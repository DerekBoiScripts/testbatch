
 <html>
 <head>
 <title>Helpdesk Express</title>

  <SCRIPT Language="VBScript">
	width = "1000"
	height = "600"
	' This moves the window to the middle of the screen
	Set objWMIService = GetObject("winmgmts:\\.\root\cimv2") 
	Set colItems = objWMIService.ExecQuery("Select * From Win32_DesktopMonitor WHERE DeviceID='DesktopMonitor1'") 
	For Each objItem in ColItems 
	intHorizontal = objItem.ScreenWidth 
	intVertical = objItem.ScreenHeight 
	Next 
	intLeft = (intHorizontal - width)/2 
	intTop = (intVertical - height)/2 
	window.resizeTo width,height 
	window.moveTo intLeft, intTop

</script>

 <HTA:APPLICATION 
     ID="objITHelpdesk"
     APPLICATIONNAME="HSS"
	 BORDER="thin"
	 CONTEXTMENU="no"
	 ICON="images/help.ico" 
	 MAXIMIZEBUTTON="no"
     MINIMIZEBUTTON="yes"
	 RESIZE="no"
	 SCROLL="no"
     SINGLEINSTANCE="yes"
     WINDOWSTATE="normal" />

<style type="text/css">
body {
 margin : 0;
 padding : 0;
 background-color : #005D8B;
 color : #000000;
 }

a:link {
font : 10pt Arial,geneva,helvetica; 
color: white; 
}

}
a:visited { 
font : 10pt Arial,geneva,helvetica;
color: white; 
}

}
a:hover {
font : 10pt Arial,geneva,helvetica;
color: white; 
}

} 
 p, ul, ol, li {
 font : 10pt Arial,geneva,helvetica;
 }
 h1 {
 font : bold 14pt Arial, Helvetica, geneva;
 }
 h2 {
 font : bold 12pt Arial, Helvetica, geneva;
 }
 #header {
 position : fixed;
 width : 100%;
 height : 2%;
 top : 0;
 right : 0;
 bottom : auto;
 left : 0;
 border-bottom : 0px solid #cccccc;
 }
 
 #leftnavigation {
 position : fixed;
 height : auto;
 top : 0%;
 left : 0;
 width : 170px;
 margin : 0px 0px 0px 2px;
 color : #000000;
 padding : 3px;
 overflow : auto;
 }
 #content {
 position : fixed;
 top : 2%;
 bottom : 2%;
 margin : 0px 0px 0px 175px;
 width : auto;
 height : auto;
 padding-left : 5px;
 padding-right : 12px;
 color : #000000;
 border-left : 0px solid #cccccc;
 overflow : auto;
 }
 #content h1, #content h2 {
 color : #cc0000;
 }
 #footer {
 display: none;
 
 background-color : #0084C7;
 position: fixed;
 width: 100%;
 height: 70px;
 top: auto;
 right: 0;
 bottom: 0;
 margin-left : 10px;
 border-top : 2px solid #cccccc;
 }
 #footer h1 {
text-align: center;
font-size:28.0pt;
font-family: Palatino Linotype, serif;
color: #FFFFFF;
letter-spacing:6.0pt
}

/* Menu css */
#dhtmlgoodies_menu{
	font-family:arial;	/* Font for main menu items */
	width:150px;	/* Width of main menu */

}
#dhtmlgoodies_menu	li{	/* Main menu <li> */
	list-style-type:none;	/* No bullets */
	margin:0px;	/* No margin - needed for Opera */
}
#dhtmlgoodies_menu ul{
	margin:0px;	/* No <ul> air */
	padding:0px;	/* No <ul> air */
}
#dhtmlgoodies_menu ul li ul{	/* Styling for those who doesn't have javascript enabled */
	padding-left:10px;
}
#dhtmlgoodies_menu	li a{	/* Main menu links */
	text-decoration:none;	/* No underline */
	color:#000;	/* Black text color */

	height:20px;	/* 20 pixel height */
	line-height:20px;	/* 20 pixel height */
	vertical-align:middle;	/* Align text in the middle */
	border:1px solid #000;	/* Black border */
	background-color:#FAFAFA;	/* Light blue background color */
	margin:1px;	/* A little bit of air */
	padding:1px;	/* Air between border and text inside */

	display:block;
}
#dhtmlgoodies_menu	li a:hover,#dhtmlgoodies_menu .activeMainMenuItem{
	color:#FFF;
	background-color:#317082;
}
.dhtmlgoodies_subMenu{
	visibility:hidden;
	position:absolute;
	overflow:hidden;
	border:1px solid #000;
	background-color:#FAFAFA;
	font-family:arial;
	text-align:left;

}
.dhtmlgoodies_subMenu ul{
	margin:0px;
	padding:0px;
}
.dhtmlgoodies_subMenu ul li{
	list-style-type:none;
	margin:0px;
	padding:1px;	/* 1px of air between submenu border and sub menu item - (the "white" space you see on mouse over )*/
}
.dhtmlgoodies_subMenu ul li a{	/* Sub menu items */
	white-space:nowrap;	/* No line break */
	text-decoration:none;	/* No underline */
	color:#000;	/* Black text color */

	height:16px;	/* 16 pixels height */
	line-height:16px;	/* 16 pixels height */
	padding:1px;	/* 1px of "air" inside */

	display:block;	/* Display as block - you shouldn't change this */
}
.dhtmlgoodies_subMenu ul li a:hover{	/* Sub menu items - mouse over effects */
	color:#FFF;	/* White text */
	background-color:#317082;	/* Blue background */
}
</style>
 <script type="text/javascript" >
/***
*	A huge thanks to Dean Parkinson for the help with this widget
*/
/************************************************************************************************************
@fileoverview
Slide out menu
Copyright (C) 2007  Dean Parkinson

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Alf Magne Kalleland, 2007
Owner of DHTMLgoodies.com


************************************************************************************************************/	
var MENUDIV_ID = "dhtmlgoodies_menu";
var SUBMENU_CLASS = 'dhtmlgoodies_subMenu';
var menuItems;
var slideSpeed_out = 50;	// Steps to move sub menu at a time ( higher = faster)
var slideSpeed_in = 50;
var delayMenuClose = 100;	// Microseconds from mouseout to close of menu
var slideTimeout_out = 25;	// Microseconds between slide steps ( lower = faster)
var slideTimeout_in = 10;	// Microseconds between slide steps ( lower = faster)
var xOffsetSubMenu = 0; 	// Offset x-position of sub menu items - use negative value if you want the sub menu to overlap main menu

/* Don't change anything below here */

var indeces = new Array();
indeces[0] = 0;
var isMSIE = navigator.userAgent.indexOf('MSIE')>=0?true:false;
var browserVersion = parseInt(navigator.userAgent.replace(/.*?MSIE ([0-9]+?)[^0-9].*/g,'$1'));
if(!browserVersion)browserVersion=1;

function mouseOn(obj) {
	var mi = findNode(getSearchIdFromObj(obj));
	if (mi) mi.mouseOn();
}

function mouseOff(obj) {
	var mi = findNode(getSearchIdFromObj(obj));
	if (mi) mi.mouseOff();
}

function getSearchIdFromObj(obj) {
	// pull the postfix off the A link or LI tag id and return the menu item ID
	var objId = obj.id;
	var idx = objId.indexOf('_');
	if (idx>=0) {
		return "MenuItem" + objId.substring(idx);
	}
	return null;
}

function slideChildMenu(aId) {
	var mi = findNode(aId);
	if (mi) mi.slideChildMenu();
}

function findNode(searchId) {
	var result;
	for (var no=0;no<menuItems.length;no++) {
		result = menuItems[no].findNode(searchId);
		if (result) return result;
	}
	return null;
}

function getNextIndex(lvl) {
	var result = 0;
	if (indeces.length<=lvl) {
		indeces[lvl] = 1;
	} else {
		result = indeces[lvl];
		indeces[lvl]++;
	}
	return result;
}

function MenuItem(divref, ulref, liref, lvlnum, parentref) {
	this.parent = parentref;
	this.div = divref;
	this.ul = ulref;
	this.width = this.ul.offsetWidth;
	// this.left = div.style.left.replace(/[^0-9]/g,'');
	this.li = liref;
	this.alink = this.li.getElementsByTagName('A')[0];
	this.lvl = lvlnum;
	this.idx = getNextIndex(this.lvl);
	this.children;
	this.subUL = this.li.getElementsByTagName('UL')[0];
	this.children;
	this.isMouseOnMe = false;
	// note: if !isOpen && !isClosed then I am animating a slide
	this.isChildMenuOpen = false;
	this.isChildMenuClosed = true;

	// Constructor
	// if a node does not have an A tag but it's children do then we need
	// null out this node's alink field...
	if (this.alink) {
		if (this.alink.parentNode!=this.li) this.alink = null;
	}
	if (this.subUL) {
		this.children = new Array();
		var subLI = this.subUL.getElementsByTagName('LI')[0];
		while(subLI) {
			if(subLI.tagName && subLI.tagName.toLowerCase()=='li') {
				this.children[this.children.length] = new MenuItem(null, this.subUL, subLI, this.lvl + 1, this);
			}
			subLI = subLI.nextSibling;
		}
	}

	this.getPostfix = function() {
		return '_' + this.idx + '_' + this.lvl;
	}
	
	this.getId = function() {
		return "MenuItem" + this.getPostfix();
	}

	this.hasChildren = function() {
		return (this.children!=null);
	}

	this.getTopPos = function() {
		var origDisp = this.div.style.display;
		this.div.style.display = "";
		var obj = this.li;
		var result = obj.offsetTop;
		while((obj = obj.offsetParent) != null) result += obj.offsetTop;
		this.div.style.display = origDisp;
		return result;
	}

	this.getLeftPos = function() {
		var origDisp = this.div.style.display;
		this.div.style.display = "";
		var obj = this.li;
		var result = obj.offsetLeft;
		while((obj = obj.offsetParent) != null) result += obj.offsetLeft;
		this.div.style.display = origDisp;
		return result;
	}

	this.renderNode = function() {
		// set node properties
		this.li.id = "menuItemLI" + this.getPostfix();
		this.ul.style.position = "relative";
		if (this.alink) {
			this.alink.id = "menuItemA" + this.getPostfix();
			this.alink.onmouseover = function() {mouseOn(this);};
			this.alink.onmouseout = function() {mouseOff(this);};
		} else {
			this.li.onmouseover = function() {mouseOn(this);};
			this.li.onmouseout = function() {mouseOff(this);};
		}

		// set sub-menu nodes
		if (this.hasChildren()) {
			var mi = this.children[0];
			var subdiv = document.createElement('DIV');
			subdiv.className=SUBMENU_CLASS;
			document.body.appendChild(subdiv);
			subdiv.id = "menuItemDIV" + mi.getPostfix();
			this.subUL.id = "menuItemUL" + mi.getPostfix();
			subdiv.appendChild(this.subUL);
			subdiv.style.left = this.getLeftPos() + this.width + xOffsetSubMenu + 'px';
			subdiv.style.top = this.getTopPos() + 'px';
			subdiv.style.visibility = "hidden";
			subdiv.style.display = "none";
			subdiv.style.zindex = "1000";
			for (var no=0;no<this.children.length;no++) {
				var mi = this.children[no];
				mi.div = subdiv;
				mi.renderNode();
			}
		}
		return this.li;
	}

	this.findNode = function(searchId) {
		var result;
		if (this.getId() == searchId) {
			result = this;
		} else {
			if (this.hasChildren()) {
				for (var no=0;no<this.children.length;no++) {
					var mi = this.children[no];
					result = mi.findNode(searchId);
					if (result!=null) break;
				}
			}
		}
		return result;
	}

	this.mouseOn = function() {
		this.isMouseOnMe = true;
		if (this.hasChildren() && this.isChildMenuClosed) {
			this.initiateChildMenuOpen();
		}
	}

	this.mouseOff = function() {
		this.isMouseOnMe = false;
		if (this.hasChildren() && !this.isChildMenuClosed) {
			this.initiateChildMenuClose();
		} else if (this.parent) {
			this.parent.mouseOff();
		}
	}

	this.isMouseOnChild = function() {
		if (this.isMouseOnMe) return true;
		if (this.hasChildren()) {
			for (var no=0;no<this.children.length;no++) {
				if (this.children[no].isMouseOnChild()) return true;
			}
		}
		return false;
	}

	this.initiateChildMenuOpen = function() {
		this.isChildMenuClosed = false;
		var childDiv = this.children[0].div;
		childDiv.style.width = "0px";
		childDiv.style.visibility = "visible";
		childDiv.style.display = "";
		this.slideChildMenu();
	}

	this.initiateChildMenuClose = function() {
		this.isChildMenuOpen = false;
		// we have to wait to close the menu
		// allow the mouse to navigate over the child menu
		setTimeout("slideChildMenu('" + this.getId() + "')", delayMenuClose);
	}

	this.slideChildMenu = function() {
		var divref = this.children[0].div;
		var ulref = this.children[0].ul;
		var maxwidth = this.children[0].width;
		var nextWidth;
		if (this.isMouseOnMe  || this.isMouseOnChild()) {
			nextWidth = divref.offsetWidth + slideSpeed_out;
			if (nextWidth >= maxwidth) {
				this.finishOpeningChild(divref, ulref, maxwidth);
			} else {
				ulref.style.left = nextWidth - maxwidth + "px";
				divref.style.width = nextWidth + "px";
				setTimeout("slideChildMenu('" + this.getId() + "')", slideTimeout_out);
			}
		} else {
			nextWidth = divref.offsetWidth - slideSpeed_in;
			if (nextWidth <= 0) {
				this.finishClosingChild(divref, ulref, maxwidth);
			} else {
				ulref.style.left = nextWidth - maxwidth + "px";
				divref.style.width = nextWidth + "px";
				setTimeout("slideChildMenu('" + this.getId() + "')", slideTimeout_out);
			}
		}
	}

	this.finishOpeningChild = function(divref, ulref, maxwidth) {
		this.isChildMenuOpen = true;
		this.isChildMenuClosed = false;
		ulref.style.left = "0px";
		divref.style.width = maxwidth + "px";
	}

	this.finishClosingChild = function(divref, ulref, maxwidth) {
		this.isChildMenuOpen = false;
		this.isChildMenuClosed = true;
		divref.style.visibility = "hidden";
		divref.style.display = "none";
		divref.style.width = maxwidth + "px";
		if (this.parent) this.parent.mouseOff();
	}

}

function collectMenuNodes(menuObj) {
     if (!menuObj) return null;

     var results = new Array();
     var menuUL = menuObj.getElementsByTagName('UL')[0];
     var menuLI = menuUL.getElementsByTagName('LI')[0];
     while(menuLI) {
        if(menuLI.tagName && menuLI.tagName.toLowerCase()=='li') {
              results[results.length] = new MenuItem(menuObj, menuUL, menuLI, 0, null);
        }
        menuLI = menuLI.nextSibling;
     }
     return results;
}

function initMenu() {
	var mainDiv = document.getElementById(MENUDIV_ID);
	menuItems = collectMenuNodes(mainDiv);
	if (menuItems) {
		for (var no=0;no<menuItems.length;no++) {
			var mi = menuItems[no];
			mi.renderNode();
		}
		mainDiv.style.visibility = 'visible';
	}
	// window.onresize = resetPosition;
}

window.onload = initMenu;
</script>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
 </head>
 <SCRIPT Language="VBScript">

<!-- This allows you to specify usernames that get access to the admin tools section, invisible to other users -->
Dim Admins(2)
Admins(0)="admin1"
Admins(1)="admin2"
Admins(2)="admin3"

Sub Window_OnLoad
	strComputerName = "."
	Set objWMIService = GetObject("winmgmts:{ImpersonationLevel=impersonate}\\" & strComputerName & "\root\cimv2")
	Set colItems = objWMIService.ExecQuery( _
	"SELECT * FROM Win32_ComputerSystem",,48) 
	For Each objItem in colItems 
	username = objitem.UserName
		For i = 0 to uBound(Admins)
			If LCase(right(username,3)) = Admins(i) Then AdminTools.style.display = "block"
		Next
	Next
End Sub
</script>

 <body topmargin="0" leftmargin="0">
 <div id="header">

 </div>
 
 <div id="leftnavigation">
<!--- START MENU HTML -->
		<div id="dhtmlgoodies_menu" style="visibility: hidden;">
		<ul>
			<li><a href="html/HSS_Welcome.html" target="contentiframe">Home</a></li>
			<li><a href="#">Microsoft Office</a>
				<ul>
					<li><a href="html/HSS_NYI.html" target="contentiframe">Excel</a></li>
					<li><a href="html/HSS_Outlook.html" target="contentiframe">Outlook</a></li>
					<li><a href="html/HSS_Word.html" target="contentiframe">Word</a></li>
				</ul>
			</li>

			<li><a href="#">Windows</a>
				<ul>
					<li><a href="html/HSS_Printers.html" target="contentiframe">Add Printers</a></li>
					<li><a href="html/HSS_Drives.html" target="contentiframe">Drive Mapping</a></li>
					<li><a href="html/HSS_WhoIsLoggedOn.html" target="contentiframe">Who is logged on</a></li>
				</ul>
			</li>
			
			<li><a href="#">Other Applications</a>
				<ul>
					<li><a href="html/HSS_NYI.html" target="contentiframe">AutoCAD</a></li>
					<li><a href="html/HSS_Netviewer.html" target="contentiframe">Netviewer</a></li>
				</ul>
			</li>
			
			<li><a href="html/HSS_SystemInfo.html" target="contentiframe">System Information</a></li>
			
			<li><a href="#">Job Services</a>
				<ul>
					<li><a href="html/BREEAM_SetupCredits.html" target="contentiframe">BREEAM Credits Setup</a></li>
				</ul>
			</li>
			
			<li><a href="#" name="AdminTools" id="AdminTools" style="display:none">Admin Tools</a>
				<ul>
					<li><a href="html/HSS_RSAChecklist.html" target="contentiframe">RSA Remote Checklist</a></li>
					<li><a href="html/HSS_ADuser.html" target="contentiframe">User Information</a></li>
				</ul>
			</li>
			
			
		</ul>
		</div>
		<!-- END MENU HTML-->
		<a href="mailto:matttilford@pickeverard.co.uk&subject=Helpdesk Express Suggestion&body=%20">Comments/Suggestions</a>
 </div>
 
 
 <div id="content">

 <iframe name="contentiframe" id="contentiframe" frameborder="1" APPLICATION="yes" src="html/HSS_Welcome.html" width="780" height="540">
  <p>Your browser does not support iframes.</p>
</iframe>
 </div>
 </body>
 </html>