enum 50100 "Quality Control Result"
{
    Extensible = true;

    value(0; " ")
    {
        CaptionML = ENU = ' ', ESP = ' ';
    }
    value(1; Satisfactory)
    {
        CaptionML = ENU = 'Satisfactory', ESP = 'Satisfactorio';
    }
    value(2; "Non Satisfactory")
    {
        CaptionML = ENU = 'Non Satisfactory', ESP = 'No Satisfactorio';
    }
}