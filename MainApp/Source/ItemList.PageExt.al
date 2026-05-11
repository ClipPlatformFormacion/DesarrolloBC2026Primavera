pageextension 50105 "Item List" extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field("Non-satisfactory Purch. (Qty.)"; Rec."Non-satisfactory Purch. (Qty.)")
            {
                ApplicationArea = All;
            }
        }
    }
}