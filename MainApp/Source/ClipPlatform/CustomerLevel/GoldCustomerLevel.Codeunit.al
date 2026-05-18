namespace ClipPlatform.CustomerLevel;

using Microsoft.Sales.Document;

codeunit 50103 "Gold Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(10);
    end;

    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
    begin
        exit(true);
    end;
}