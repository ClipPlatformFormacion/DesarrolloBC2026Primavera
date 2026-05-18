codeunit 50154 "Platinium Management"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, OnValidateCustomerLevelOnBeforeUnknownLevelError, '', false, false)]
    local procedure Customer_OnValidateCustomerLevelOnBeforeUnknownLevelError(var Customer: Record Customer; var Handled: Boolean)
    begin
        if Customer."Customer Level" <> Customer."Customer Level"::Platinium then
            exit;

        Customer.Validate("Level Discount", 15);
        Handled := true;
    end;
}