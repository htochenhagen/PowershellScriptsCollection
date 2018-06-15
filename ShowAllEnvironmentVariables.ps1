[Environment]::GetEnvironmentVariables().GetEnumerator() | Sort-Object Name | Out-String
pause