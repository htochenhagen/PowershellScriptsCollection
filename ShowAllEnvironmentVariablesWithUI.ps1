[Environment]::GetEnvironmentVariables().GetEnumerator() | Sort-Object Name | Out-GridView -Title "All Environment variables"
pause