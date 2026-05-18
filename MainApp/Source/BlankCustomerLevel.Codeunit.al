codeunit 50101 "Blank Customer Level" implements ICustomerLevel
{
    procedure GetDiscount(): Decimal
    begin
        exit(0);
    end;

    procedure CustomerCanCreateSalesDocument(SalesDocumentType: Enum "Sales Document Type"): Boolean
    begin
        exit(SalesDocumentType <> "Sales Document Type"::Quote)
    end;
}