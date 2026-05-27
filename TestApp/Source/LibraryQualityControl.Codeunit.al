codeunit 50153 "Library - Quality Control"
{
    procedure CreateItemWithQC() Item: Record Item;
    var
        LibraryInventory: Codeunit "Library - Inventory";
    begin
        LibraryInventory.CreateItem(Item);
        Item.Validate("Requires Quality Control", true);
        Item.Modify(true);

        CreateQualityControlMeasure('MEDIDA1');
        CreateQualityControlMeasure('MEDIDA2');
        CreateItemQualityControlMeasure(Item."No.", 'MEDIDA1');
        CreateItemQualityControlMeasure(Item."No.", 'MEDIDA2');
    end;

    procedure CreateQualityControlMeasure(Measure: Code[20])
    var
        QCMeasures: Record "Quality Control Measures";
    begin
        if QCMeasures.Get(Measure) then
            exit;
        QCMeasures.Init();
        QCMeasures.Validate(Measure, Measure);
        QCMeasures.Validate(Description, Measure);
        QCMeasures.Validate(Blocked, false);
        QCMeasures.Insert(true);
    end;

    procedure CreateItemQualityControlMeasure(ItemNo: Code[20]; Measure: Code[20])
    var
        ItemQCMeasures: Record "Item Quality Control Measures";
    begin
        ItemQCMeasures.Init();
        ItemQCMeasures.Validate("Item No.", ItemNo);
        ItemQCMeasures.Validate(Measure, Measure);
        ItemQCMeasures.Validate("Normal Value", Measure);
        ItemQCMeasures.Insert(true);
    end;
}