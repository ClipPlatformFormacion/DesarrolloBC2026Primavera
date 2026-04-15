page 50100 "Quality Control Measures List"
{
    CaptionML = ENU = 'Quality Control Measures', ESP = 'Medidas control calidad';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Quality Control Measures";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field(Measure; Rec.Measure) { }
                field(Description; Rec.Description) { }
                field(Blocked; Rec.Blocked) { }
            }
        }
    }
}