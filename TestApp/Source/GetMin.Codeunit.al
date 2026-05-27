codeunit 50151 GetMin
{
    [Obsolete('Esta función va a desaparecer. Utiliza la funcion GetMin(List of [Integer] en su lugar')]
    procedure GetMin(P1: Integer; P2: Integer) Resultado: Integer
    var
        Datos: List of [Integer];
    begin
        Datos.Add(P1);
        Datos.Add(P2);
        Resultado := GetMin(Datos);
    end;

    procedure GetMin(Data: List of [Integer]) Resultado: Decimal
    var
        Valor: Integer;
        FirstIteration: Boolean;
    // i: Integer;
    begin
        FirstIteration := true;

        if Data.Count() = 0 then
            Error('La lista no puede estar vacía');

        foreach Valor in Data do
            if FirstIteration then begin
                Resultado := Valor;
                FirstIteration := false;
            end else
                if Valor < Resultado then
                    Resultado := Valor;

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