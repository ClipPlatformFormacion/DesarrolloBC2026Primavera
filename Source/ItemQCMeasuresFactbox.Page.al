page 50102 "Item QC Measures Factbox"
{
    CaptionML = ENU = 'Item Quality measures', ESP = 'Medidas calidad producto';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Item Quality Control Measures";

    layout
    {
        area(Content)
        {
            repeater(RepeteaerControl)
            {
                field("Item No."; Rec."Item No.")
                {
                    Visible = false;
                }
                field(Measure; Rec.Measure) { }
                field("Normal Value"; Rec."Normal Value") { }
            }
        }
    }
}