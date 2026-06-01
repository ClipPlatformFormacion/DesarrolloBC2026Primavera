namespace ClipPlatform.CustomerLevel;

using ClipPlatform.QualityControl;
using Microsoft.Sales.Customer;

tableextension 50105 Customer extends Customer
{
    fields
    {
        field(50100; "Customer Level"; Enum "Customer Level")
        {
            DataClassification = CustomerContent;
            AllowInCustomizations = Never;
        }
        field(50101; "Level Discount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}