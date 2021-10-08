#defining the functions part1
$PortScan = @(
    [PSCustomObject]@{Message = 'Basic Port Scan'; Option = { Basic } }
    [PSCustomObject]@{Message = 'Full Port Scan'; Option = { Full } }
)

#defining the functions part2
function Basic()
{

#prerequisite 

        #The user gets to select the targets IP
        $ip = Read-Host -Prompt 'Enter the IP'
#Code
    #Testing certain ports, feel free to edit.
    Test-NetConnection -ComputerName $ip -port 139 | Out-File -FilePath $PSScriptRoot\port.txt -append
    Test-NetConnection -ComputerName $ip -port 445 | Out-File -FilePath $PSScriptRoot\port.txt -append
    Test-NetConnection -ComputerName $ip -port 873 | Out-File -FilePath $PSScriptRoot\port.txt -append
    Test-NetConnection -ComputerName $ip -port 8081 | Out-File -FilePath $PSScriptRoot\port.txt -append
	Get-Content -Path $PSScriptRoot\port.txt

#Finally, it pauses the script so you can see what happened.
pause

}

function Full()
{
    Clear-Host
        #The user gets to select the targets IP
        Write-Host -ForegroundColor Red  'This is the FULL scan, This CAN trip the firewall and lead to serious consequences; 
        I am not responsible for anything that may go wrong.'
        $ip = Read-Host -Prompt 'Enter the IP'
		
    #Probing ALL viable ports.. almost in order, feel free to edit.
Test-NetConnection -ComputerName $ip -port 21
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 22
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 23
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 161
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 53
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 80
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 110
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 135
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 143
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 443
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 636
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 1701
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 636
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 646
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 1433
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 995
    timeout /t 1 /nobreak
Test-NetConnection -ComputerName $ip -port 5900
    timeout /t 1 /nobreak


#Finally, it pauses the script so you can see what happened.
pause

}


# let the user pick a Option:
Write-Host  "Choose a Option:"

$PortScan | ForEach-Object -Begin { $i = 1;} -Process { 
    Write-Host  ('{0}. {1}' -f ($i++), $_.Message) 
}

do 
{
    $value = Read-Host 'Choose a number from the list'

}
while($value -match '\D+' -or $value -le 0 -or $value -gt $PortScan.Count)

# invoke the Option chosen:
& $PortScan[$value-1].Option