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
                part(QCMeasures; "Item QC Measures Factbox")
                {
                    ApplicationArea = All;
                    SubPageLink = "Item No." = field("No.");
                }
            }
        }
        addbefore(ItemAttributesFactbox)
        {
            part(QCMeasuresFactbox; "Item QC Measures Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No.");
            }
        }
    }
    actions
    {
        addafter("&Units of Measure")
        {
            action(QCMeasuresAction)
            {
                CaptionML = ENU = 'Quality Control Measures', ESP = 'Medidas control calidad';
                RunObject = page "Item QC Measures List";
                RunPageLink = "Item No." = field("No.");
                ApplicationArea = All;
                Image = Questionaire;
            }
        }
    }
}