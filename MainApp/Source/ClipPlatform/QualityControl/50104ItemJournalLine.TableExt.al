namespace ClipPlatform.QualityControl;

using Microsoft.Inventory.Journal;
tableextension 50104 "50104Item Journal Line" extends "Item Journal Line"
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
    }
}