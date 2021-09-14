<!-- :: Batch section
@echo off
setlocal

echo Select an option:
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
echo End of HTA window, reply: "%HTAreply%"
pause
goto :EOF
-->



<HTML>
<HEAD>

<TITLE>Commands List</TITLE>



<SCRIPT language="JavaScript">
window.resizeTo(500,900);
function closeHTA(reply){
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   fso.GetStandardStream(1).WriteLine(reply);
   window.close();
}

</SCRIPT>



<HTA:APPLICATION
 MAXIMIZEBUTTON="no"
 MINIMIZEBUTTON="yes"
 RESIZE="no"
 SCROLL="yes"
 SINGLEINSTANCE="yes"
 WINDOWSTATE="normal"
 SHOWINTASKBAR="yes"
 BORDER="thin" >

</HEAD>
<BODY>
<ol>
<h2>Page 1 (Main)</h2>

<li>ipconfig/ all</li>
<ul><li>/all             Display full configuration information. The default is to display only the IP address, subnet mask and
default gateway for each adapter bound to TCP/IP.</li></ul>
<li>Reset the TCP/IP (Lots of CMDS)</li>
<ul><li>Starts a set of commands, that WILL usually fix slow internet</li></ul>
<li>Flush DNS</li>
<ul><li>Purges the DNS Resolver cache.</li></ul>
<li>Clear NetBIOS</li>
<ul><li>Purges and reloads the remote cache name table</li></ul>
<li>SFC-Integrity</li>
<ul><li>scan all protected system files, and replace corrupted files with a cached copy that is located in a compressed folder</li></ul>
<li>Page 2</li>
<ul><li>Goes to page 2</li></ul>
<li>Page 3</li>
<ul><li>Goes to page 3</li></ul>
<li>What these commands do [Info]</li>
<ul><li>Current</li></ul>
<li>Page 4/Extras/Programs</li>
<ul><li>Goes to page 4</li></ul>
<br>

<h2>Page 2 </h2>
<li>Enable Trim / System Assessment</li>
<ul><li>Enables Periodic TRIM & Starts System Assessment</li></ul>
<li>Trim SSD</li>
<ul><li>Trims the SSD</li></ul>
<li>System Assessment</li>
<ul><li>Starts the System Assessment tool (WinSAT) in CMD.</li></ul>
<li>IP Release/renew</li>
<ul><li>Release the IPv4 IP address for the specified adapter & Renew the IPv4 address for the specified adapter.</li></ul>
<li>Register ocx/dll</li>
<ul><li>Register- unregistered dll's & ocx file types, and signs them</li></ul>
<li>Nagles Alg On</li>
<ul><li>improving the efficiency of TCP/IP networks by reducing the number of packets that need to be sent over the network.</li></ul>
<li>Nagles Alg Off</li>
<ul><li>Disables Nagles algorithm</li></ul>
<li>Go Back</li>
<ul><li>Back to menu 1</li></ul>
<br>

<h2>Page 3 </h2>
<li>Getmac</li>
<ul><li>enables admins to display the mac address</li></ul>
<li>Shutdown</li>
<ul><li>Shuts down a PC on the local network</li></ul>
<li>System Info</li>
<ul><li>shows system info in cmd</li></ul>
<li>tracert/pathping</li>
<ul><li>Pings, and traces the IP/domain how long it takes</li></ul>
<li>WMIC</li>
<ul><li>Starts WMIC</li></ul>
<li>defrag HDD/trim ssd</li>
<ul><li>Selects a drive and either trims or defrags it</li></ul>
<li>Reset Windows</li>
<ul><li>Literally resets windows</li></ul>
<li>go back</li>
<ul><li>Go back to menu 1</li></ul>
<br>

<h2>Page 4</h2>
<li>Disk Manager</li>
<ul><li>Starts Disk Manager</li></ul>
<li>Device Manager</li>
<ul><li>Starts Device Manager</li></ul>
<li>Event Viewer</li>
<ul><li>Starts Event Viewer</li></ul>
<li>Services</li>
<ul><li>Opens services</li></ul>
<li>Task Scheduler</li>
<ul><li>Start Task Scheduler</li></ul>
<li>Local User Mgnt</li>
<ul><li>Opens Local Users</li></ul>
<li>Create A User</li>
<ul><li>Creates a user, and can make them into admin accounts.</li></ul>
<li>Go back to Menu 1</li>
</ol>
<button onclick="closeHTA(1);">Exit</button>
</BODY>
</HTML>