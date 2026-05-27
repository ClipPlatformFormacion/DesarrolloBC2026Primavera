codeunit 50151 GetMin
{
    procedure GetMin(P1: Integer; P2: Integer) Resultado: Integer
    begin
        Resultado := p1;
        if P2 < p1 then
            Resultado := P2;
    end;

    procedure GetMin(Data: List of [Integer]) Resultado: Decimal
    var
        Valor: Integer;
        FirstIteration: Boolean;
    begin
        FirstIteration := true;

        if Data.Count() = 0 then
            Error('La lista no puede estar vacía');

        foreach Valor in Data do
            if FirstIteration then begin
                Resultado := Valor;
                FirstIteration := false;
            end else
                Resultado := GetMin(Resultado, Valor);
    end;
}