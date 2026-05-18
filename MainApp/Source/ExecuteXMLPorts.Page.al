page 50104 "Execute XMLPorts"
{
    Caption = 'Execute XMLPorts', comment = 'ESP="Ejecutar XMLPorts"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(ExportSalesOrder)
            {
                Caption = 'Export Sales Order', comment = 'ESP="Exportar Pedido Venta"';
                RunObject = xmlport "Export Sales Order";
                Image = Export;
            }
        }
    }
}