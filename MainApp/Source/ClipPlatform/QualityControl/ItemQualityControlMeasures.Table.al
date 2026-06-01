namespace ClipPlatform.QualityControl;
using Microsoft.Inventory.Item;
table 50101 "Item Quality Control Measures"
{
    Caption = 'Item Quality Control Measures', Comment = 'ESP="Medidas control calidad producto"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.', Comment = 'ESP="Nº producto"';
            TableRelation = Item;
            AllowInCustomizations = Never;
        }
        field(2; Measure; Code[20])
        {
            Caption = 'Measure', Comment = 'ESP="Medida"';
            TableRelation = "Quality Control Measures";
            ToolTip = 'vsahvsahvjhasv', Comment = 'ESP="Especifica la medida que tendrá que tomar para realizar un control de calidad"';
            AllowInCustomizations = Never;
        }
        field(3; "Normal Value"; Text[50])
        {
            Caption = 'Normal Value', Comment = 'ESP="Valor normal"';
            AllowInCustomizations = Never;
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