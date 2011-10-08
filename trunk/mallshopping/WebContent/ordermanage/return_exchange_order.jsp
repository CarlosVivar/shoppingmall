<%-- 
    Document   : manageorders
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@include file="../library.jsp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%
	String myAccount = (String) session.getAttribute("username");

	if (myAccount == null) {
		request.getRequestDispatcher("/login.html").forward(request,
				response);
	}
%>
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


</head>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="../WEB-INF/header.jsp"%>
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
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("return_exchange", lang)%></a>
							</li>

						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8"> </a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="../WEB-INF/sellermenu.jsp"%>
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


															<div id="returnExchangeStep1" class="tab_show">
																<%
																	String podid = request.getParameter("podid");
																	Productorderdetail productODetail = null;
																	if (podid != null) {
																		productODetail = ProductorderdetailBUS.getProductorderdetail(
																				Integer.parseInt(podid), lang);
																	}
																%>





																<div
																	style="background-color: #fbfbfb; border: 2px solid #e6e6e6; padding: 10px 10px">
																	<h4><%=LanguegeBUS.getValue("return_exchange_step1", lang)%>:&nbsp;
																		<%=LanguegeBUS.getValue("cancel_step1_content", lang)%>
																	</h4>
																</div>
																<br>
																<form id="cancelForm" name="cancelForm"
																action="<%=ServletUtils.getBaseUrl(request) %>/ReturnExchangeController" method="post">
																<table width="100%" class="manageorderTable"
																	id="tab1_table">
																	<tbody>
																		<tr class="sup">
																			<th class="title" width="20%"><%=LanguegeBUS.getValue("orderNo.", lang)%>
																				<div>
																					(<%=LanguegeBUS.getValue("oDate", lang)%>)
																				</div>
																			<th class="title" width="20%"><%=LanguegeBUS.getValue("Item", lang)%>
																			<th class="title" width="20%"><%=LanguegeBUS.getValue("deli_quantity", lang)%>
																			<th class="title" width="13%"><%=LanguegeBUS.getValue("price", lang)%>
																			<th class="title" width="13%"><%=LanguegeBUS.getValue("shipping", lang)%>
																			<th class="title" width="13%"><%=LanguegeBUS.getValue("exc_status", lang)%>
																			<th class="title" width="40%"><%=LanguegeBUS.getValue("subtotal", lang)%>
																		</tr>
																		<%
																			if (productODetail != null) {
																																				Productorder prod = ProductorderBUS.getProductorder(
																																						productODetail.getProductorder().getProductOrderId(),
																																						lang);

																																				int id_ProductOrder = prod.getProductOrderId();

																																				
																																				Date orderdate = prod.getOrderDate();

																																				Date d = new Date();
																																				Products product = ProductBUS.getProducts(
																																						productODetail.getProductId(), lang);
																																				float price = product.getPrice();
																																				float quantity = productODetail.getProductNumber();
																																				float deliverCost = DeliverCostBUS.getDeliverCostByProduct(product,
																																						price*quantity,prod.getTransportId(), lang);
																																				Deliver deliver = DeliverBUS.getDeliverByPODetail(
																																						productODetail.getProductOrderDetailId(), lang);
																																				Deliverstatus deliverStatus = DeliverStatusBUS
																																						.getDeliverStatus(deliver.getDeliverstatusID(), lang);
																																				
																																				float subtotal = (productODetail.getProductNumber() * price)
																																						+ deliverCost;
																		%>
																		<tr>
																			<td style="border-left: none !important;"><a
																				href="orderdetail.html?Id=<%=id_ProductOrder%>">
																					HD00<%=id_ProductOrder%>/<%=d.getYear() + 1900%> </a><br>(<%=orderdate%>)</td>
																			<td align="center" style="color: #0066BC"><%=product.getProductName()%>
																			</td>
																			<td align="center"><%=quantity%></td>
																			<td align="right"><%=price%></td>
																			<td align="right"><%=deliverCost%></td>
																			<td align="right">
																				<%
																					if (deliverStatus != null) {
																				%><%=deliverStatus.getDeliverStatus()%>
																				<%
																					}
																				%> <%
 	if (deliverStatus.getDeliverStatusId() != 1) {
 %>
																				<div>
																					<a href="" style="color: #0066BC"><%=LanguegeBUS.getValue("shipping_info", lang)%></a>
																				</div> <%
 	}
 %>
																			</td>
																			<td align="center"><%=subtotal%></td>
																		</tr>
																		<%
																			}
																		%>
																		<tr>
																			<td><%=LanguegeBUS.getValue("exc_reason", lang)%></td>
																			<td colspan="6"
																				style="text-align: left; padding-left: 10px"><select
																				style="width: 150px" id="reasonSelect" name="reasonSelect">
																					<option value="Return"><%=LanguegeBUS.getValue("exc_return", lang)%></option>
																					<option value="Exchange"><%=LanguegeBUS.getValue("exc_exchange", lang)%></option>
																			</select>
																				<div>
																					<input type="text" style="width: 300px"
																					name="reasonText"	id="reasonText" />
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
																<br>
																
																 <input
																	type="hidden" name="orderDetailID" value="<%=podid%>">
																
																<div style="text-align: center">
																	<button type="submit"
																		style="padding: 0 10px"><%=LanguegeBUS.getValue("cont", lang)%></button>

																</div>	</form>

															</div>
															
															<div class="footer blog">
																<%@include file="../WEB-INF/footer.jsp"%>
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
					<%@include file="../WEB-INF/rightmenu.jsp"%>

				</DIV>

			</DIV>

		</DIV>
	</DIV>

</body>
</html>
