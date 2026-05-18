pageextension 50106 "Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Level"; Rec."Customer Level")
            {
                ApplicationArea = All;
            }
            field("Level Discount"; Rec."Level Discount")
            {
                ApplicationArea = All;
            }
        }
    }
}