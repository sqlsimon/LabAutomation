Configuration SQLServer2014 {
<#
    Requires the following DSC resources:

        xNetworking:                  https://github.com/PowerShell/xNetworking
        xPSDesiredStateConfiguration: https://github.com/PowerShell/xPSDesiredStateConfiguration
#>
    param ()

    Import-DscResource -Module xNetworking, xPSDesiredStateConfiguration;

    node $AllNodes.Where({$true}).NodeName {

        LocalConfigurationManager {

            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode = 'ApplyOnly';
            CertificateID = $node.Thumbprint;
        }

        if (-not [System.String]::IsNullOrEmpty($node.IPAddress)) {

            xIPAddress 'PrimaryIPAddress' {

                IPAddress      = $node.IPAddress;
                InterfaceAlias = $node.InterfaceAlias;
                PrefixLength   = $node.PrefixLength;
                AddressFamily  = $node.AddressFamily;
            }

            if (-not [System.String]::IsNullOrEmpty($node.DnsServerAddress)) {

                xDnsServerAddress 'PrimaryDNSClient' {

                    Address        = $node.DnsServerAddress;
                    InterfaceAlias = $node.InterfaceAlias;
                    AddressFamily  = $node.AddressFamily;
                }
            }

            if (-not [System.String]::IsNullOrEmpty($node.DefaultGateway)) {

                xDefaultGatewayAddress 'PrimaryDefaultGateway' {

                    InterfaceAlias = $node.InterfaceAlias;
                    Address = $node.DefaultGateway;
                    AddressFamily = $node.AddressFamily;
                }
            }

        } #end if IPAddress

      

    } #end nodes ALL

} #end Configuration Example
