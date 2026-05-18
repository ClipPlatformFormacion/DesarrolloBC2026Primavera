codeunit 50154 "Platinium Management" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(15);
    end;

    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
    begin
        exit(true);
    end;
}