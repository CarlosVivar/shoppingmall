<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, BUS.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%  
 ServletContext sapp=getServletContext();;
 String slang = (String)sapp.getAttribute("MALL_LA"); %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

       <DIV class="main-block">
         <DIV class="border-bot"><DIV class="border-left"><DIV class="border-right"><DIV class="corner-left-top"><DIV class="corner-right-top">
          <DIV class="corner-left-bot"><DIV class="corner-right-bot">
           <DIV class="title-block">
           <DIV class="top"><DIV><DIV>&nbsp;</DIV></DIV></DIV>
                 <DIV class="middle"><H2><%=LanguegeBUS.getValue("category", slang) %></H2></DIV>
           <DIV class="bot"><DIV><DIV>&nbsp;</DIV></DIV></DIV></DIV>
         <div class="boxes_content" id="boxes_content">
         <% if(session.getAttribute("Role").equals("Seller")){%>
        <br/>
        <h4><%=LanguegeBUS.getValue("productinfo", slang) %></h4>
        <ul>
             <br/><li><a href="index.html"><%=LanguegeBUS.getValue("home", slang) %></a></li><br/>
             <li><a href="upload.html"><%=LanguegeBUS.getValue("newupload", slang) %></a></li><br/>
             <li><a href="seller.html"><%=LanguegeBUS.getValue("productmanage", slang) %></a></li><br/>
             <li><a href="sale.html"><%=LanguegeBUS.getValue("salemanage", slang) %></a></li><br/>
        </ul>
        <% } %>
        <br/>
        <h4><%=LanguegeBUS.getValue("personinfo", slang) %></h4>
        <ul>
             <br/><li><a href="accountdetail.html"><%=LanguegeBUS.getValue("personinfo", slang) %></a></li><br/>
             <li><a href="changepass.html"><%=LanguegeBUS.getValue("changepass", slang) %></a></li><br/>
             <li><a href="order.html?defaultId=1"><%=LanguegeBUS.getValue("ordermanage", slang) %></a></li><br/>
             <li><a href="ShoppingHelp.html"><%=LanguegeBUS.getValue("buyguide", slang) %></a></li><br/>
             <% if(session.getAttribute("Role").equals("Seller")){%>
             		<li><a href="#"><%=LanguegeBUS.getValue("saleguide", slang) %></a></li><br/>
             <% } %>
             
        </ul>
        <br/>
        
        </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
        
            <br><br>
        <a href="#"><img alt="women fashion" width="180" src="images/adv/Ogage.png"/></a>
        <br><br>
        <a href="#"><img alt="women fashion" width="180" src="images/adv/britney-spears-blackout-com.jpg"/></a>
        
        </DIV>
        
</body>
</html>