namespace ClipPlatform.Purchases.MasterData;

using System.Globalization;

#pragma warning disable PTE0025, AS0130
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
#pragma warning restore PTE0025, AS0130