<%@page import="CONTROLLER.HomeDeliverController"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<%
	List<HomeDeliverView> homeDelivers = (List<HomeDeliverView>) request
			.getAttribute("homeDelivers");
	if (homeDelivers == null) {
		request.getRequestDispatcher("/HomeDeliverController")
				.forward(request, response);
	}
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String currentDate = dateFormat.format(date);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("delistatus", lang)%></title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />

<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css"
	media="screen" rel="stylesheet" type="text/css" />


<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/datetimepicker_css.js"></script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#shEdit").hide();
	});

	function fillDataForEdit(productID,deliverID,shippingCompanyName,shippingType,shippingCost){
		document.formEdit.productID.value=productID;
		document.formEdit.deliverID.value=deliverID;
		document.formEdit.shippingCompanyName.value=shippingCompanyName;
		document.formEdit.shippingType.value=shippingType;
		document.formEdit.shippingCost.value=shippingCost;
	}
	
</script>

</head>
<body id="travel">
	<div id="wrapper">
		<div id="header">
			<%@include file="layout/header.jsp"%>
		</div>


		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("link_home_deliver", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="close" width="8" height="8"> </a>
			</div>

			<br />
			<div class="bottom_userCPanel">
				<p class="sumMoney">
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("link_home_deliver", lang)%></label>
				</p>

				<p>
					<b><%=LanguegeBUS.getValue("link_home_deliver", lang)%>:</b>
					<%=LanguegeBUS.getValue("hd_introduce", lang)%>
				</p>

				<div class="clear"></div>
			</div>
			<div class="content_inside">
				<div class="content_shop">

					<div class="left_content_shop">

						<div class="box_sale">
							<div class="top_box_ucp">
								<div class="ltop_box_ucp"></div>
								<div class="rtop_box_ucp"></div>

							</div>
							<div class="center_box_ucp">
								<div style="padding: 4px 5px">

									<div class="space"></div>
									<div>
										<label
											style="display: block; text-align: left !important; margin-left: 5px !important; padding-left: 10px; height: 20px !important"
											class="title_deli"><%=LanguegeBUS.getValue("hd_manage", lang)%>
										</label>
									</div>
									<div class="space"></div>
									<div>
										<form name="formSearch" onsubmit="return validSearch();" method="post"
											action="<%=ServletUtils.getBaseUrl(request)%>/HomeDeliverController">
											<table class=table_deli border="0" cellpadding="0"
												style="width: 730px;" cellspacing="0">
												<tbody>
													<tr>
														<td width="100" style="text-align: left; background-color: #CCCCCC;"><%=LanguegeBUS.getValue("deli_selected_view", lang)%></td>
														<td width="530" style="text-align: left;">
														<div>
																		<input readonly type="text" name="from" id="from"
																					value="<%=currentDate%>" style="width: 80px"
																					class="medium_text_input show_tip required" /> <a
																					href="javascript:NewCssCal('from','yyyymmdd')">
																					<img
																					src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/images/cal.gif"
																					width="16px" height="17" alt=""> </a> <label>~</label>
																				<input name="to" readonly type="text" id="to"
																					value="<%=currentDate%>" style="width: 80px"
																					class="medium_text_input show_tip required" /> <a
																					href="javascript:NewCssCal('to','yyyymmdd')"> <img
																					src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/images/cal.gif"
																					width="16px" height="17" alt=""> </a>
																			</div>
														</td>
														<td width="100"><button name="search" value="search"><%=LanguegeBUS.getValue("deli_view", lang)%></button>
														</td>
													</tr>

												</tbody>
											</table>
										</form>
									</div>
									<div class="space"></div>
									<div class="line_gray"></div>
									<div class="space"></div>
									<div style="overflow: auto; width: 740px">
										<table class="table_ucp" border="0" cellpadding="0"
											cellspacing="0" width="820">
											<tbody>
												<tr>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_no", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_product_id", lang)%></td>
													<td class="lstitle" style="color: black" width="150"><%=LanguegeBUS.getValue("de_delvier_id", lang)%></td>
													<td class="lstitle" style="color: black" width="200"><%=LanguegeBUS.getValue("sh_company_name", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("hd_shipping_type", lang)%></td>
													<td class="lstitle" style="color: black" width="100"><%=LanguegeBUS.getValue("sh_shipping_cost", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_finished_date", lang)%></td>

												</tr>
												<%
													if (homeDelivers != null) {
														int count = 0;
														for (HomeDeliverView homeDeliver : homeDelivers) {
															String productID = homeDeliver.getProductID();
															String deliverID = homeDeliver.getDeliverID();
															String shippingCompanyName = homeDeliver.getShippingCompanyName();
															String shippingType = homeDeliver.getDeliverType();
															String shippingCost = homeDeliver.getShippingCost();
															String finishedDate = homeDeliver.getFinishedDate();												
															count++;
												%>

												<tr class="order_row"
													onmouseover="this.style.backgroundColor='#FFEBDA'"
													onmouseout="this.style.backgroundColor='#FFFFFF'"
													onmousedown="this.style.backgroundColor='#FFEBDA'"
													>
													<td class="nonSearch"><label><%=count%></label>
													</td>
													<td class="nonSearch"><label><%=productID%></label>
													</td>
													<td class="nonSearch"><label><%=deliverID%></label>
													</td>
													<td class="nonSearch"><label><%=shippingCompanyName%></label>
													</td>
													<td class="nonSearch"><label><%=shippingType%></label>
													</td>
													<td class="nonSearch"><label><%if(shippingCost!=null){ %><%=shippingCost%><%} else{%>--<%} %></label>
													</td>
													<td class="nonSearch"><label><%if(finishedDate!=null){ %><%=finishedDate%><%} else{%>--<%} %></label>
													</td>


												</tr>
												<%
													}
													} else {
												%><tr>
													<td colspan="11"><label><%=LanguegeBUS.getValue(
						"sh_message_have_not_shipping", lang)%></label>
													</td>
												</tr>
												<%
													}
												%>

											</tbody>
										</table>

									</div>
									
									<div class="space"></div>

									<div class="space"></div>
									<div id="shEdit">
										<div class="space"></div>
										<div class="space"></div>
										<div class="line_gray"></div>
										<div class="space"></div>
										<div style="padding-left: 5px">
											<label class="title_deli" style="display: block"><%=LanguegeBUS.getValue("deli_edit", lang)%></label>
										</div>
										<div class="space"></div>
										<div>
											<form name="formEdit" onsubmit="return validateForm(this)" method="post"
												action="<%=ServletUtils.getBaseUrl(request)%>/HomeDeliverController">
												<table class=table_deli border="0" cellpadding="0"
													style="width: 730px;" cellspacing="0">
													<tbody>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_product_id", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="productID" disabled="disabled"/></td>
															<td rowspan="6" valign="middle"
																style="vertical-align: middle; width: 200px"><input
																type="hidden" name="shID" disabled="disabled">
																<button type="submit" value="shUpdate" name="update"><%=LanguegeBUS.getValue("deli_update", lang)%></button>
															</td>

														</tr>
														<tr>
															<td class="lstitle" width="150px"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("de_delvier_id", lang)%>deliverid</td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="deliverID" disabled="disabled"/></td>

														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_name", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 400px;" name="shippingCompanyName" disabled="disabled"/></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("hd_shipping_type", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shippingType" disabled="disabled"/></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_shipping_cost", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shippingCost" /></td>
														</tr>									

													</tbody>
												</table>
												<div class="space"></div>

												<div class="space"></div>
												<div align="center"></div>
											</form>
										</div>
										<div class="space"></div>

									</div>
									
								</div>
							</div>

							<div class="bottom_box_ucp">
								<div class="lbottom_box_ucp"></div>
								<div class="rbottom_box_ucp"></div>
							</div>
						</div>
					</div>
					<div class="right_content_shop">

						<%@include file="layout/menuright.jsp"%>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>