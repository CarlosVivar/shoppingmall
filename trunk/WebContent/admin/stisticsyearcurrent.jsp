<%@page import="java.util.Date"%>
<%@include file="../library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>

<%
    Object obj = request.getAttribute("lststisticsYearCurrent");
    if (obj == null) {
        String url = "/StatisticsAdminYearCurrentController";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title><%=LanguegeBUS.getValue("salemanage", lang) %></title>
        <meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 

        <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.popupWindow.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/service.1.0.6.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>
         <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
         <script type="text/javascript"> function onViewSubmit() { var form = document.getElementById("viewForm"); form.submit(); } </script> 


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

                            <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a> 
                                &nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;<a rel="nofollow"  href="salemonth.html" class="viewmore"><%=LanguegeBUS.getValue("uSALE", lang) %></a></li>			
                        </ul></div>
                    <a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>

                <div id="col1">
                    <div class="left_content_ucp">
                        <div class="box_msg">
                            <p><a class="msg clear" href="#"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
                        </div>


                         <div class="module_ucp boxRadius">
                            <h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
                            <ul>
                                <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>

                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
                                <li class="active"><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", lang) %></a></li>
                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>    
                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li>  
                                <li><a href="category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li>
                            </ul>
                        </div>
                    </div>
                    <%@include file="template/leftmenu.jsp" %>
                </div>
                <!--col1-->
                <div id="col2">


                    <div class="right_content_ucp">
                        <div class="box_ucp">
                            <div class="top_box_ucp">
                                <div class="ltop_box_ucp"></div>
                                <div class="rtop_box_ucp"></div>
                            </div>
                            <div class="center_box_ucp">
                                <div class="box_ucp_inside">
                                    <h2 class="title"><%=LanguegeBUS.getValue("salemanage", lang) %></h2>
                                    <div id="usual2">

                                        <ul class="tab">
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html" ><span><%=LanguegeBUS.getValue("day", lang) %></span></a></li>
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonthcurrent.html" ><span><%=LanguegeBUS.getValue("month", lang) %></span></a></li>
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/saleyearcurrent.html" class="selected"><span><%=LanguegeBUS.getValue("year", lang) %></span></a></li>
                                        </ul>
                                        <div class="clear"></div>

                                        <form action="<%=ServletUtils.getBaseUrl(request)%>/StatisticsAdminYearCurrentController" id="viewForm" method="post">
                                        <table style="display: table;" id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td  colspan="9" class="nonSearch" width="110"><%=LanguegeBUS.getValue("selectyear", lang) %> &nbsp;&nbsp;
                                                        <select id="cbxyear" name="cbxyear" onchange="onViewSubmit();" style="width: 80px;">
                                                <option value="" >--<%=LanguegeBUS.getValue("year", lang) %>--</option>
                                                <%
                                                    Date d = new Date();
                                                    for (int j = 0; j <= (d.getYear() + 20); j++) {
                                                        int y = d.getYear() + 20 - j;
                                                %>
                                                <option value="<%=(y + 1900)%>" selected><%=(y + 1900)%> </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </td>

                                            </tr>

                                            <tr>
                                                	<td class="lstitle" width="30">Id</td>
                                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("productname", lang) %></td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("photo", lang) %></td>                                 
                                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("sDate", lang) %></td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("price", lang) %><br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("amount", lang) %></td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("sellername", lang) %></td>
                                                    <td  colspan="2" class="lstitle" width="50"><%=LanguegeBUS.getValue("total", lang) %><br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>

                                            </tr>
                                            <%
                                                float total = 0;
                                                List<Productorderdetail> lstProductDetail = (List<Productorderdetail>) request.getAttribute("lststisticsYearCurrent");
                                                if (lstProductDetail == null || lstProductDetail.isEmpty() ) {
                                            %>
                                            <tr>
                                                <td colspan="9">
                                                    <%
                                                        String message = (String) request.getAttribute("Message");
                                                        if (message != null) {
                                                            out.println("<p align='center'><font size='2pt' color='red'>" + message + "</font></p>");
                                                        }
                                                    %>

                                                </td>
                                            </tr>
                                            <%} else {
                                                
                                                for (int i = 0; i < lstProductDetail.size(); i++) {
                                                    Productorderdetail proDetail = lstProductDetail.get(i);
                                                    Productphotos photo = ProductPhotoBUS.lstProductPhoto(proDetail.getProducts(),lang);
                                                    total = total + proDetail.getProductNumber() * proDetail.getProducts().getPrice();
                                            %>



                                            <tr class="order_row">
                                                <td class="nonSearch" ><%=proDetail.getProducts().getProductId()%></td>
                                                <td class="nonSearch" ><a title="View product information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/productdetail.html?Id=<%=proDetail.getProducts().getProductId() %>" ><%=proDetail.getProducts().getProductName()%></a></td>
                                                <td class="nonSearch" ><a title="View product information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/productdetail.html?Id=<%=proDetail.getProducts().getProductId() %>" >
                                                <img  width="35" src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/<%=photo.getProductPhotoName()%>"/></a></td>                                 
                                                <td class="nonSearch" ><%=proDetail.getProductorder().getOrderDate()%></td>
                                                <td class="nonSearch" ><%=proDetail.getProducts().getPrice()%></td>
                                                <td class="nonSearch" ><%=proDetail.getProductNumber()%></td>
                                                 <td class="nonSearch" ><a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=proDetail.getProducts().getUser().getAccount()%>" >
                                                 <%=proDetail.getProducts().getUser().getAccount()%></a></td>
                                                <td  colspan="2" class="nonSearch" width="50"><%=proDetail.getProducts().getPrice() * proDetail.getProductNumber()%> </td>

                                            </tr>
                                            <%}
                                            }
                                              if(total > 0){  
                                            %>
											
                                            <tr class="order_row">
                                                <td  colspan="2" class="lstitle" width="50"><%=LanguegeBUS.getValue("total", lang) %></td>
                                                <td  colspan="5" class="nonSearch" width="50"></td>
                                                <td class="lstitle"><%=total%></td>
                                            </tr>
											<%} %>
											
											<% if (lstProductDetail != null && !lstProductDetail.isEmpty() ) { %>   
                                            <tr>
			                                    	<td colspan="8">
			                                    			<%NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pageyear");
												                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
												              %>
								                              <div class="paging grey page_item">
								                              <div class="wrap">
								                              <div class="pageOn">
								                               <% 
												                if(pagedcust.isFirstPage()==false){%>
								                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/saleyearcurrent.html?cbxyear=<%=(String)session.getAttribute("cbxyear") %>&page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
								                               <% }
												                	 for(int i=1;i<pagedcust.getIndexList().length;i++){
												                		 if(i!=pagedcust.getCurrentPage()){    	                
												               %>
								                              <!-- span class="active">1</span-->
								                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/saleyearcurrent.html?cbxyear=<%=(String)session.getAttribute("cbxyear") %>&page=<%=i%>" ><%=i%></a></span>
								                              <%}else{ %>	
												                 	<span class="active"><%=i%></span>
												                 <%}
												                	 }
												                	if(pagedcust.isLastPage()==false){	 
												                 %>
								                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/saleyearcurrent.html?cbxyear=<%=(String)session.getAttribute("cbxyear") %>&page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
								                               <%} 
												                	%>   
												                
								                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
								                             <%} 
								                             %>
			                                    	</td>
		                                    	</tr>
		                               <%} %>     	
                                            </tbody>
                                         
                                        </table>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="bottom_box_ucp">
                                <div class="lbottom_box_ucp"></div>
                                <div class="rbottom_box_ucp"></div>
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