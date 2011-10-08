<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, BUS.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>    
    </head>
 <%  
 ServletContext fapp=getServletContext();;
 String flang = (String)fapp.getAttribute("MALL_LA"); %>  
    <body>
	 <div id="bottom_menu">
	 <ul class="bottom_menu_inside">
			 <li class="add_homepage"><a rel="nofollow" href="#"><%=LanguegeBUS.getValue("home", flang) %></a></li>
			 <li><a rel="nofollow" href="#"><%=LanguegeBUS.getValue("user", flang) %></a></li>
			 <li><a href="#"><%=LanguegeBUS.getValue("sale", flang) %></a></li> 
			<li><a href="#"><%=LanguegeBUS.getValue("product", flang) %></a></li>
			<li><a rel="nofollow" href="#"><%=LanguegeBUS.getValue("order", flang) %></a></li>
			<li><a href="#"><%=LanguegeBUS.getValue("help", flang) %></a></li>
	</ul>
	<span class="end_bottom_menu">&nbsp;</span></div>
	<div class="legal">
	<p><%=LanguegeBUS.getValue("unit", flang) %>: Intech Co</p>
	<p><%=LanguegeBUS.getValue("address", flang) %>: 19w Nguyen Huu Canh, district 10, HCMC</p>
	<p><%=LanguegeBUS.getValue("email", flang) %>: <a rel="nofollow" href="mailto:cam@zing.vn">cam@zing.vn</a> - <%=LanguegeBUS.getValue("phone", flang) %>: (84.8) 3866 4666 - (84.8) 3866 6217 </p>
	</div>
</body>
</html>