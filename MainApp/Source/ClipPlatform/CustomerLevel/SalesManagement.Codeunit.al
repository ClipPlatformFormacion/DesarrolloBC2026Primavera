namespace ClipPlatform.CustomerLevel;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

codeunit 50104 "Sales Management"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Sell-to Customer No.", false, false)]
    local procedure CheckIfCustomerCanCreateDocument(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
        ICustomerLevel: Interface ICustomerLevel;
    begin
        Customer.Get(Rec."Sell-to Customer No.");
        ICustomerLevel := Customer."Customer Level";
        if not ICustomerLevel.CustomerCanCreateSalesDocument(Rec."Document Type") then
            Error('Los clientes con nivel %1 no pueden crear documentos de tipo %2', Customer."Customer Level", Rec."Document Type");
    end;
}