codeunit 50106 "Bloquear Producto"
{
    TableNo = Item;

    trigger OnRun()
    begin
        BloquearElProducto(Rec);
    end;

    procedure BloquearElProducto(Item: Record Item)
    var
        BlockReasonMsg: Label 'Blocked by report 50100', Comment = 'ESP="Bloqueado por report 5100"';
    begin
        if Item."No." = '1936-S' then
            Error('un error');

        Item.CalcFields("Non-satisfactory Purch. (Qty.)");
        // if Item."Non-satisfactory Purch. (Qty.)" > NoOfNonSatisfactoryUnits then begin
        Item.Validate(Blocked, true);
        Item.Validate("Block Reason", BlockReasonMsg);
        Item.Modify(true); // Aqui se abre la transaccion
        // end;
    end;
}