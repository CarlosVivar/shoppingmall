// JavaScript Document
	sStartup = "";
	if (!ROOT_URL) ROOT_URL = "http://" + location.hostName + "/";
		
function Startup(sfunc) {
	if (sfunc != null) {
		sStartup += sfunc + ";";
	}else eval("try { " + sStartup + "} catch(ex) {  }" );	
}
if (!window.$) {
      window.$ = function(id) { return document.getElementById(id); }
}
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function removeLeadingAndTrailingChar (inputString, removeChar) 
{
	var returnString = inputString;
	if (removeChar.length)
	{
	  while(''+returnString.charAt(0)==removeChar)
		{
		  returnString=returnString.substring(1,returnString.length);
		}
		while(''+returnString.charAt(returnString.length-1)==removeChar)
	  {
	    returnString=returnString.substring(0,returnString.length-1);
	  }
	}
	return returnString;
}

function openlink(URLStr)
{	
	location = URLStr;
}
// Example:
// alert( readCookie("myCookie") );
function readCookie(name)
{
  var cookieValue = "";
  var search = name + "=";
  if(document.cookie.length > 0)
  { 
    offset = document.cookie.indexOf(search);
    if (offset != -1)
    { 
      offset += search.length;
      end = document.cookie.indexOf(";", offset);
      if (end == -1) end = document.cookie.length;
      cookieValue = unescape(document.cookie.substring(offset, end))
    }
  }
  return cookieValue;
}
// Example:
// writeCookie("myCookie", "my name", 24);
// Stores the string "my name" in the cookie "myCookie" which expires after 24 hours.
function writeCookie(name, value, hours)
{
  var expire = "";
  if(hours != null)
  {
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = "; expires=" + expire.toGMTString();
  }
  //document.write(expire);
  document.cookie = name + "=" + escape(value) + expire;
  
}

function trimString(inputString) {
	return inputString.replace(/^\s+|\s+$/g, '') ;
}

//  Detect browser---------------------------------------------------------------
var exclude=1;
var agt=navigator.userAgent.toLowerCase();
var win=0;var mac=0;var lin=1;
if(agt.indexOf('win')!=-1){win=1;lin=0;}
if(agt.indexOf('mac')!=-1){mac=1;lin=0;}
var lnx=0;if(lin){lnx=1;}
var ice=0;
var ie=0;var ie4=0;var ie5=0;var ie6=0;var com=0;var dcm;
var op5=0;var op6=0;var op7=0;
var ns4=0;var ns6=0;var ns7=0;var mz7=0;var kde=0;var saf=0;
if(typeof navigator.vendor!="undefined" && navigator.vendor=="KDE"){
	var thisKDE=agt;
	var splitKDE=thisKDE.split("konqueror/");
	var aKDE=splitKDE[1].split("; ");
	var KDEn=parseFloat(aKDE[0]);
	if(KDEn>=2.2){
		kde=1;
		ns6=1;
		exclude=0;
		}
	}
else if(agt.indexOf('webtv')!=-1){exclude=1;}
else if(typeof window.opera!="undefined"){
	exclude=0;
	if(agt.indexOf("opera/5")!=-1||agt.indexOf("opera 5")!=-1){op5=1;}
	if(agt.indexOf("opera/6")!=-1||agt.indexOf("opera 6")!=-1){op6=1;}
	if(agt.indexOf("opera/7")!=-1||agt.indexOf("opera 7")!=-1){op7=1;}
	}
else if(typeof document.all!="undefined"&&!kde){
	exclude=0;
	ie=1;
	if(typeof document.getElementById!="undefined"){
		ie5=1;
		if(agt.indexOf("msie 6")!=-1){
			ie6=1;
			dcm=document.compatMode;
			if(dcm!="BackCompat"){com=1;}
			}
		}
	else{ie4=1;}
	}
else if(typeof document.getElementById!="undefined"){
	exclude=0;
	if(agt.indexOf("netscape/6")!=-1||agt.indexOf("netscape6")!=-1){ns6=1;}
	else if(agt.indexOf("netscape/7")!=-1||agt.indexOf("netscape7")!=-1){ns6=1;ns7=1;}
	else if(agt.indexOf("gecko")!=-1){ns6=1;mz7=1;}
	if(agt.indexOf("safari")!=-1 || (typeof document.childNodes!="undefined" && typeof document.all=="undefined" && typeof navigator.taintEnabled=="undefined")){mz7=0;ns6=1;saf=1;}
	}
else if((agt.indexOf('mozilla')!=-1)&&(parseInt(navigator.appVersion)>=4)){
	exclude=0;
	ns4=1;
	if(typeof navigator.mimeTypes['*']=="undefined"){
		exclude=1;
		ns4=0;
		}
	}
if(agt.indexOf('escape')!=-1){exclude=1;ns4=0;}
if(typeof navigator.__ice_version!="undefined"){exclude=1;ie4=0;}


document.write("<script language=\"JavaScript\" src=\"" + ROOT_URL + "js/ajax.js\" type='text/javascript'></script>");


//setInterval("ajaxRead('modules/consultant/turn.php')", 15000)
//---------------------------------------------------------------------------------------------