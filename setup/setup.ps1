
<#
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module -Name Lability
	
Get-Command -Module Lability

Get-LabMedia | ft Id,Description

Install-Module -Name xNetworking
Install-Module -Name xPSDesiredStateConfiguration
Install-Module -Name xSQLServer



#>

Get-LabHostDefault

$LabilityDrive = 'Y'

Set-LabHostDefault -ConfigurationPath ($LabilityDrive + ":\Lability\Configurations") 
Set-LabHostDefault -HotfixPath ($LabilityDrive + ":\Lability\Hotfixes")
Set-LabHostDefault -IsoPath ($LabilityDrive + ":\Lability\ISOs")
Set-LabHostDefault -ParentVhdPath ($LabilityDrive + ":\Lability\MasterVirtualHardDisks")
Set-LabHostDefault -DifferencingVhdPath ($LabilityDrive + ":\Lability\VMVirtualHardDisks")
Set-LabHostDefault -ResourcePath ($LabilityDrive + ":\Lability\Resources")

<#
cd Y:\Lability\Configurations
. Y:\Lability\Configurations\NanoExample.ps1
NanoExample -Outputpath D:\Lability\Configurations -ConfigurationData .\NanoExample.psd1

. Y:\Lability\Configurations\SQLServer2014.ps1
SQLServer2014 -OutputPath  Y:\Lability\Configurations\ -ConfigurationData .\SQLServer2014.psd1

Start-LabConfiguration -ConfigurationData .\SQLServer2014.psd1 -Verbose
#>

Start-LabHostConfiguration -Verbose