interface ICustomerLevel
{
    procedure GetDiscount(): Decimal;
    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
}