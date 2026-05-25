pageextension 50103 "50103Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Quantity)
        {
            field("QC Result (Option)"; Rec."QC Result (Option)")
            {
                ApplicationArea = All;
            }
            field("QC Result (Enum)"; Rec."QC Result (Enum)")
            {
                ApplicationArea = All;
            }
            field("Source No.2"; Rec."Source No.")
            {
                ApplicationArea = All;
            }
            field("Source Name"; Rec."Source Name")
            {
                ApplicationArea = All;
            }
#pragma warning disable AA0225
            field(Expresion1; 2) { ApplicationArea = All; }
            field(Expresion2; 'un texto') { ApplicationArea = All; }
            field(Expresion3; 1 + 2) { ApplicationArea = All; }
            field(Expresion4; UnaLlamadaAUnaFuncion()) { ApplicationArea = All; }
            field(Expresion5; UnaVariable) { ApplicationArea = All; }
#pragma warning restore
        }
    }

    views
    {
        addfirst
        {
            view(Satisfactory)
            {
                Caption = 'Satisfactory', comment = 'ESP="Satisfactorio"';
                Filters = where("QC Result (Enum)" = const(satisfactory));
                SharedLayout = false;

                layout
                {
                    modify(Description) { Visible = false; }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UnaVariable := UnaLlamadaAUnaFuncion();
    end;

    var
        UnaVariable: Text;

    procedure UnaLlamadaAUnaFuncion(): Text
    var
        Vendor: Record Microsoft.Purchases.Vendor.Vendor;
        Customer: Record Customer;
    begin
        case Rec."Source Type" of
            Rec."Source Type"::Vendor:
                begin
                    Vendor.SetLoadFields(Name);
                    if Vendor.Get(Rec."Source No.") then
                        exit(Vendor.Name);
                end;
            Rec."Source Type"::Customer:
                begin
                    Customer.SetLoadFields(Name);
                    if Customer.Get(Rec."Source No.") then
                        exit(Customer.Name);
                end;
        end;
    end;
}