namespace ClipPlatform.QualityControl;
using ClipPlatform.Purchases;
using ClipPlatform.WebServices;
page 50104 "Execute XMLPorts"
{
    Caption = 'Execute XMLPorts', comment = 'ESP="Ejecutar XMLPorts"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Promoted)
        {
            group(UnGrupo)
            {
                ShowAs = SplitButton;
                actionref(ExportSalesOrderPromoted; ExportSalesOrder) { }
                actionref(ImportSalesOrderPromoted; ImportSalesOrder) { }
            }
            actionref(ExecuteQueryPromoted; ExecuteQuery) { }
        }
        area(Navigation)
        {
            action(ExportSalesOrder)
            {
                Caption = 'Export Sales Order', comment = 'ESP="Exportar Pedido Venta"';
                RunObject = xmlport "Export Sales Order";
                Image = Export;
                ToolTip = 'Export a sales order to XML.';
            }
            action(ImportSalesOrder)
            {
                Caption = 'Import Sales Order', comment = 'ESP="Importar Pedido Venta"';
                RunObject = xmlport "Import Sales Order";
                Image = Import;
                ToolTip = 'Import a sales order from XML.';
            }
        }
        area(Processing)
        {
            action(ExecuteQuery)
            {
                Caption = 'Execute Query', comment = 'ESP="Ejecutar Query"';
                RunObject = query "Item Query";
                Image = ExecuteAndPostBatch;
                ToolTip = 'Execute the item query.';
            }
            action(CodeQuery)
            {
                Caption = 'Code query', comment = 'ESP="Ejecutar query por código"';
                Image = ExecuteBatch;
                ToolTip = 'Execute the item query through code.';

                trigger OnAction()
                var
                    ItemQuery: Query "Item Query";
                begin
                    ItemQuery.SetRange(ItemQuery.Requieres_Quality_Control, true);
                    if ItemQuery.Open() then
                        while ItemQuery.Read() do begin
                            this.Counter += 1;
                            this.VendorName := ItemQuery.Name;
                        end;

                    ItemQuery.Close();
                    Message(Format(this.Counter));
                end;
            }
            action(CrearCliente)
            {
                Image = "8ball";
                ToolTip = 'Create a new customer via web service.';
                trigger OnAction()
                var
                    MiWebService: Codeunit "Mi WebService";
                begin
                    MiWebService.CrearClienteConParametros('un nombre desde BC', 'una direccion desde BC', '679223344', 2500);
                end;
            }
        }
    }

    var
        VendorName: Text;
        Counter: Integer;
}