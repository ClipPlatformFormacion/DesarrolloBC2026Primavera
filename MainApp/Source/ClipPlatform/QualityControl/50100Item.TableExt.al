namespace ClipPlatform.QualityControl;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Location;
tableextension 50100 "50100Item" extends Item
{
    fields
    {
        field(50100; "Requieres Quality Control"; Boolean)
        {
            Caption = 'Requieres Quality Control', Comment = 'ESP="Requiere control calidad"';
            DataClassification = CustomerContent;
            AllowInCustomizations = Never;
            ObsoleteReason = 'Este campo va a ser eliminado. Utiliza el campo "Requires Quality Control" en su lugar.';
            ObsoleteState = Pending;
            ObsoleteTag = '27.0';

            trigger OnValidate()
            begin
                Rec."Requires Quality Control" := Rec."Requieres Quality Control";
            end;
        }
        field(50103; "Requires Quality Control"; Boolean)
        {
            Caption = 'Requires Quality Control', Comment = 'ENG="Requires Quality Control"';
            DataClassification = CustomerContent;
            AllowInCustomizations = Never;

            trigger OnValidate()
            begin
                Rec."Requieres Quality Control" := Rec."Requires Quality Control";
            end;
        }
        field(50101; "Non-satisfactory Purch. (Qty.)"; Decimal)
        {
            Caption = 'Non-satisfactory Purch. (Qty.)', comment = 'ESP="Compras No Satisfactorias (Cdad.)"';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                 "Entry Type" = const(Purchase),
                                                                 "Document Type" = const("Purchase Receipt"),
                                                                 "QC Result (Enum)" = const("Non Satisfactory"),
                                                                 "Location Code" = field("Un FlowFilter")
                                                                ));
            DecimalPlaces = 0 : 5;
            BlankZero = true;
        }
        field(50102; "Un FlowFilter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }

        modify(Blocked)
        {
            trigger OnAfterValidate()
            begin
                if Rec."No." = '1906-S' then
                    Error('Error del producto 1906-S');
            end;
        }
    }
}