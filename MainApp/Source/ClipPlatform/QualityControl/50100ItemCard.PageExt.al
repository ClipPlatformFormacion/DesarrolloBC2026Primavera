namespace ClipPlatform.QualityControl;
using Microsoft.Inventory.Item;
pageextension 50100 "50100Item Card" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(Quality)
            {
                // Caption = 'Quality', Comment = 'ESP="Calidad"';
                Caption = 'Quality', Comment = 'ESP="Calidad",FRA="Calidad en frances"';
                field("Requieres Quality Control"; Rec."Requires Quality Control")
                {
                    // CaptionML = ESP = 'Nuevo caption';
                    ApplicationArea = All;
                    ToolTip = 'sbjhas', Comment = 'ESP="Especifica si el producto tiene que pasar por un proceso de control de calidad en la recepción de compras"';
                }
                // field("Non-satisfactory Purch. (Qty.)"; Rec."Non-satisfactory Purch. (Qty.)")
                // {
                //     ApplicationArea = All;
                // }
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
                Caption = 'Quality Control Measures', Comment = 'ESP="Medidas control calidad"';
                RunObject = page "Item QC Measures List";
                RunPageLink = "Item No." = field("No.");
                ApplicationArea = All;
                Image = Questionaire;
                ToolTip = 'Open the quality control measures for this item.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Non-satisfactory Purch. (Qty.)");
        Message('La cantidad comprada no satisfactoria es: %1', Rec."Non-satisfactory Purch. (Qty.)");
    end;
}