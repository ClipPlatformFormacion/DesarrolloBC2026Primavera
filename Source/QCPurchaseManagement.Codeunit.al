codeunit 50100 "QC Purchase Management"
{
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
}