<%-- 
    Document   : orderproductdetail
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@include file="library.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("ordermanage", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="Googlebot" content="index,follow,archive">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>
<script type="text/javascript">
                
         function openPage(path)
             {
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

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">
				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>&nbsp; <img
								src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("ordermanage", lang)%></a>
								&nbsp; <img
								src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
								<a rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("odetail", lang)%></a>
							</li>

						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8">
					</a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/sellermenu.jsp"%>
				</DIV>

				<!-- -------------Content------------- -->
				<DIV class="col-main">



					<br />
					<DIV class="main-block">
						<DIV class="border-bot">
							<DIV class="border-left">
								<DIV class="border-right">
									<DIV class="corner-left-top">
										<DIV class="corner-right-top">

											<DIV class="corner-left-bot">
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<div class="tube">
															<%
																String message = (String) request.getAttribute("Message");
																if (message != null) {
																	out.println("<p align='center'><font color='red'>" + message
																			+ "</font></p>");
																}
															%>

															<%
																String id_order_test = request.getParameter("Id");
																int id_order = Integer.parseInt(id_order_test);

																Productorder info_order = (Productorder) ProductorderBUS
																		.getProductorder(id_order, lang);
																String myacc = (String) session.getAttribute("username");

																User newUser = new User();

																newUser = UserBUS.getUser(myacc, lang);

																int transport_id = info_order.getTransportId();
																Transport mytransport = TransportBUS.getTransport(transport_id,
																		lang);
																Date d = new Date();
															%>
															<form id="orderdetailform" name="orderdetailform"
																action="orderdetailController" method="post">
																<table class="carttable" width="533">
																	<tbody>
																		<p align='center'>
																			<font color="#000066">
																				<h1>
																					<b> <%=LanguegeBUS.getValue("oform", lang)%> <br>
																						<%=LanguegeBUS.getValue("serialorder", lang)%> :
																						HD00<%=id_order%>/<%=d.getYear() + 1900%> </b>
																				</h1> </font>
																		</p>
																	</tbody>
																</table>
																<table class="carttable" width="100%">
																	<tbody>
																		<tr>
																			<td width="50%" height="23" valign="top">
																				<table width="100%" style="font-size: 9pt">
																					<tr>
																						<p align='center'>
																							<font color='red'>
																								<h1>
																									<b> <%=LanguegeBUS.getValue("sender", lang)%>:
																									</b>
																								</h1> </font>
																						</p>

																					</tr>
																					<tr>
																						<td><%=LanguegeBUS.getValue("fullname", lang)%>:
																							<a style="color: blue" href="accountdetail.html"><%=newUser.getAccount()%></a>
																						</td>
																					</tr>
																					<br>
																					<tr>
																						<td><%=LanguegeBUS.getValue("oDate", lang)%>
																							: <b style="color: green"><%=info_order.getOrderDate()%></b>
																						</td>
																					</tr>
																					<tr>
																						<td width="540"><%=LanguegeBUS.getValue("total", lang)%>:
																							<b style="color: green"><%=info_order.getTotalMoney()%></b>
																							<b style="color: black">$</b></td>
																					</tr>

																					<tr>
																						<br>
																						<%
																							ArrayList<String> myTransport = new ArrayList<String>();
																							ArrayList<Integer> myValueTransport = new ArrayList<Integer>();
																							int trans = info_order.getTransportId();

																							if (trans == 1) {
																								myTransport.add("Home Delivery");
																								myValueTransport.add(2);
																								myTransport.add("Courier");
																								myValueTransport.add(3);
																							} else if (trans == 2) {
																								myTransport.add("To receiver goods");
																								myValueTransport.add(1);
																								myTransport.add("Courier");
																								myValueTransport.add(3);
																							} else if (trans == 3) {
																								myTransport.add("To receiver goods");
																								myValueTransport.add(1);
																								myTransport.add("Home Delivery");
																								myValueTransport.add(2);
																							}
																						%>

																						<td class="label"><%=LanguegeBUS.getValue("transport", lang)%>:

																							<b> <font color="Blue"><%=mytransport.getTransportName().toString()%>
																							</font> </b></td>
																					</tr>
																				</table></td>

																			<td width="50%" height="23" valign="top">
																				<table width="100%" style="font-size: 9pt">
																					<tr>
																						<p align='center'>
																							<font color='red'>
																								<h1>
																									<b> <%=LanguegeBUS.getValue("receiver", lang)%>:
																									</b>
																								</h1> </font>
																						</p>

																					</tr>
																					<tr>
																						<td><%=LanguegeBUS.getValue("fullname", lang)%>:
																							<b> <font color="Blue"> <%=info_order.getReciever()%>
																							</font> </b></td>
																					</tr>
																					<br>

																					<tr>
																						<td><%=LanguegeBUS.getValue("address", lang)%>
																							: <b> <font color="Blue"> <%=info_order.getAddress()%>
																							</font> </b></td>
																					</tr>
																					<tr>
																						<td><%=LanguegeBUS.getValue("phone", lang)%>:<b>
																								<font color="Blue"> <%=info_order.getPhone()%>
																							</font> </b></td>
																					</tr>
																				</table></td>
																		</tr>

																	</tbody>
																</table>
																<br>

																<center>
																	<table class="carttable" border="0"
																		style="font-size: 9pt" width="100%">
																		<tbody>
																			<tr style="border: #fff 1px solid;">
																				<td class="title" width="10%"><%=LanguegeBUS.getValue("no.", lang)%>Cart no(date)</td>
																				<td class="title" width="40%"><%=LanguegeBUS.getValue("product", lang)%></td>
																				<td class="title" width="20%"><%=LanguegeBUS.getValue("productnumber", lang)%></td>
																				<td class="title" width="30%"><%=LanguegeBUS.getValue("", lang)%>payment</td>
																				<td class="title" width="30%"><%=LanguegeBUS.getValue("", lang)%>Shipping</td>
																				<td class="title" width="30%"><%=LanguegeBUS.getValue("", lang)%>Status</td>																			
																				<td class="title" width="30%"><%=LanguegeBUS.getValue("", lang)%>Remarks</td>

																			</tr>
																			<%
																				List<Productorderdetail> nList = ProductorderdetailBUS
																																							.getListProductorderdetail(id_order, lang);
																																					float tongtien = 0;

																																					for (int i = 0; i < nList.size(); i++) {

																																						Productorderdetail prodet = nList.get(i);
																																						int id_product = prodet.getProductId();
																																						Products pro = ProductBUS.getProducts(id_product, lang);
																																						tongtien += prodet.getTotalMoney();
																																						Orderdetailstatus orderDStatus = OrderdetailstatusBUS
																																								.getOrderDetailStatusById(
																																										prodet.getOrderDetailStatusId(), lang);
																																						Deliver deliver = DeliverBUS.getDeliverByPODetail(prodet.getOrderDetailStatusId(), lang);
																																						Deliverstatus deliverStatus = DeliverStatusBUS
																																								.getDeliverStatus(deliver.getDeliverstatusID(), lang);
																																						Productorder pOrder=ProductorderBUS.getProductorder(prodet.getProductorder().getProductOrderId(),lang);
																																						String deliverCost = DeliverCostBUS.getDeliverCostByProduct(pro,
																																								tongtien,pOrder.getTransportId(), lang) + "";
																			%>
																			<tr style="border: #fff 1px solid;">
																				<td align="center"><%=prodet.getProductorder().getTransportId()%></td>
																				<td><a title="<%=pro.getProductName()%>"
																					href="productdetail.html?Id=<%=pro.getProductId()%>"><%=pro.getProductName()%></a>
																				</td>
																				<td align="center"><%=prodet.getProductNumber()%>
																				</td>
																				<td align="center"><%=prodet.getTotalMoney()%>
																				</td>
																				<td align="center"><%=deliverCost%></td>
																				<td align="center"><%=orderDStatus.getOrderDetailStatus()%>
																				</td>
																				<td align="center"><%=deliverStatus.getDeliverStatus()%>
																				</td>
																				<td align="center">
																				<a alt="View" href="buyer_update_order.jsp?Id="<%=prodet.getProductOrderDetailId()%>> <img height="15" width="20"  src="css/images//icon-reply.gif" name="edit" title="Update" > </a>
																				</td>
																			</tr>

																			<%
																				}
																			%>

																		</tbody>
																	</table>
																</center>
																<br />
																<hr />
																<p>
																	<%=LanguegeBUS.getValue("total", lang)%>: <strong
																		style="color: red"> <%=tongtien%></strong> $
																</p>
																<hr />

															</form>
															<div class="footer blog">
																<%@include file="WEB-INF/footer.jsp"%>
															</div>
														</DIV>
													</DIV>
												</DIV>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>

				</DIV>

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>

				</DIV>

			</DIV>
	</DIV>
	</DIV>		
</body>
</html>
