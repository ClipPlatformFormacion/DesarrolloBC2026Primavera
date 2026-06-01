namespace ClipPlatform.QualityControl;

page 50106 "QC Activities"
{
    PageType = CardPart;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Quality Control Cue";

    layout
    {
        area(Content)
        {
            cuegroup(ControlCalidad)
            {
                field("Items that Requiere QC"; Rec."Items that Requiere QC") { ToolTip = 'Specifies the number of items that require quality control.'; }
                field("Receptions - NonSatisfactory"; Rec."Receptions - NonSatisfactory") { ToolTip = 'Specifies the number of non-satisfactory purchase receptions.'; }
                field("Receptions - Satisfactory"; Rec."Receptions - Satisfactory") { ToolTip = 'Specifies the number of satisfactory purchase receptions.'; }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}