#!/usr/bin/env powershell
# Hide PowerShell Console

$version="3.0"
$githubver = "https://raw.githubusercontent.com/DerekBoiScripts/testbatch/main/v.txt"
$updatefile = "https://raw.githubusercontent.com/DerekBoiScripts/testbatch/main/update.ps1"




$Point = 'System.Drawing.Point'
$textboxes = 'System.Windows.Forms.TextBox'
$TabPages = 'System.Windows.Forms.Tabpage'
$Size = 'System.Drawing.Size'
$buttons = 'System.Windows.Forms.Button'
$textboxes = 'system.Windows.Forms.Textbox'
$drawing = 'system.Drawing.Size'
$buttons = 'windows.forms.button'
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




try
{
  param([switch]$Elevated)
}

catch [Management.Automation.CommandNotFoundException]
{
  # get error record
  [Management.Automation.ErrorRecord]$e = $_

  # retrieve information about runtime error
  $info = New-Object -TypeName PSObject -Property @{
    Exception = $e.Exception.Message
    Reason    = $e.CategoryInfo.Reason
    Target    = $e.CategoryInfo.TargetName
    Script    = $e.InvocationInfo.ScriptName
    Line      = $e.InvocationInfo.ScriptLineNumber
    Column    = $e.InvocationInfo.OffsetInLine
  }
  
  # output information. Post-process collected info, and log info (optional)
  $info
}


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


try
{
  Set-ExecutionPolicy -ExecutionPolicy Unrestricted -ErrorAction Stop
}

catch [Security.SecurityException]
{
  # get error record
  [Management.Automation.ErrorRecord]$e = $_

  # retrieve information about runtime error
  $info = New-Object -TypeName PSObject -Property @{
    Exception = $e.Exception.Message
    Reason    = $e.CategoryInfo.Reason
    Target    = $e.CategoryInfo.TargetName
    Script    = $e.InvocationInfo.ScriptName
    Line      = $e.InvocationInfo.ScriptLineNumber
    Column    = $e.InvocationInfo.OffsetInLine
  }
  
  # output information. Post-process collected info, and log info (optional)
  $info
}


$msgBody = 'Running with Full Privileges, and Unrestricted Policy'
[Windows.MessageBox]::Show($msgBody)


$form = new-object -TypeName Windows.forms.form
$form.FormBorderStyle = [Windows.Forms.FormBorderStyle]::FixedDialog
$form.text = 'Selection'
$form.Topmost = $true
$form.minimumSize = New-Object -TypeName $Size -ArgumentList (600,350)
$form.maximumSize = New-Object -TypeName $Size -ArgumentList (600,350)
$form.StartPosition = 'CenterScreen'
$Form.ShowInTaskbar = $Formalse
$Form.MaximizeBox = $Formalse
$Form.MinimizeBox = $Formalse
$Form.MinimizeBox = $Formalse
$Image = [system.drawing.image]::FromFile("$PSScriptRoot\cat.jpeg") 
$Form.BackgroundImage = $Image
$Form.BackgroundImageLayout = 'Stretch'

$Icon = [system.drawing.icon]::ExtractAssociatedIcon("c:\Windows\System32\UserAccountControlSettings.exe")
$Form.Icon = $Icon


$FormTabControl = New-object -TypeName System.Windows.Forms.TabControl 
$FormTabControl.Size = '600,300' 
$FormTabControl.Location = '0,0' 
$form.Controls.Add($FormTabControl)

$Tab1 = New-object -TypeName $TabPages
$Tab1.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab1.UseVisualStyleBackColor = $True 
$Tab1.Name = 'Tab1' 
$Tab1.Text = 'General Use' 
$FormTabControl.Controls.Add($Tab1)

#console box
$console = New-Object -TypeName System.Windows.Forms.RichTextBox
$console.Location = New-Object -TypeName $Size -ArgumentList (364,0)
$console.Size = New-Object -TypeName $Size -ArgumentList (220,300)
$console.ReadOnly = $true
$console.Multiline = $true
$console.ScrollBars = [Windows.Forms.ScrollBars]::Both
$console.ForeColor = [Drawing.Color]::Black
$console.Text = "Version 3.0"

#add label
$textboxlabel = new-object -TypeName windows.forms.label
$textboxlabel.text = 'AppliestonslookuporTracert'
$textboxlabel.location = New-Object -TypeName $drawing -ArgumentList (10,25) 
$textboxlabel.size = New-Object -TypeName $Size -ArgumentList (100,45)

#add a input textbox to the form
$theTbox = New-Object -TypeName $textboxes
$theTbox.text = 'Enter URL Here/IP'
$theTbox.location = New-Object -TypeName $drawing -ArgumentList (0,50)
$theTbox.size = New-Object -TypeName $Size -ArgumentList (100,20)

#add another button to the form
$Go_button = new-object -TypeName $buttons
$Go_button.text = 'NSLOOKUP Start'
$Go_button.location = New-Object -TypeName $drawing -ArgumentList (0,80)
$Go_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$Go_button.add_click{Resolve-DnsName -Name $theTbox.text | Out-GridView}

#ipconfigbutton
$ipconf_button = new-object -TypeName $buttons
$ipconf_button.text = 'ipconfig'
$ipconf_button.location = New-Object -TypeName $drawing -ArgumentList (0,200)
$ipconf_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$ipconf_button.add_click{$console.Text = & "$env:windir\system32\ipconfig.exe" /all | Out-String}

#add another button to the form
$tracerts_button = new-object -TypeName $buttons
$tracerts_button.text = 'DisplayDNS'
$tracerts_button.location = New-Object -TypeName $drawing -ArgumentList (0,110) 
$tracerts_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$tracerts_button.add_click{
  DnsclientCache | Format-Table -Property Entry, RecordName, RecordStatusType, Section, TimeToLive, DataLength, Data -AutoSize | Out-String
  $P = DnsclientCache
  $P | Out-GridView
}

#add another button to the form
$tracert_button = new-object -TypeName $buttons
$tracert_button.text = 'TraceRoute'
$tracert_button.location = New-Object -TypeName $drawing -ArgumentList (0,140) 
$tracert_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$tracert_button.add_click{
 
  Start-Job -ScriptBlock { Test-NetConnection -ComputerName $theTbox.text -Traceroute -Hops 2 } 
  Get-Job -Id 1 | Receive-Job
 
}

$tcpipstack_button = new-object -TypeName $buttons
$tcpipstack_button.text = 'Clear TCP/IP Stack'
$tcpipstack_button.location = New-Object -TypeName $drawing -ArgumentList (120,140) 
$tcpipstack_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$tcpipstack_button.add_click{
  $cleardns = "$env:windir\system32\netsh.exe"
  $console.Text = 'Please wait..' 
  & $cleardns winsock reset catalog

  & $cleardns interface ipv4 reset

  & $cleardns interface ipv6 reset

  & "$env:windir\system32\arp.exe" d

  & $cleardns winsock reset

  & $cleardns int tcp reset

  & $cleardns int ip reset

  & $cleardns int ip delete neighbors

  & $cleardns int ip delete destinationcache

  & $cleardns int ip delete arpcache

  & "$env:windir\system32\ipconfig.exe" /flushDNS

  & "$env:windir\system32\ipconfig.exe" /registerDNS

  & "$env:windir\system32\ipconfig.exe" /displayDNS

  & "$env:windir\system32\nbtstat.exe" -R

  & "$env:windir\system32\nbtstat.exe" -RR

  $console.Text = 'Done.'
  $console.Lines += & "$env:windir\system32\ipconfig.exe" /displaydns 
  $console.Lines += & "$env:windir\system32\ipconfig.exe" /all

}




#add another button to the form
$ping_button = new-object -TypeName $buttons
$ping_button.text = 'Ping'
$ping_button.location = New-Object -TypeName $drawing -ArgumentList (120,80)
$ping_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$ping_button.add_click{$console.Lines += Test-Connection -ComputerName $pingtextbox.Text -Quiet -Count 2 | Out-String}

#add a input textbox to the form
$pingtextbox = New-Object -TypeName $textboxes
$pingtextbox.text = 'Enter IP'
$pingtextbox.location = New-Object -TypeName $drawing -ArgumentList (120,50)
$pingtextbox.size = New-Object -TypeName $Size -ArgumentList (100,20)

	


#add another button to the form
$Scan_button = new-object -TypeName $buttons
$Scan_button.text = 'Scan Network'
$Scan_button.location = New-Object -TypeName $drawing -ArgumentList (120,110)
$Scan_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$Scan_button.add_click{


  $ipv4 = $pingtextbox.Text 
  $firstoctic = 1
  $lastoctic = 254
  $ping = 1

  $null = while ($firstoctic -le $lastoctic) 
  {
    $IP = ('{0}.{1}' -f $ipv4, $firstoctic)
    try
    {
      $console.SelectionColor = [Drawing.Color]::Green
      (Test-Connection -ComputerName $IP -count $ping  -ErrorAction Stop)
      $null = $console.AppendText(("pinging {0} : Reachable `n" -f $IP))


    }
    catch 
    {

      $console.SelectionColor = [Drawing.Color]::Red
      $null = $console.AppendText(("pinging {0} : Unreachable `n" -f $IP))

    }
    $firstoctic++ |	Out-File -FilePath $PSScriptRoot\Result.csv -Append
  } 






}


#add another button to the form
$sysinfo_button = new-object -TypeName $buttons
$sysinfo_button.text = 'Systeminfo'
$sysinfo_button.location = New-Object -TypeName $drawing -ArgumentList (240,110)
$sysinfo_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$sysinfo_button.add_click{$console.Text =Get-ComputerInfo -Property '*Version'| Out-String}






#add another button to the form
$shutdown_button = new-object -TypeName $buttons
$shutdown_button.text = 'Get Updates'
$shutdown_button.location = New-Object -TypeName $drawing -ArgumentList (0,230) 
$shutdown_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$shutdown_button.add_click{
 
 UpdatesAvailable
Process-Updates


 try 
{
    $console.Text = "[*] Updating improvedGUI.ps1"
        Remove-Item "$($PSScriptRoot)\improvedGUI.ps1"
(New-Object System.Net.WebClient).Downloadstring('https://raw.githubusercontent.com/DerekBoiScripts/testbatch/main/improvedGUI.ps1') | Out-File "$($PSScriptRoot)\improvedGUI.ps1"

}
catch [System.Exception] {
     $console.Text = "Error saving new version of improvedGUI.ps1" 
    exit
}

}

#add another button to the form
$regdns_button = new-object -TypeName $buttons
$regdns_button.text = 'Clear/Register DNS'
$regdns_button.location = New-Object -TypeName $drawing -ArgumentList (0,170) 
$regdns_button.size = New-Object -TypeName $Size -ArgumentList (110,30)
$regdns_button.add_click{
  Clear-DnsClientCache
  $console.Text = 'Clearing The DNS Cache'
  Register-DnsClient
  $console.Text = 'Registering the DNS Cache'
}



#add another button to the form
$stopptr_button = new-object -TypeName $buttons
$stopptr_button.text = 'Stop Printer'
$stopptr_button.location = New-Object -TypeName $drawing -ArgumentList (120,170) 
$stopptr_button.size = New-Object -TypeName $Size -ArgumentList (80,30)
$stopptr_button.add_click{
  & "$env:windir\system32\net.exe" stop spooler
  $console.Text = 'Stopping Printer Services..'
}

#add another button to the form
$startptr_button = new-object -TypeName $buttons
$startptr_button.text = 'Start Printer'
$startptr_button.location = New-Object -TypeName $drawing -ArgumentList (200,170) 
$startptr_button.size = New-Object -TypeName $Size -ArgumentList (80,30)
$startptr_button.add_click{
  & "$env:windir\system32\net.exe" start spooler
  $console.Text = 'Starting Printer Services..'
}





#add a input textbox to the form
$nslookupx2textbox = New-Object -TypeName $textboxes
$nslookupx2textbox.text = 'Enter IP/HostName'
$nslookupx2textbox.location = New-Object -TypeName $drawing -ArgumentList (240,50)
$nslookupx2textbox.size = New-Object -TypeName $Size -ArgumentList (100,20)


#add another button to the form
$nslookupv2 = new-object -TypeName $buttons
$nslookupv2.text = 'Resolve '
$nslookupv2.location = New-Object -TypeName $drawing -ArgumentList (240,80) 
$nslookupv2.size = New-Object -TypeName $Size -ArgumentList (80,30)
$nslookupv2.add_click{
  $console.Text = resolve-DnsName -Name $nslookupx2textbox.Text | Out-String 
}


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
$Tab1.Controls.add($update)
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



$Tab2 = New-object -TypeName $TabPages
$Tab2.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab2.UseVisualStyleBackColor = $True 
$Tab2.Name = 'Tab2' 
$Tab2.Text = 'Server Commands' 
$FormTabControl.Controls.Add($Tab2)

$button = New-Object -TypeName $buttons
$button.Location = New-Object -TypeName $Point -ArgumentList (10,10)
$button.Size = New-Object -TypeName $Size -ArgumentList (140,30)
$button.Text = 'Clear Server DNS Cache'
$button.Add_Click{
  $console2.Text = 'Clearing The DNS Cache'
  & "$env:ComSpec" /c dnscmd /clearcache 
}

#console2 box
$console2 = New-Object -TypeName $textboxes
$console2.Location = New-Object -TypeName $Size -ArgumentList (364,0)
$console2.Size = New-Object -TypeName $Size -ArgumentList (220,300)
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




$Tab3 = New-object -TypeName $TabPages
$Tab3.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab3.UseVisualStyleBackColor = $True 
$Tab3.Name = 'Tab3' 
$Tab3.Text = 'General Use #2'
$FormTabControl.Controls.Add($Tab3)

function script:procInfo {
  $device=$dropdown1.SelectedItem.ToString() #populate the var with the value you selected
  $pingResult=New-NetIPAddress -IPAddress $ipaddr.Text -InterfaceAlias $device -PrefixLength $subnet.Text -DefaultGateway $gateway.Text -AddressFamily IPv4
  $console3.text=$pingResult
} #end procInfo


$dropdown1 = New-Object -TypeName System.Windows.Forms.ComboBox
$dropdown1.Location = New-Object -TypeName $Size -ArgumentList (12,10) 
$dropdown1.Size = New-Object -TypeName $Size -ArgumentList (100,20) 
$dropdown1.DropDownHeight = 200 
$Tab3.Controls.Add($dropdown1) 

$wksList=@('Ethernet','Wi-Fi')

foreach ($wks in $wksList) {
  $dropdown1.Items.Add($wks)
} #end foreach






$button = New-Object -TypeName $buttons
$button.Location = New-Object -TypeName $Point -ArgumentList (10,182)
$button.Size = New-Object -TypeName $Size -ArgumentList (55,25)
$button.Text = 'Change'
$button.Add_Click{
  $console3.Text = 'Starting.. '
  procInfo

}





#add a input textbox to the form
$ipaddr = New-Object -TypeName $textboxes
$ipaddr.text = 'IP'
$ipaddr.location = New-Object -TypeName $drawing -ArgumentList (12,50)
$ipaddr.size = New-Object -TypeName $Size -ArgumentList (100,20)

#add a input textbox to the form
$subnet = New-Object -TypeName $textboxes
$subnet.text = 'Prefix'
$subnet.location = New-Object -TypeName $drawing -ArgumentList (12,75)
$subnet.size = New-Object -TypeName $Size -ArgumentList (100,20)


#add a input textbox to the form
$gateway = New-Object -TypeName $textboxes
$gateway.text = 'Default Gateway'
$gateway.location = New-Object -TypeName $drawing -ArgumentList (12,100)
$gateway.size = New-Object -TypeName $Size -ArgumentList (100,20)

#add a input textbox to the form
$PreDNS = New-Object -TypeName $textboxes
$PreDNS.text = ''
$PreDNS.location = New-Object -TypeName $drawing -ArgumentList (12,125)
$PreDNS.size = New-Object -TypeName $Size -ArgumentList (100,20)

#add a input textbox to the form
$altDNS = New-Object -TypeName $textboxes
$altDNS.text = ''
$altDNS.location = New-Object -TypeName $drawing -ArgumentList (12,150)
$altDNS.size = New-Object -TypeName $Size -ArgumentList (100,20)


##################################
##################################
##################################
##################################


















#console3 box
$console3 = New-Object -TypeName $textboxes
$console3.Location = New-Object -TypeName $Size -ArgumentList (364,0)
$console3.Size = New-Object -TypeName $Size -ArgumentList (220,300)
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
$Tab3.Controls.Add($netuse)
$Tab3.Controls.Add($netuseip)
$Tab3.Controls.Add($ShareName)
$Tab3.Controls.Add($pass)
$Tab3.Controls.Add($dropdown2)



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

$Point = 'System.Drawing.Point'
$textboxes = 'System.Windows.Forms.TextBox'
$TabPages = 'System.Windows.Forms.Tabpage'
$Size = 'System.Drawing.Size'
$buttons = 'System.Windows.Forms.Button'
$textboxes = 'system.Windows.Forms.Textbox'
$rtb = 'system.Windows.Forms.RichTextBox'
$drawings = 'system.Drawing.Size'
$buttons = 'windows.forms.button'


$Tab4 = New-object -TypeName $TabPages
$Tab4.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab4.UseVisualStyleBackColor = $True 
$Tab4.Name = 'Tab4' 
$Tab4.Text = 'Software / PC Optimization'
$FormTabControl.Controls.Add($Tab4)


$FormTabControl1 = New-object -TypeName System.Windows.Forms.TabControl 
$FormTabControl1.Size = '340,260' 
$FormTabControl1.Location = '10,10' 
$form.Controls.Add($FormTabControl1)

$Tab5 = New-object -TypeName $TabPages
$Tab5.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab5.UseVisualStyleBackColor = $True 
$Tab5.Name = 'Tab5' 
$Tab5.Text = 'Utilties' 
$FormTabControl1.Controls.Add($Tab5)


$Cleartempfiles = New-Object -TypeName $buttons
$Cleartempfiles.Location = New-Object -TypeName $Point -ArgumentList (0,0)
$Cleartempfiles.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$Cleartempfiles.Text = 'Clean Temp Files'
$Cleartempfiles.Add_Click{
  $tempfolders = @( 'C:\Windows\Temp\*', "$env:temp\*" )
  Remove-Item -Path $tempfolders -Recurse -Force

  $data = Get-ChildItem -Path $tempfolders -Recurse | Measure-Object -property length -sum
  if ($data.sum -ige 1074000000){
    $inbytes = $data.sum  / 1074000000
    $inmbs = ('{0}' -f $inbytes).split('.')
    $size = $inmbs[0] + '.' + $inmbs[1][0] + $inmbs[1][1] + ' Gbs'
  }elseif ($data.sum -ige 1049000){
    $inbytes = $data.sum  / 1049000
    $inmbs = ('{0}' -f $inbytes).split('.')
    $size = $inmbs[0] + '.' + $inmbs[1][0] + $inmbs[1][1] + ' mbs'
  }else{ $size = -join($data.sum, ' ', 'bytes') }
  $count = -join($data.count, ' ', 'temporary files') 

  $console4.Text = ('Total {0}, Size of {1} Removed' -f $count, $size)
}


$BigTweaks = New-Object -TypeName $buttons
$BigTweaks.Location = New-Object -TypeName $Point -ArgumentList (150,150)
$BigTweaks.Size = New-Object -TypeName $Size -ArgumentList (80,80)
$BigTweaks.Text = 'BigTweaks, irreversible (unless you know what youre doing)'
$BigTweaks.Add_Click{
  Enable-ComputerRestore -Drive 'C:\'
  & "$env:windir\system32\reg.exe" ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore' /V 'SystemRestorePointCreationFrequency' /T REG_DWORD /D 0 /F
  Checkpoint-Computer -Description 'b4tweaks' -RestorePointType 'MODIFY_SETTINGS'
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableActivityFeed' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Type DWord -Value 1
  $null = Disable-ScheduledTask -TaskName 'Microsoft\Windows\Feedback\Siuf\DmClient' -ErrorAction SilentlyContinue
  $null = Disable-ScheduledTask -TaskName 'Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload' -ErrorAction SilentlyContinue
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -Type DWord -Value 1
  Write-Host 'Disabling Error reporting...'
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -Type DWord -Value 1
  $null = Disable-ScheduledTask -TaskName 'Microsoft\Windows\Windows Error Reporting\QueueReporting'
  Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338387Enabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338389Enabled' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353698Enabled' -Type DWord -Value 0
  If (!(Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent')) {
    $null = New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force
  }
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -Type DWord -Value 1
  Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'IRPStackSize' -Type DWord -Value 25
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name 'PeopleBand' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name 'PeopleBand' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Type DWord -Value 0
  Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name 'PeopleBand' -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 1
  
  Powercfg.exe -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
      
            Powercfg.exe /S $A[3]
        $A = (powercfg.exe -l | findstr -i Ultimate).split()
        Powercfg.exe /S $A[3]

  $form.WindowState = 1
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
    Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
    If (!(Test-Path $onedrive)) {
        $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
    }
    Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
    Start-Sleep -s 2
    Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
    Start-Sleep -s 2
    Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
    If (!(Test-Path "HKCR:")) {
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    }
    Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
    $formWindowsToolbox.WindowState = 0

}

$Tab6 = New-object -TypeName $TabPages
$Tab6.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab6.UseVisualStyleBackColor = $True 
$Tab6.Name = 'Tab6' 
$Tab6.Text = 'Software' 
$FormTabControl1.Controls.Add($Tab6)

$checkwinget = New-Object -TypeName $buttons
$checkwinget.Location = New-Object -TypeName $Point -ArgumentList (0,0)
$checkwinget.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$checkwinget.Text = 'Click me first'
$checkwinget.Add_Click{
  if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    $console4.SelectionColor = [Drawing.Color]::Green
    $console4.text = 'Winget Already Installed'
    
  }  
  else{
    # Installing winget from the Microsoft Store
    Write-Host 'Winget not found, installing it now.'
    $console4.text = "`r`n" +"`r`n" + 'Installing Winget... Please Wait'
    Start-Process 'ms-appinstaller:?source=https://aka.ms/getwinget'
    $nid = (Get-Process AppInstaller).Id
    Wait-Process -Id $nid
    Write-Host Winget Installed
    $console4.text = "`r`n" +"`r`n" + 'Winget Installed - Ready for Next Task'
  }

}


$Notepad = New-Object -TypeName $buttons
$Notepad.Location = New-Object -TypeName $Point -ArgumentList (0,30)
$Notepad.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$Notepad.Text = 'Notepad++'
$Notepad.Add_Click{
  $source = 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.3/npp.8.3.Installer.x64.exe'

  $destination = 'c:\Temp\npp.8.3.Installer.x64.exe'

  #Check if software is installed. If installed terminate script
  if ((Test-Path 'C:\Program Files\Notepad++') -Or (Test-Path 'C:\Program Files\Notepad++')){
    $console4.text = 'Software already installed' 
    exit
  }

  #Check if the installer is in the folder. If installer exist, replace it
  If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
  } 

  Invoke-WebRequest $source -OutFile $destination

  Start-Process -FilePath 'C:\Temp\npp.8.3.Installer.x64.exe' -ArgumentList '/S','/v','/qn' -Wait
 

  #Delete installer
  Start-sleep -s 25
  Remove-Item -recurse 'C:\Temp\npp.8.3.Installer.x64.exe'
}


$Nmap = New-Object -TypeName $buttons
$Nmap.Location = New-Object -TypeName $Point -ArgumentList (0,180)
$Nmap.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$Nmap.Text = 'Nmap'
$Nmap.Add_Click{
  $source = 'https://nmap.org/dist/nmap-7.92-setup.exe'

  $destination = 'c:\Temp\nmap-7.92-setup.exe'

  #Check if the installer is in the folder. If installer exist, replace it
  If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
  } 

  Invoke-WebRequest $source -OutFile $destination
  Start-Process -FilePath 'C:\Temp\nmap-7.92-setup.exe' -ArgumentList '/S','/v','/qn' -Wait
 
  #Delete installer
  Start-sleep -s 25
  Remove-Item -recurse 'C:\Temp\nmap-7.92-setup.exe'
}







$AdvancedIP = New-Object -TypeName $buttons
$AdvancedIP.Location = New-Object -TypeName $Point -ArgumentList (0,60)
$AdvancedIP.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$AdvancedIP.Text = 'Adv IP Scanner'
$AdvancedIP.Add_Click{
  $source = 'https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.3850.exe'

  $destination = 'c:\Temp\Advanced_IP_Scanner_2.5.3850.exe'
  #Check if software is installed. If installed terminate script
  if ((Test-Path 'C:\Program Files\Advanced IP Scanner') -Or (Test-Path 'C:\Program Files (x86)\Advanced IP Scanner')){
    $console4.text = 'Software already installed' 
    exit
  }

  #Check if the installer is in the folder. If installer exist, replace it
  If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
  } 

  Invoke-WebRequest $source -OutFile $destination
  Start-Process -FilePath 'C:\Temp\Advanced_IP_Scanner_2.5.3850.exe' -ArgumentList '/S','/v','/qn' -Wait
 
  #Delete installer
  Start-sleep -s 25
  Remove-Item -recurse 'C:\Temp\Advanced_IP_Scanner_2.5.3850.exe'

}

$NetScan = New-Object -TypeName $buttons
$NetScan.Location = New-Object -TypeName $Point -ArgumentList (0,90)
$NetScan.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$NetScan.Text = 'NetScan'
$NetScan.Add_Click{

}

$OWASP = New-Object -TypeName $buttons
$OWASP.Location = New-Object -TypeName $Point -ArgumentList (0,120)
$OWASP.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$OWASP.Text = 'OWASP'
$OWASP.Add_Click{
  $source = 'https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2_11_1_windows.exe'

  $destination = 'c:\Temp\ZAP_2_11_1_windows.exe'


  #Check if the installer is in the folder. If installer exist, replace it
  If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
  } 

  Invoke-WebRequest $source -OutFile $destination
  Start-Process -FilePath 'C:\Temp\ZAP_2_11_1_windows.exe' -ArgumentList '/S','/v','/qn' -Wait
 
  #Delete installer
  Start-sleep -s 25
  Remove-Item -recurse 'C:\Temp\ZAP_2_11_1_windows.exe'

}

$winterminal = New-Object -TypeName $buttons
$winterminal.Location = New-Object -TypeName $Point -ArgumentList (0,150)
$winterminal.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$winterminal.Text = 'winterminal'
$winterminal.Add_Click{

  winget install --id=Microsoft.WindowsTerminal -e
  console4.text = "Done."
  
}

$bb = New-Object -TypeName $buttons
$bb.Location = New-Object -TypeName $Point -ArgumentList (130,180)
$bb.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$bb.Text = 'BleachBit'
$bb.Add_Click{
  $source = ''
  $destination = 'c:\Temp\BleachBit-4.4.2-setup.exe'

  #Check if the installer is in the folder. If installer exist, replace it
  If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
  } 

  Invoke-WebRequest $source -OutFile $destination
  Start-Process -FilePath 'C:\Temp\BleachBit-4.4.2-setup.exe' -ArgumentList '/S','/v','/qn' -Wait
 
  #Delete installer
  Start-sleep -s 25
  Remove-Item -recurse 'C:\Temp\BleachBit-4.4.2-setup.exe'
}

$powertoys = New-Object -TypeName $buttons
$powertoys.Location = New-Object -TypeName $Point -ArgumentList (130,150)
$powertoys.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$powertoys.Text = 'powertoys'
$powertoys.Add_Click{
  winget install -e Microsoft.PowerToys
  console4.text = "Done."
}

$putty = New-Object -TypeName $buttons
$putty.Location = New-Object -TypeName $Point -ArgumentList (130,120)
$putty.Size = New-Object -TypeName $Size -ArgumentList (110,30)
$putty.Text = 'PuTTy'
$putty.Add_Click{
  winget install -e PuTTY.PuTTY
  console4.text = "Done."
}

#console4 box
$console4 = New-Object -TypeName $rtb
$console4.Location = New-Object -TypeName $Size -ArgumentList (364,0)
$console4.Size = New-Object -TypeName $Size -ArgumentList (220,300)
$console4.ReadOnly = $true
$console4.Multiline = $true
$console4.ScrollBars = [Windows.Forms.ScrollBars]::Both
$console4.ForeColor = [Drawing.Color]::Black




$Tab4.Controls.add($console4)
$Tab4.Controls.Add($FormTabControl1)
$Tab5.Controls.add($Cleartempfiles)
$Tab5.Controls.add($BigTweaks)
$Tab6.Controls.add($Notepad)
$Tab6.Controls.add($checkwinget)
$Tab6.Controls.add($Nmap)
$Tab6.Controls.add($AdvancedIP)
$Tab6.Controls.add($NetScan)
$Tab6.Controls.add($OWASP)
$Tab6.Controls.add($winterminal)
$Tab6.Controls.add($bb)
$Tab6.Controls.add($powertoys)
$Tab6.Controls.Add($putty)



$form.Add_shown{$form.Activate()}
$result = $form.ShowDialog()
if ($result -eq [Windows.Forms.DialogResult]::OK)
{
  Write-Verbose -Message 'a'

} 

function UpdatesAvailable()
{
  $updateavailable = $false
  $nextversion = $null
  try
  {
    $nextversion = (New-Object System.Net.WebClient).DownloadString($githubver).Trim([Environment]::NewLine)
  }
  catch [System.Exception] 
  {
    $console.Text = "$_ debug" 
  }
	
  $console.Text = "CURRENT VERSION: $version debug"
  $console.Text = "NEXT VERSION: $nextversion debug"
  if ($nextversion -ne $null -and $version -ne $nextversion)
  {
    #An update is most likely available, but make sure
    $updateavailable = $false
    $curr = $version.Split('.')
    $next = $nextversion.Split('.')
    for($i=0; $i -le ($curr.Count -1); $i++)
    {
      if ([int]$next[$i] -gt [int]$curr[$i])
      {
        $updateavailable = $true
        break
      }
    }
  }
  return $updatesAvailable
}

function Process-Updates()
{
  if (Test-Connection 8.8.8.8 -Count 1 -Quiet)
  {
    $updatepath = "$($PSScriptRoot)\update.ps1"
    if (Test-Path -Path $PSScriptRoot)	
    {
      #Remove-Item $updatepath
    }
    if (UpdatesAvailable)
    {
			
      {	
        (New-Object System.Net.Webclient).DownloadFile($updatefile, $updatepath)
        Start-Process PowerShell -Arg $updatepath
        exit
      }
    }
  }
  else
  {
    $console.Text = "Unable to check for updates. Internet connection not available. - warning"
  }
}

if (!$API)
{
	Process-Updates
}


$form.ShowDialog()
#===== CODE ends here ======
