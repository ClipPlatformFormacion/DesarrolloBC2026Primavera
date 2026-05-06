table 50102 "Purch. QC Measures"
{
    Caption = 'Purchase Quality Control Measures', Comment = 'ESP="Medidas control calidad compra"';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Document Type"; Enum "Purchase Document Type") { }
        field(11; "Document No."; Code[20]) { }
        field(12; "Line No."; Integer) { }
        field(2; Measure; Code[20])
        {
            Caption = 'Measure', Comment = 'ESP="Medida"';
            TableRelation = "Quality Control Measures";
            ToolTip = 'vsahvsahvjhasv', Comment = 'ESP="Especifica la medida que tendrá que tomar para realizar un control de calidad"';
        }
        field(3; "Normal Value"; Text[50])
        {
            Caption = 'Normal Value', Comment = 'ESP="Valor normal"';
        }
        field(4; Value; Text[50])
        {
            Caption = 'Value', Comment = 'ESP="Valor"';
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.", Measure)
        {
            Clustered = true;
        }
    }
}