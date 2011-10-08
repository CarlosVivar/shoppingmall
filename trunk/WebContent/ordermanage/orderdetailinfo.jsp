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

<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>
<script type="text/javascript">
	function onSubmit2() {
		var form = document.getElementById("choosekindorder");
		form.submit();
	}
	function goBack() {
		history.go(-1);
	}
</script>

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
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("order_info", lang)%></a>
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
															<h2><%=LanguegeBUS.getValue("order_info", lang)%>
															</h2>
															<br>

															<div id="tabs1" class="tab_show">
																<%
																	String id = request.getParameter("id");
																	if (id != null) {
																		Productorderdetail productODetail = ProductorderdetailBUS
																				.getProductorderdetail(Integer.parseInt(id), lang);
																		if (productODetail != null) {

																			int pODetailID = productODetail.getProductOrderDetailId();
																			Productorder prod = ProductorderBUS.getProductorder(
																					productODetail.getProductorder()
																							.getProductOrderId(), lang);

																			int id_ProductOrder = prod.getProductOrderId();
																			Date orderdate = prod.getOrderDate();

																			Date d = new Date();
																			Products product = ProductBUS.getProducts(
																					productODetail.getProductId(), lang);
																			float price = product.getPrice();
																			float quantiy = productODetail.getProductNumber();
																			float totalmoney = price * quantiy;

																			float deliverCost = DeliverCostBUS
																					.getDeliverCostByProduct(product, totalmoney,prod.getTransportId(), lang);
																			Deliver deliver = DeliverBUS.getDeliverByPODetail(
																					pODetailID, lang);
																			Deliverstatus deliverStatus = DeliverStatusBUS
																					.getDeliverStatus(deliver.getDeliverstatusID(),
																							lang);
																			float totalAmount = totalmoney + deliverCost;
																			User buyer = UserBUS.getUser(prod.getAccount(), lang);
																%>

																<form id="orderform" name="orderform"
																	action="orderdetailController" method="post">
																	<table width="100%" class="info" id="tab1_table">
																		<tbody>
																			<tr>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("orderNo.", lang)%><div>
																						(<%=LanguegeBUS.getValue("oDate", lang)%>)
																					</div>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("item", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("deli_quantity", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="13%"><%=LanguegeBUS.getValue("price", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="13%"><%=LanguegeBUS.getValue("shipping", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="13%"><%=LanguegeBUS.getValue("shipping_info", lang)%>
																			</tr>

																			<tr>
																				<td class="select">HD00<%=id_ProductOrder%>/<%=d.getYear() + 1900%>
																					<br>(<%=orderdate%>)</td>
																				<td class="select" align="center"><%=product.getProductName()%>
																				</td>
																				<td class="select" align="center"><%=quantiy%></td>
																				<td class="select" align="right"><%=price%></td>
																				<td class="select" align="right"><%=deliverCost%></td>
																				<td class="select" align="right"><%=prod.getAddress()%></td>

																			</tr>

																		</tbody>
																	</table>
																</form>
																<br>
																<div>
																	<%=LanguegeBUS.getValue("shipping", lang)%>
																	<%=LanguegeBUS.getValue("exc_status", lang)%>:
																	<%=deliverStatus.getDeliverStatus()%>
																	<table width="100%" class="info">
																		<tr>
																			<td rowspan="2" class="select" width="60%"></td>
																			<td class="select" width="40%">
																				<div>
																					<%=LanguegeBUS.getValue("total_amount", lang)%>:
																					<%=totalAmount%></div>
																			</td>
																		</tr>
																		<tr>
																			<td class="select" width="40%">
																				<div><%=LanguegeBUS.getValue("cancel", lang)%>\<%=LanguegeBUS.getValue("refund", lang)%>
																					<%=LanguegeBUS.getValue("amount", lang)%>:
																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
																<br>
																
																<div>
																	<%=LanguegeBUS.getValue("deliver", lang)%>
																	<%=LanguegeBUS.getValue("info", lang)%>
																	<table width="100%" class="info">
																		<tr style="width: 100%">
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS.getValue("buyer", lang)%></td>
																			<td class="select" width="30%"><%=buyer.getAccount()%></td>
																			<td class="title" bgcolor="#FAF8EA" width="20%" style="max-width: 20%"><%=LanguegeBUS.getValue("recipient", lang)%></td>
																			<td class="select" width="30%"><%=prod.getReciever()%></td>
																		</tr>
																		<tr style="width: 100%">
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS.getValue("telephone", lang)%>
																				<%=LanguegeBUS.getValue("no.", lang)%></td>
																			<td class="select" width="30%"><%=buyer.getPhone()%></td>
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS.getValue("mobilephone", lang)%>
																				<%=LanguegeBUS.getValue("no.", lang)%></td>
																			<td class="select" width="30%"></td>
																		</tr>
																		<tr style="width: 100%">
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS
							.getValue("deli_deliver_address", lang)%></td>
																			<td class="select" colspan="3" width="80%"><%=prod.getAddress()%></td>

																		</tr>
																		<tr style="width: 100%">
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS.getValue("memo_to_seller", lang)%></td>
																			<td class="select" colspan="3" width="80%">
																				<%String memo="";
																						if (productODetail.getOrderDetailStatusId() == 3) {
																									Ordercancel ordercancel = OrdercancelBUS
																											.getOrdercancelByPODetailID(pODetailID, lang);
																									if (ordercancel != null) {
																										memo=ordercancel.getMemo();
																									}
																						}
																									%> <textarea rows=2 cols="60"
																					readonly="readonly"><%=memo.trim() %>			
																					</textarea>
																			</td>

																		</tr>
																	</table>
																</div>
																<br>
																<div style="text-align: center">
																	<a><button onclick="goBack()"><%=LanguegeBUS.getValue("prev_ page", lang)%></button>
																	</a> <a href="index.html"><button style=""><%=LanguegeBUS.getValue("home", lang)%></button>
																	</a>
																</div>
																<%
																	}
																	}
																%>
															</div>
															<br>



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
