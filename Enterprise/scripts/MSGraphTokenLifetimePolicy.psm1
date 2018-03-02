# Globals
$Global:authenticationResult
$global:graphEndpoint = "https://graph.windows.net"


#######################################
# ADAL Setup
#######################################

function Import-ActiveDirectoryAuthenticationLibrary(){
  $moduleDirPath = [Environment]::GetFolderPath("MyDocuments") + "\WindowsPowerShell\Modules"
  $modulePath = $moduleDirPath + "\AADGraph"
  if(-not (Test-Path ($modulePath+"\Nugets"))) {New-Item -Path ($modulePath+"\Nugets") -ItemType "Directory" | out-null}
  $adalPackageDirectories = (Get-ChildItem -Path ($modulePath+"\Nugets") -Filter "Microsoft.IdentityModel.Clients.ActiveDirectory*" -Directory)
  if($adalPackageDirectories.Length -eq 0){
    Write-Host "Active Directory Authentication Library Nuget doesn't exist. Downloading now ..." -ForegroundColor Yellow
    if(-not(Test-Path ($modulePath + "\Nugets\nuget.exe")))
    {
      Write-Host "nuget.exe not found. Downloading from http://www.nuget.org/nuget.exe ..." -ForegroundColor Yellow
      $wc = New-Object System.Net.WebClient
      $wc.DownloadFile("http://www.nuget.org/nuget.exe",$modulePath + "\Nugets\nuget.exe");
    }
    $nugetDownloadExpression = $modulePath + "\Nugets\nuget.exe install Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.14.201151115 -OutputDirectory " + $modulePath + "\Nugets | out-null"
    Invoke-Expression $nugetDownloadExpression
  }
  $adalPackageDirectories = (Get-ChildItem -Path ($modulePath+"\Nugets") -Filter "Microsoft.IdentityModel.Clients.ActiveDirectory*" -Directory)
  $ADAL_Assembly = (Get-ChildItem "Microsoft.IdentityModel.Clients.ActiveDirectory.dll" -Path $adalPackageDirectories[$adalPackageDirectories.length-1].FullName -Recurse)
  $ADAL_WindowsForms_Assembly = (Get-ChildItem "Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll" -Path $adalPackageDirectories[$adalPackageDirectories.length-1].FullName -Recurse)
  if($ADAL_Assembly.Length -gt 0 -and $ADAL_WindowsForms_Assembly.Length -gt 0){
    Write-Host "Loading ADAL Assemblies ..." -ForegroundColor Green
    [System.Reflection.Assembly]::LoadFrom($ADAL_Assembly[0].FullName) | out-null
    [System.Reflection.Assembly]::LoadFrom($ADAL_WindowsForms_Assembly.FullName) | out-null
    return $true
  }
  else{
    Write-Host "Fixing Active Directory Authentication Library package directories ..." -ForegroundColor Yellow
    $adalPackageDirectories | Remove-Item -Recurse -Force | Out-Null
    Write-Host "Not able to load ADAL assembly. Delete the Nugets folder under" $modulePath ", restart PowerShell session and try again ..."
    return $false
  }
}

#######################################
# Connect to Tenant
#######################################

function Get-AuthenticationResult($tenant = "common"){
  $clientId = "1950a258-227b-4e31-a9cf-717495945fc2"
  $redirectUri = "urn:ietf:wg:oauth:2.0:oob"
  $resourceAppIdURI = "https://graph.windows.net/"
  $authority = "https://login.windows.net/" + $tenant
  $authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority,$false
  $Global:authenticationResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, [Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Always)
  return $Global:authenticationResult;
}

function GetAuthenticationHeader()
{
    if($Global:authenticationResult -eq $null)
    {
        $Global:authenticationResult = Get-AuthenticationResult;
    }

    return $Global:authenticationResult.CreateAuthorizationHeader();
}

#######################################
# Policy CRUD
#######################################

function Get-Policy($policyID = ""){
    $uri = GetPolicyUrl -policyId $policyId -internal $true
    Write-Host "Invoked Get-Policy"
    return InvokeMSGraphAPI -uri $uri
}

function Remove-Policy($policyId)
{
    ValidateArgument "PolicyId", $policyId

    $uri = GetPolicyUrl -policyId $policyId -internal $true;
    return InvokeMSGraphAPI -uri $uri -HttpMethod "DELETE"
}

function Get-PoliciesAssignedToApplication($applicationId = $null){
    ValidateArgument -argName "ApplicationId" -argument $applicationId

    $uri = GetPoliciesAssignedToEntityUrl -entity "applications" -entityId $applicationId
    return InvokeMSGraphAPI -uri $uri
}

function Get-PoliciesAssignedToServicePrincipal($servicePrincipalId = $null){
    ValidateArgument -argName "ServicePrincipalId" -argument $servicePrincipalId

    $uri = GetPoliciesAssignedToEntityUrl -entity "servicePrincipals" -entityId $servicePrincipalId
    return InvokeMSGraphAPI -uri $uri
}

function Set-PolicyToApplication(
    $policyId = $null, 
    $applicationId = $null)
{
    ValidateArgument -argName "PolicyId" -argument $policyId
    ValidateArgument -argName "ApplicationId" -argument $applicationId

    return AssignPolicyToEntity -policyId $policyId -entity "applications" -entityId $applicationId
}

function Remove-PolicyFromApplication(
    $policyId = $null, 
    $applicationId = $null)
{
    ValidateArgument -argName "PolicyId" -argument $policyId
    ValidateArgument -argName "ApplicationId" -argument $applicationId

    return RemovePolicyFromEntity -policyId $policyId -entity "applications" -entityId $applicationId
}

function Set-PolicyToServicePrincipal(
    $policyId = $null, 
    $servicePrincipalId = $null)
{
    ValidateArgument -argName "PolicyId" -argument $policyId
    ValidateArgument -argName "ServicePrincipalId" -argument $servicePrincipalId

    return AssignPolicyToEntity -policyId $policyId -entity "servicePrincipals" -entityId $servicePrincipalId
}

function Remove-PolicyFromServicePrincipal(
    $policyId = $null, 
    $servicePrincipalId = $null)
{
    ValidateArgument -argName "PolicyId" -argument $policyId
    ValidateArgument -argName "ServicePrincipalId" -argument $servicePrincipalId

    return RemovePolicyFromEntity -policyId $policyId -entity "servicePrincipals" -entityId $servicePrincipalId
}

function Get-ServicePrincipal($servicePrincipalId = ""){
    $uri = GetEntityUrl -entity "servicePrincipals" -entityId $servicePrincipalId
    return InvokeMSGraphAPI -uri $uri
}

function Get-Application($applicationId = ""){
    $uri = GetEntityUrl -entity "applications" -entityId $applicationId
    return InvokeMSGraphAPI -uri $uri
}

function Add-TokenLifetimePolicy(
    $DisplayName = $null,
    $AccessTokenLifetime = $null,
    $MaxInactiveTime = $null,
    $MaxAgeSingleFactor = $null,
    $MaxAgeMultiFactor = $null,
    $MaxAgeSessionSingleFactor = $null,
    $MaxAgeSessionMultiFactor = $null)
{
    $payload = New-Object System.Object;
    $uri = GetEntityUrl -entity "policies";

    $parameters = @{
        "displayName" = $DisplayName;
    }

    # Add default parameters
    $parameters.Add("type", "TokenLifetimePolicy");

    $policyParameters = @{
        "AccessTokenLifetime" = $AccessTokenLifetime;
        "MaxInactiveTime" = $MaxInactiveTime;
        "MaxAgeSingleFactor" = $MaxAgeSingleFactor;
        "MaxAgeMultiFactor" = $MaxAgeMultiFactor;
        "MaxAgeSessionSingleFactor" = $MaxAgeSessionSingleFactor;
        "MaxAgeSessionMultiFactor" = $MaxAgeSessionMultiFactor;
    }

    $policyParameters.Add("Version", 1);

    $payload = DictionaryToObject $parameters;
    $policyDefinition = DictionaryToObject $policyParameters;
    $policyChunk = DictionaryToObject @{ "TokenLifetimePolicy"= $policyDefinition; }
    $policyChunkJSON = ConvertTo-Json -InputObject $policyChunk -Depth 10 -Compress

    Add-Member -InputObject $payload -MemberType NoteProperty -Name "definition" -Value @($policyChunkJSON)

    $jsonPayload = ConvertTo-Json -InputObject $payload -Depth 10 -Compress

    return InvokeMSGraphAPI -uri $uri -HttpMethod "POST" -body $jsonPayload
}

function Add-TokenIssuancePolicy(
    $DisplayName = $null,
    $SigningAlgorithm = $null,
    $TokenResponseSigningPolicy = $null,
    $SamlTokenVersion = $null)
{
    $payload = New-Object System.Object;
    $uri = GetEntityUrl -entity "policies" -internal $true;

    $parameters = @{
        "displayName" = $DisplayName;
    }

    # Add default parameters
    $parameters.Add("policyType", "17");

    $policyParameters = @{
        "SigningAlgorithm" = $SigningAlgorithm;
        "TokenResponseSigningPolicy" = $TokenResponseSigningPolicy;
        "SamlTokenVersion" = $SamlTokenVersion;
    }

    $policyParameters.Add("Version", 1);

    $payload = DictionaryToObject $parameters;
    $policyDefinition = DictionaryToObject $policyParameters;
    $policyChunk = DictionaryToObject @{ "TokenIssuancePolicy"= $policyDefinition; }
    $policyChunkJSON = ConvertTo-Json -InputObject $policyChunk -Depth 10 -Compress

    Add-Member -InputObject $payload -MemberType NoteProperty -Name "policyDetail" -Value @($policyChunkJSON)

    $jsonPayload = ConvertTo-Json -InputObject $payload -Depth 10 -Compress

    return InvokeMSGraphAPI -uri $uri -HttpMethod "POST" -body $jsonPayload
}

#function Update-TokenLifetimePolicy(
#    $policyId = $null,
#    $AccessTokenLifetime = $null,
#    $MaxInactiveTime = $null,
#    $MaxAgeSingleFactor = $null,
#    $MaxAgeMultiFactor = $null,
#    $MaxAgeSessionSingleFactor = $null,
#    $MaxAgeSessionMultiFactor = $null)
#{
#    ValidateArgument "PolicyId", $policyId
    
#    $payload = New-Object System.Object;
#    $uri = GetPolicyUrl -policyId $policyId -internal $true;

#    $policyParameters = @{
#        "AccessTokenLifetime" = $AccessTokenLifetime;
#        "MaxInactiveTime" = $MaxInactiveTime;
#        "MaxAgeSingleFactor" = $MaxAgeSingleFactor;
#        "MaxAgeMultiFactor" = $MaxAgeMultiFactor;
#        "MaxAgeSessionSingleFactor" = $MaxAgeSessionSingleFactor;
#        "MaxAgeSessionMultiFactor" = $MaxAgeSessionMultiFactor;
#    }

#    $policyParameters.Add("Version", 1);

#    $policyDefinition = DictionaryToObject $policyParameters;
#    $policyChunk = DictionaryToObject @{ "TokenLifetimePolicy"= $policyDefinition; }
#    $policyChunkJSON = ConvertTo-Json -InputObject $policyChunk -Depth 10 -Compress

#    Add-Member -InputObject $payload -MemberType NoteProperty -Name "policyDetail" -Value @($policyChunkJSON)

#    $jsonPayload = ConvertTo-Json -InputObject $payload -Depth 10 -Compress

#    return InvokeMSGraphAPI -uri $uri -HttpMethod "PATCH" -body $jsonPayload
#}

#function Update-TokenIssuancePolicy(
#    $policyId = $null,
#    $SigningAlgorithm = $null,
#    $TokenResponseSigningPolicy = $null,
#    $SamlTokenVersion = $null)
#{
#    ValidateArgument "PolicyId", $policyId
    
#    $payload = New-Object System.Object;
#    $uri = GetPolicyUrl -policyId $policyId -internal $true;

#    $policyParameters = @{
#        "SigningAlgorithm" = $SigningAlgorithm;
#        "TokenResponseSigningPolicy" = $TokenResponseSigningPolicy;
#        "SamlTokenVersion" = $SamlTokenVersion;
#    }

#    $policyParameters.Add("Version", 1);

#    $policyDefinition = DictionaryToObject $policyParameters;
#    $policyChunk = DictionaryToObject @{ "TokenIssuancePolicy"= $policyDefinition; }
#    $policyChunkJSON = ConvertTo-Json -InputObject $policyChunk -Depth 10 -Compress

#    Add-Member -InputObject $payload -MemberType NoteProperty -Name "policyDetail" -Value @($policyChunkJSON)

#    $jsonPayload = ConvertTo-Json -InputObject $payload -Depth 10 -Compress

#    return InvokeMSGraphAPI -uri $uri -HttpMethod "PATCH" -body $jsonPayload
#}

#######################################
# Helper Functions
#######################################

function DictionaryToObject($dictionary)
{
    $outputObject = New-Object System.Object;
    foreach($key in $dictionary.Keys)
    {
        if($dictionary[$key] -ne $null)
        {
            Add-Member -InputObject $outputObject -MemberType NoteProperty -Name $key -Value $dictionary[$key]
        }
    }

    return $outputObject;
}

function InvokeMSGraphAPI($uri, $HttpMethod = "GET", $body = "")
{
    $bodyMethods = @("POST", "PATCH")
    if($bodyMethods -contains $HttpMethod -and ($body -eq "" -or $body -eq $null))
    {
        Write-Error "The body is empty for a POST request"
    }

    $authHeader = GetAuthenticationHeader;
    Write-Host HTTP $HttpMethod $uri -ForegroundColor Cyan
    if ($body)
    {
        Write-Host $body
    }

    $objects = $null;
    
    $parameters = @{
        "Method" = $HttpMethod;
        "Uri" = $uri;
        "Headers" = @{"Authorization"=$authHeader; "Content-Type"="application/json"};
    }

    if($bodyMethods -contains $HttpMethod)
    {
        $parameters.Add("Body", $body);
    }

    $result = Invoke-RestMethod @parameters
    $returnValue = $result;
    if ($result -ne $null) {
        if([bool]($result.PSobject.Properties.name -match "value"))
        {
            $returnValue = $result.Value;
        }
    }

    return $returnValue
}

function GetPolicyUrl($policyId, $internal)
{
    return  GetEntityUrl -entity "policies" -entityId $policyId -internal $internal
}

function GetApiVersionParameter($internal)
{
    $apiVersionParameter = "api-version=1.6"
    if ($internal -eq $true)
    {
        $apiVersionParameter = $apiVersionParameter
    }
    return $apiVersionParameter
}

function GetEntityUrl($entity, $entityId, $internal)
{
	Write-Host "GetEntityUrl: Using graph endpoint: $global:graphEndpoint entity: $entity entityId: $entityId"
    $apiVersionParameter = GetApiVersionParameter($internal)
    return  ("{0}/myorganization/{1}/{2}?{3}" -f $global:graphEndpoint, $entity, $entityId, $apiVersionParameter)
}

function GetPoliciesAssignedToEntityUrl($entity, $entityId)
{
	Write-Host "GetPoliciesAssignedToEntityUrl: Using graph endpoint: $global:graphEndpoint entity: $entity entityId: $entityId"
    $apiVersionParameter = GetApiVersionParameter($true)
    return  ("{0}/myorganization/{1}/{2}/{3}?{4}" -f $global:graphEndpoint, $entity, $entityId, "defaultPolicy", $apiVersionParameter)
}

function ValidateArgument($argName, $argument)
{
    if($argument -eq "" -or $argument -eq $null)
    {
        Write-Error "$($argName) is null or empty"
    }
}

function AssignPolicyToEntity($policyId, $entity, $entityId)
{
    Write-Host "AssignPolicyToEntity: Using graph endpoint: $global:graphEndpoint entity: $entity entityId: $entityId"
    $apiVersionParameter = GetApiVersionParameter($true)
    $uri = "{0}/myorganization/{1}/{2}/`$links/defaultPolicy?{3}" -f $global:graphEndpoint, $entity, $entityId, $apiVersionParameter

    $policyUri = GetPolicyUrl -policyId $policyId -internal $true
    $payloadData = DictionaryToObject @{ "url"= $policyUri; }
    $jsonPayload = ConvertTo-Json -InputObject $payloadData -Depth 10 -Compress

    return InvokeMSGraphAPI -uri $uri -HttpMethod "POST" -body $jsonPayload
}

function RemovePolicyFromEntity($policyId, $entity, $entityId)
{
    Write-Host "AssignPolicyToEntity: Using graph endpoint: $global:graphEndpoint entity: $entity entityId: $entityId"
    $apiVersionParameter = GetApiVersionParameter($true)
    $uri = "{0}/myorganization/{1}/{2}/`$links/defaultPolicy/{3}?{4}" -f $global:graphEndpoint, $entity, $entityId, $policyId, $apiVersionParameter

    return InvokeMSGraphAPI -uri $uri -HttpMethod "DELETE"
}