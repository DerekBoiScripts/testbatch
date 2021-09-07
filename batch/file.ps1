Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'

$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?
        Select "Yes" to Run as an Administrator
        Select "No" to not run this as an Administrator
        
        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco) 
    Switch ($Prompt) {
        
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = New-Object System.Drawing.Point(804,708)
$Form.text = "Test"
$Form.TopMost = $false

$PictureBox1 = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width = 600
$PictureBox1.height = 45
$PictureBox1.location = New-Object System.Drawing.Point(103,23)
$PictureBox1.imageLocation = "https://raw.githubusercontent.com/jake666777666/testbatch/main/test.png"
$PictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$TRIMSSD = New-Object system.Windows.Forms.Button
$TRIMSSD.text = "TRIM SSD"
$TRIMSSD.width = 200
$TRIMSSD.height = 30
$TRIMSSD.location = New-Object System.Drawing.Point(400,150)
$TRIMSSD.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$FLUSHDNS = New-Object system.Windows.Forms.Button
$FLUSHDNS.text = "Flush DNS"
$FLUSHDNS.width = 80
$FLUSHDNS.height = 30
$FLUSHDNS.location = New-Object System.Drawing.Point(300,150)
$FLUSHDNS.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$DEFRAGHDD = New-Object system.Windows.Forms.Button
$DEFRAGHDD.text = "Defrag HDD"
$DEFRAGHDD.width = 200
$DEFRAGHDD.height = 30
$DEFRAGHDD.location = New-Object System.Drawing.Point(400,200)
$DEFRAGHDD.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$DISPLAYDNS = New-Object system.Windows.Forms.Button
$DISPLAYDNS.text = "Display DNS"
$DISPLAYDNS.width = 90
$DISPLAYDNS.height = 40
$DISPLAYDNS.location = New-Object System.Drawing.Point(180,150)
$DISPLAYDNS.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$REGISTERDNS = New-Object system.Windows.Forms.Button
$REGISTERDNS.text = "Register DNS"
$REGISTERDNS.width = 90
$REGISTERDNS.height = 40
$REGISTERDNS.location = New-Object System.Drawing.Point(180,190)
$REGISTERDNS.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$PING = New-Object system.Windows.Forms.Button
$PING.text = "ping ip/hostname"
$PING.width = 150
$PING.height = 40
$PING.location = New-Object System.Drawing.Point(200,300)
$PING.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


$Form.controls.AddRange(@($PictureBox1,$TRIMSSD,$FLUSHDNS,$DEFRAGHDD,$DISPLAYDNS,$REGISTERDNS,$PING))

#####################################################
#####################################################
#####################################################
#####################################################
#trim ssd and hard drives, if any
$TRIMSSD.Add_Click({
Optimize-Volume -DriveLetter C -ReTrim -Verbose
timeout /t 5 /nobreak
})

$DEFRAGHDD.Add_Click({
Optimize-Volume -DriveLetter d -verbose
timeout /t 5 /nobreak
})

#####################################################
#####################################################
#####################################################
#####################################################
#ipconfig set of tools
$FLUSHDNS.Add_Click({
Clear-DnsClientCache
timeout /t 2 /nobreak
})

$DISPLAYDNS.Add_Click({
DnsClientCache
})

$REGISTERDNS.Add_Click({
Register-DnsClient
})

#####################################################
#####################################################
#####################################################
#####################################################
$PING.add_Click({

})

[void]$Form.ShowDialog()