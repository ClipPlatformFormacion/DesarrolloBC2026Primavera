codeunit 50152 "Quality Control Test"
{
    Subtype = Test;

    [Test]
    procedure ErrorWhenPostingReceiptWithoutQCResult()
    var
        Item: Record Item;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        LibraryInventory: Codeunit "Library - Inventory";
        LibraryPurchase: Codeunit "Library - Purchase";
        LibraryAssert: Codeunit "Library Assert";
        QCMandatoryResultErr: TextConst ENU = 'Item %1 requieres quality control', ESP = 'El producto %1 requiere control de calidad';
    begin
        // [Scenario] Cuando se intenta registrar la recepción de un pedido de compra que
        // contiene un producto que requiere control de calidad, si el usuario no establece
        // el resultado del control de calidad, el sistema no tiene que permitir el registro

        // [Given] Un producto que requiera control de calidad
        //         Un pedido de compra para un proveedor cualquiera
        //         Una línea de compra para el producto (sin especificar resultado CC)
        LibraryInventory.CreateItem(Item);
        Item.Validate("Requieres Quality Control", true);
        Item.Modify(true);

        LibraryPurchase.CreatePurchaseDocumentWithItem(PurchaseHeader,
                                                        PurchaseLine,
                                                        "Purchase Document Type"::Order,
                                                        '',
                                                        Item."No.",
                                                        1,
                                                        '',
                                                        Today());

        // [When] Se registra la recepción
        asserterror LibraryPurchase.PostPurchaseDocument(PurchaseHeader, true, false);

        // [Then] Se produce un error y el sistema no registra el albarán
        LibraryAssert.AreEqual(StrSubstNo(QCMandatoryResultErr, Item."No."), GetLastErrorText(), 'El mensaje de error no es el esperado');
    end;
}