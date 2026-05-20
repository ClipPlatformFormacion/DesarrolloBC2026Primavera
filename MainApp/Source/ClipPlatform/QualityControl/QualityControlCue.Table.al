namespace ClipPlatform.QualityControl;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;

table 50105 "Quality Control Cue"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; PK; Code[10]) { }
        field(2; "Items that Requiere QC"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item where("Requieres Quality Control" = const(true)));
            Editable = false;
        }
        field(3; "Receptions - Satisfactory"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Item Ledger Entry" where("QC Result (Enum)" = const(Satisfactory),
                                                            "Entry Type" = const(Purchase)));
            Editable = false;
        }
        field(4; "Receptions - NonSatisfactory"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Item Ledger Entry" where("QC Result (Enum)" = const("Non Satisfactory"),
                                                            "Entry Type" = const(Purchase)));
            Editable = false;
        }
    }
}