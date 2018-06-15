function Show-Menu
{
     param (
           [string]$Title = 'Scope'
     )
     Clear-Host
     Write-Host "================ $Title ================"
     
     Write-Host "1: Press '1' for <User> scope."
     Write-Host "2: Press '2' for <Machine> scope."
}

do
{
     Show-Menu
     $scopeInput = Read-Host "Please make a selection"
     $scope = "Process"
     switch ($scopeInput)
     {
           '1' {
                $scope = "User"
                Clear-Host
                "You choose option #1 ($scope)"
           } '2' {
                $scope = "Machine"
                Clear-Host
                "You choose option #2 ($scope)"

                Write-Host ""
                Write-Warning "Please make sure you have administrator rights"                
           }
     }
}
until ($scopeInput -eq '1' -or $scopeInput -eq '2')

try{
    Write-Host ""
    $envInput = Read-Host "Please define the environment variable name"
    
    Write-Host ""
    $envValueInput = Read-Host "Please define the environment variable initial value"
    Write-Host ""
    
    [Environment]::SetEnvironmentVariable($envInput, $envValueInput, $scope)
    [Environment]::SetEnvironmentVariable($envInput, $envValueInput, "Process")
    
    Write-Host "Environment variable <$envInput> was succesfully created!" -ForegroundColor Green
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