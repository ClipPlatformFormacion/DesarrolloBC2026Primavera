codeunit 50152 "Quality Control Test"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure ErrorWhenPostingReceiptWithoutQCResult()
    var
        Item: Record Item;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        LibraryQualityControl: Codeunit "Library - Quality Control";
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
        Item := LibraryQualityControl.CreateItemWithQC();

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

    [Test]
    procedure QCResultIsSavedInTheReceipt()
    var
        Item: Record Item;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        LibraryQualityControl: Codeunit "Library - Quality Control";
        LibraryPurchase: Codeunit "Library - Purchase";
        LibraryAssert: Codeunit "Library Assert";
        DocumentNo: Code[20];
    begin
        // [Scenario] El resultado de control de calidad que el usuario establece en el pedido
        // de compra, queda guardada en el correspondiente albarán tras registrar el pedido

        // [Given] Un producto que requiera control de calidad
        //         Un pedido de compra para un proveedor cualquiera
        //         Una línea de compra para el producto (especificando resultado CC)
        Item := LibraryQualityControl.CreateItemWithQC();

        LibraryPurchase.CreatePurchaseDocumentWithItem(PurchaseHeader,
                                                        PurchaseLine,
                                                        "Purchase Document Type"::Order,
                                                        '',
                                                        Item."No.",
                                                        1,
                                                        '',
                                                        Today());
        PurchaseLine.Validate("QC Result (Option)", PurchaseLine."QC Result (Option)"::Satisfactory);
        PurchaseLine.Validate("QC Result (Enum)", PurchaseLine."QC Result (Enum)"::Satisfactory);
        PurchaseLine.Modify(true);

        // [When] Se registra la recepción
        DocumentNo := LibraryPurchase.PostPurchaseDocument(PurchaseHeader, true, false);

        // [Then] El resultado del control de calidad ha quedado guardado en el albarán
        PurchRcptLine.Get(DocumentNo, PurchaseLine."Line No.");
        LibraryAssert.AreEqual(PurchaseLine."QC Result (Option)"::Satisfactory, PurchRcptLine."QC Result (Option)", 'El resultado no es correcto');
        LibraryAssert.AreEqual(PurchaseLine."QC Result (Enum)"::Satisfactory, PurchRcptLine."QC Result (Enum)", 'El resultado no es correcto');
    end;

    [Test]
    procedure SelectingItemOnAnOrderFillsQCMeasures()
    var
        Item: Record Item;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        ItemQCMeasures: Record "Item Quality Control Measures";
        PurchaseQCMeasures: Record "Purch. QC Measures";
        LibraryQualityControl: Codeunit "Library - Quality Control";
        LibraryPurchase: Codeunit "Library - Purchase";
        LibraryAssert: Codeunit "Library Assert";
    begin
        // [Scenario] Cuando un usuario selecciona un producto que 
        // requiere control de calidad en un documento de compra
        // el sistema le proporciona al usuario la información de las
        // medidas que tiene que tomar

        // [Given] Un producto que requiera control de calidad y tenga medidas
        //         Un pedido de compra para un proveedor cualquiera
        //         Una línea de compra
        Item := LibraryQualityControl.CreateItemWithQC();

        LibraryPurchase.CreatePurchHeader(PurchaseHeader, "Purchase Document Type"::Order, '');
        LibraryPurchase.CreatePurchaseLineSimple(PurchaseLine, PurchaseHeader);

        // [When] El usuario selecciona el producto en la línea
        PurchaseLine.Validate(Type, PurchaseLine.Type::Item);
        PurchaseLine.Validate("No.", Item."No.");
        PurchaseLine.Modify(true);

        // [Then] Existen las medidas del producto vinculadas a la línea
        ItemQCMeasures.SetRange("Item No.", Item."No.");
        PurchaseQCMeasures.SetRange("Document Type", PurchaseLine."Document Type");
        PurchaseQCMeasures.SetRange("Document No.", PurchaseLine."Document No.");
        PurchaseQCMeasures.SetRange("Line No.", PurchaseLine."Line No.");
        LibraryAssert.AreEqual(ItemQCMeasures.Count(), PurchaseQCMeasures.Count(), 'El número es registros es incorrecto');
    end;
}