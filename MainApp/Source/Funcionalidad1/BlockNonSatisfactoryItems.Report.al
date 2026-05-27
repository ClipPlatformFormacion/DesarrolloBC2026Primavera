report 50100 "Block Non Satisfactory Items"
{
    Caption = 'Block Non Satisfactory Items', comment = 'ESP="Bloquear productos no satisfactorios"';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // ProcessingOnly = true;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", Description, Inventory;
            // DataItemTableView = where("Non-satisfactory Purch. (Qty.)" = filter(<> 0));

            column(No; "No.") { IncludeCaption = true; }
            column(Description; Description) { IncludeCaption = true; }
            column(NonSatisfactoryPurchQty; "Non-satisfactory Purch. (Qty.)") { IncludeCaption = true; }
            column(ItemModified; Format(ItemModified)) { }
            column(ItemModifiedCaption; ItemModifiedCaptionLbl) { }

            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLinkReference = Item;
                DataItemLink = "Item No." = field("No."), "Location Code" = field("Un FlowFilter");
                DataItemTableView = sorting("Entry No.") where("QC Result (Enum)" = const("Non Satisfactory"),
                                            "Entry Type" = const(Purchase),
                                            "Document Type" = const("Purchase Receipt"));

                column(Document_No_; "Document No.") { IncludeCaption = true; }
                column(Posting_Date; "Posting Date") { IncludeCaption = true; }
                column(Quantity; Quantity) { IncludeCaption = true; }
                column(Source_Name; "Source Name") { IncludeCaption = true; }

                // trigger OnPreDataItem()
                // begin
                //     Message('OnPreDataItem ItemLedgerEntry %1', Counter);
                // end;

                // trigger OnAfterGetRecord()
                // begin
                //     Counter += 1;
                // end;

                // trigger OnPostDataItem()
                // begin
                //     Message('OnPostDataItem ItemLedgerEntry %1', Counter);
                // end;
            }

            trigger OnPreDataItem()
            begin
#pragma warning disable AA0205
                Message('OnPreDataItem Item %1', Counter);
#pragma warning restore
            end;

            trigger OnAfterGetRecord()
            var
                BloquearProducto: Codeunit "Bloquear Producto";
            begin
                if not BloquearProducto.Run(Item) then begin
                    Item.Blocked := false;
                    Item."Block Reason" := CopyStr(GetLastErrorText(), 1, MaxStrLen(Item."Block Reason"));
                    Item.Modify();
                end;
                Commit(); // Aqui se cierra la transacción
            end;

            trigger OnPostDataItem()
            begin
#pragma warning disable AA0205
                Message('OnPostDataItem Item Total %1 Modificados %2', Counter, ModifiedCounter);
#pragma warning restore
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options', comment = 'ESP="Opciones"';
                    field(NoOfNonSatisfactoryUnitsLabel; NoOfNonSatisfactoryUnits)
                    {
                        Caption = 'No. of Non-Satisfactory Units', comment = 'ESP="Nº de Unidades No Satisfactorias"';
                        ToolTip = 'EnglishText', comment = 'ESP="Se van a bloquear los productos que tengan almenos el número de unidades no satisfactorias especificadas en este campo"';
                        ApplicationArea = All;
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            NoOfNonSatisfactoryUnits := 1;
        end;
    }

    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './Source/Layouts/BlockNonSatisfactoryItems.rdl';
        }
        layout(ExcelLayout)
        {
            Type = Excel;
            // ExcelLayoutMultipleDataSheets = true;
            LayoutFile = './Source/Layouts/BlockNonSatisfactoryItems.xlsx';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './Source/Layouts/BlockNonSatisfactoryItems.docx';
        }
    }

    trigger OnPreReport()
    begin
        if NoOfNonSatisfactoryUnits = 0 then
            Error('Tienes que especificar un número mínimo');

        if not Confirm('¿Estás seguro que quieres bloquear los productos con más de %1 unidades no satisfactorias?', false, NoOfNonSatisfactoryUnits) then
            Error('Proceso detenido a petición del usuario');
    end;

    var
        Counter, ModifiedCounter : Integer;
        NoOfNonSatisfactoryUnits: Decimal;
        ItemModified: Boolean;
        ItemModifiedCaptionLbl: Label 'Item Modified', Comment = 'ESP="Producto Modificado"';
}