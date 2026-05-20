namespace ClipPlatform.WebServices;

codeunit 50105 "Mi WebService"
{
    procedure UnMetodoSinParametroNiValorDeRetorno()
    begin
    end;

    procedure UnMetodoConParametroDeTexto(UnParametro: Text): Text
    begin
        exit(UnParametro + ' desde Business Central');
    end;
}