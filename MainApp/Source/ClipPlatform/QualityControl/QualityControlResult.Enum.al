namespace ClipPlatform.QualityControl;
enum 50100 "Quality Control Result"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ', Comment = 'ESP=" "';
    }
    value(1; Satisfactory)
    {
        Caption = 'Satisfactory', Comment = 'ESP="Satisfactorio"';
    }
    value(2; "Non Satisfactory")
    {
        Caption = 'Non Satisfactory', Comment = 'ESP="No Satisfactorio"';
    }
}