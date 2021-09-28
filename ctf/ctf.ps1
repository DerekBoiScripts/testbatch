
        #The user gets to select the targets IP
        $ip = Read-Host -Prompt 'Enter the IP'

#Testing certain ports, feel free to edit.

 Test-NetConnection -ComputerName $ip -port 5900 | Out-File -Append -FilePath $PSScriptRoot\result.txt
 Test-NetConnection -ComputerName $ip -port 443 | Out-File -Append -FilePath $PSScriptRoot\result.txt
 Test-NetConnection -ComputerName $ip -port 80 | Out-File -Append -FilePath $PSScriptRoot\result.txt
 Test-NetConnection -ComputerName $ip -port 3389 | Out-File -Append -FilePath $PSScriptRoot\result.txt 

 Get-Content -Path $PSScriptRoot\Result.txt
 #Finally, it pauses the script so you can see what happened.
pause

#

#Remote into the machine now?
