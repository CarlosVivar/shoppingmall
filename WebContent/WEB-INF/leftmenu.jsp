<%-- 
    Document   : leftmenu
    Created on : May 19, 2011, 2:26:27 PM
    Author     : admin
--%>
<%@page  import="java.util.*, UTIL.*,BUS.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List"%>
<!DOCTYPE html>
<%
ServletContext mapp=getServletContext();;
String mlang = (String)mapp.getAttribute("MALL_LA"); %>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="css/style-header.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.js"></script>
         
		<script type="text/javascript" src="scripts/jquery.activeMenu.js"></script>
		<script type="text/javascript" src="scripts/custom.js"></script>
    </head>
    <body>
        
        <DIV class="main-block">
         <DIV class="border-bot"><DIV class="border-left"><DIV class="border-right"><DIV class="corner-left-top"><DIV class="corner-right-top">
          <DIV class="corner-left-bot"><DIV class="corner-right-bot">
           <DIV class="title-block">
           <DIV class="top"><DIV><DIV>&nbsp;</DIV></DIV></DIV>
                 <DIV class="middle"><H2><%=LanguegeBUS.getValue("category", mlang)%></H2></DIV>
           <DIV class="bot"><DIV><DIV>&nbsp;</DIV></DIV></DIV></DIV>
         <div class="menu">
         <div class="boxes_content" id="boxes_content">
        <%
            List<Category> lstCat = (List<Category>)CategoryBUS.lstCategory(mlang);
            for(int t=0;t<lstCat.size();t++){
                Category cat = (Category)lstCat.get(t); 
                List<CategoryChild> lstChild = (List<CategoryChild>)CategoryChildBUS.lstCategoryChild(cat,mlang);
        %>     
        <h3><%=cat.getCategoryName() %></h3>      		        
        <ul >
            <% 
                for(int k=0;k<lstChild.size();k++){
                    CategoryChild child = (CategoryChild)lstChild.get(k); 
                    List<CategorySub> lstSub = (List<CategorySub>)CategorySubBUS.lstCategorySub(child,mlang);
            %>    
                    <li>
                                      	  
                   
              		<%
              			if(null!=lstSub && lstSub.size()>0){
              		%>	
              			<h3><%=child.getCategoryChildName()%></h3>
              			<ul class="subnav">
              		<%	
              			for(int j=0;j<lstSub.size();j++){
              				CategorySub cb = (CategorySub)lstSub.get(j);
              			
              		%>      	
							<li class="subcat"><a rel="permalink" href="product.html?subId=<%=cb.getCategorySubId()%> ">&nbsp; <%=cb.getCategorySubName() %></a></li>
					
					<%	} %>
              		 </ul>	
              		<% }else{ %>
              				<a href="product.html?Id=<%=child.getCategoryChildId()%>"><%=child.getCategoryChildName()%></a>
              		 <%} %>	
              		
                    </li>
            <% } %>       
        
        </ul>
        <% } %>  
       </div><!--End .boxes_content-->
        
        </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
        
            <br><br>
        <a href="#"><img alt="women fashion" width="180" src="images/adv/Ogage.png"/></a>
        <br><br>
        <a href="#"><img alt="women fashion" width="180" src="images/adv/britney-spears-blackout-com.jpg"/></a>
        
        </DIV>
        
        
    </body>
</html>
