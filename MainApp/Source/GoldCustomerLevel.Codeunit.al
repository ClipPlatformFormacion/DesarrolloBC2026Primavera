codeunit 50103 "Gold Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(10);
    end;
}