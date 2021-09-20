$Displaydnslist_CellContentClick = {

}



$button4_Click = {

	$console.Text = ipconfig /all | Out-String



}

$PING_Click = {
	 
	$console.Lines += Test-Connection $ip.Text -Count 1 | Out-String

	
}



$button3_Click = {

	$console.Lines += Test-NetConnection -ComputerName $ip.Text -port 22 | Out-String




}

$PORTS_Click = {
	 #Testing certain ports, feel free to edit.
    Test-NetConnection -ComputerName $ip.Text -port 22
timeout /t 3 /nobreak
    Test-NetConnection -ComputerName $ip -port 3389
timeout /t 3 /nobreak
    Test-NetConnection -ComputerName $ip -port 646
timeout /t 3 /nobreak
    Test-NetConnection -ComputerName $ip -port 5900
timeout /t 3 /nobreak
}

$TRIMSSD_Click = {
	Optimize-Volume -DriveLetter C -ReTrim -Verbose
	$console.Text = "Trimming the SSD..."


}

$registerdns_Click = {
	Register-DnsClient
	$console.Text = "Registering the DNS Cache"
}


$DISPLAYDNS_Click = {
	


$console.Text = DnsclientCache | Format-Table -Property Entry, RecordName, RecordStatusType, Section, TimeToLive, DataLength, Data -AutoSize | Out-String
$P = DnsclientCache
$P | Out-GridView


}

 
$button5_Click = {
	Clear-DnsClientCache
	$console.Text = "Clearing The DNS Cache"
}

[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$button2 = $null
[System.Windows.Forms.Button]$DISPLAYDNS = $null
[System.Windows.Forms.Button]$REGISTERDNS = $null
[System.Windows.Forms.Button]$FLUSHDNS = $null
[System.Windows.Forms.Button]$TRIMSSD = $null
[System.Windows.Forms.Button]$DEFRAGHDD = $null
[System.Windows.Forms.Button]$PING = $null
[System.Windows.Forms.TextBox]$console = $null
[System.Windows.Forms.Button]$button3 = $null
[System.Windows.Forms.TextBox]$ip = $null
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$Entry = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$RecordStatusType = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$Section = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$TimeToLive = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$DataLength = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$RecordName = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$Data = $null
[System.Windows.Forms.DataGridView]$Displaydnslist = $null
[System.Windows.Forms.Button]$button4 = $null
[System.Windows.Forms.ListView]$listView1 = $null
[System.Windows.Forms.ColumnHeader]$Entryy = $null
[System.Windows.Forms.ColumnHeader]$RecordStatusTypee = $null
[System.Windows.Forms.ColumnHeader]$Sectionn = $null
[System.Windows.Forms.ColumnHeader]$TsiMeToLive = $null
[System.Windows.Forms.ColumnHeader]$DataaLength = $null
[System.Windows.Forms.ColumnHeader]$ReCcordName = $null
[System.Windows.Forms.TextBox]$hiddentxt = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
[System.Windows.Forms.ListViewGroup]$listViewGroup1 = (New-Object -TypeName System.Windows.Forms.ListViewGroup -ArgumentList @([System.String]'ListViewGroup',[System.Windows.Forms.HorizontalAlignment]::Left))
[System.Windows.Forms.ListViewGroup]$listViewGroup2 = (New-Object -TypeName System.Windows.Forms.ListViewGroup -ArgumentList @([System.String]'ListViewGroup',[System.Windows.Forms.HorizontalAlignment]::Left))
[System.Windows.Forms.ListViewGroup]$listViewGroup3 = (New-Object -TypeName System.Windows.Forms.ListViewGroup -ArgumentList @([System.String]'ListViewGroup',[System.Windows.Forms.HorizontalAlignment]::Left))
[System.Windows.Forms.ListViewGroup]$listViewGroup4 = (New-Object -TypeName System.Windows.Forms.ListViewGroup -ArgumentList @([System.String]'ListViewGroup',[System.Windows.Forms.HorizontalAlignment]::Left))
[System.Windows.Forms.ListViewItem]$listViewItem1 = (New-Object -TypeName System.Windows.Forms.ListViewItem -ArgumentList @([System.String]''))
[System.Windows.Forms.ListViewItem]$listViewItem2 = (New-Object -TypeName System.Windows.Forms.ListViewItem -ArgumentList @([System.String]''))
[System.Windows.Forms.ListViewItem]$listViewItem3 = (New-Object -TypeName System.Windows.Forms.ListViewItem -ArgumentList @([System.String]''))
[System.Windows.Forms.ListViewItem]$listViewItem4 = (New-Object -TypeName System.Windows.Forms.ListViewItem -ArgumentList @([System.String]''))
[System.Windows.Forms.ListViewItem]$listViewItem5 = (New-Object -TypeName System.Windows.Forms.ListViewItem -ArgumentList @([System.String]''))
$button2 = (New-Object -TypeName System.Windows.Forms.Button)
$DISPLAYDNS = (New-Object -TypeName System.Windows.Forms.Button)
$REGISTERDNS = (New-Object -TypeName System.Windows.Forms.Button)
$FLUSHDNS = (New-Object -TypeName System.Windows.Forms.Button)
$TRIMSSD = (New-Object -TypeName System.Windows.Forms.Button)
$DEFRAGHDD = (New-Object -TypeName System.Windows.Forms.Button)
$PING = (New-Object -TypeName System.Windows.Forms.Button)
$console = (New-Object -TypeName System.Windows.Forms.TextBox)
$ip = (New-Object -TypeName System.Windows.Forms.TextBox)
$button3 = (New-Object -TypeName System.Windows.Forms.Button)
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Displaydnslist = (New-Object -TypeName System.Windows.Forms.DataGridView)
$Entry = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$RecordStatusType = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$Section = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$TimeToLive = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$DataLength = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$RecordName = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$Data = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$button4 = (New-Object -TypeName System.Windows.Forms.Button)
$listView1 = (New-Object -TypeName System.Windows.Forms.ListView)
$Entryy = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$RecordStatusTypee = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$Sectionn = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$TsiMeToLive = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$DataaLength = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$ReCcordName = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$hiddentxt = (New-Object -TypeName System.Windows.Forms.TextBox)
([System.ComponentModel.ISupportInitialize]$Displaydnslist).BeginInit()
$Form1.SuspendLayout()
#
#button2
#
$button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]778,[System.Int32]328))
$button2.Name = [System.String]'button2'
$button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]8,[System.Int32]8))
$button2.TabIndex = [System.Int32]0
$button2.Text = [System.String]'button2'
$button2.UseVisualStyleBackColor = $true
#
#DISPLAYDNS
#
$DISPLAYDNS.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]661,[System.Int32]75))
$DISPLAYDNS.Name = [System.String]'DISPLAYDNS'
$DISPLAYDNS.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$DISPLAYDNS.TabIndex = [System.Int32]1
$DISPLAYDNS.Text = [System.String]'DISPLAY DNS'
$DISPLAYDNS.UseVisualStyleBackColor = $true
$DISPLAYDNS.add_Click($DISPLAYDNS_Click)
#
#REGISTERDNS
#
$REGISTERDNS.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]130,[System.Int32]26))
$REGISTERDNS.Name = [System.String]'REGISTERDNS'
$REGISTERDNS.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$REGISTERDNS.TabIndex = [System.Int32]2
$REGISTERDNS.Text = [System.String]'Register DNS'
$REGISTERDNS.UseVisualStyleBackColor = $true
$REGISTERDNS.add_Click($registerdns_Click)
#
#FLUSHDNS
#
$FLUSHDNS.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]26))
$FLUSHDNS.Name = [System.String]'FLUSHDNS'
$FLUSHDNS.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$FLUSHDNS.TabIndex = [System.Int32]3
$FLUSHDNS.Text = [System.String]'Flush DNS'
$FLUSHDNS.UseVisualStyleBackColor = $true
$FLUSHDNS.add_Click($button5_Click)
#
#TRIMSSD
#
$TRIMSSD.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]75))
$TRIMSSD.Name = [System.String]'TRIMSSD'
$TRIMSSD.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$TRIMSSD.TabIndex = [System.Int32]4
$TRIMSSD.Text = [System.String]'TRIM SSD'
$TRIMSSD.UseVisualStyleBackColor = $true
$TRIMSSD.add_Click($TRIMSSD_Click)
#
#DEFRAGHDD
#
$DEFRAGHDD.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]130,[System.Int32]75))
$DEFRAGHDD.Name = [System.String]'DEFRAGHDD'
$DEFRAGHDD.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$DEFRAGHDD.TabIndex = [System.Int32]5
$DEFRAGHDD.Text = [System.String]'Defrag HDD'
$DEFRAGHDD.UseVisualStyleBackColor = $true
#
#PING
#
$PING.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]186,[System.Int32]470))
$PING.Name = [System.String]'PING'
$PING.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$PING.TabIndex = [System.Int32]6
$PING.Text = [System.String]'Ping Target'
$PING.UseVisualStyleBackColor = $true
$PING.add_Click($PING_Click)
#
#console
#
$console.Dock = [System.Windows.Forms.DockStyle]::Right
$console.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]761,[System.Int32]0))
$console.Multiline = $true
$console.Name = [System.String]'console'
$console.ReadOnly = $true
$console.ScrollBars = [System.Windows.Forms.ScrollBars]::Both
$console.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]275,[System.Int32]537))
$console.TabIndex = [System.Int32]8
#
#ip
#
$ip.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]482))
$ip.Name = [System.String]'ip'
$ip.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]157,[System.Int32]20))
$ip.TabIndex = [System.Int32]9
#
#button3
#
$button3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]508))
$button3.Name = [System.String]'button3'
$button3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]70,[System.Int32]23))
$button3.TabIndex = [System.Int32]10
$button3.Text = [System.String]'Basic Scan'
$button3.UseVisualStyleBackColor = $true
$button3.add_Click($button3_Click)
#
#label1
#
$label1.AutoSize = $true
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]18,[System.Int32]466))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]151,[System.Int32]13))
$label1.TabIndex = [System.Int32]11
$label1.Text = [System.String]'Enter the IP to find ports open:'
#
#Displaydnslist
#
$Displaydnslist.ColumnHeadersHeightSizeMode = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::AutoSize
$Displaydnslist.Columns.AddRange($Entry,$RecordStatusType,$Section,$TimeToLive,$DataLength,$RecordName,$Data)
$Displaydnslist.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]124))
$Displaydnslist.Name = [System.String]'Displaydnslist'
$Displaydnslist.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]743,[System.Int32]110))
$Displaydnslist.TabIndex = [System.Int32]12
$Displaydnslist.add_CellContentClick($Displaydnslist_CellContentClick)
#
#Entry
#
$Entry.HeaderText = [System.String]'Entry'
$Entry.Name = [System.String]'Entry'
#
#RecordStatusType
#
$RecordStatusType.HeaderText = [System.String]'Record Status Type'
$RecordStatusType.Name = [System.String]'RecordStatusType'
#
#Section
#
$Section.HeaderText = [System.String]'Section'
$Section.Name = [System.String]'Section'
#
#TimeToLive
#
$TimeToLive.HeaderText = [System.String]'Time To Live'
$TimeToLive.Name = [System.String]'TimeToLive'
#
#DataLength
#
$DataLength.HeaderText = [System.String]'Data Length'
$DataLength.Name = [System.String]'DataLength'
#
#RecordName
#
$RecordName.HeaderText = [System.String]'Record Name'
$RecordName.Name = [System.String]'RecordName'
#
#Data
#
$Data.HeaderText = [System.String]'Data'
$Data.Name = [System.String]'Data'
#
#button4
#
$button4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]239,[System.Int32]53))
$button4.Name = [System.String]'button4'
$button4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]43))
$button4.TabIndex = [System.Int32]13
$button4.Text = [System.String]'ipconfig'
$button4.UseVisualStyleBackColor = $true
$button4.add_Click($button4_Click)
#
#listView1
#
$listView1.Columns.AddRange([System.Windows.Forms.ColumnHeader[]]@($Entryy,$RecordStatusTypee,$Sectionn,$TsiMeToLive,$DataaLength,$ReCcordName))
$listViewGroup1.Header = [System.String]'ListViewGroup'
$listViewGroup1.Name = [System.String]'listViewGroup1'
$listViewGroup2.Header = [System.String]'ListViewGroup'
$listViewGroup2.Name = [System.String]'listViewGroup2'
$listViewGroup3.Header = [System.String]'ListViewGroup'
$listViewGroup3.Name = [System.String]'listViewGroup3'
$listViewGroup4.Header = [System.String]'ListViewGroup'
$listViewGroup4.Name = [System.String]'listViewGroup4'
$listView1.Groups.AddRange([System.Windows.Forms.ListViewGroup[]]@($listViewGroup1,$listViewGroup2,$listViewGroup3,$listViewGroup4))
$listView1.HideSelection = $false
$listView1.Items.AddRange([System.Windows.Forms.ListViewItem[]]@($listViewItem1,$listViewItem2,$listViewItem3,$listViewItem4,$listViewItem5))
$listView1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]241))
$listView1.Name = [System.String]'listView1'
$listView1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]734,[System.Int32]133))
$listView1.TabIndex = [System.Int32]14
$listView1.UseCompatibleStateImageBehavior = $false
#
#Entryy
#
$Entryy.Text = [System.String]'Entry'
#
#RecordStatusTypee
#
$RecordStatusTypee.Text = [System.String]'RecordStatusType'
#
#Sectionn
#
$Sectionn.Text = [System.String]'Section'
#
#TsiMeToLive
#
$TsiMeToLive.Text = [System.String]'TiMeToLive'
#
#DataaLength
#
$DataaLength.Text = [System.String]'DataaLength'
#
#ReCcordName
#
$ReCcordName.Text = [System.String]'ReCcordName'
#
#hiddentxt
#
$hiddentxt.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]501,[System.Int32]505))
$hiddentxt.Name = [System.String]'hiddentxt'
$hiddentxt.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]20))
$hiddentxt.TabIndex = [System.Int32]15
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1036,[System.Int32]537))
$Form1.Controls.Add($hiddentxt)
$Form1.Controls.Add($listView1)
$Form1.Controls.Add($button4)
$Form1.Controls.Add($Displaydnslist)
$Form1.Controls.Add($label1)
$Form1.Controls.Add($button3)
$Form1.Controls.Add($ip)
$Form1.Controls.Add($console)
$Form1.Controls.Add($PING)
$Form1.Controls.Add($DEFRAGHDD)
$Form1.Controls.Add($TRIMSSD)
$Form1.Controls.Add($FLUSHDNS)
$Form1.Controls.Add($REGISTERDNS)
$Form1.Controls.Add($DISPLAYDNS)
$Form1.Controls.Add($button2)
$Form1.Name = [System.String]'Form1'
$Form1.ShowIcon = $false
([System.ComponentModel.ISupportInitialize]$Displaydnslist).EndInit()
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button2 -Value $button2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name DISPLAYDNS -Value $DISPLAYDNS -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name REGISTERDNS -Value $REGISTERDNS -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name FLUSHDNS -Value $FLUSHDNS -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TRIMSSD -Value $TRIMSSD -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name DEFRAGHDD -Value $DEFRAGHDD -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name PING -Value $PING -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name console -Value $console -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button3 -Value $button3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ip -Value $ip -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Entry -Value $Entry -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name RecordStatusType -Value $RecordStatusType -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Section -Value $Section -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TimeToLive -Value $TimeToLive -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name DataLength -Value $DataLength -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name RecordName -Value $RecordName -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Data -Value $Data -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Displaydnslist -Value $Displaydnslist -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button4 -Value $button4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name listView1 -Value $listView1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Entryy -Value $Entryy -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name RecordStatusTypee -Value $RecordStatusTypee -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Sectionn -Value $Sectionn -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TsiMeToLive -Value $TsiMeToLive -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name DataaLength -Value $DataaLength -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ReCcordName -Value $ReCcordName -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name hiddentxt -Value $hiddentxt -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent


$Form1.ShowDialog()