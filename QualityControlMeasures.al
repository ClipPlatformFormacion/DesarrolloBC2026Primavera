table 50100 "Quality Control Measures"
{
    CaptionML = ENU = 'Quality Control Measures', ESP = 'Medidas control calidad';
    LookupPageId = "Quality Control Measures List";

    fields
    {
        field(1; Measure; Code[20])
        {
            CaptionML = ENU = 'Measure', ESP = 'Medida';
        }
        field(2; Description; Text[100])
        {
            CaptionML = ENU = 'Description', ESP = 'Descripción';
        }
        field(3; Blocked; Boolean)
        {
            CaptionML = ENU = 'Blocked', ESP = 'Bloqueado';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Measure, Description, Blocked) { }
    }
}