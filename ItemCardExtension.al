pageextension 50100 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(Quality)
            {
                CaptionML = ENU = 'Quality', ESP = 'Calidad';
                field("Requieres Quality Control"; Rec."Requieres Quality Control")
                {
                    // CaptionML = ESP = 'Nuevo caption';
                    ApplicationArea = All;
                }
            }
        }
    }
}