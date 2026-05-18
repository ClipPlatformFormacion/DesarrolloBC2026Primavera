xmlport 50100 "Export Sales Order"
{
    Direction = Export;
    FormatEvaluate = Xml;
    UseRequestPage = false;
    Format = FixedText;
    // FieldSeparator = ';';
    // FieldDelimiter = '';

    schema
    {
        textelement(Root)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                SourceTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
                // fieldelement(DocumentType; SalesHeader."Document Type") { }

                textelement(DocumentType)
                {
                    Width = 10;
                    trigger OnBeforePassVariable()
                    begin
                        DocumentType := Format(SalesHeader."Document Type");
                    end;
                }
                fieldelement(DocumentNo; SalesHeader."No.")
                {
                    Width = 20;
                }
                fieldelement(CustomerNo; SalesHeader."Sell-to Customer No.")
                {
                    Width = 20;
                }
                fieldelement(CustomerName; SalesHeader."Sell-to Customer Name")
                {
                    Width = 100;
                }
                fieldelement(CurrencyCode; SalesHeader."Currency Code")
                {
                    Width = 10;
                }
                fieldelement(DocumentDate; SalesHeader."Document Date")
                {
                    Width = 20;
                }
                // tableelement(SalesLine; "Sales Line")
                // {
                //     SourceTableView = sorting("Document Type", "Document No.", "Line No.");
                //     LinkTable = SalesHeader;
                //     LinkFields = "Document Type" = field("Document Type"), "Document No." = field("No.");
                //     // fieldelement(Type; SalesLine.Type) { }
                //     textelement(Type)
                //     {
                //         trigger OnBeforePassVariable()
                //         begin
                //             Type := Format(SalesLine.Type);
                //         end;
                //     }
                //     fieldelement(No; SalesLine."No.") { }
                //     fieldelement(Quantity; SalesLine.Quantity) { }
                //     fieldelement(UnitPrice; SalesLine."Unit Price") { }
                // }
            }
        }
    }
}