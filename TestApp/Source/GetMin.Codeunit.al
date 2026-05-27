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
        i: Integer;
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

        // repeat
        //     i += 1;
        //     Data.Get(i, Valor);
        //     if FirstIteration then begin
        //         Resultado := Valor;
        //         FirstIteration := false;
        //     end else
        //         Resultado := GetMin(Resultado, Valor);
        // until i >= Data.Count();

        // i := 0;
        // while i < Data.Count() do begin
        //     i += 1;
        //     Data.Get(i, Valor);
        //     if FirstIteration then begin
        //         Resultado := Valor;
        //         FirstIteration := false;
        //     end else
        //         Resultado := GetMin(Resultado, Valor);
        // end;

        // for i := 1 to Data.Count() do begin
        //     Data.Get(i, Valor);
        //     if FirstIteration then begin
        //         Resultado := Valor;
        //         FirstIteration := false;
        //     end else
        //         Resultado := GetMin(Resultado, Valor);
        // end;
    end;
}