namespace ClipPlatform.QualityControl;
page 50107 "Quality Control Measures API"
{
    Caption = 'Quality Control Measures', Comment = 'ESP="Medidas control calidad"';
    PageType = API;
    APIPublisher = 'clipplatform';
    APIGroup = 'qualitycontrol';
    APIVersion = 'v1.0';
    EntityName = 'qualityControlMeasure';
    EntitySetName = 'qualityControlMeasures';
    SourceTable = "Quality Control Measures";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field(measure; Rec.Measure) { }
                field(description; Rec.Description) { }
                field(blocked; Rec.Blocked) { }
            }
        }
    }
}