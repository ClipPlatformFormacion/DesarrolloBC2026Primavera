
namespace ClipPlatform.QualityControl;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Foundation.Task;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Document;
using System.Visualization;

page 50105 "Quality Control RoleCenter"
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control104; "Headline RC Order Processor")
            {
                ApplicationArea = Basic, Suite;
            }
            part(QCActivities; "QC Activities")
            {
                ApplicationArea = All;
            }
            part("Job Queue Tasks Activities"; "Job Queue Tasks Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(NewPurchaseOrder)
            {
                ApplicationArea = All;
                Caption = 'Purchase Order', comment = 'ESP="Pedido compra"';
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            action("Sales &Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Journal';
                Image = Journals;
                RunObject = Page "Sales Journal";
                ToolTip = 'Open a sales journal where you can batch post sales transactions to G/L, bank, customer, vendor and fixed assets accounts.';
            }
        }
        area(Sections)
        {
            group(Items)
            {
                Caption = 'Items', comment = 'ESP="Productos"';
                action(Item)
                {
                    Caption = 'Items', comment = 'ESP="Productos"';
                    ApplicationArea = All;
                    RunObject = Page "Item List";
                }
            }
            group(Purchases)
            {
                Caption = 'Purchases', comment = 'ESP="Compras"';

                action(Vendors)
                {
                    Caption = 'Vendors', comment = 'ESP="Proveedores"';
                    ApplicationArea = All;
                    RunObject = page "Vendor List";
                }
            }
        }
        area(Embedding)
        {
            action(Item2)
            {
                Caption = 'Items', comment = 'ESP="Productos"';
                ApplicationArea = All;
                RunObject = Page "Item List";
            }
            action(PurchaseOrder)
            {
                Caption = 'Purchase Orders', comment = 'ESP="Pedidos compra"';
                ApplicationArea = All;
                RunObject = Page "Purchase Orders";
            }
        }
    }
}