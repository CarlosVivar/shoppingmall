<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>

<%@include file="../library.jsp" %>
<%@page import="POJO.Manufacturer"%>
<%@page import="POJO.Productphotos"%>
<%@page import="POJO.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Object obj = request.getAttribute("productPOJO");
    if (obj == null) {
        String url = "/productDetailAdminController";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=LanguegeBUS.getValue("pDetail", lang) %></title>
        <meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 

        <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
        
       <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.popupWindow.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/service.1.0.6.js"></script>
        
    </head>
    <body id="travel">
        <div id="wrapper"> 
            <div id="header">
                <%@include file="template/header.jsp" %>
            </div> <!--end header-->
            <div id="content">
                <div style="display: block;" class="ctnAlert">	
                    <div style="height: 208px;" class="spyWrapper">
                        <ul class="ctnAlert_inside spy">

                            <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a>&nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;
                                <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("uPRODUCT", lang) %></a></li>	

                        </ul></div>
                    <a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>

                <div id="col1">
                    <div class="left_content_ucp">
                        <div class="box_msg">
                            <p><a class="msg clear" href="inbox.html"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
                        </div>
                        <div class="module_ucp boxRadius">
                           <h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
							<ul>
						      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
						      <li><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
						      <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
						      <li class="active"><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
						      <li><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
							  	</ul>
						 </div>
                    </div>
                    <%@include file="template/leftmenu.jsp" %>
                </div>
                <!--col1-->
                <div id="col2">
                    <div class="right_content_ucp">
			            <div class="box_ucp">
			               
			                
			                        <h2 class="title"><%=LanguegeBUS.getValue("pDetail", lang) %></h2>	    			     	
                        <div id="content">

                            <div class="content_inside">

                                <div class="content_shop">
                                    <div class="left_content_shop">
                                        <div class="detail_product">
                                            <div class="wrapper_pic">
                                                <%
                                                    Productphotos pic = (Productphotos) request.getAttribute("productPhotoPOJO");
                                                %>
                                                <div class="pic"><a class="thumb_big">
                                                
	                                                 <% if(pic == null){ %>
							                               <img src="../images/fashion/DefaultImage.gif" alt=""  />
							                        <% }else { %>
							                        		
							                               <img alt="" id="main_img" src="../images/fashion/<%=pic.getProductPhotoName()%>" />
							                        <% } %>
                                                </a></div>
                                                <div id="box_thumbnail" class="other_pic">
                                                    <span class="go-next" id="next"></span>
                                                    <span class="go-prev" id="prev"></span>
                                                    <ul>
                                                        <%
                                                            List<Productphotos> lstPhoto = (List<Productphotos>) request.getAttribute("productPhotoPOJOs");
                                                            if (lstPhoto != null) {
                                                                for (int i = 0; i < lstPhoto.size(); i++) {
                                                                    Productphotos photo = (Productphotos) lstPhoto.get(i);
                                                        %>
                                                        <li><a style="cursor:pointer"><img alt="" src="../images/fashion/<%=photo.getProductPhotoName()%>" height="60" /></a> </li>                            
                                                                <%      }
                                                                    }
                                                                %>
                                                     </ul>         
                                                            </div>
                                                            
                                                            </div>
                                                            <div class="desc">
                                                                <%

                                                                    Products pPojo = (Products) request.getAttribute("productPOJO");

                                                                    Manufacturer manufacture = (Manufacturer) request.getAttribute("manufacturerPOJO");

                                                                %>

                                                                <h1 class="product_name"><%=pPojo.getProductName()%></h1>
                                                                <span class="option"><span class="label"><%=LanguegeBUS.getValue("manufac", lang) %>:</span><%=manufacture.getManufacturerName()%></span>
                                                                <span class="option"><span class="label"><%=LanguegeBUS.getValue("size", lang) %>:</span><%=pPojo.getSize()%></span>
                                                                <span class="option"><span class="label"><%=LanguegeBUS.getValue("color", lang) %>:</span> <%=pPojo.getColor()%></span>


                                                                <span class="option"><span class="label"><%=LanguegeBUS.getValue("price", lang) %>:</span><strong class="price ex"><%=pPojo.getPrice()%>&nbsp;$</strong><br /></span>
                                                                <span class="option clear" id="rating_product" style="display:none"></span>


                                                                <div class="summary_info">
                                                                    <div class="summary_info_box clearfix">
                                                                        <h3>
                                                                            <a href="#" title="shop_kabi"><%=LanguegeBUS.getValue("pDetail", lang) %></a>
                                                                        </h3>

                                                                        <div class="summary_info_inside clear">                                	
                                                                            <p><span class="info" style="display:inline;margin-left:0"><strong><%=pPojo.getDetail()%></strong></span></p>

                                                                        </div>
                                                                        <p>&nbsp; </p>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            
                                                            
             
                    

                </div>
               
            </div>
                                              
                                                            </div>
                                                            </div>
                                                            <!--End content-->
                                                            <div class="clear"></div>
                                                            <div id="ad_zone_footer_b1" style="width:960px"></div>
                                                            <div id="footer">
                                                                <%@include file="template/footer.jsp" %>
                                                            </div><!--end footer-->
                                                            <!--End footer-->
                                                            </div>



</body>
</html>

