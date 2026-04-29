page 50103 "Purchase QC Measures Subpage"
{
    CaptionML = ENU = 'Purchase Quality measures', ESP = 'Medidas calidad compra';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Purch. QC Measures";
    // Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(RepeteaerControl)
            {
                field(Measure; Rec.Measure)
                {
                    Editable = false;
                }
                field("Normal Value"; Rec."Normal Value")
                {
                    Editable = false;
                }
                field(Value; Rec.Value) { }
            }
        }
    }
}