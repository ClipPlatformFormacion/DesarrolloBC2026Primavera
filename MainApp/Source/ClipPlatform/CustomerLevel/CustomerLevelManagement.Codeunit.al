namespace ClipPlatform.CustomerLevel;

using Microsoft.Sales.Customer;

codeunit 50108 "Customer Level Management"
{

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, "Customer Level", false, false)]
    procedure ValidateCustomerLevel(Rec: Record Customer)
    var
        ICustomerLevel: Interface ICustomerLevel;
    begin
        ICustomerLevel := Rec."Customer Level";
        Rec.Validate("Level Discount", ICustomerLevel.GetDiscount());
    end;
}