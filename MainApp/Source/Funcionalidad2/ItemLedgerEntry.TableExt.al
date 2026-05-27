tableextension 50103 "Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "QC Result (Option)"; Option)
        {
            Caption = 'QC Result (Option)', Comment = 'ESP="Resultado CC (Option)"';
            OptionMembers = " ",Satisfactory,"Non Satisfactory";
            OptionCaption = ' ,Satisfactory,Non Satisfactory', Comment = 'ESP=" ,Satisfactorio,No Satisfactorio"';
            DataClassification = CustomerContent;
        }
        field(50101; "QC Result (Enum)"; Enum "Quality Control Result")
        {
            Caption = 'QC Result (Enum)', Comment = 'ESP="Resultado CC (Enum)"';
            DataClassification = CustomerContent;
        }
        field(50103; "Source Name"; Text[100])
        {
            Caption = 'Source Name', comment = 'ESP="Nombre procedencia mov."';
            FieldClass = FlowField;
            CalcFormula = lookup(Microsoft.Purchases.Vendor.Vendor.Name where("No." = field("Source No.")));
        }
    }
}