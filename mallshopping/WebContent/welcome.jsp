<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp" %>
<%@page import="POJO.*, UTIL.*,java.util.*"%>
<%
			
            String lang1 = (String)request.getParameter("lang");	
            if (null!=lang1) {
                String url = "/languageController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head><style type="text/css">

p {color: #333333;
	text-align:center;
	font-size:11px;
	font-family:Arial, Helvetica, sans-serif;
	}

</style>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=LanguegeBUS.getValue("welcometo", lang) %></title>
        <meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />             
		<script src="scripts/AC_RunActiveContent.js" type="text/javascript"></script>   
		<script type="text/javascript">
			function gohome(){
				location="welcome.html?lang=3";
			}
		</script>
</head>
<body style="background:#000500 right top no-repeat" onclick="gohome()">
<div style="width:700px; height:500px; border:solid 0px #121212; margin:50px auto auto auto;">
  <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','700','height','500','src','scripts/4','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','scripts/4' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="700" height="500">
  <param name="movie" value="scripts/4.swf" />
  <param name="quality" value="high" />
  <embed src="scripts/4.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="500"></embed>
</object></noscript>
<p>Copyright@2011 ELISOFT, All right reserved Elisoft</br>
Head Quater & factory | #104,R&DB center.Kyung-li Univ,Buhori,Hayangup,Kyungsansi,Kyungpook,Ref of Korea</br>
                         Tel : +82-53-857-5548,Fax:+82-53-857-5549</br>
Sales office in Seoul | 3Fl,283-8,Sukchondong,Songpagu,Seoul,Ref of Korea</br>
                 Tel:+82-2-419-5396,Fax:+82-2-419-5397 </p>
</div>

</body>
	 </html>