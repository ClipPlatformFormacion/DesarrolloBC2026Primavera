codeunit 50154 "Platinium Management" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(15);
    end;
}