table 50100 "Quality Control Measures"
{
    Caption = 'Quality Control Measures', Comment = 'ESP="Medidas control calidad"';
    LookupPageId = "Quality Control Measures List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Measure; Code[20])
        {
            Caption = 'Measure', Comment = 'ESP="Medida"';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked', Comment = 'ESP="Bloqueado"';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Measure, Description, Blocked) { }
    }
}