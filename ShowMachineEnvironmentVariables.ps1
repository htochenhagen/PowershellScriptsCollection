[Environment]::GetEnvironmentVariables("Machine").GetEnumerator() | Sort-Object Name | Out-String
pause