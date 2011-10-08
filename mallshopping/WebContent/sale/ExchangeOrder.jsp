<%@page import="DAO.ExchangeStatusDAO"%>
<%@page import="DAO.LanguegeDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("exc_manager", lang)%></title>
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

<%
	List<Exchangeorder> lstExchangeOrderByUser = (List<Exchangeorder>) request
			.getAttribute("lstExchangeOrder");
	if (lstExchangeOrderByUser == null) {
		request.getRequestDispatcher("/ExchangeOrderController")
				.forward(request, response);
	}
%>

<script type="text/javascript">
function onmouseoverRowTable1(row_table1){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFEBDA";
}

function onmouseoutRowTable1(row_table1){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFFFFF";
}
function onmousedowRowTable1(row_table1){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFEBDA";
}


 function addContent(id) {
	<%List<Exchangeorder> lstExchangeOrder = (List<Exchangeorder>) ExchangeOrderBUS
					.lstExchangeOrder(lang);
			if (lstExchangeOrder != null) {
				for (int i = 0; i < lstExchangeOrder.size(); i++) {
					Productorderdetail orderDetail = ProductorderdetailBUS
							.getProductorderdetail(
									lstExchangeOrder.get(i).getOrderDetail()
											.getProductOrderDetailId(), lang);

					Products product = ProductBUS.getProducts(orderDetail
							.getProducts().getProductId(), lang);
					Productorder order = ProductorderBUS.getProductorder(
							orderDetail.getProductorder().getProductOrderId(),
							lang);
					User us = UserBUS.getUser(order.getUser().getAccount(),
							lang);
					Exchangestatus exchangeStatus = ExchangeStatusBUS
							.getExchangeStatus(lstExchangeOrder.get(i)
									.getExchangeStatus().getExchangeStatusId(),
									lang);
					Orderdetailstatus orderDetailStatus = OrderdetailstatusBUS
							.getOrderDetailStatusById(
									orderDetail.getOrderDetailStatusId(), lang);%>
					
		if (id==<%=lstExchangeOrder.get(i).getExchangeId()%>){
			
						
			document.getElementById("exchangeOrderID").value = <%=lstExchangeOrder.get(i).getExchangeId()%>;
			document.getElementById("productName").innerHTML="<%=product.getProductName()%>";
			document.getElementById("productNumber").innerHTML="<%=orderDetail.getProductNumber()%>";
			document.getElementById("money").innerHTML="<%=orderDetail.getTotalMoney()%>";
			document.getElementById("buyName").innerHTML="<%=us.getFullName()%>";
			document.getElementById("buyPhone").innerHTML="<%=us.getPhone()%>";
			document.getElementById("receiverName").innerHTML="<%=order.getReciever()%>";
			document.getElementById("receiverPhone").innerHTML="<%=order.getPhone()%>";
			document.getElementById("receiverAddress").innerHTML="<%=order.getAddress()%>";
			document.getElementById("requiredDate").innerHTML="<%=lstExchangeOrder.get(i).getRequiredDate()%>";
			document.getElementById("resolvedDate").innerHTML="<%=lstExchangeOrder.get(i).getResolvedDate()%>";
			document.getElementById("signedDate").innerHTML ="<%=lstExchangeOrder.get(i).getSignedDate()%>" ;
			document.getElementById("reason").innerHTML ="<%=lstExchangeOrder.get(i).getReason()%>" ;
			document.getElementById("moneyReturn").innerHTML ="<%=lstExchangeOrder.get(i).getMoneyReturn()%>" ;
			document.getElementById("request").innerHTML ="<%=orderDetailStatus.getOrderDetailStatus()%>" ;		
			//scroll to the bottom window
			<%=ResourcesDefault.loadCrollBottom()%>
			
		}			
		
		
	<%}
			}%>
 }


function checkValid(){
	var answer = confirm("<%=LanguegeBUS.getValue("are_you_sure", lang)%>");
	if (answer){
		alert("<%=LanguegeBUS.getValue("update_completed", lang)%>");
	}else{
		return false;
	}
	return true;
}


function isNumber(val) {
    if(!val || (typeof val != "string" || val.constructor != String)) {
      return(false);
    }
    var isNumber = !isNaN(new Number(val));
    if(isNumber) {
      return true;
    } else {
      return(false);
    }
  }

</script>


<style type="text/css">
input1 {
	display: block;
}

.hide1 {
	display: none;
}

.show {
	display: block;
}
</style>
</head>
<body id="travel">
	<div id="wrapper">

		<div id="header">
			<%@include file="layout/header.jsp"%>
		</div>
		<!--end header-->

		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("exc_manager", lang)%></a>
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
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("exc_manager", lang)%></label>
				</p>

				<div class="clear"></div>
			</div>


			<div class="clear"></div>
			<div class="content_inside">
				<div class="content_shop">

					<div class="left_content_shop">

						<div class="box_sale">
							<div class="top_box_ucp">
								<div class="ltop_box_ucp"></div>
								<div class="rtop_box_ucp"></div>
							</div>
							<div class="center_box_ucp">
								<div style="padding-left: 5px">
									<h2 class="title"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("exc_manager", lang)%></h2>

									<div id="usual2" style="width: 730px">
										<ul class="tab">

											<li><a rel="ntabs1" class="selected" href="#tabs1"><span><%=LanguegeBUS.getValue("exc_status_view", lang)%></span>
											</a>
											</li>

											<!-- <li><a rel="ntabs3" href="#tabs1"><span>Setting
														exchange and return cost</span> </a>
											</li> -->

											<!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
										</ul>

										<div style="width: 730px">
											<div id="ntabs1" class="tab_class">
												<!-- 
												
												<form name="form0">
													<table id="" class=table_deli border="0" cellpadding="0"
														style="width: 730px;" cellspacing="0">
														<tbody>
															<tr>
																<td class="bgtitle" rowspan="2"
																	style="text-align: left; vertical-align: middle; width: 100px"><label><%=LanguegeBUS.getValue("exc_status_resolved", lang)%></label>
																</td>

																<td><label><%=LanguegeBUS.getValue("exc_resolved", lang)%></label>
																	<a> <label style="font-weight: bold;"></label> </a>
																</td>
																<td><label><%=LanguegeBUS.getValue("exc_exchange", lang)%></label>
																	<label style="font-weight: bold;"></label></td>
																<td><label><%=LanguegeBUS.getValue("exc_return", lang)%></label>
																	<label style="font-weight: bold;"></label></td>
																<td><label><%=LanguegeBUS.getValue("exc_signed", lang)%></label>
																	<label style="font-weight: bold;"></label></td>
															</tr>
														</tbody>
													</table>
												</form>
												
												-->
											</div>
											<br>
											<div>
												<%=LanguegeDAO.getValue("exc_money_info", lang)%>
											</div>
											<br>

											<div style="width: 730px; overflow: auto">
												
													<table id="table1" class=table_deli border="0"
														cellpadding="0" cellspacing="0" style="width: 100%">
														<tbody>
															<tr class="bgtitle" style="background-color: #BFD9E7">
																<td><label><%=LanguegeBUS.getValue("exc_id", lang)%></label>
																</td>
																<td><label><%=LanguegeBUS.getValue("exc_status", lang)%></label>
																</td>
																<td><label><%=LanguegeBUS.getValue("exc_required_date", lang)%></label>
																</td>
																<td><label><%=LanguegeBUS.getValue("productname", lang)%></label>
																</td>
																<td><label><%=LanguegeBUS.getValue("exc_money", lang)%></label>
																</td>
															</tr>
															<%
																if (lstExchangeOrderByUser != null) {
																	for (int i = 0; i < lstExchangeOrderByUser.size(); i++) {
																		Exchangestatus exchangeStatus = ExchangeStatusBUS
																				.getExchangeStatus(lstExchangeOrderByUser.get(i)
																						.getExchangeStatus().getExchangeStatusId(),
																						lang);
																		Productorderdetail orderDetail = ProductorderdetailBUS
																				.getProductorderdetail(lstExchangeOrderByUser
																						.get(i).getOrderDetail()
																						.getProductOrderDetailId(), lang);
																		Products product = ProductBUS.getProducts(
																				orderDetail.getProductId(), lang);
															%>
															<tr class="order_row"
																onmouseover="this.style.backgroundColor='#FFEBDA'; onmouseoverRowTable1(this)"
																onmouseout="this.style.backgroundColor='#FFFFFF'; onmouseoutRowTable1(this)"
																onmousedown="this.style.backgroundColor='#FFEBDA'; onmousedowRowTable1(this)"
																onclick="addContent(<%=lstExchangeOrderByUser.get(i).getExchangeId()%>);">
																<td><label><%=lstExchangeOrderByUser.get(i).getExchangeId()%></label>
																<td><label><%=exchangeStatus.getExchangeStatusName()%></label>
																</td>
																<td><label><%=lstExchangeOrderByUser.get(i).getRequiredDate()%></label>
																</td>
																<td><label><%=product.getProductName()%></label>
																</td>
																<td><label><%=orderDetail.getTotalMoney()%></label>
																</td>
															</tr>
															<%
																}
																}
															%>
														
													</table>
												
											</div>

											<br />

											<div style="font-weight: bold;">
												<%=LanguegeBUS.getValue("exc_cart", lang)%>
											</div>


											<div style="width: 730px; overflow: auto">
											
													
													<table id="" class=table_deli border="0" cellpadding="0"
														style="width: 100%" cellspacing="0">
														<tbody>
															<tr>
																<td class="bgtitle" style="width: 100px"><label><%=LanguegeBUS.getValue("productname", lang)%></label>
																</td>
																<td style="width: 250px"><label id=productName></label>
																</td>
																<td class="bgtitle" style="width: 120px"><label><%=LanguegeBUS.getValue("exc_pnumber", lang)%></label>
																</td>
																<td><label id=productNumber></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_buy_name", lang)%></label>
																</td>
																<td><label id=buyName></label></td>
																<td class="bgtitle" style="width: 120px"><label><%=LanguegeBUS.getValue("exc_phone", lang)%></label>
																</td>
																<td><label id=buyPhone></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_receiver_name", lang)%></label>
																</td>
																<td><label id=receiverName></label></td>
																<td class="bgtitle" style="width: 120px"><label><%=LanguegeBUS.getValue("exc_phone", lang)%></label>
																</td>
																<td><label id=receiverPhone></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_receiver_address", lang)%></label>
																</td>
																<td colspan="3"><label id=receiverAddress></label>
																</td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_required_date", lang)%></label>
																</td>
																<td><label id="requiredDate"></label></td>
																<td class="bgtitle" style="width: 120px"><label><%=LanguegeBUS.getValue("exc_resolved_date", lang)%></label>
																</td>
																<td><label id="resolvedDate"></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_signed_date", lang)%></label>
																</td>
																<td><label id=signedDate></label></td>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_money", lang)%></label>
																</td>
																<td><label id=money></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_reason", lang)%></label>
																</td>
																<td colspan="3"><label id=reason></label></td>
															</tr>
															<tr>
																<td class="bgtitle"><label><%=LanguegeBUS.getValue("exc_money_return", lang)%></label>
																</td>
																<td><label id="moneyReturn"></label></td>
																<td class="bgtitle" style="width: 120px"><label><%=LanguegeBUS.getValue("exc_request", lang)%></label>
																</td>
																<td><label id="request"></label></td>
															</tr>
															
														</tbody>
													</table>

										
											</div>
											<br /> <br />
											<h2 class="title"><%=LanguegeBUS.getValue("Confirm", lang)%>
											</h2>
											<div class="line clear"></div>
											<div class="group_listing_input">
												<form
													action="<%=ServletUtils.getBaseUrl(request)%>/ExchangeOrderController"
													method="post">
													<table>
														
														<tr>
															<td colspan="2">
																<div class="info_profile_inside">
																	<div class="listing_input">
																		<div class="post_label_container">

																			<label class="postLabel">&nbsp;</label>
																		</div>

																		<select id="confirmStatus"
																			name="confirmStatus" style="width: 180px">
																			<%
																				List<Exchangestatus> exchangeStatuss = ExchangeStatusBUS.lstExchangeStatus(lang);
																				if (exchangeStatuss.size() > 0) {
																					for (Exchangestatus exchangestatus : exchangeStatuss) {
																			%>
																			<option value="<%=exchangestatus.getExchangeStatusId()%>"><%=exchangestatus.getExchangeStatusName()%></option>
																			<%
																				}
																				}
																			%>
																		</select><br />
																	</div>
																	<div class="listing_input">
																		<div class="post_label_container">

																			<label class="postLabel"> <b><%=LanguegeBUS.getValue("memo_to_buyer", lang)%></b>
																			</label>
																		</div>

																		<textarea id="memoToBuyer" rows="2" cols="80"
																			name="memoToBuyer"></textarea>
																	</div>
																</div></td>
														</tr>
													</table>
													<br /> <br /> <br /> <br />
													<div style="text-align: center">
														<input type="hidden" id=exchangeOrderID name="id">
														<input id="upload_button" 
															class="btn_submit" type="submit" name="action"
															value="<%=LanguegeBUS.getValue("submit", lang)%>" /> <input
															id="reset_button" name="reset_button" class="btn_submit"
															type="submit"
															value="<%=LanguegeBUS.getValue("cancel", lang)%>" />
													</div>
												</form>
												<div class="clear"></div>
												<br> <br>
											</div>
										</div>
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
		<!--End content-->
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer"></div>
		<!--end footer-->
		<!--End footer-->
	</div>



</body>
</html>