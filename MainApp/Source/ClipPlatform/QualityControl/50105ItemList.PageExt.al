namespace ClipPlatform.QualityControl;
using Microsoft.Inventory.Item;
pageextension 50105 "50105Item List" extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field("Non-satisfactory Purch. (Qty.)"; Rec."Non-satisfactory Purch. (Qty.)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the quantity of non-satisfactory purchases for the item.';
            }
        }
    }
}