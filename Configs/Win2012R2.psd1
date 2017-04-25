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
        }
        @{
            NodeName                    = 'LABSQL01';
            IPAddress                   = '19.168.0.56';
            Lability_Media              = '2012R2_x64_Standard_EN_V5_1_Eval';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 2GB;
            Lability_WarningMessage     = "Keyboard layout will be 'EN-US'";
        }
    );
    NonNodeData = @{
        Lability = @{
            DSCResource = @(
                @{ Name = 'xNetworking'; RequiredVersion = '3.2.0.0'; }
                @{ Name = 'xPSDesiredStateConfiguration'; RequiredVersion = '6.0.0.0'; }
            )
        };
    };
};
