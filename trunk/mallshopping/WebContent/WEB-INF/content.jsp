<%-- 
    Document   : content
    Created on : May 19, 2011, 2:29:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE html>
 <% 
 ServletContext capp=getServletContext();;
 String clang = (String)capp.getAttribute("MALL_LA"); %>      
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <DIV class="main-block"><DIV class="border-bot"><DIV class="border-left">
        <DIV class="border-right"><DIV class="corner-left-top"><DIV class="corner-right-top">
        <DIV class="corner-left-bot"><DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">

        <!--  <a href="#"><img width="620" src="css/images//home/home-banner.gif"/></a>
        <div id="s1">
                       
            <a href="#"><img alt="wholesale bags" width="620" src="css/images//home/home-banner-800_300_3.gif"/></a>
        </div> -->
      

        <H2>Welcome to ELI Mall Shopping</H2>
        <div class="blog">
        	<%=LanguegeBUS.getValue("mIndex", clang)%>
        </div>
		
		<%
		List<Category> categories=CategoryBUS.lstCategory(clang);
		for(Category category : categories){
		%>
		
		<div style="width:598px;height:30px; border-bottom: #1272e8 solid 2px; clear:both; padding-top:10px">
		<h4 style="padding: 0 10px 0 10px;padding-top:8px; margin:0; background: url('images/11_03.gif') repeat-x;height:30px; color:white; float:left"><%=category.getCategoryName() %></h4>
		</div>
		<UL class="prodlist" style="clear:left">
         <%
         	List<Products> lst = (List<Products>)ProductBUS.getListProductByCategoryMax(category.getCategoryId(),0,6,clang);
                              for(int p=0;p<lst.size();p++){
                                      Products pr = (Products)lst.get(p);
                                      Productphotos pic = ProductPhotoBUS.lstProductPhoto(pr,clang);
         %>    
        
           
        <li><div class="outterimgframe"><div class="innerimgframe"><A  href="productdetail.html?Id=<%=pr.getProductId() %>">
                      
                        <% if(pic == null){ %>
                               <img src="images/fashion/DefaultImage.gif" alt="<%=pr.getProductName()%>" />
                        <% }else { %>
                               <img width="140" height="200" src="images/fashion/<%=pic.getProductPhotoName()%>" alt="<%=pr.getProductName()%>" />
                        <% } %>
        </A></div></div>
        <img src="images/hot.gif"/>
        <p><span class="title"><%=pr.getProductName()%></span></p>
        <p class="price"><%=pr.getPrice()%>$</p>
        </li>
         <%  } %>
        </ul>
		
		<%} %>
        
        <br class="clr">


        <div class="footer blog">
         	<%@include file="footer.jsp" %>
        </div>
        </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
    </body>
</html>
