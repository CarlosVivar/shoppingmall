<%-- 
    Document   : header
    Created on : May 19, 2011, 2:09:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, BUS.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%   
ServletContext happ=getServletContext();;
String hlang = (String)happ.getAttribute("MALL_LA"); %>          
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/jquery-1.4.2.min.js"></script>
       
		 
		
    </head>
   
    <body>
        
		 <a id="branding" href=""><img width="140" height="40" src="css//images/intech.png" alt="" /></a>
   

   
   	<ul class="miniBox" id="_loginAlr">
			
				<%
                    if(session.getAttribute("username") == null){
         		%>     
				 	<li><a rel="nofollow" href="<%=ServletUtils.getBaseUrl(request)%>/admin/login.html"><%=LanguegeBUS.getValue("login", hlang) %></a></li>
				<%}else{ %> 
				 	<li><span class="me_uname"><%=LanguegeBUS.getValue("welcome", hlang) %>,&nbsp;
				 	 <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=session.getAttribute("username")%>"><b><%=session.getAttribute("username")%></b></a></span>
				 	&nbsp;&nbsp; (<a href="<%=ServletUtils.getBaseUrl(request)%>/manageLogoutController"><%=LanguegeBUS.getValue("logout", hlang) %></a>)</li>
				<%} %>
				 <li><a rel="nofollow" href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html" ><%=LanguegeBUS.getValue("manage", hlang) %></a></li>
				 <li class="end"><a rel="nofollow" href="javascript:OpenWin('/guide.html',600,590);"><%=LanguegeBUS.getValue("help", hlang)%></a></li>
			 </ul>
   

    <div id="menu">
       <ul class="menu_inside">
		 <li class="menu_home">
		 <a href="#" rel="permalink" class="subhover">&nbsp;</a></li>
		<li class="cat"><a rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html"><%=LanguegeBUS.getValue("home", hlang) %></a></li>
		<li class="cat"><a rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html"><%=LanguegeBUS.getValue("user", hlang) %></a></li>
		<li class="cat"><a class="permalink" rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", hlang) %></a></li>
		<li class="cat"><a rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/product.html"><%=LanguegeBUS.getValue("product", hlang) %></a></li>
		<li class="cat"><a rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/order.html"><%= LanguegeBUS.getValue("order", hlang) %></a></li>
		<li class="cat"><a rel="permalink" href="<%=ServletUtils.getBaseUrl(request)%>/admin/emailconfigure.html"><%= LanguegeBUS.getValue("configure", hlang) %></a></li>
		 <li class="end"><a id="menu_expand" href="#"><%=LanguegeBUS.getValue("help", hlang) %></a></li>
		 </ul>

        <div class="end_menu">
        	<form action="<%=ServletUtils.getBaseUrl(request)%>/languageManageController" method="POST" id="languageForm" > 
              <div rel="nofollow"  class="fl">                
	                <% if(null==hlang || hlang.length() == 0 || hlang.equals("MALL_EN")){ %>
			        		<span class="cat" style="color:white;" ><%=LanguegeBUS.getValue("en", hlang)%></span>
			         <%}else{ 	
			         		if(hlang.equals("MALL_VN")){
			         %>		
		                		<span class="cat" style="color:white;"><%=LanguegeBUS.getValue("vi", hlang)%></span>
		              <%
		                	}else{
		               %>		
			                		<span class="cat" style="color:white;"><%=LanguegeBUS.getValue("ko", hlang)%></span>
			           <% 	
		                	}
			         } %>
	            
	           </div>
       		   <div  style="display: block;" class="jewel">
                	<div class="jewelToggler" rel="nofollow" >
                	<% if(null==hlang){ %>
			        		<img alt="" width="24" height="15" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/flag_en.gif">
			         <%}else{ %>	
                			<img  alt="" width="24" height="15" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/<%=session.getAttribute("FLAG")%>"></div>
					<%} %>
            	</div>
	             
            </form>
            
        </div>
    </div>

    </body>
</html>
