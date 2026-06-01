namespace ClipPlatform.QualityControl;

using ClipPlatform.CustomerLevel;
enum 50101 "Customer Level" implements ICustomerLevel
{
    Extensible = true;

    value(0; " ")
    {
        Implementation = ICustomerLevel = "Blank Customer Level";
    }
    value(1; Silver)
    {
        Implementation = ICustomerLevel = "Silver Customer Level";
    }
    value(2; Gold)
    {
        Implementation = ICustomerLevel = "Gold Customer Level";
    }
}