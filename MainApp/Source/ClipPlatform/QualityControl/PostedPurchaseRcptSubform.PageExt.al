namespace ClipPlatform.QualityControl;
using Microsoft.Purchases.History;
pageextension 50102 "Posted Purchase Rcpt. Subform" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter(Quantity)
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