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
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("cancel_refund_status", lang)%></a>
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
																			String memoToSeller = "", submitted = "", status = "", memoToBuyer = "", cancelReason = "";
																			if (productODetail.getOrderDetailStatusId() == 3) {
																				Ordercancel ordercancel = OrdercancelBUS
																						.getOrdercancelByPODetailID(pODetailID, lang);
																				if (ordercancel != null) {
																					submitted = ordercancel.getRequestDate() + "";
																					cancelReason = ordercancel.getCancelCause();
																					memoToBuyer = (ordercancel.getMemo() != null) ? ordercancel
																							.getMemo() : "";

																					Cancelstatus cancelstatus = CancelstatusBUS
																							.getCancelstatusById(
																									ordercancel.getCancelStatusId(),
																									lang);
																					if (cancelstatus != null)
																						status = cancelstatus.getCancelStatusName();

																					Confirm confirm = ConfirmBUS
																							.getCurrentCancelConfirm(
																									ordercancel.getOrderCancelId(),"S",
																									lang);
																					if (confirm != null && confirm.getMemo() != null) {
																						memoToSeller = confirm.getMemo();
																					}
																				}
																			}
																%>

																<%=LanguegeBUS.getValue("current_status", lang)%>

																<div>
																	<table width="100%"  class="info" id="tab1_table">
																		<tbody>
																			<tr>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("type", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("submitted", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="20%"><%=LanguegeBUS.getValue("exc_status", lang)%>
																				<td bgcolor="#FAF8EA" class="title" width="13%"><%=LanguegeBUS.getValue("refund", lang)%>
																					<%=LanguegeBUS.getValue("exc_status", lang)%>
																			</tr>
																			<tr>
																				<td class="select">Cancel</td>
																				<td class="select" align="center"><%=submitted%>
																				</td>
																				<td class="select" align="center"><%=status%></td>
																				<td class="select" align="right"></td>

																			</tr>
																		</tbody>
																	</table>
																</div>
																<br>
																
																<div>
																	<%=LanguegeBUS.getValue("shipping_info", lang)%>
																	
																	<table class="info" width="100%">
																		<tr>
																			<td class="title" bgcolor="#FAF8EA" width="20%"><%=LanguegeBUS.getValue("item", lang)%></td>
																			<td class="select" width="80%"
																				style="text-align: left; padding-left: 4px"><%=product.getProductName()%></td>
																		</tr>
																		<tr>
																			<td class="title" bgcolor="#FAF8EA"><%=LanguegeBUS.getValue("exc_reason", lang)%></td>
																			<td class="select"
																				style="text-align: left; padding-left: 4px"><select>
																					<option><%=cancelReason%></option>
																			</select> <textarea rows=2 style="width: 99%"
																					readonly="readonly"><%=memoToBuyer%>			
																					</textarea></td>
																		</tr>
																		<tr>
																			<td class="title" bgcolor="#FAF8EA"><%=LanguegeBUS.getValue("seller_memo", lang)%></td>
																			<td class="select"
																				style="text-align: left; padding-left: 4px"><textarea
																					rows=2 style="width: 99%" readonly="readonly"><%=memoToSeller%>			
																					</textarea></td>
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
