namespace ClipPlatform.CustomerLevel;

using Microsoft.Sales.Document;

codeunit 50102 "Silver Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(5);
    end;

    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
    begin
        exit(true);
    end;
}