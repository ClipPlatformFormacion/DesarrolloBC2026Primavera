namespace ClipPlatform.Purchases.MasterData;

using System.Globalization;

table 50104 Vendor
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; MyField; Integer)
        {
            TableRelation = Microsoft.Inventory.Item.Item;
        }
        field(2; OtroCampo; Code[20])
        {
            TableRelation = Language;
        }
    }
}