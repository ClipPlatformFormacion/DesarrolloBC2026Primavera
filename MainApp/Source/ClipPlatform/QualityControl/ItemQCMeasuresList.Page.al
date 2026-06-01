namespace ClipPlatform.QualityControl;
page 50101 "Item QC Measures List"
{
    Caption = 'Item Quality measures', Comment = 'ESP="Medidas calidad producto"';
    PageType = List;
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
                    ToolTip = 'Specifies the item number.';
                }
                field(Measure; Rec.Measure) { }
                field("Normal Value"; Rec."Normal Value") { ToolTip = 'Specifies the normal value for this quality control measure.'; }
            }
        }
    }
}