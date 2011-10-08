<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, POJO.*, BUS.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%   
 ServletContext rapp=getServletContext();;
 String rlang = (String)rapp.getAttribute("MALL_LA"); %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="content_profile" class="info_shop_ex">
                                                    <div class="top_info_shop">
                                                        <div class="ltop_info_shop"></div>
                                                        <div class="rtop_info_shop"></div>
                                                        <h3><%=LanguegeBUS.getValue("product", rlang)%></h3>
                                                    </div>

                                                    <div class="info_shop_inside">

                                                        <div class="private_user">
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/notice.html"><%=LanguegeBUS.getValue("generalnotice", rlang)%> </a></p>
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/amountprice.html"><%=LanguegeBUS.getValue("mamagerpriceandamount", rlang)%> </a></p>
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/inventory.html"><%=LanguegeBUS.getValue("lstproductstock", rlang)%></a> </p>
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/upload.html"><%=LanguegeBUS.getValue("newproduct", rlang)%></a> </p>
                                                                    </div>
                                                                </div>

                         </div>
<div id="content_profile" class="info_shop_ex">
                                                    <div class="top_info_shop">
                                                        <div class="ltop_info_shop"></div>
                                                        <div class="rtop_info_shop"></div>
                                                        <h3><%=LanguegeBUS.getValue("delivery", rlang) %></h3>
                                                    </div>

                                                    <div class="info_shop_inside">

                                                        <div class="private_user">
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/deliverstatus.html" ><%=LanguegeBUS.getValue("deliverinfo", rlang)%></a> </p>
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/shippingcompany.html"><%=LanguegeBUS.getValue("shipping_com", rlang)%> </a></p>
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/delivercost.html" ><%=LanguegeBUS.getValue("de_cost_deliver_cost", rlang)%></a></p>
                                                                    </div>
                                                                </div>

                         </div>
                         <div id="content_profile" class="info_shop_ex">
                                                    <div class="top_info_shop">
                                                        <div class="ltop_info_shop"></div>
                                                        <div class="rtop_info_shop"></div>
                                                        <h3>Complain</h3>
                                                    </div>

                                                    <div class="info_shop_inside">

                                                        <div class="private_user">
                                                                        <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/cancelorder.html"><%=LanguegeBUS.getValue("cancel_request", rlang)%></a></p>
                                                                        <p class="homephone"><a rel="nofollow" href="<%=ServletUtils.getBaseUrl(request)%>/sale/exchangeorder.html"><%=LanguegeBUS.getValue("returns_request", rlang)%> </a></p>
                                                                       <p class="homephone"><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/exchangeorder.html"><%=LanguegeBUS.getValue("exchange_request", rlang)%> </a></p>
                                                                    </div>
                                                                </div>

                         </div>
                          <div id="content_profile" class="info_shop_ex">
                                                    <div class="top_info_shop">
                                                        <div class="ltop_info_shop"></div>
                                                        <div class="rtop_info_shop"></div>
                                                        <h3><%=LanguegeBUS.getValue("promotion", rlang)%></h3>
                                                    </div>

                                                    <div class="info_shop_inside">

                                                        <div class="private_user">
                                                                        <p class="homephone"><a id="cmd_contact" name="cmd_contact" style="cursor:pointer">&nbsp; </a></p>
                                                                        <p class="homephone"><a rel="nofollow" href="ymsgr:sendIM?bop_shop">&nbsp; </a></p>
                                                                        <p class="homephone">&nbsp; </p>
                                                                        <p class="homephone">&nbsp; </p>
                                                                    </div>
                                                                </div>

                         </div>
</body>
</html>