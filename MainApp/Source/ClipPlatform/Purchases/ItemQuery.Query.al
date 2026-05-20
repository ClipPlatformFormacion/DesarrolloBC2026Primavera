namespace ClipPlatform.Purchases;

using Microsoft.Inventory.Item;
using Microsoft.Purchases.Vendor;

query 50100 "Item Query"
{
    Caption = 'Item query', comment = 'ESP="Consulta productos"';
    TopNumberOfRows = 10;

    elements
    {
        dataitem(Item; Item)
        {
            DataItemTableFilter = "Replenishment System" = const(Purchase);
            column(No_; "No.") { }
            column(Description; Description) { }
            column(Base_Unit_of_Measure; "Base Unit of Measure") { }
            column(Unit_Cost; "Unit Cost")
            {
                ColumnFilter = Unit_Cost = filter(<> 0);
            }
            filter(Vendor_No_; "Vendor No.") { }
            filter(Requieres_Quality_Control; "Requieres Quality Control") { }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = Item."Vendor No.";

                column(Name; Name)
                {
                    Caption = 'Vendor Name', comment = 'ESP="Nombre proveedor"';
                }
                column(City; City)
                {
                    Caption = 'Vendor City', comment = 'ESP="Ciudad proveedor"';
                }
            }
        }
    }
}

// SELECT No.,Description FROM Item
// LEFT JOIN SELECT Name FROM Vendor
// WHERE SistemaReposicion = Compra