namespace ClipPlatform.CustomerLevel;

using Microsoft.Sales.Document;

interface ICustomerLevel
{
    procedure GetDiscount(): Decimal;
    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
}