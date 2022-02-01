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
[System.Windows.Forms.Application]::EnableVisualStyles()


param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

'running with full privileges with unrestricted policy'

Set-ExecutionPolicy -ExecutionPolicy Unrestricted

$msgBody = "Running with Full Privileges, and Unrestricted Policy"
[System.Windows.MessageBox]::Show($msgBody)


$form = new-object Windows.forms.form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
$form.text = "selection"
$form.Topmost = $true
$form.minimumSize = New-Object System.Drawing.Size(600,350)
$form.maximumSize = New-Object System.Drawing.Size(600,350)
$form.StartPosition = "CenterScreen"


$FormTabControl = New-object System.Windows.Forms.TabControl 
$FormTabControl.Size = "600,300" 
$FormTabControl.Location = "0,0" 
$form.Controls.Add($FormTabControl)

$Tab1 = New-object System.Windows.Forms.Tabpage
$Tab1.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab1.UseVisualStyleBackColor = $True 
$Tab1.Name = "Tab1" 
$Tab1.Text = "General Use” 
$FormTabControl.Controls.Add($Tab1)

#console box
$console = New-Object System.Windows.Forms.TextBox
$console.Location = New-Object System.Drawing.Size(364,0)
$console.Size = New-Object System.Drawing.Size(220,300)
$console.ReadOnly = $true
$console.Multiline = $true
$console.ScrollBars = [System.Windows.Forms.ScrollBars]::Both

#add label
$textboxlabel = new-object windows.forms.label
$textboxlabel.text = "Applies to nslookup/Tracert"
$textboxlabel.location = New-Object system.Drawing.Size(10,25) 
$textboxlabel.size = New-Object System.Drawing.Size(100,45)

#add a input textbox to the form
$theTbox = New-Object system.Windows.Forms.Textbox
$theTbox.text = "Enter URL Here/IP"
$theTbox.location = New-Object system.Drawing.Size(0,50)
$theTbox.size = New-Object System.Drawing.Size(100,20)

#add another button to the form
$Go_button = new-object windows.forms.button
$Go_button.text = "NSLOOKUP Start"
$Go_button.location = New-Object system.Drawing.Size(0,80)
$Go_button.size = New-Object System.Drawing.Size(110,30)
$Go_button.add_click({Resolve-DnsName -Name $theTbox.text | Out-GridView})

#ipconfigbutton
$ipconf_button = new-object windows.forms.button
$ipconf_button.text = "ipconfig"
$ipconf_button.location = New-Object system.Drawing.Size(0,200)
$ipconf_button.size = New-Object System.Drawing.Size(110,30)
$ipconf_button.add_click({$console.Text = ipconfig /all | Out-String})

#add another button to the form
$tracerts_button = new-object windows.forms.button
$tracerts_button.text = "DisplayDNS"
$tracerts_button.location = New-Object system.Drawing.Size(0,110) 
$tracerts_button.size = New-Object System.Drawing.Size(110,30)
$tracerts_button.add_click({
DnsclientCache | Format-Table -Property Entry, RecordName, RecordStatusType, Section, TimeToLive, DataLength, Data -AutoSize | Out-String
$P = DnsclientCache
$P | Out-GridView
})

#add another button to the form
$tracert_button = new-object windows.forms.button
$tracert_button.text = "TraceRoute"
$tracert_button.location = New-Object system.Drawing.Size(0,140) 
$tracert_button.size = New-Object System.Drawing.Size(110,30)
$tracert_button.add_click({
Test-NetConnection -ComputerName $theTbox.text -Traceroute -Hops 2 
})




#add another button to the form
$ping_button = new-object windows.forms.button
$ping_button.text = "Ping"
$ping_button.location = New-Object system.Drawing.Size(120,80)
$ping_button.size = New-Object System.Drawing.Size(110,30)
$ping_button.add_click({$console.Lines += Test-Connection $pingtextbox.Text -Quiet -Count 2 | Out-String})

#add a input textbox to the form
$pingtextbox = New-Object system.Windows.Forms.Textbox
$pingtextbox.text = "Enter IP"
$pingtextbox.location = New-Object system.Drawing.Size(120,50)
$pingtextbox.size = New-Object System.Drawing.Size(100,20)




#add another button to the form
$Scan_button = new-object windows.forms.button
$Scan_button.text = "Scan Network"
$Scan_button.location = New-Object system.Drawing.Size(120,110)
$Scan_button.size = New-Object System.Drawing.Size(110,30)
$Scan_button.add_click({

$enterip = $pingtextbox
$range = 1..254
$ErrorActionPreference = "SilentlyContinue"
$console.Text = "Scanning..."
$range | ForEach-Object {
$address = "$enterip.$_"
Write-Progress "Scanning Network" $address -PercentComplete (($_/$range.Count)*100)
New-Object PSObject -Property @{
Address = $address
Ping = Test-Connection $address -Quiet -Count 1
}
} | Out-File $PSScriptRoot\Result.csv
$console.Text = "Done"
})



#add another button to the form
$sysinfo_button = new-object windows.forms.button
$sysinfo_button.text = "Systeminfo"
$sysinfo_button.location = New-Object system.Drawing.Size(240,80)
$sysinfo_button.size = New-Object System.Drawing.Size(110,30)
$sysinfo_button.add_click({$console.Text =Get-ComputerInfo -Property "*Version"| Out-String})










#add another button to the form
$shutdown_button = new-object windows.forms.button
$shutdown_button.text = "Shutdown local PC"
$shutdown_button.location = New-Object system.Drawing.Size(0,230) 
$shutdown_button.size = New-Object System.Drawing.Size(110,30)

$shutdown_button.add_click({
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(170,210)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Are you sure?'
$form.Controls.Add($label)

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(135,230)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(210,230)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

})


#add another button to the form
$regdns_button = new-object windows.forms.button
$regdns_button.text = "Clear/Register DNS"
$regdns_button.location = New-Object system.Drawing.Size(0,170) 
$regdns_button.size = New-Object System.Drawing.Size(110,30)
$regdns_button.add_click({
Clear-DnsClientCache
$console.Text = "Clearing The DNS Cache"
Register-DnsClient
$console.Text = "Registering the DNS Cache"
})














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



$Tab2 = New-object System.Windows.Forms.Tabpage
$Tab2.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab2.UseVisualStyleBackColor = $True 
$Tab2.Name = "Tab2" 
$Tab2.Text = "Server Commands” 
$FormTabControl.Controls.Add($Tab2)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10,10)
$button.Size = New-Object System.Drawing.Size (140,30)
$button.Text = "Clear Server DNS Cache"
$button.Add_Click({
$console2.Text = "Clearing The DNS Cache"
cmd /c dnscmd /clearcache 
})

#console2 box
$console2 = New-Object System.Windows.Forms.TextBox
$console2.Location = New-Object System.Drawing.Size(364,0)
$console2.Size = New-Object System.Drawing.Size(220,300)
$console2.ReadOnly = $true
$console2.Multiline = $true
$console2.ScrollBars = [System.Windows.Forms.ScrollBars]::Both

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




$Tab3 = New-object System.Windows.Forms.Tabpage
$Tab3.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab3.UseVisualStyleBackColor = $True 
$Tab3.Name = "Tab3" 
$Tab3.Text = "General Use #2"
$FormTabControl.Controls.Add($Tab3)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10,182)
$button.Size = New-Object System.Drawing.Size (140,30)
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

############################################## end functions

############################################## Start drop down boxes

$dropdown1 = New-Object System.Windows.Forms.ComboBox
$dropdown1.Location = New-Object System.Drawing.Size(12,10) 
$dropdown1.Size = New-Object System.Drawing.Size(180,20) 
$dropdown1.DropDownHeight = 200 
$Tab3.Controls.Add($dropdown1) 

$wksList=@("Ethernet","Wi-Fi")

foreach ($wks in $wksList) {
                      $dropdown1.Items.Add($wks)
                              } #end foreach

############################################## end drop down boxes





#add a input textbox to the form
$ipaddr = New-Object system.Windows.Forms.Textbox
$ipaddr.text = "IP"
$ipaddr.location = New-Object system.Drawing.Size(12,50)
$ipaddr.size = New-Object System.Drawing.Size(100,20)

#add a input textbox to the form
$subnet = New-Object system.Windows.Forms.Textbox
$subnet.text = "Prefix"
$subnet.location = New-Object system.Drawing.Size(12,75)
$subnet.size = New-Object System.Drawing.Size(100,20)


#add a input textbox to the form
$gateway = New-Object system.Windows.Forms.Textbox
$gateway.text = "Default Gateway"
$gateway.location = New-Object system.Drawing.Size(12,100)
$gateway.size = New-Object System.Drawing.Size(100,20)

#add a input textbox to the form
$PreDNS = New-Object system.Windows.Forms.Textbox
$PreDNS.text = ""
$PreDNS.location = New-Object system.Drawing.Size(12,125)
$PreDNS.size = New-Object System.Drawing.Size(100,20)

#add a input textbox to the form
$altDNS = New-Object system.Windows.Forms.Textbox
$altDNS.text = ""
$altDNS.location = New-Object system.Drawing.Size(12,150)
$altDNS.size = New-Object System.Drawing.Size(100,20)








#console3 box
$console3 = New-Object System.Windows.Forms.TextBox
$console3.Location = New-Object System.Drawing.Size(364,0)
$console3.Size = New-Object System.Drawing.Size(220,300)
$console3.ReadOnly = $true
$console3.Multiline = $true
$console3.ScrollBars = [System.Windows.Forms.ScrollBars]::Both
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

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    write-host 'a'
} 








$form.ShowDialog()
#===== CODE ends here ======