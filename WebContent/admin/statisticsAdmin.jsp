<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>
<%
    Object obj = request.getAttribute("lstProductAdmin");
    if(StringUtils.equals(request.getParameter("SearchSeller"),"Submit")){
        if(request.getAttribute("flag")==null){
            String url = "/stisticsAdminDateCotroller";
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
    }else if (obj == null) {
        String url = "/StatisticsAdminController";
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
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.popupWindow.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/service.1.0.6.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>


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
                            <p><a class="msg clear" href="<%=ServletUtils.getBaseUrl(request)%>/admin/inbox.html">Messages (<strong>0</strong>)</a></p>
                        </div>


                        <div class="module_ucp boxRadius">
                            <h4 class="title"><%=LanguegeBUS.getValue("manage", lang)%></h4>
                            <ul>
                                <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html"><%=LanguegeBUS.getValue("home", lang)%></a></li>

                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html"><%=LanguegeBUS.getValue("user", lang)%></a></li>
                                <li class="active"><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", lang)%></a></li>
                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/product.html"><%=LanguegeBUS.getValue("product", lang)%></a></li>
                                <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/order.html"><%=LanguegeBUS.getValue("order", lang)%></a></li>  
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
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html" class="selected"><span><%=LanguegeBUS.getValue("day", lang)%></span></a></li>
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonthcurrent.html"><span><%=LanguegeBUS.getValue("month", lang)%></span></a></li>
                                            <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/saleyearcurrent.html"><span><%=LanguegeBUS.getValue("year", lang)%></span></a></li>
                                        </ul>
                                        <div class="clear"></div>
                                        <form  method="post">
                                            <table style="display: table;" id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td  colspan="2"  class="nonSearch" width="90"><%=LanguegeBUS.getValue("datefrom", lang) %>
                                                        <input type="text" name="datepickerdateFrom" value="" id="datepickerdateFrom" title="Input Exp Date" style="width: 120px"/>
                                                        <a href="javascript:NewCssCal('datepickerdateFrom','yyyymmdd')">
                                                            <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
                                                    </td>
                                                    <td  colspan="2" class="nonSearch" width="90"><%=LanguegeBUS.getValue("dateto", lang) %>                                

                                                        <input type="text" name="datepickerdateTo" value="" id="datepickerdateTo" title="Input Exp Date" style="width: 120px"/>
                                                        <a href="javascript:NewCssCal('datepickerdateTo','yyyymmdd')">
                                                            <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
                                                    </td>

                                                    <td align="left"  colspan="2" class="nonSearch" width="50">
                                                        <input type="submit" name="SearchSeller" value="<%=LanguegeBUS.getValue("submit", lang)%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>

                                        <table style="display: table;" id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody><tr>
                                                    <td class="lstitle" width="10">ID</td>
                                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("productname", lang)%></td>
                                                    <td class="lstitle" width="40"><%=LanguegeBUS.getValue("photo", lang)%></td>                                 
                                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("sDate", lang)%></td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("price", lang)%> <br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>
                                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("amount", lang)%></td>
                                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("sellername", lang)%></td>
                                                    <td  colspan="2" class="lstitle" width="50"><%=LanguegeBUS.getValue("total", lang)%><br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>

                                                </tr>
                                                <%
                                                    float total = 0;
                                                    List<Productorderdetail> lstProductDetail = (List<Productorderdetail>) request.getAttribute("lstProductAdmin");
                                                    if (lstProductDetail.isEmpty() || lstProductDetail == null) {
                                                %>
                                                <tr>
                                                    <td colspan="7">
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
                                                    <td class="nonSearch"><%=proDetail.getProducts().getProductId()%></td>
                                                    <td class="nonSearch"><a title="View product information" href="productdetail.html?Id=<%=proDetail.getProducts().getProductId()%>" ><%=proDetail.getProducts().getProductName()%></a></td>
                                                    <td class="nonSearch" width="80"><a title="View product information" href="productdetail.html?Id=<%=proDetail.getProducts().getProductId()%>" >
		                                                    <% if(photo == null){ %>
					                                               <img  src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/DefaultImage.gif" width="40" height="40" />
					                                        <% }else { %>
					                                               <img  width="35" src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/<%=photo.getProductPhotoName()%>"/>
					                                        <% } %>    
                                                    
                                                    
                                                    </a></td>                                 
                                                    <td class="nonSearch"><%=proDetail.getProductorder().getOrderDate()%></td>
                                                    <td class="nonSearch"><%=proDetail.getProducts().getPrice()%></td>
                                                    <td class="nonSearch"><%=proDetail.getProductNumber()%></td>
                                                    <td class="nonSearch"><%=proDetail.getProducts().getUser().getAccount()%></td>
                                                    <td  colspan="2" class="nonSearch"><%=proDetail.getProducts().getPrice() * proDetail.getProductNumber()%> </td>

                                                </tr>
                                                <%}%>

                                                <tr class="order_row">
                                                    <td  colspan="2" class="lstitle" width="50">Total</td>
                                                    <td  colspan="5" class="nonSearch"></td>
                                                    <td class="lstitle"><%=total%></td>
                                                </tr>
                                                <% }%>
                                                 <tr>
			                                    	<td colspan="8">
			                                    			<%NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pagedcust");
												                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
												                	
												                		String date = (String)session.getAttribute("date");
												                	
												              %>
								                              <div class="paging grey page_item">
								                              <div class="wrap">
								                              <div class="pageOn">
								                               <% 
												                if(pagedcust.isFirstPage()==false){%>
								                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html?<%if(null!=date){%><%=date%><%}%>page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
								                               <% }
												                	 for(int i=1;i<pagedcust.getIndexList().length;i++){
												                		 if(i!=pagedcust.getCurrentPage()){    	                
												               %>
								                              <!-- span class="active">1</span-->
								                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html?<%if(null!=date){%><%=date%><%}%>page=<%=i%>" ><%=i%></a></span>
								                              <%}else{ %>	
												                 	<span class="active"><%=i%></span>
												                 <%}
												                	 }
												                	if(pagedcust.isLastPage()==false){	 
												                 %>
								                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html?<%if(null!=date){%><%=date%><%}%>page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
								                               <%} 
												                	%>   
												                
								                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
								                             <%} 
								                             %>
			                                    	</td>
		                                    	</tr>
                                            </tbody>
                                        </table>


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