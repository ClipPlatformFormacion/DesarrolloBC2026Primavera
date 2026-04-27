tableextension 50103 "Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "QC Result (Option)"; Option)
        {
            CaptionML = ENU = 'QC Result (Option)', ESP = 'Resultado CC (Option)';
            OptionMembers = " ",Satisfactory,"Non Satisfactory";
            OptionCaptionML = ENU = ' ,Satisfactory,Non Satisfactory', ESP = ' ,Satisfactorio,No Satisfactorio';
            DataClassification = CustomerContent;
        }
        field(50101; "QC Result (Enum)"; Enum "Quality Control Result")
        {
            CaptionML = ENU = 'QC Result (Enum)', ESP = 'Resultado CC (Enum)';
            DataClassification = CustomerContent;
        }
    }
}