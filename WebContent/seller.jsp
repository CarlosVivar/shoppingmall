<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj = request.getAttribute("ProductPOJOs");
            if (obj == null) {
                String url = "/sellerController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("salemanage", lang) %></title>
		<meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
	        
	        function openPage(path){
	        	window.location.href = path;
	        }
        </script>
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
					   </a>&nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="seller.html" class="viewmore"><%=LanguegeBUS.getValue("seller", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/sellermenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">

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
                <!--ul class="jsddm fleft">
                <li><a href="#" style="border:0;">Sort By</a>
                 <ul> 
                   <LI><a href="#">Price: Low to High</a></LI>						
                   <LI><a href="#">Price: High to Low</a></LI> 
                   <LI><a href="#">Interests: See More</a></LI>   

                </ul>
                <li><a href="#" style="border-right:#ccc 1px solid;">Item number</a>
                 <ul>
                   <LI><a href="#">20 Item <img src="scripts/5_2_thoitrangabc/images//filtercheck.jpg"/></a></LI>						
                   <LI><a href="#">40 Item </a></LI> 
                   <LI><a href="#">60 Item </a></LI>
                   <LI><a href="#">100 Item </a></LI>
                 </ul>  
                </li>
                
                </ul-->
				<p align="right"><BUTTON class="button" type="button"  onclick="openPage('upload.html').call(this)">
					      <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("newupload", lang) %></SPAN></SPAN></SPAN>
					</BUTTON></p>
                </div>
                
                <!-- PAGI -->

                <div class="pagination"><ul>
                <% NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pagedcust");
                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
                if(!pagedcust.isFirstPage()){%>
                
                		<li><a href="seller.html?page=0">First</a></li> 
                       
                 <% }
                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
                		 if(i!=pagedcust.getCurrentPage()){    	                
                 %>
                 	<li class="pagir"><a href="seller.html?page=<%=i%>"><%=i%></a></li>
                 <%}else{ %>	
                 	<li class="pagir"><a href="#" class="currentpage"><%=i%></a></li>
                 <%}
                	 }
                	if(!pagedcust.isLastPage()){	 
                 %>
                    <li><a href="seller.html?page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></li>
                 <%} 
                	}%>   
                <!--li><a href="#">First</a></li> 
                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> <li class="pagir"><a href="#">2</a></li> <li class="pagir"><a href="#">3</a></li> <li class="pagir"><a href="#">4</a></li> 

                <li><a href="#">Nt&#187;</a></li> 
                <li><a href="#">Last</a></li--></ul></div>

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

                        <li><div class="outterimgframe"><div class="innerimgframe"><A title="<%=emp.getProductName() %>" href="productdetail.html?Id=<%=emp.getProductId() %>">
                                        <% if(pic == null){ %>
                                               <img src="images/fashion/no.jpeg" alt="<%=emp.getProductName()%>" />
                                        <% }else { %>
                                               <img width="140" height="200" src="images/fashion/<%=pic.getProductPhotoName()%>" alt="<%=emp.getProductName()%>" />
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
                        <p class="price"> <%=emp.getPrice() %> $</p>
                        <% 
                               }else{     
                        %>
                        <p class="price" style="color:red;"> <span style="text-decoration:line-through"><%=emp.getPrice() %> $</span>&nbsp;&nbsp;&nbsp;
                        <%=emp.getPrice()- emp.getPrice()*(Float.parseFloat(pr.getRate())) %> $</p>
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
                
                		<li><a href="seller.html?page=0">First</a></li> 
                       
                 <% }
                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
                		 if(i!=pagedcust.getCurrentPage()){    	                
                 %>
                 	<li class="pagir"><a href="seller.html?page=<%=i%>" ><%=i%></a></li>
                 <%}else{ %>	
                 	<li class="pagir"><a href="#" class="currentpage"><%=i%></a></li>
                 <%}
                	 }
                	if(!pagedcust.isLastPage()){	 
                 %>
                    <li><a href="seller.html?page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></li>
                 <%} 
                  }%>   
                <!--li><a href="#">First</a></li> 
                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> <li class="pagir"><a href="#">2</a></li> 
                 <li class="pagir"><a href="#">3</a></li> 
                 <li class="pagir"><a href="#">4</a></li> 

                <li><a href="#">Nt&#187;</a></li> 
                <li><a href="#">Last</a></li--></ul></div>
                <br class="clr">


                <div class="footer blog">
                <p>ELI Shopping Mall customer service with fast shipping manner, and can reduce the price to 4% for large orders. Our high quality fashion products from China, Japan, Hong Kong, and Korea. With us, you go shopping confidence because we only offer products of famous brands. For example, the Doreme, Hanee, Moom, Yoko, LY Fashion, Eastsun, Marloca, Miss Milan, Xianwei, Ugo, Vivicam ... </p>
                <p>Sponsorship: One stop complete of <a href="http://fashion4us.com">online fashion</a> for all choices</p>
                <p>Copyright 2007-Present One-Dream Fashion Corp.</p>

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