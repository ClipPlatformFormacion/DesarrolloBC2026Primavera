pageextension 50101 "Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addafter("Qty. to Receive")
        {
            field("QC Result (Option)"; Rec."QC Result (Option)")
            {
                ApplicationArea = All;
            }
            field("QC Result (Enum)"; Rec."QC Result (Enum)")
            {
                ApplicationArea = All;
            }
        }
    }
}