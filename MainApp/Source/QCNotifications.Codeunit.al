codeunit 50109 "QC Notifications"
{

    [EventSubscriber(ObjectType::Page, Page::"Item List", OnOpenPageEvent, '', false, false)]
    local procedure OnOpenItemList_ShowError()
    var
        ErrorInfo: ErrorInfo;
    begin
        ErrorInfo.Message('Un mensaje un de error');
        ErrorInfo.AddAction('Desbloquear el producto', Codeunit::"QC Notifications", 'ErrorAction1');
        // Error(ErrorInfo);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item List", OnOpenPageEvent, '', false, false)]
    local procedure OnOpenItemList_ShowNotification()
    var
        MyNotification: Notification;
    begin
        if this.NotificationShouldBeShown() then begin
            MyNotification.Message('Hay productos que han tenido recepciones no satisfactorias que no están bloqueados');
            MyNotification.AddAction('Bloquear productos', Codeunit::"QC Notifications", 'BlockItems');
            MyNotification.AddAction('No volver a mostrar', Codeunit::"QC Notifications", 'DoNotShowAnymore');
            MyNotification.SetData('Producto', '1986-S');
            MyNotification.Send();
        end;
    end;

    local procedure NotificationShouldBeShown(): Boolean
    var
        Item: Record Item;
        MyNotifications: Record "My Notifications";
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        if MyNotifications.Get(UserId(), AppInfo.Id()) then
            if not MyNotifications.Enabled then
                exit(false);

        Item.SetRange(Blocked, false);
        Item.SetFilter("Non-satisfactory Purch. (Qty.)", '>0');
        exit(not Item.IsEmpty());
    end;

    procedure BlockItems(LaNotification: Notification)
    var
        ItemNo: Text;
    begin
        Report.Run(Report::"Block Non Satisfactory Items");
        ItemNo := LaNotification.GetData('Producto');
    end;

    procedure DoNotShowAnymore(LaNotification: Notification)
    var
        MyNotifications: Record "My Notifications";
        AppInfo: ModuleInfo;
        NotificationGUID: Guid;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        NotificationGUID := AppInfo.Id();

        if MyNotifications.Get(UserId(), NotificationGUID) then begin
            MyNotifications.Validate(Enabled, false);
            MyNotifications.Modify(true);
        end else
            MyNotifications.InsertDefault(NotificationGUID, 'Notificacion de productos no satisfactorios no bloqueados', 'Notificacion de productos no satisfactorios no bloqueados', false);
    end;

    procedure ErrorAction1(ErrorInfor: ErrorInfo)
    var
        Item: Record Item;
    begin
        Item.ModifyAll(Blocked, false);
    end;
}