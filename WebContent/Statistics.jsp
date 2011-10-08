<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>

<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            Object obj = request.getAttribute("lstProductSeller");
            if (obj == null) {
                String url = "/StatisticsController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("salemanage", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
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
						 <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("sale", lang) %></a></li>					
										
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
                                                                
                    <br><h2><%=LanguegeBUS.getValue("salemanage", lang) %></h2><br/><br>
                         
                        <form action="StatisticsController" method="get">
                       
                            <table id="main"  width="617" border="1">
                                 
                            
                                <tr class="carttable">
                                    <td style="vertical-align:middle;font-size:9pt" ><%=LanguegeBUS.getValue("datefrom", lang) %>:</td>
                                    <td colspan="2"> 
                                        <table><tr><td><input type="text" name="datepicker1" value="" id="datepicker1" title="Input Exp Date" style="width: 120px"/></td>
                                        <td><a href="javascript:NewCssCal('datepicker1','yyyymmdd')">
                                            <img src="scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a></td>
                                        </tr></table>    
                                    </td>
                                    <td style="vertical-align:middle;font-size:9pt;text-align:right" ><%=LanguegeBUS.getValue("dateto", lang) %>:</td>
                                    <td colspan="2"> 
                                    <table><tr><td><input type="text" name="datepicker2" value="" id="datepicker2" title="Input Exp Date" style="width: 120px"/></td>
                                        <td><a href="javascript:NewCssCal('datepicker2','yyyymmdd')">
                                            <img src="scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a></td>
                                     </tr></table>          
                                    </td>
                                    <td><input type="submit" name="Search" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
                                        </td>
                                </tr>
                                
                            
                           
                                <tr align="center" class="carttable">
                                    <th style="text-align:center" width="5%">ID </th>
                                    <th width="40%"><%=LanguegeBUS.getValue("productname", lang) %></th>
                                    <th width="15%"><%=LanguegeBUS.getValue("photo", lang) %></th>
                                    <th width="25%"><%=LanguegeBUS.getValue("saledate", lang) %> </th>
                                    <th width="20%" align="center"><%=LanguegeBUS.getValue("price", lang) %><br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</th>
                                    <th width="15%"><%=LanguegeBUS.getValue("amount", lang) %></th>
                                     <th width="10%" align="center"><%=LanguegeBUS.getValue("total", lang) %><br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</th>
                                    
                                </tr>
                                <%
                                    float total=0;
                                    List<Productorderdetail> lstProductDetail = (List<Productorderdetail>)request.getAttribute("lstProductSeller");
                                  if(lstProductDetail.isEmpty() || lstProductDetail == null) {%>
                                    <tr>
                                        <td class="nonSearch" colspan="8">
    		                                 <%
    				                            String message = (String) request.getAttribute("Message");
    				                            if (message != null) {
    				                                out.println("<p align='center'><font size='2pt' color='red'>" + message + "</font></p>");
    				                            }
    				                         %>
                            				
                            			</td>
                            		</tr>
                            	<%}else {
                                        for (int i = 0; i < lstProductDetail.size(); i++) {
                                            Productorderdetail proDetail=lstProductDetail.get(i);
                                            Productphotos photo = ProductPhotoBUS.lstProductPhoto(proDetail.getProducts(),lang);
                                            total=total+proDetail.getProductNumber()*proDetail.getProducts().getPrice();
                                            // Productorder productOrder=ProductorderBUS.

                                %>
                                <tr>
                                    <td style="text-align:center" class="nonSearch"><%= proDetail.getProducts().getProductId()%></td>
                                    <td class="nonSearch"><A title="<%=proDetail.getProducts().getProductName() %>" href="productdetail.html?Id=<%=proDetail.getProducts().getProductId() %>"><%=proDetail.getProducts().getProductName() %></A></td>
                                    <td style="text-align:center" class="nonSearch"><A title="<%=proDetail.getProducts().getProductName() %>" href="productdetail.html?Id=<%=proDetail.getProducts().getProductId() %>"><img width="35" src="images/fashion/<%=photo.getProductPhotoName()%>"/></A></td>
                                    <td class="nonSearch"><%=proDetail.getProductorder().getOrderDate()%> </td>
                                    
                                    <td style="text-align:right" class="nonSearch"><%=proDetail.getProducts().getPrice()%> </td>
                                    <td style="text-align:center" class="nonSearch"><%=proDetail.getProductNumber()%> </td>
                                    <td style="text-align:right" class="nonSearch"><%=proDetail.getProducts().getPrice()*proDetail.getProductNumber()%> </td>
                                    
                                </tr>
                                <% } %>
                                        
                                 <tr>
                                        <td style="height:35px;font-size:9pt;text-align:center" class="carttable"><%=LanguegeBUS.getValue("total", lang) %></td>
                                        <td colspan="5"></td>
                                        
                                        <td style="text-align:right;font-size:9pt" class="carttable"><%=total%> </td>
                                        
                                        
                                 </tr>        
                               <% } %>
                               

                            </table>
                         </form>
                         <br class="clr"><br>
                          <!-- PAGI -->
				
			                <div class="pagination"><ul>
			                <% NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pagedcust");
			                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
			                	String date = (String)session.getAttribute("selldate");
			                if(!pagedcust.isFirstPage()){%>
			                
			                		<li><a href="sale.html?<%if(null!=date){%><%=date%><%}%>page=0">First</a></li> 
			                       
			                 <% }
			                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
			                		 if(i!=pagedcust.getCurrentPage()){    	                
			                 %>
			                 	<li class="pagir"><a href="sale.html?<%if(null!=date){%><%=date%><%}%>page=<%=i%>"><%=i%></a></li>
			                 <%}else{ %>	
			                 	<li class="pagir"><a href="#" class="currentpage"><%=i%></a></li>
			                 <%}
			                	 }
			                	if(!pagedcust.isLastPage()){	 
			                 %>
			                    <li><a href="sale.html?<%if(null!=date){%><%=date%><%}%>page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></li>
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
