@{
    AllNodes = @(
        @{
            NodeName                    = '*';
            InterfaceAlias              = 'Ethernet';
            DefaultGateway              = '19.168.0.1';
            PrefixLength                = 24;
            AddressFamily               = 'IPv4';
            DnsServerAddress            = '192.168.0.1';
            PSDscAllowPlainTextPassword = $true;
            Lability_SwitchName         = 'External';
            Lability_Module             = 'dbatools';
        }
        @{
            NodeName                    = 'SQL01';
            IPAddress                   = '19.168.0.56';
            Lability_Media              = '2012R2_x64_Standard_EN_V5_1_Eval';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 2GB;
            Lability_WarningMessage     = "Keyboard layout will be 'EN-US'";
			Lability_Resource = @('SQL2014Express');

        }
    );
    NonNodeData = @{
        Lability = @{
            DSCResource = @(
                @{ Name = 'xNetworking'; RequiredVersion = '3.2.0.0'; }
                @{ Name = 'xPSDesiredStateConfiguration'; RequiredVersion = '6.0.0.0'; }
            )
			Resource = @(
                @{
                    ## Resource identifier. If the resource is to be expanded (ZIP or ISO), it will also be expanded into
                    ## the \Resources\<ResourceID> folder on the target node.
                    Id = 'SQL2014Express';
            
                    ## When the file is downloaded, it will be placed in the host's Resources folder using this filename.
                    Filename = 'SQLEXPR_x64_ENU.zip';
            
                    ## The source URI to download the file from if it is not present in the host's Resources folder. This can
                    ## be a http, https or file URI. If the path includes spaces, they must be URL encoded.
                    Uri = 'file://\\FILESERVER\SHARE\Software\Microsoft\SQLEXPRWT_x64_ENU.zip';
            
                    ## If you want the module to check the downloaded file, you can specify a MD5 checksum. If you do specify a
                    ## checksum you HAVE to ensure it's correct otherwise it will continuously attempt to download the image!
                    Checksum = '';
            
                    ## If the resource is a .ZIP or .ISO file, it can be expanded/decompressed when copied into the node's
                    ## \Resources\<ResourceID> folder. If not specified, this value defaults to False.
                    Expand = $true;
                    
                    ## The default target path can be overridden by specifying a destination path. This path is relative to
                    ## the root of the operating system drive. Resources will be placed inside this directory.
                    DestinationPath = '\SQLSetup'
                }
				)
                            ## The Module node follows the same schema as the DSCResource node (essentially they're the same!)
            Module = @(
                ## Downloads the latest published module version from the PowerShell Gallery
                @{ Name = 'dbatools' }
            )
        };
    };
};
