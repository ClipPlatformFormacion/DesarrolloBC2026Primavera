page 50104 "Execute XMLPorts"
{
    Caption = 'Execute XMLPorts', comment = 'ESP="Ejecutar XMLPorts"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    PromotedActionCategoriesML = ENU = 'New,Process,Report,MyCategory', ESP = 'Nuevo,Acciones,Informes,MiCategoria';

    actions
    {
        area(Navigation)
        {
            action(ExportSalesOrder)
            {
                Caption = 'Export Sales Order', comment = 'ESP="Exportar Pedido Venta"';
                RunObject = xmlport "Export Sales Order";
                Image = Export;
                Promoted = true;
                PromotedCategory = New;
            }
            action(ImportSalesOrder)
            {
                Caption = 'Import Sales Order', comment = 'ESP="Importar Pedido Venta"';
                RunObject = xmlport "Import Sales Order";
                Image = Import;
            }
        }
        area(Processing)
        {
            action(ExecuteQuery)
            {
                Caption = 'Execute Query', comment = 'ESP="Ejecutar Query"';
                RunObject = query "Item Query";
                Image = ExecuteAndPostBatch;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
            }
            action(CodeQuery)
            {
                Caption = 'Code query', comment = 'ESP="Ejecutar query por código"';
                Image = ExecuteBatch;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ItemQuery: Query "Item Query";
                begin
                    ItemQuery.SetRange(ItemQuery.Requieres_Quality_Control, true);
                    if ItemQuery.Open() then
                        while ItemQuery.Read() do begin
                            Counter += 1;
                            VendorName := ItemQuery.Name;
                        end;

                    ItemQuery.Close();
                    Message(Format(Counter));
                end;
            }
        }
    }

    var
        VendorName: Text;
        Counter: Integer;
}