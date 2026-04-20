#Install-Module -Name BcContainerHelper -Force

$artifactUrl = Get-BCArtifactUrl -country es -select Latest -version 27


$UserName = 'Alumno'
$Password = 'Formacion2026'
$credential = New-Object pscredential $UserName, (ConvertTo-SecureString -String $Password -AsPlainText -Force)

New-BcContainer -containerName BC27CU5ES -artifactUrl $artifactUrl -auth UserPassword -Credential $credential -accept_eula -useBestContainerOS -updateHosts -includeTestToolkit -includeTestLibrariesOnly