codeunit 50107 "Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);

        if (AppInfo.AppVersion.ToText() = '1.0.0.1') then
            UpgradeRequiresQualityControl();
    end;

    local procedure UpgradeRequiresQualityControl()
    var
        Item: Record Item;
    begin
        if Item.FindSet() then
            repeat
                Item."Requires Quality Control" := Item."Requieres Quality Control";
                Item.Modify();
            until Item.Next() = 0;
    end;
}