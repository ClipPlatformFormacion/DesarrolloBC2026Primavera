tableextension 50105 Customer extends Customer
{
    fields
    {
        field(50100; "Customer Level"; Enum "Customer Level")
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Handled: Boolean;
            begin
                case Rec."Customer Level" of
                    Rec."Customer Level"::" ":
                        Rec.Validate("Level Discount", 0);
                    Rec."Customer Level"::Silver:
                        Rec.Validate("Level Discount", 5);
                    Rec."Customer Level"::Gold:
                        Rec.Validate("Level Discount", 10);
                    else
                        OnValidateCustomerLevelOnBeforeUnknownLevelError(Rec, Handled);
                        if not Handled then
                            Error('Nivel %1 desconocido', Rec."Customer Level");
                end;
            end;
        }
        field(50101; "Level Discount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    [IntegrationEvent(false, false)]
    procedure OnValidateCustomerLevelOnBeforeUnknownLevelError(var Customer: Record Customer; var Handled: Boolean)
    begin

    end;
}