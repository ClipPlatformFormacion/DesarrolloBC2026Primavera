namespace ClipPlatform.OtraFuncionalidad;

pagecustomization PageExtension50000 customizes ClipPlatform.QualityControl."QC Activities"
{
    layout
    {
        movefirst(ControlCalidad; "Receptions - Satisfactory")
        moveafter("Receptions - Satisfactory"; "Receptions - NonSatisfactory")
    }
}