<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration TeamsChannelConfig
{
    Import-DSCResource -ModuleName Office365DSC
    $credsGlobalAdmin = Get-Credential -UserName "TenantAdmin@O365DSC1.onmicrosoft.com" -Message "Global Admin"
    Node localhost
    {
        TeamsChannel MyChannel
        {
            GroupID            = "6c1d4863-d0c0-402d-b169-ead1bb6a2f59"
            DisplayName        = "SP2013 Review teams group"
            NewDisplayName     = "SP2016 Review teams group"
            Description        = "SP2016 Code reviews for SPFX"
            Ensure             = "Present"
            GlobalAdminAccount = $credsGlobalAdmin
        }
    }
}

$configData = @{
    AllNodes = @(
        @{
            NodeName                    = "localhost"
            PSDscAllowPlainTextPassword = $true;
            PSDscAllowDomainUser        = $true;
        }
    )
}

TeamsChannelConfig -ConfigurationData $configData
