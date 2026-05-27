codeunit 50150 "Test Framework"
{
    Subtype = Test;

    [Test]
    procedure Test001()
    begin

    end;

    [Test]
    procedure Test002()
    begin
        Error('Error en el test');
    end;

    [Test]
    procedure GetMin001()
    var
        GetMin: Codeunit GetMin;
        Datos: List of [Integer];
        Value1, Value2 : Integer;
        Resultado: Integer;
    begin
        // [Scenario] Cuando a una función GetMin le pasamos los valores 1 y 2, el resultado es el primero (1) porque es el más pequeño

        // [Given] Los valores 1 y 2
        value1 := 1;
        Value2 := 2;
        Datos.Add(Value1);
        Datos.Add(Value2);

        // [When] Llamamos a la función GetMin
        Resultado := GetMin.GetMin(Datos);
        // [Then] El resultado tiene que ser 1
        if Resultado <> Value1 then
            Error('El resultado es incorrecto');
    end;

    [Test]
    procedure GetMin002()
    var
        GetMin: Codeunit GetMin;
        Value1, Value2 : Integer;
        Datos: List of [Integer];
        Resultado: Integer;
    begin
        // [Scenario] Cuando a una función GetMin le pasamos los valores 10 y 2, el resultado es el segundo (2) porque es el más pequeño

        // [Given] Los valores 10 y 2
        value1 := 10;
        Value2 := 2;
        Datos.Add(Value1);
        Datos.Add(Value2);
        // [When] Llamamos a la función GetMin
        Resultado := GetMin.GetMin(Datos);
        // [Then] El resultado tiene que ser 2
        if Resultado <> Value2 then
            Error('El resultado es incorrecto');
    end;

    [Test]
    procedure GetMin003()
    var
        GetMin: Codeunit GetMin;
        Value1, Value2 : Integer;
        Datos: List of [Integer];
        Resultado: Integer;
    begin
        // [Scenario] Cuando a una función GetMin le pasamos los valores 11 y 11, el resultado es cualquiera de los dos

        // [Given] Los valores 11 y 11
        value1 := 11;
        Value2 := 11;
        Datos.Add(Value1);
        Datos.Add(Value2);
        // [When] Llamamos a la función GetMin
        Resultado := GetMin.GetMin(Datos);
        // [Then] El resultado tiene que ser cualquiera de los 2
        if Resultado <> Value2 then
            Error('El resultado es incorrecto');
    end;

    [Test]
    procedure GetMin004()
    var
        GetMin: Codeunit GetMin;
        Valores: List of [Integer];
        Resultado: Integer;
    begin
        // [Scenario] Cuando a una función GetMin le pasamos los valores 11 y 11, el resultado es cualquiera de los dos

        // [Given] Los valores 11 y 11        
        Valores.Add(11);
        Valores.Add(11);
        Valores.Add(2);
        Valores.Add(5);
        // [When] Llamamos a la función GetMin
        Resultado := GetMin.GetMin(Valores);
        // [Then] El resultado tiene que ser cualquiera de los 2
        if Resultado <> 2 then
            Error('El resultado es incorrecto');
    end;
}