<%-- 
    Document   : manageorders
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@include file="library.jsp" %>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("ordermanage", lang) %></title>
		<meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <%
        	String username = (String) session.getAttribute("username");
        %>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
		
		
           
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
					 <a rel="nofollow"  href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("ordermanage", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/sellermenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">                           
                          <br/>
                    <h2><%=LanguegeBUS.getValue("exc_manager", lang) %></h2>      
                   <DIV class="main-block">         
                   <DIV class="border-bot">
                        <DIV class="border-left">
                                <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                                <DIV class="corner-right-top">

                                                        <DIV class="corner-left-bot">
                                                                <DIV class="corner-right-bot"><DIV class="category-title">
                                                                        <div class="tube">         
        <%
                        String message = (String) request.getAttribute("Message");
                        if (message != null) {
                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                        }
                 %>     
                               <div style="overflow: auto; width: 610px;text-align: center">
   												<form>
													<table class="vuhong_table"	cellpadding="0" cellspacing="0">
														<tbody>
															<tr style="background-color: #BFD9E7">
																<th><label><%=LanguegeBUS.getValue("exc_id", lang)%></label>
																</th>
																<th><label><%=LanguegeBUS.getValue("productname", lang)%></label>
																</th>
																<th><label><%=LanguegeBUS.getValue("exc_pnumber", lang)%></label>
																</th>
																<th><label><%=LanguegeBUS.getValue("exc_money", lang)%></label>
																</th>
															</tr>
															<%
															List<Productorderdetail> lstProductOrderDetail = ProductorderdetailBUS.lstProductorderdetail(username,lang);
															if(lstProductOrderDetail!=null){																
															for(Productorderdetail productOrderDetail:lstProductOrderDetail){
																	Products product = ProductBUS.getProducts(productOrderDetail.getProductId(),lang);
															%>
															<tr onMouseOver="this.className='mouse'">
																<td style="height:30px;">
																	<label><%=productOrderDetail.getProductOrderDetailId()%></label>
																</td>
																<td>
																	<label><%=product.getProductName()%></label>
																</td>
																<td>
																	<label><%=productOrderDetail.getProductNumber()%></label>
																</td>
																<td>
																	<label><%=productOrderDetail.getTotalMoney()%></label>
																</td>
															</tr>
															<%
																}}
															%>
													</table>
												</form>
												
												</div>
												
                                                                    
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
