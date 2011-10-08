<%-- 
    Document   : product
    Created on : May 23, 2011, 2:20:37 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List"%>
<%@include file="library.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            Object obj = request.getAttribute("ProductPOJOs");
            if (obj == null) {
                String url = "/lstPromotionController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("promotion", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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
        
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
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
                <a href="#"><img width="620" src="css/images//home/home-banner.gif"/></a>
                <div id="s1">
                    <a href="#"><img alt="women fashion" width="620" src="css/images//home/home-banner-800_300_1.gif"/></a>
                    <a href="#"><img height="220" alt="men fashion" width="620" src="images/adv/Ogage201.jpg"/></a>
                    <a href="#"><img alt="wholesale bags" width="620" src="css/images//home/home-banner-800_300_3.gif"/></a>
                </div>                                                            
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
                   <LI><a href="#">20 Item <img src="scripts/5_2_thoitrangabc/images//filtercheck.jpg"/></a></LI>						
                   <LI><a href="#">40 Item </a></LI> 
                   <LI><a href="#">60 Item </a></LI>
                   <LI><a href="#">100 Item </a></LI>
                </li>
                </ul>

                </div>
                
                <!-- PAGI -->

                 <div class="pagination"><ul>
                <li><a href="#">First</a></li> 
                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> <li class="pagir"><a href="#">2</a></li> <li class="pagir"><a href="#">3</a></li> <li class="pagir"><a href="#">4</a></li> 

                <li><a href="#">Nt&#187;</a></li> 
                <li><a href="#">Last</a></li></ul></div>
                
                <br class="clr">
                <!-- PROD LIST -->		
                <UL class="prodlist">
                <%
                    List<Products> ds = (List<Products>) request.getAttribute("ProductPOJOs");
                    if (ds != null) {
                        for (int i = 0; i < ds.size(); i++) {
                            Products emp = (Products)ds.get(i);
                            Productphotos pic = ProductPhotoBUS.lstProductPhoto(emp,lang);
                            Promotions pr = PromotionBUS.getPromotion(emp,lang);
                           
                 %>

                        <li><div class="outterimgframe"><div class="innerimgframe"><A title="" href="productdetail.html?Id=<%=emp.getProductId() %>">
                                        <% if(pic == null){ %>
                                               <img src="images/fashion/DefaultImage.gif" alt="<%=emp.getProductName()%>" />
                                        <% }else { %>
                                               <img width="140" height="200" src="images/fashion/<%=pic.getProductPhotoName()%>" alt="<%=emp.getProductName()%>" />
                                        <% } %>     
                                        
                           </A>
                                    </div></div>
                                    <span style="color:red;font-size:9pt; font-weight:bold"><%=pr.getPromotionType() %></span>
                          
                            <p><A title="" href="productdetail.html?Id=<%=emp.getProductId() %>"><span class="title"><%=emp.getProductName() %></span></A></p>
                        <%
                            if(Float.parseFloat(pr.getRate()) == 0){
                        %>
                            <p class="price"> <%=emp.getPrice() %> $</p>
                        <% }else{ %> 
                            <p class="price"> <span style="text-decoration:line-through;font-size:8pt;"> <%=emp.getPrice() %> $</span>
                                &nbsp;&nbsp;&nbsp;<%=emp.getPrice()- emp.getPrice()*(Float.parseFloat(pr.getRate())) %> $</p>
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
                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=1">First</a></li> 
                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                 <li class="pagir"><a href="#" class="currentpage">1</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=2">2</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=3">3</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=4">4</a></li> 

                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=2">Nt&#187;</a></li> 
                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=2&amp;l=12&amp;p=157">Last</a></li></ul></div>
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
