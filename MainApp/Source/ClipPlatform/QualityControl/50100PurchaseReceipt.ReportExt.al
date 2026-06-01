namespace ClipPlatform.QualityControl;
using Microsoft.Purchases.History;
reportextension 50100 "50100Purchase - Receipt" extends "Purchase - Receipt"
{
    dataset
    {
        add("Purch. Rcpt. Line")
        {
            column(QC_Result__Enum_; "QC Result (Enum)") { IncludeCaption = true; }
        }
    }

    requestpage
    {
        layout
        {
            addafter(Options)
            {
                group(AnotherGroup)
                {
                    field(UnCampo; 'un valor fijo')
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
            modify(ShowInternalInfo)
            {
                Visible = false;
            }
        }
    }

    rendering
    {
        layout(QCRDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './source/Layouts/PurchaseReceipt.rdl';
        }
    }
}