pageextension 50104 "Purchase Order" extends "Purchase Order"
{
    layout
    {
        addafter(PurchLines)
        {
            part(PurchaseQCMeasures; "Purchase QC Measures Subpage")
            {
                ApplicationArea = All;
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
                UpdatePropagation = Both;
            }
        }
    }
}