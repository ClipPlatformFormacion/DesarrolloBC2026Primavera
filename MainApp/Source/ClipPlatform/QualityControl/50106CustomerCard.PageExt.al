namespace ClipPlatform.QualityControl;
using Microsoft.Sales.Customer;
pageextension 50106 "50106Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Level"; Rec."Customer Level")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer level.';
            }
            field("Level Discount"; Rec."Level Discount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the discount associated with the customer level.';
            }
        }
    }
}