namespace ClipPlatform.QualityControl;
using Microsoft.Sales.Document;
xmlport 50101 "Import Sales Order"
{
    Direction = Import;
    FormatEvaluate = Xml;
    UseRequestPage = false;
    UseDefaultNamespace = true;

    schema
    {
        textelement(Root)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                // AutoReplace = true;
                AutoUpdate = true;

                SourceTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
                // fieldelement(DocumentType; SalesHeader."Document Type") { }

                textelement(DocumentType)
                {
                    trigger OnBeforePassVariable()
                    begin
                        DocumentType := Format(SalesHeader."Document Type");
                    end;

                    trigger OnAfterAssignVariable()
                    begin
                        Evaluate(SalesHeader."Document Type", DocumentType);
                    end;
                }
                fieldelement(DocumentNo; SalesHeader."No.")
                {
                }
                fieldelement(CustomerNo; SalesHeader."Sell-to Customer No.")
                {
                }
                fieldelement(CustomerName; SalesHeader."Sell-to Customer Name")
                {
                }
                fieldelement(CurrencyCode; SalesHeader."Currency Code")
                {
                }
                fieldelement(DocumentDate; SalesHeader."Document Date")
                {
                }
                tableelement(SalesLine; "Sales Line")
                {
                    SourceTableView = sorting("Document Type", "Document No.", "Line No.");
                    LinkTable = SalesHeader;
                    LinkFields = "Document Type" = field("Document Type"), "Document No." = field("No.");
                    // fieldelement(Type; SalesLine.Type) { }
                    textelement(Type)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            Type := Format(SalesLine.Type);
                        end;

                        trigger OnAfterAssignVariable()
                        begin
                            Evaluate(SalesLine.Type, Type);
                        end;
                    }
                    fieldelement(No; SalesLine."No.") { }
                    fieldelement(Quantity; SalesLine.Quantity)
                    {
                        trigger OnAfterAssignField()
                        begin
                            if SalesLine.Quantity > 100 then
                                Error('No se permiten grandes cantidades en una importación');
                        end;
                    }
                    fieldelement(UnitPrice; SalesLine."Unit Price") { }
                }
            }
        }
    }
}