<%-- 
    Document   : index
    Created on : May 19, 2011, 10:21:51 AM
    Author     : admin
--%>

<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.*,UTIL.*"%>

<%
            Object obj = request.getAttribute("productPOJO");
            if (obj == null) {
                String url = "/productDetailController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }
            //System.out.print(session.getAttribute("lastpage"));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("pDetail", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="scripts/jquery-1.3.min.js"></script>	
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
       	<script type="text/javascript">
       		function onLogins(){
       			var users="<%=session.getAttribute("username")%>";
       			if(users=="null"){
       				       				
       				alert("<%=LanguegeBUS.getValue("alert_login",lang)%>");
       				return false;
       			}
       			else {       				
       				document.formAddToCart.submit();
       			}       			
       		}
       	</script>
        
        
    </head>
    <body>
    <a id="logindd" href="LoginForm/index.jsp"></a>
    
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
					 <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("product", lang) %></a>
					 &nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("pDetail", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
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
                <!-- SMALL IMAGE -->
                <%
                    Products pPojo = (Products)request.getAttribute("productPOJO");
                    Productphotos pic = (Productphotos)request.getAttribute("productPhotoPOJO");
                    Manufacturer manufacture = (Manufacturer)request.getAttribute("manufacturerPOJO");
                    List<Productphotos> lstPhoto = (List<Productphotos>)ProductPhotoBUS.lstProductPhotoAll(pPojo,lang);
                %>
                <div class="itemdiv">
                <!-- intro image -->
                
                <div id="gallery"  class="introimgoutterimgframe">
                  
                     <% if(pic == null){ %>
                               <img src="images/fashion/DefaultImage.gif" alt="<%=pPojo.getProductName()%>" />
                        <% }else { %>
                               <img  src="images/fashion/<%=pic.getProductPhotoName()%>" alt="<%=pPojo.getProductName()%>" />
                        <% } %>
                </div>
                    
                <div class="detailattr">
                <h2 class="fleft"><%=pPojo.getProductName()%></h2><br class="clr">
                <p><b><%=LanguegeBUS.getValue("manufactural", lang)%>: &nbsp;</b><%=manufacture.getManufacturerName()%></p>
                <p><b><%=LanguegeBUS.getValue("size", lang)%>: &nbsp;</b>       <%=pPojo.getSize()%> </p>
                <p><b><%=LanguegeBUS.getValue("color", lang)%>:&nbsp;   </b>    <%=pPojo.getColor()%> </p>
                <%
                    Promotions pr = PromotionBUS.getPromotion(pPojo,lang);
                    if(pr != null && Float.parseFloat(pr.getRate()) != 0){
                       
                %>
                <p><b><%=LanguegeBUS.getValue("promotions", lang)%>:   </b>    <span style="color:red;"><%=pr.getContent() %></span></p>
                
                <div>
                	<p class="top15"><b><%=LanguegeBUS.getValue("price", lang)%>:</b></p> 
                	<p class="price"><span style="text-decoration:line-through;font-size:12pt;"><%=ResourcesDefault.priceVNFormat(pPojo.getPrice())%> <%=LanguegeBUS.getValue("dolar",lang) %></span> &nbsp;&nbsp;&nbsp; <%=pPojo.getPrice()-pPojo.getPrice()*(Float.parseFloat(pr.getRate())) %> <%=LanguegeBUS.getValue("dolar",lang) %></p>
                 	</div>
               
                <%  }else{ %>
                    <div>
                      <p class="top15"><%=LanguegeBUS.getValue("price", lang)%>:</p>   
                      <p class="price"><%=ResourcesDefault.priceVNFormat(pPojo.getPrice())%> <%=LanguegeBUS.getValue("dolar",lang) %></p></div>
                <% } %>
                 <form name="formAddToCart" action="<%=ServletUtils.getBaseUrl(request) %>/cartController" method="post">
                 <%
                 List<Options> options=OptionBUS.getListOptionByProductID(pPojo.getProductId(),lang);
                 if(options!=null&&options.size()>0){
                 %>
                <div class="detail-section">
                <span style="width:100;"><%=LanguegeBUS.getValue("option",lang) %>:</span>&nbsp;&nbsp;                               
                <select style="width:220px !important;" name="selectOption" id="selectOption">
                <option value="0" ><%=LanguegeBUS.getValue("select",lang) %></option>
                <%
                
                for(int i=0;i<options.size();i++){
                	Options option=options.get(i);%>
                	<option value="<%=option.getOptionId()%>"><%=option.getDescription() %> (+ <%=LanguegeBUS.getValue("dolar",lang) %><%=option.getOptionPrice() %>)</option>
                <%}
                %>                
                </select>
                
                </div>
                <%} %>
               <p>
                       <a onclick="onLogins();">
                           <img height="40" width="120" class="fleft" src="css/images//cart/button-addcart.gif" id="addtocart" name="309219"></a>
          
                </p>
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="pId" value="<%=pPojo.getProductId()%>"/>
                </form>
                
                </div>
                         
                <br class="clr">

                <div class="detail-desc">
                    <h2><%=LanguegeBUS.getValue("productdescription", lang)%></h2>
                
                <p><%=pPojo.getDetail() %></p>
               
                
                </div>
				 <br/>
                <br/>
                <br class="clr">
                
                <div class="detail-desc">
                <h2><%=LanguegeBUS.getValue("imagedetails", lang)%></h2>
                <div align="center">
               <%
                   
                    if (null!=lstPhoto&& lstPhoto.size()>0) {
                        for (int i = 0; i < lstPhoto.size(); i++) {
                            Productphotos photo = (Productphotos)lstPhoto.get(i);
                            
                %>
                <img src="images/fashion/<%=photo.getProductPhotoName() %>" alt="<%=pPojo.getProductName()%>"  width="350"/>
                <br><br/>
                <%      }
                    }
                 %>
               
              	</div>
                </div>

                 <br>
				 </div>

				<br class="clr">
                <div class="footer blog">
                 	<%@include file="WEB-INF/footer.jsp" %>
                </div>

                </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
            </DIV>

        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV></DIV>
         
        </DIV>
    </body>
</html>
