report 50100 "Block Non Satisfactory Items"
{
    Caption = 'Block Non Satisfactory Items', comment = 'ESP="Bloquear productos no satisfactorios"';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", Description, Inventory;
            trigger OnPreDataItem()
            begin
                Message('OnPreDataItem %1', Counter);
            end;

            trigger OnAfterGetRecord()
            var
                BlockReasonMsg: Label 'Blocked by report 50100', Comment = 'ESP="Bloqueado por report 5100"';
            begin
                Counter := Counter + 1;

                Item.CalcFields("Non-satisfactory Purch. (Qty.)");
                if Item."Non-satisfactory Purch. (Qty.)" > NoOfNonSatisfactoryUnits then begin
                    Item.Validate(Blocked, true);
                    Item.Validate("Block Reason", BlockReasonMsg);
                    Item.Modify(true);
                    ModifiedCounter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('OnPostDataItem Total %1 Modificados %2', Counter, ModifiedCounter);
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
}