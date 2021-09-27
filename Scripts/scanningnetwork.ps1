$enterip = Read-Host -Prompt 'Enter the IP, only 3 octets'
$range = 1..254
$ErrorActionPreference = "SilentlyContinue"
Write-Host = Enter the IP, then it will scan for active devices. 


$range | ForEach-Object {

  $address = "$enterip.$_"



Write-Progress "Scanning Network" $address -PercentComplete (($_/$range.Count)*100)
  New-Object PSObject -Property @{

    Address = $address

    Ping = Test-Connection $address -Quiet -Count 1

  }
} | Out-File $PSScriptRoot\Result.csv