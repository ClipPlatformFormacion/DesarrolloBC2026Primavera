namespace ClipPlatform.QualityControl;
using Microsoft.Sales.Receivables;
pagecustomization "50107Customer Ledger Entries" customizes "Customer Ledger Entries"
{
    analysisviews
    {
        addfirst
        {
            analysisview(UnaVistaDeAnalisis)
            {
                Caption = 'Una Vista de Análisis';
                DefinitionFile = './Source/SumaDeFacturas.analysis.json';
            }
        }
    }
}