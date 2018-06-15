[Environment]::GetEnvironmentVariables("User").GetEnumerator() | Sort-Object Name | Out-String
pause