namespace ClipPlatform.QualityControl;
using Microsoft.Purchases.Document;
pageextension 50101 "50101Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addafter("Qty. to Receive")
        {
            field("QC Result (Option)"; Rec."QC Result (Option)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the quality control result (option field).';
            }
            field("QC Result (Enum)"; Rec."QC Result (Enum)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the quality control result (enum field).';
            }
        }
    }
}