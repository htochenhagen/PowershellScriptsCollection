try{
    $env = [Environment]::GetEnvironmentVariables().GetEnumerator() | Sort-Object Name | Out-GridView -Title "Select environment variable to edit" -OutputMode Single
    $envKey = $env.Key;
    $envVal = $env.Value;
    
    if (!$env) 
    {
        Write-Host ""
        Write-Warning "No environment variable was selected!"
        exit 0
    }

    Write-Host ""
    Write-Host "You choose environment variable <$envKey> with current value <$envVal> for editing" -ForegroundColor Green
    Write-Host ""
    Write-Warning "Please make sure you have administrator rights if you want to set an environment variable on <Machine> scope"
    Write-Host ""
    $envValInput = Read-Host "Please define the new environment variable value"
    Write-Host ""
    
    $isMachineScope = [Environment]::GetEnvironmentVariable($envKey, "Machine")
    if ($isMachineScope) {
        Write-Host "Environment variable <$envKey> is defined on <Machine> scope" -ForegroundColor Green
        [Environment]::SetEnvironmentVariable($envKey, $envValInput, "Machine")
    }
    $isUserScope = [Environment]::GetEnvironmentVariable($envKey, "user")
    if ($isUserScope) {
        Write-Host "Environment variable <$envKey> is defined on <User> scope" -ForegroundColor Green
        [Environment]::SetEnvironmentVariable($envKey, $envValInput, "User")
    }
    [Environment]::SetEnvironmentVariable($envKey, $envValInput)

    Write-Host "Environment variable <$envKey> was succesfully updated to value <$envValInput>!" -ForegroundColor Green
    exit 0
}
catch [Exception] {
    Write-Error $_.Exception.Message  
    exit 1
}
finally{
    Write-Host ""
    pause
}