tableextension 50100 ItemExtension extends Item
{
    fields
    {
        field(50100; "Requieres Quality Control"; Boolean)
        {
            Caption = 'Requieres Quality Control', Comment = 'ESP="Requiere control calidad"';
            DataClassification = CustomerContent;
        }
        field(50101; "Non-satisfactory Purch. (Qty.)"; Decimal)
        {
            Caption = 'Non-satisfactory Purch. (Qty.)', comment = 'ESP="Compras No Satisfactorias (Cdad.)"';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
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
    }
}