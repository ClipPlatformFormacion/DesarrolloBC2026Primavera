codeunit 50151 GetMin
{
    procedure GetMin(P1: Integer; P2: Integer) Resultado: Integer
    begin
        Resultado := p1;
        if P2 < p1 then
            Resultado := P2;
    end;
}