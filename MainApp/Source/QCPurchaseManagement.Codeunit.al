codeunit 50100 "QC Purchase Management"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsert_FillQCMeasures(var Rec: Record "Purchase Line")
    begin
        FillQCMeasures(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure OnAfterValidate_No_FillQCMeasures(var Rec: Record "Purchase Line")
    begin
        FillQCMeasures(Rec);
    end;

    procedure FillQCMeasures(var Rec: Record "Purchase Line")
    var
        ItemQCMeasures: Record "Item Quality Control Measures";
        PurchaseQCMeasures: Record "Purch. QC Measures";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type <> Rec.Type::Item then
            exit;

        if Rec."Line No." = 0 then
            exit;

        ItemQCMeasures.SetRange("Item No.", Rec."No.");
        if ItemQCMeasures.FindSet() then
            repeat
                PurchaseQCMeasures.Init();
                PurchaseQCMeasures.Validate("Document Type", Rec."Document Type");
                PurchaseQCMeasures.Validate("Document No.", Rec."Document No.");
                PurchaseQCMeasures.Validate("Line No.", Rec."Line No.");
                PurchaseQCMeasures.Validate(Measure, ItemQCMeasures.Measure);
                PurchaseQCMeasures.Validate("Normal Value", ItemQCMeasures."Normal Value");
                PurchaseQCMeasures.Insert(true);
            until ItemQCMeasures.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure CheckItemQualityControl(var PurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        Item: Record Item;
        QCMandatoryResultErr: TextConst ENU = 'Item %1 requieres quality control', ESP = 'El producto %1 requiere control de calidad';
    begin
        if not PurchaseHeader.Receive then
            exit;

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        PurchaseLine.SetRange(Type, Enum::"Purchase Line Type"::Item);
        PurchaseLine.SetFilter("Qty. to Receive", '<>0');
        PurchaseLine.SetLoadFields("No.", "QC Result (Enum)", "QC Result (Option)");
        if PurchaseLine.FindSet() then  // SELECT No.,QCResult, FROM PurchaseLine
            repeat
                Item.SetLoadFields("Requieres Quality Control");
                Item.Get(PurchaseLine."No.");
                if Item."Requieres Quality Control" then begin
                    if PurchaseLine."QC Result (Enum)" = Enum::"Quality Control Result"::" " then
                        Error(QCMandatoryResultErr, PurchaseLine."No.");
                    if PurchaseLine."QC Result (Option)" = PurchaseLine."QC Result (Option)"::" " then
                        Error(QCMandatoryResultErr, PurchaseLine."No.");
                end;
            until PurchaseLine.Next() = 0;
    end;

    // TODO: limpiar el resultado tras recepción parcial

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromPurchLine"(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."QC Result (Option)" := PurchLine."QC Result (Option)";
        ItemJnlLine."QC Result (Enum)" := PurchLine."QC Result (Enum)";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnAfterInitItemLedgEntry"(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."QC Result (Option)" := ItemJournalLine."QC Result (Option)";
        NewItemLedgEntry."QC Result (Enum)" := ItemJournalLine."QC Result (Enum)";
    end;
}