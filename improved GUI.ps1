#!/usr/bin/env powershell
# Hide PowerShell Console
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
# NOTE: When you use a SPECIFIC catch block, exceptions thrown by -ErrorAction Stop MAY LACK
# some InvocationInfo details such as ScriptLineNumber.
# REMEDY: If that affects you, remove the SPECIFIC exception type [System.Management.Automation.CommandNotFoundException] in the code below
# and use ONE generic catch block instead. Such a catch block then handles ALL error types, so you would need to
# add the logic to handle different error types differently by yourself.
catch [System.Management.Automation.CommandNotFoundException]
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
# NOTE: When you use a SPECIFIC catch block, exceptions thrown by -ErrorAction Stop MAY LACK
# some InvocationInfo details such as ScriptLineNumber.
# REMEDY: If that affects you, remove the SPECIFIC exception type [System.Security.SecurityException] in the code below
# and use ONE generic catch block instead. Such a catch block then handles ALL error types, so you would need to
# add the logic to handle different error types differently by yourself.
catch [System.Security.SecurityException]
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
$form.FormBorderStyle = [Windows.Forms.FormBorderStyle]::Fixed3D
$form.text = 'selection'
$form.Topmost = $true
$form.minimumSize = New-Object -TypeName $Size -ArgumentList (600,350)
$form.maximumSize = New-Object -TypeName $Size -ArgumentList (600,350)
$form.StartPosition = 'CenterScreen'


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
$shutdown_button.text = 'Shutdown local PC'
$shutdown_button.location = New-Object -TypeName $drawing -ArgumentList (0,230) 
$shutdown_button.size = New-Object -TypeName $Size -ArgumentList (110,30)

$shutdown_button.add_click{
  $Point = 'System.Drawing.Point'
  $drawings = 'System.Drawing.Size'
  $buttons = 'System.Windows.Forms.Button'
  $label = New-Object -TypeName System.Windows.Forms.Label
  $label.Location = New-Object -TypeName $Point -ArgumentList (170,210)
  $label.Size = New-Object -TypeName $drawings -ArgumentList (280,20)
  $label.Text = 'Are you sure?'
  $form.Controls.Add($label)

  $OKButton = New-Object -TypeName $buttons
  $OKButton.Location = New-Object -TypeName $Point -ArgumentList (135,230)
  $OKButton.Size = New-Object -TypeName $drawings -ArgumentList (75,23)
  $OKButton.Text = 'OK'
  $form.Controls.Add($OKButton)

  $CancelButton = New-Object -TypeName $buttons
  $CancelButton.Location = New-Object -TypeName $Point -ArgumentList (210,230)
  $CancelButton.Size = New-Object -TypeName $drawings -ArgumentList (75,23)
  $CancelButton.Text = 'Cancel'
  $CancelButton.DialogResult = [Windows.Forms.DialogResult]::Cancel
  $form.CancelButton = $CancelButton
  $form.Controls.Add($CancelButton)

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
$button.Size = New-Object -TypeName $Size -ArgumentList (140,30)
$button.Text = 'Change Adaptor Settings'
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
$drawings = 'system.Drawing.Size'
$buttons = 'windows.forms.button'

$Tab4 = New-object -TypeName $TabPages
$Tab4.DataBindings.DefaultDataSourceUpdateMode = 0 
$Tab4.UseVisualStyleBackColor = $True 
$Tab4.Name = 'Tab4' 
$Tab4.Text = 'Software / PC Optimization'
$FormTabControl.Controls.Add($Tab4)

$Optimization = New-Object -TypeName System.Windows.Forms.Label
$Optimization.Location = New-Object -TypeName $Point -ArgumentList (170,210)
$Optimization.Size = New-Object -TypeName $drawings -ArgumentList (280,20)
$Optimization.Text = 'Optimization'
$form.Controls.Add($Optimization)

$Cleartempfiles = New-Object -TypeName $buttons
$Cleartempfiles.Location = New-Object -TypeName $Point -ArgumentList (10,182)
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









#console4 box
$console4 = New-Object -TypeName $textboxes
$console4.Location = New-Object -TypeName $Size -ArgumentList (364,0)
$console4.Size = New-Object -TypeName $Size -ArgumentList (220,300)
$console4.ReadOnly = $true
$console4.Multiline = $true
$console4.ScrollBars = [Windows.Forms.ScrollBars]::Both
$Tab4.Controls.add($console4)
$Tab4.Controls.add($Cleartempfiles)









$form.Add_shown{$form.Activate()}
$result = $form.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::OK)
{
  Write-Verbose -Message 'a'
} 





$form.ShowDialog()
#===== CODE ends here ======
