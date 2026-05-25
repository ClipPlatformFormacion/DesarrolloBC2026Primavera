namespace ClipPlatform.WebServices;
using Microsoft.Sales.Customer;

codeunit 50105 "Mi WebService"
{
    procedure UnMetodoSinParametroNiValorDeRetorno()
    begin
    end;

    procedure UnMetodoConParametroDeTexto(UnParametro: Text): Text
    begin
        exit(UnParametro + ' desde Business Central');
    end;

    procedure CrearCliente(): Code[20]
    var
        Customer: Record Customer;
    begin
        Customer.Init();
        Customer.Validate(Name, 'Cliente creado desde WS');
        Customer.Insert(true);
        exit(Customer."No.");
    end;

    procedure CrearClienteConParametros(Name: Text[100]; Address: Text[100]; PhoneNo: Text[30]; CreditLimit: Decimal): Code[20]
    var
        Customer: Record Customer;
    begin
        if GuiAllowed() then
            if not Confirm('¿Estás seguro que quieres crear el cliente') then
                Error('');

        Customer.Init();
        Customer.Validate(Name, Name);
        Customer.Validate(Address, Address);
        Customer.Validate("Phone No.", PhoneNo);
        Customer.Validate("Credit Limit (LCY)", CreditLimit);
        Customer.Insert(true);
        exit(Customer."No.");
    end;

    procedure CrearClienteComplejo(parametro: XmlPort "Import Sales Order")
    begin
        parametro.Import();
    end;
}