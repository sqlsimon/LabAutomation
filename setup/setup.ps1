
<#
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module -Name Lability
	
Get-Command -Module Lability

Get-LabMedia | ft Id,Description

#>

Get-LabHostDefault

$LabilityDrive = 'Y'

Set-LabHostDefault -ConfigurationPath ($LabilityDrive + ":\Lability\Configurations") 
Set-LabHostDefault -HotfixPath ($LabilityDrive + ":\Lability\Hotfixes")
Set-LabHostDefault -IsoPath ($LabilityDrive + ":\Lability\ISOs")
Set-LabHostDefault -ParentVhdPath ($LabilityDrive + ":\Lability\MasterVirtualHardDisks")
Set-LabHostDefault -DifferencingVhdPath ($LabilityDrive + ":\Lability\VMVirtualHardDisks")
Set-LabHostDefault -ResourcePath ($LabilityDrive + ":\Lability\Resources")