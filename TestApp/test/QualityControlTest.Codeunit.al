codeunit 50152 "Quality Control Test"
{
    Subtype = Test;

    [Test]
    procedure ErrorWhenPostingReceiptWithoutQCResult()
    var
        Item: Record Item;
        v1: Record "Quality Control Measures";
    begin
        // [Scenario] Cuando se intenta registrar la recepción de un pedido de compra que
        // contiene un producto que requiere control de calidad, si el usuario no establece
        // el resultado del control de calidad, el sistema no tiene que permitir el registro

        // [Given] Un producto que requiera control de calidad
        //         Un pedido de compra para un proveedor cualquiera
        //         Una línea de compra para el producto (sin especificar resultado CC)
        Item.Init();
        Item."No." := 'TEST';
        Item."Requieres Quality Control" := true;
        Item.Insert();
        // TODO Test-TestLibraries

        // [When] Se registra la recepción

        // [Then] Se produce un error y el sistema no registra el albarán
    end;
}