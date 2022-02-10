$ls = (New-Object System.Net.WebClient).Downloadstring('https://raw.githubusercontent.com/DerekBoiScripts/testbatch/main/improvedGUI.ps1')
try 
{
    Write-Output "[*] Updating improvedGUI.ps1"
    Remove-Item "$($PSScriptRoot)\improvedGUI.ps1"
    $ls | Out-File "$($PSScriptRoot)\improvedGUI.ps1"
}
catch [System.Exception] {
    Write-Output "Error saving new version of improvedGUI.ps1"
    throw
	Read-Host "Press any key to exit."
    exit
}
pause