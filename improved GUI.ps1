# Hide PowerShell Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework

[Windows.Forms.Application]::EnableVisualStyles()


param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object -TypeName Security.Principal.WindowsPrincipal -ArgumentList $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if (!($Elevated)) {
        Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    } 
    exit
}

'running with full privileges with unrestricted policy'

Set-ExecutionPolicy -ExecutionPolicy Unrestricted

$msgBody = "Running with Full Privileges, and Unrestricted Policy"
[Windows.MessageBox]::Show($msgBody)


$form = new-object -TypeName Windows.forms.form
$form.FormBorderStyle = [Windows.Forms.FormBorderStyle]::Fixed3D
$form.text = "selection"
$form.Topmost = $true
$form.minimumSize = New-Object -TypeName System.Drawing.Size -ArgumentList (600,350)
$form.maximumSize = New-Object -TypeName System.Drawing.Size -ArgumentList (600,350)
$form.StartPosition = "CenterScreen"


$FormTabControl = New-object -TypeName System.Windows.Forms.TabControl 
$FormTabControl.Size = "600,300" 
$FormTabControl.Location = "0,0" 
$form.Controls.Add($FormTabControl)

$Tab1 = New-object -TypeName System.Windows.Forms.Tabpage
$Tab1.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab1.UseVisualStyleBackColor = $True 
$Tab1.Name = "Tab1" 
$Tab1.Text = "General Use" 
$FormTabControl.Controls.Add($Tab1)

#console box
$console = New-Object -TypeName System.Windows.Forms.RichTextBox
$console.Location = New-Object -TypeName System.Drawing.Size -ArgumentList (364,0)
$console.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (220,300)
$console.ReadOnly = $true
$console.Multiline = $true
$console.ScrollBars = [Windows.Forms.ScrollBars]::Both
$console.ForeColor = [Drawing.Color]::Black

#add label
$textboxlabel = new-object -TypeName windows.forms.label
$textboxlabel.text = "AppliestonslookuporTracert"
$textboxlabel.location = New-Object -TypeName system.Drawing.Size -ArgumentList (10,25) 
$textboxlabel.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,45)

#add a input textbox to the form
$theTbox = New-Object -TypeName system.Windows.Forms.Textbox
$theTbox.text = "Enter URL Here/IP"
$theTbox.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,50)
$theTbox.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)

#add another button to the form
$Go_button = new-object -TypeName windows.forms.button
$Go_button.text = "NSLOOKUP Start"
$Go_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,80)
$Go_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$Go_button.add_click({Resolve-DnsName -Name $theTbox.text | Out-GridView})

#ipconfigbutton
$ipconf_button = new-object -TypeName windows.forms.button
$ipconf_button.text = "ipconfig"
$ipconf_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,200)
$ipconf_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$ipconf_button.add_click({$console.Text = ipconfig /all | Out-String})

#add another button to the form
$tracerts_button = new-object -TypeName windows.forms.button
$tracerts_button.text = "DisplayDNS"
$tracerts_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,110) 
$tracerts_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$tracerts_button.add_click({
DnsclientCache | Format-Table -Property Entry, RecordName, RecordStatusType, Section, TimeToLive, DataLength, Data -AutoSize | Out-String
$P = DnsclientCache
$P | Out-GridView
})

#add another button to the form
$tracert_button = new-object -TypeName windows.forms.button
$tracert_button.text = "TraceRoute"
$tracert_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,140) 
$tracert_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$tracert_button.add_click({
 
Start-Job -ScriptBlock { Test-NetConnection -ComputerName $theTbox.text -Traceroute -Hops 2 } 
Get-Job -Id 1 | Receive-Job
 
})

$tcpipstack_button = new-object -TypeName windows.forms.button
$tcpipstack_button.text = "Clear TCP/IP Stack"
$tcpipstack_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (120,140) 
$tcpipstack_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$tcpipstack_button.add_click({
$console.Text = "Please wait.." 
netsh winsock reset catalog;
netsh interface ipv4 reset;
netsh interface ipv6 reset;
arp d;
netsh winsock reset;
netsh int tcp reset;
netsh int ip reset;
netsh int ip delete neighbors;
netsh int ip delete destinationcache;
netsh int ip delete arpcache;
ipconfig /flushDNS;
ipconfig /registerDNS;
ipconfig /displayDNS;
NBTStat -R;
NBTStat -RR;
$console.Text = "Done."
$console.Lines += ipconfig /displaydns ; $console.Lines += ipconfig /all

})




#add another button to the form
$ping_button = new-object -TypeName windows.forms.button
$ping_button.text = "Ping"
$ping_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (120,80)
$ping_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$ping_button.add_click({$console.Lines += Test-Connection -ComputerName $pingtextbox.Text -Quiet -Count 2 | Out-String})

#add a input textbox to the form
$pingtextbox = New-Object -TypeName system.Windows.Forms.Textbox
$pingtextbox.text = "Enter IP"
$pingtextbox.location = New-Object -TypeName system.Drawing.Size -ArgumentList (120,50)
$pingtextbox.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)

	


#add another button to the form
$Scan_button = new-object -TypeName windows.forms.button
$Scan_button.text = "Scan Network"
$Scan_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (120,110)
$Scan_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$Scan_button.add_click({




$ipv4 = $pingtextbox.Text 
$firstoctic = 1
$lastoctic = 254
$ping = 1

$null = while ($firstoctic -le $lastoctic) 
{
$IP = "$ipv4.$firstoctic"
try
{
$console.SelectionColor = [Drawing.Color]::Green
(Test-Connection -ComputerName $IP -count $ping  -ErrorAction Stop)
$null = $console.AppendText("pinging $IP : Reachable `n")


}
catch 
{

$console.SelectionColor = [Drawing.Color]::Red
$null = $console.AppendText("pinging $IP : Unreachable `n")

}
$firstoctic++ |	Out-File -FilePath $PSScriptRoot\Result.csv -Append
} 






})


#add another button to the form
$sysinfo_button = new-object -TypeName windows.forms.button
$sysinfo_button.text = "Systeminfo"
$sysinfo_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (240,110)
$sysinfo_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$sysinfo_button.add_click({$console.Text =Get-ComputerInfo -Property "*Version"| Out-String})










#add another button to the form
$shutdown_button = new-object -TypeName windows.forms.button
$shutdown_button.text = "Shutdown local PC"
$shutdown_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,230) 
$shutdown_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)

$shutdown_button.add_click({
$label = New-Object -TypeName System.Windows.Forms.Label
$label.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (170,210)
$label.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (280,20)
$label.Text = 'Are you sure?'
$form.Controls.Add($label)

$OKButton = New-Object -TypeName System.Windows.Forms.Button
$OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (135,230)
$OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75,23)
$OKButton.Text = 'OK'
$form.Controls.Add($OKButton)

$CancelButton = New-Object -TypeName System.Windows.Forms.Button
$CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (210,230)
$CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

})

#add another button to the form
$regdns_button = new-object -TypeName windows.forms.button
$regdns_button.text = "Clear/Register DNS"
$regdns_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (0,170) 
$regdns_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (110,30)
$regdns_button.add_click({
Clear-DnsClientCache
$console.Text = "Clearing The DNS Cache"
Register-DnsClient
$console.Text = "Registering the DNS Cache"
})



#add another button to the form
$stopptr_button = new-object -TypeName windows.forms.button
$stopptr_button.text = "Stop Printer"
$stopptr_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (120,170) 
$stopptr_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (80,30)
$stopptr_button.add_click({
net stop spooler
$console.Text = "Stopping Printer Services.."
})

#add another button to the form
$startptr_button = new-object -TypeName windows.forms.button
$startptr_button.text = "Start Printer"
$startptr_button.location = New-Object -TypeName system.Drawing.Size -ArgumentList (200,170) 
$startptr_button.size = New-Object -TypeName System.Drawing.Size -ArgumentList (80,30)
$startptr_button.add_click({
net start spooler
$console.Text = "Starting Printer Services.."
})





#add a input textbox to the form
$nslookupx2textbox = New-Object -TypeName system.Windows.Forms.Textbox
$nslookupx2textbox.text = "Enter IP/HostName"
$nslookupx2textbox.location = New-Object -TypeName system.Drawing.Size -ArgumentList (240,50)
$nslookupx2textbox.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)


#add another button to the form
$nslookupv2 = new-object -TypeName windows.forms.button
$nslookupv2.text = "Resolve "
$nslookupv2.location = New-Object -TypeName system.Drawing.Size -ArgumentList (240,80) 
$nslookupv2.size = New-Object -TypeName System.Drawing.Size -ArgumentList (80,30)
$nslookupv2.add_click({
$console.Text = resolve-DnsName -Name $nslookupx2textbox.Text | Out-String 
})


$Tab1.Controls.add($nslookupx2textbox)
$Tab1.Controls.Add($nslookupv2)
$Tab1.Controls.add($stopptr_button)
$Tab1.Controls.add($startptr_button)
$Tab1.Controls.add($ping_button)
$Tab1.controls.add($theTbox)
$Tab1.Controls.add($console)
$Tab1.controls.add($Go_button)
$Tab1.controls.add($displaydns_button)
$Tab1.Controls.add($shutdown_button)
$Tab1.Controls.add($tracert_button)
$Tab1.Controls.add($ipconf_button)
$Tab1.Controls.add($regdns_button)
# Tab1.Controls.add($trim_button)
$Tab1.Controls.add($textboxlabel)
$Tab1.Controls.add($tracerts_button)
$Tab1.Controls.add($pingtextbox)
$Tab1.Controls.add($Scan_button)
$Tab1.Controls.Add($sysinfo_button)
$Tab1.Controls.Add($CancelButton)
$Tab1.Controls.Add($OKButton)
$Tab1.Controls.Add($label)
$Tab1.Controls.Add($tcpipstack_button)


#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################



$Tab2 = New-object -TypeName System.Windows.Forms.Tabpage
$Tab2.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab2.UseVisualStyleBackColor = $True 
$Tab2.Name = "Tab2" 
$Tab2.Text = "Server Commands" 
$FormTabControl.Controls.Add($Tab2)

$button = New-Object -TypeName System.Windows.Forms.Button
$button.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (10,10)
$button.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (140,30)
$button.Text = "Clear Server DNS Cache"
$button.Add_Click({
$console2.Text = "Clearing The DNS Cache"
cmd /c dnscmd /clearcache 
})

#console2 box
$console2 = New-Object -TypeName System.Windows.Forms.TextBox
$console2.Location = New-Object -TypeName System.Drawing.Size -ArgumentList (364,0)
$console2.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (220,300)
$console2.ReadOnly = $true
$console2.Multiline = $true
$console2.ScrollBars = [Windows.Forms.ScrollBars]::Both

$Tab2.Controls.Add($button)
$Tab2.Controls.add($console2)



#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################

#############################################




$Tab3 = New-object -TypeName System.Windows.Forms.Tabpage
$Tab3.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab3.UseVisualStyleBackColor = $True 
$Tab3.Name = "Tab3" 
$Tab3.Text = "General Use #2"
$FormTabControl.Controls.Add($Tab3)

$button = New-Object -TypeName System.Windows.Forms.Button
$button.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (10,182)
$button.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (140,30)
$button.Text = "Change Adaptor Settings"
$button.Add_Click({
$console3.Text = "Starting.. "
procInfo

})

function procInfo {
$device=$dropdown1.SelectedItem.ToString() #populate the var with the value you selected
$pingResult=New-NetIPAddress -IPAddress $ipaddr.Text -InterfaceAlias $device -PrefixLength $subnet.Text -DefaultGateway $gateway.Text -AddressFamily IPv4
$console3.text=$pingResult
                     } #end procInfo


$dropdown1 = New-Object -TypeName System.Windows.Forms.ComboBox
$dropdown1.Location = New-Object -TypeName System.Drawing.Size -ArgumentList (12,10) 
$dropdown1.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20) 
$dropdown1.DropDownHeight = 200 
$Tab3.Controls.Add($dropdown1) 

$wksList=@("Ethernet","Wi-Fi")

foreach ($wks in $wksList) {
                      $dropdown1.Items.Add($wks)
                              } #end foreach







#add a input textbox to the form
$ipaddr = New-Object -TypeName system.Windows.Forms.Textbox
$ipaddr.text = "IP"
$ipaddr.location = New-Object -TypeName system.Drawing.Size -ArgumentList (12,50)
$ipaddr.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)

#add a input textbox to the form
$subnet = New-Object -TypeName system.Windows.Forms.Textbox
$subnet.text = "Prefix"
$subnet.location = New-Object -TypeName system.Drawing.Size -ArgumentList (12,75)
$subnet.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)


#add a input textbox to the form
$gateway = New-Object -TypeName system.Windows.Forms.Textbox
$gateway.text = "Default Gateway"
$gateway.location = New-Object -TypeName system.Drawing.Size -ArgumentList (12,100)
$gateway.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)

#add a input textbox to the form
$PreDNS = New-Object -TypeName system.Windows.Forms.Textbox
$PreDNS.text = ""
$PreDNS.location = New-Object -TypeName system.Drawing.Size -ArgumentList (12,125)
$PreDNS.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)

#add a input textbox to the form
$altDNS = New-Object -TypeName system.Windows.Forms.Textbox
$altDNS.text = ""
$altDNS.location = New-Object -TypeName system.Drawing.Size -ArgumentList (12,150)
$altDNS.size = New-Object -TypeName System.Drawing.Size -ArgumentList (100,20)








#console3 box
$console3 = New-Object -TypeName System.Windows.Forms.TextBox
$console3.Location = New-Object -TypeName System.Drawing.Size -ArgumentList (364,0)
$console3.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (220,300)
$console3.ReadOnly = $true
$console3.Multiline = $true
$console3.ScrollBars = [Windows.Forms.ScrollBars]::Both
$Tab3.Controls.add($console3)
$Tab3.Controls.add($button)
$Tab3.Controls.add($ipaddr)
$Tab3.Controls.add($subnet)
$Tab3.Controls.add($gateway)
$Tab3.Controls.add($PreDNS)
$Tab3.Controls.add($altDNS)
$Tab3.Controls.Add($dropdown1)
$Tab3.Controls.Add($Name)



$form.Add_shown({$form.Activate()})
$result = $form.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::OK)
{
    write-host 'a'
} 





$form.ShowDialog()
#===== CODE ends here ======
# SIG # Begin signature block
# MIIDyQYJKoZIhvcNAQcCoIIDujCCA7YCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUiv+FXsXaGlomWtWjbt8i6FQ7
# zF2gggHvMIIB6zCCAVSgAwIBAgIQKc64KuRKDI9EBFdNSSW7pzANBgkqhkiG9w0B
# AQUFADAQMQ4wDAYDVQQDDAVEZXJlazAeFw0yMjAyMDMxOTU4MDFaFw0yNjAyMDMw
# MDAwMDBaMBAxDjAMBgNVBAMMBURlcmVrMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB
# iQKBgQCcnzDxBLCeAClIeR3o0gFsnEt70K6d1o2lZV1gOWv8CIXhR1IfuABqYlVo
# 19sSBL2p5qh3FrTGGEvqiqAzu/DHLw0WU46uSK/WXGER3AsrIDSyfyQ+FPmYPQfb
# QQ712bgTfmnsp/U4MhGq18HGSHbtkm2B7utYSstaJ9XIfv3XWQIDAQABo0YwRDAT
# BgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUuqmDvXUSvMDN72AbCgIawai2
# wGcwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBBQUAA4GBAFFq7EtIXU8nAV/2
# VJn9J9e1lg/Zjc7532kUs3AAeZG4MUHPFKAaqfnO8zO1vgkeL6nqIq6YsoQ1k/vW
# Dicy9pieis/jXKZJ5ltEiPdMnaS2pOKDJgGEFMU4rFuvCLysxRwFN/024OVDYwNg
# B/3uyz6zAynPyeWr9vju4LHiW7M3MYIBRDCCAUACAQEwJDAQMQ4wDAYDVQQDDAVE
# ZXJlawIQKc64KuRKDI9EBFdNSSW7pzAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIB
# DDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEE
# AYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUY4NV5Slpp7M5
# ylQAa/Xtlz2szVEwDQYJKoZIhvcNAQEBBQAEgYB80K1RmLgGeycrZNUfLtu1Wutz
# wCbh17QV0Df/3xDhgl3GZRrDHKg/3+kDYkRQxVVyAx5daMrtslpYJeiS3w0nnRW4
# Sxo5thRc1GwGuA7cxk7AHP9DtZUNqDFF1VhSb6QUBHzzkuFZC/T/G3tcnrKPBEW6
# q69OHf6A4v0mmtLJ/Q==
# SIG # End signature block
