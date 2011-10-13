<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("home", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.js"></script>	
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        
    </head>
    <%
    if(session.getAttribute("loadIntroduce")!=null){
    %>    
    <script type="text/javascript">
	
	$(document).ready(function() {
		setTimeout("loadPopup()", 1000);
	})
;
	function loadPopup(){
		createTag();
		$("#showIntroduces").fancybox({
			'width' : 1000,
			'height' : 720,
			'autoScale' : false,
			'transitionIn' : 'none',
			'transitionOut' : 'none',
			'type' : 'iframe',
			'hideOnOverlayClick' : true,
			'hideOnContentClick' : false
		}).trigger('click');
	    //launch on load after 5 second delay
		setTimeout("parent.$.fancybox.close()", 42000);
		setTimeout("removeTag()", 43000);
	}
	function createTag(){
		myA=document.createElement("A");
		myA.setAttribute("id","showIntroduces");
		myA.setAttribute("href","welcome.html");
		document.body.appendChild(myA);
	}
	function removeTag(){
		myA=document.getElementById("showIntroduces");
		document.body.removechild(myA);
	}
</script>
<%
session.removeAttribute("loadIntroduce");
    } %>
    <body>
    
        <DIV class="site-container">
        <DIV class="page">
            
       <!-- ---------Begin Header--------------------- -->     
        <DIV class="header">	

            <%@include file="WEB-INF/header.jsp" %>
        </DIV>    
        <!-- -------------MIDDLE------------- -->
        <DIV class="col3-layout">
         <div class="clear"></div>
        <div style="display: block;" class="ctnAlert">	
					 <div style="height: 208px;" class="spyWrapper">
					 <ul class="ctnAlert_inside spy">
					 
					 <li style="height: 26px; opacity: 1; display: block;">
					 <img src="admin/css/images/icon-arrow1.gif">&nbsp;<a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>   </a>			
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
					<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">
                <%@include file="WEB-INF/content.jsp" %>  
            </DIV>  
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
        
        </DIV></DIV>
    </body>
</html>
