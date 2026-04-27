table 50101 "Item Quality Control Measures"
{
    CaptionML = ENU = 'Item Quality Control Measures', ESP = 'Medidas control calidad producto';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.', ESP = 'Nº producto';
            TableRelation = Item;
        }
        field(2; Measure; Code[20])
        {
            CaptionML = ENU = 'Measure', ESP = 'Medida';
            TableRelation = "Quality Control Measures";
            ToolTipML = ENU = 'vsahvsahvjhasv', ESP = 'Especifica la medida que tendrá que tomar para realizar un control de calidad';
        }
        field(3; "Normal Value"; Text[50])
        {
            CaptionML = ENU = 'Normal Value', ESP = 'Valor normal';
        }
    }

    keys
    {
        key(PK; "Item No.", Measure)
        {
            Clustered = true;
        }
    }
}