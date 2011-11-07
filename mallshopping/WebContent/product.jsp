<%-- 
    Document   : product
    Created on : May 23, 2011, 2:20:37 PM
    Author     : admin
--%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List,UTIL.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
			String Id=request.getParameter("Id");
            Object obj = request.getAttribute("ProductPOJOs");
            if (obj == null) {
                String url = "/lstProductController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("product", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
       
        <script type="text/javascript">
            var timeout=500;var closetimer=0;var ddmenuitem=0;function jsddm_open(){jsddm_canceltimer();jsddm_close();ddmenuitem=$(this).find('ul').css('visibility','visible')}function jsddm_close(){if(ddmenuitem)ddmenuitem.css('visibility','hidden')}function jsddm_timer(){closetimer=window.setTimeout(jsddm_close,timeout)}function jsddm_canceltimer(){if(closetimer){window.clearTimeout(closetimer);closetimer=null}}document.onclick=jsddm_close;
            $(document).ready(function() {
            if ('12'.length!=0){$(".category-items li").each(function(){	if ('12'==$(this).attr('k')){$(this).find("a").css('font-weight','bold').css('color','#555555');$(this).parent().show();return false;}})}
            $('.jsddm > li').bind('mouseover', jsddm_open);$('.jsddm > li').bind('mouseout',  jsddm_timer);
            });
        </script>

    </head>
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
					 
					 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>
					   </a>&nbsp; <img src="admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("product", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
					<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">
                    
                <form  action="searchController" method="get">
                                <table class="carttable" width="625" style="font-size:9pt">
                                    <tr>    

                                        <td  colspan="2" width="220"> 
                                        	<b> <%=LanguegeBUS.getValue("keyword", lang) %>:&nbsp </b><input class="txt" type="text" name="txtWord" style="width:190px;height:22px" /> 
                                        </td>
                                        <td width="108">
                                            <label class="carttable">
                                                <select style="width:130px;height:23px" name="selectWord" >
                                                    <option value="0">- <%=LanguegeBUS.getValue("manufactural", lang) %> -</option>
                                                    <%
                                                        List<Manufacturer> listManu = ManufacturerBUS.lstManufacturer(lang);
                                                        if (listManu != null) {
                                                            for (int i = 0; i < listManu.size(); i++) {
                                                                Manufacturer Manu = listManu.get(i);

                                                    %>                                           
                                                    <option value="<%=Manu.getManufacturerId()%>">
                                                        <%=Manu.getManufacturerName()%>
                                                    </option>      
                                                    <%
                                                            }
                                                        }
                                                    %> 
                                                </select>

                                            </label>   
                                        </td>

                                        <td width="120">
                                            <select  style="width:130px;height:23px" name="selectPrice"  >
                                                <option value="0">-<%=LanguegeBUS.getValue("price", lang) %>-</option>
                                                <%
                                                    double maxPrice = (double) ProductBUS.maxPrice(lang);
                                                    double minPrice = (double) ProductBUS.minPrice(lang);
                                                    if (minPrice < 10) {
                                                        minPrice = 10;
                                                    }
                                                    for (int i = 0; i < maxPrice / 20; i++) {
                                                %>
                                                <option  value="<%=minPrice * i%> <%=minPrice * i + 10 * i%> ">
                                                    <%=minPrice * i%>&nbsp;~&nbsp;<%=minPrice * i + 10 * i%>       
                                                </option>
                                                <%}%>
                                            </select>
                                        </td>


                                        <td width="60"  align="right" >
                                            <input  type="submit" name="Submit" value="<%=LanguegeBUS.getValue("search", lang) %>" style="width:60px"/>
                                        </td>
                                    </tr>
                                </table>
                            </form><br/>
                   <DIV class="main-block">         
                   <DIV class="border-bot">
                        <DIV class="border-left">
                                <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                                <DIV class="corner-right-top">

                                                        <DIV class="corner-left-bot">
                                                                <DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">         
                 <!-- Sort and Gadget -->
                <div class="fleft">
                <ul class="jsddm fleft">
                <li><a href="#" style="border:0;">Sort By</a>
                 <ul> 
                   <LI><a href="#">Price: Low to High</a></LI>						
                   <LI><a href="#">Price: High to Low</a></LI> 
                   <LI><a href="#">Interests: See More</a></LI>   

                </ul>
                <li><a href="#" style="border-right:#ccc 1px solid;">Item number</a>
                 <ul>
                   <LI><a href="product.html?item=9">9 Item <img src="css/images//filtercheck.jpg"/></a></LI>						
                   <LI><a href="product.html?item=12">12 Item </a></LI> 
                   <LI><a href="product.html?item=15">15 Item </a></LI>
                   <LI><a href="product.html?item=18">18 Item </a></LI>
                 </ul>  
                </li>
                </ul>
				
                </div>
                
                <!-- PAGI -->
				
                <div class="pagination"><ul>
                <% NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pagedcust");
                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
                if(!pagedcust.isFirstPage()){%>
                
                		<li><a href="product.html?page=0">First</a></li> 
                       
                 <% }
                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
                		 if(i!=pagedcust.getCurrentPage()){    	                
                 %>
                 	<li class="pagir"><a href="product.html?page=<%=i%>" ><%=i%></a></li>
                 <%}else{ %>	
                 	<li class="pagir"><a href="#" class="currentpage"><%=i%></a></li>
                 <%}
                	 }
                	if(!pagedcust.isLastPage()){	 
                 %>
                    <li><a href="product.html?page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></li>
                 <%} 
                	}%>   
                
                <!-- li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> 
                 <li class="pagir"><a href="#">2</a></li> 
                 <li class="pagir"><a href="#">3</a></li> <li class="pagir"><a href="#">4</a></li> 

                <li><a href="#">Nt&#187;</a></li> 
                <li><a href="#">Last</a></li-->
                
                </ul></div>

                <br class="clr">
                <!-- PROD LIST -->		
                <UL class="prodlist">
                <%
                    List<Products> ds = (List<Products>) request.getAttribute("ProductPOJOs");
                    if (ds != null) {
                        for (int i = 0; i < ds.size(); i++) {
                            Products emp = (Products)ds.get(i);
                            Productphotos pic = ProductPhotoBUS.lstProductPhoto(emp,lang);
                 %>

                        <li><div class="outterimgframe"><div class="innerimgframe" style="position: relative !important"><A title="<%=emp.getProductName() %>" href="productdetail.html?Id=<%=emp.getProductId() %>">
                                        <% if(pic == null){ %>
                                               <img  src="images/fashion/DefaultImage.gif" alt="<%=emp.getProductName()%>" />
                                        <% }else { %>
                                               <img  src="images/fashion/<%=pic.getProductPhotoName()%>" alt="<%=emp.getProductName()%>" />
                                        <% } %>    
                                        
                        </A></div></div>
                        <% 
                               Promotions pr = (Promotions)PromotionBUS.getPromotion(emp,lang); 
                               if(pr != null){     
                        %>
                                <span style="color:red;font-size:9pt; font-weight:bold"><%=pr.getPromotionType() %></span>
                        <%     
                                }
                        %><br>
                        <p><A title="<%=emp.getProductName() %>" href="productdetail.html?Id=<%=emp.getProductId() %>">
                        <span class="title"><%=emp.getProductName() %></span></A></p>
                        <% 
                               if(pr == null || Float.parseFloat(pr.getRate()) == 0){     
                        %>
                        <p class="price"> <%if("MALL_VN".equals(lang)){%><%=ResourcesDefault.priceVNFormat(emp.getPrice())%><%}else{%><%=emp.getPrice()%><%}%><%=LanguegeBUS.getValue("dolar",lang) %></p>
                        <% 
                               }else{     
                        %>
                        <p class="price" style="color:red;"> <span style="text-decoration:line-through"><%=emp.getPrice() %> <%=LanguegeBUS.getValue("dolar",lang) %></span>&nbsp;&nbsp;&nbsp;
                        <%=emp.getPrice()- emp.getPrice()*(Float.parseFloat(pr.getRate())) %> <%=LanguegeBUS.getValue("dolar",lang) %></p>
                        <% } %>
                        </li>                  
                <%
                               
                        }
                    }
                %>
            </ul>
                <br class="clr"><br>
                <!-- PAGI -->
				
                <div class="pagination"><ul>
                 <% if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
                if(!pagedcust.isFirstPage()){%>
                
                		<li><a href="product.html?Id=<%=Id%>&page=0">First</a></li> 
                       
                 <% }
                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
                		 if(i!=pagedcust.getCurrentPage()){    	                
                 %>
                 	<li class="pagir"><a href="product.html?Id=<%=Id%>&page=<%=i%>"><%=i%></a></li>
                 <%}else{ %>	
                 	<li class="pagir"><a class="currentpage"><%=i%></a></li>
                 <%}
                	 }
                	if(!pagedcust.isLastPage()){	 
                 %>
                    <li><a href="product.html?Id=<%=Id%>&page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></li>
                 <%} 
                  }%>   
                <!--li><a href="#">First</a></li> 
                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> 
                 <li class="pagir"><a href="#">2</a></li> 
                 <li class="pagir"><a href="#">3</a></li> 
                 <li class="pagir"><a href="#">4</a></li> 

                <li><a href="#">Nt&#187;</a></li> 
                <li><a href="#">Last</a></li-->
                
                </ul></div>
                <br class="clr">


                <div class="footer blog">
                 	<%@include file="WEB-INF/footer.jsp" %>
                </div>
                </DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>

            </DIV>  
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
        
  
          </DIV></DIV> 
    </body>
</html>
