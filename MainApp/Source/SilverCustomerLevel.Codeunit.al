codeunit 50102 "Silver Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(5);
    end;
}