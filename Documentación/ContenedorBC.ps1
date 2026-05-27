#Install-Module -Name BcContainerHelper -Force

$artifactUrl = Get-BCArtifactUrl -country es -select Latest -version 28.1


$UserName = 'Alumno'
$Password = 'Formacion2026'
$credential = New-Object pscredential $UserName, (ConvertTo-SecureString -String $Password -AsPlainText -Force)

New-BcContainer -containerName BC28CU1ES -artifactUrl $artifactUrl -auth UserPassword -Credential $credential -accept_eula -useBestContainerOS -updateHosts -includeTestToolkit -includeTestLibrariesOnly