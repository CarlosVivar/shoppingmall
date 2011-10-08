<%-- 
    Document   : payment
    Created on : 30-05-2011, 20:07:21
    Author     : Mr Long
--%>
<%@include file="library.jsp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String detailId = (String) request.getParameter("id");
	session.setAttribute("orderDetailID",detailId);

	Productorderdetail pDetail = ProductorderdetailBUS
			.getProductorderdetail(Integer.parseInt(detailId), lang);
	Date d = new Date();
	Productorder order = ProductorderBUS.getProductorder(pDetail
			.getProductorder().getProductOrderId(), lang);

	Products p = ProductBUS.getProducts(pDetail.getProductId(), lang);
	float optionPrice = 0, shippingCost = 0;
	if (pDetail.getOption() != null) {
		Options option = OptionBUS.getOptionByID(pDetail.getOption()
				.getOptionId(), lang);
		if (option != null) {
			optionPrice = option.getOptionPrice();
		}
	}

	if (null != p.getDeliverCost()) {
		Delivercost dc = DeliverCostBUS.getDeliverCostById(p
				.getDeliverCost().getDeliverCostId(), lang);
		Stateorder st = StateorderBUS.getStateorder(order
				.getStateorder().getStateOrderId(), lang);
		shippingCost = DeliverCostBUS.getDeliverCostByProduct(p,
				p.getPrice() * pDetail.getProductNumber(),
				order.getTransportId(), lang);
	}
	float totalOrder=ResourcesDefault.getTotalMoney(p.getPrice(),
			pDetail.getProductNumber(), optionPrice, shippingCost);
	float Payment_Amount=totalOrder;
	if("MALL_VN".equals(lang)){
		//System.out.print("Payment_Amount_VND: "+Payment_Amount);
		Payment_Amount=ConvertCurrency.convertVND_USD(Payment_Amount);
		//System.out.print("Payment_Amount_USD: "+Payment_Amount);
		Payment_Amount=ResourcesDefault.Round(Payment_Amount,2);
		//System.out.print("Payment_Amount_USD: "+Payment_Amount);
	}else if("MALL_KR".equals(lang)){
		Payment_Amount=ConvertCurrency.convertKRWtoUSD(Payment_Amount);
		Payment_Amount=ResourcesDefault.Round(Payment_Amount,2);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("payment", lang)%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/PaymentValidator.js"></script>
<script type="text/javascript">
	$(function() {
		$("#card").hide();
		$("#chuyenkhoan").hide();
		//$("#tienmat").hide();
		$("#paypal").hide();
		$("#nl_checkout").hide();

	});
	function showtab() {
		$("#tab2").hide();		
	}
	function showCC() {
		var loai = $("#paymentType").val();
		switch (loai) {
		case '1':
			$("#card").show();
			$("#chuyenkhoan").hide();
			//$("#tienmat").hide();
			$("#paypal").hide();
			$("#nl_checkout").hide();
			break;
		case '2':
			$("#card").hide();
			$("#chuyenkhoan").show();
			//$("#tienmat").hide();
			$("#paypal").hide();
			$("#nl_checkout").hide();
			break;
		case '3':
			$("#paypal").show();
			$("#card").hide();
			$("#chuyenkhoan").hide();
			//$("#tienmat").hide();
			$("#nl_checkout").hide();
			break;
		case '4':
			$("#card").hide();
			$("#chuyenkhoan").hide();
			//$("#tienmat").show();
			$("#paypal").hide();
			$("#nl_checkout").hide();
			break;		
		case '5':
			$("#card").hide();
			$("#chuyenkhoan").hide();
			//$("#tienmat").hide();
			$("#paypal").hide();
			$("#nl_checkout").show();
			break;
	}
	}
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
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/leftmenu.jsp"%>
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
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<div class="tube">
															<Br>
															<h2><%=LanguegeBUS.getValue("pMethod", lang)%></h2>
															<br> <br>


															<h1><%=LanguegeBUS.getValue("payGuide", lang)%></h1>

															<div id="bill" style="font-size: 12pt">


																<table class="carttable" style="font-size: 10pt">

																	<tr>
																		<th class="label"><%=LanguegeBUS.getValue("paymentwith", lang)%>:</th>
																		<td><select id="paymentType" name="paymentType"
																			onchange="showCC();" style="width: 150px">
																				<option value="0">
																					--<%=LanguegeBUS.getValue("pMethod", lang)%>--
																				</option>
																				<%
																				//System.out.print("p.getAmount(): "+p.getAmount());
																				//System.out.print("account: "+p.getUser().getAccount());
																				Nganluong nganluong=NganLuongBUS.getNganLuongBySellerAccount(p.getUser().getAccount(),lang);
																					List<Paymentmethod> lstPM = PaymentMethodBUS.lstPaymentmethod(lang);
																					for (int i = 0; i < lstPM.size(); i++) {
																						Paymentmethod pm = (Paymentmethod) lstPM.get(i);
																						
																						//System.out.print("bank.getNganLuongAccount(): "+bank.getNganLuongAccount());
																						
																				%>
																				<option value="<%=pm.getPaymentMethodId()%>"><%=pm.getPaymentMethodName()%></option>

																			<%
																					}
																				%>
																				
																		</select>
																		</td>
																	</tr>
																</table>
																<br> <br>

																

																<div id="paypal" style="font-size: 11.5px">
																	<fieldset>
																		<legend>
																			<%=LanguegeBUS.getValue("accpaypal", lang)%>
																		</legend>
																		<div>
																			<br>
																			
																			<form
																				action='expresscheckout.jsp?Id=<%=pDetail.getProductOrderDetailId()%>'
																				METHOD='POST'>
																				<%if(!("MALL_EN".equals(lang))){ %>
																						<div>
																						<%=LanguegeBUS.getValue("total",lang) %>:&nbsp; <%=totalOrder %>&nbsp;<%=LanguegeBUS.getValue("dolar",lang) %> (<%=Payment_Amount %>&nbsp;USD)
																						</div>
																						<br>
																					<%} %>
																				<p align="center">
																					
																					<input type='image' name='submit'
																						src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif'
																						border='0' align='top' alt='Check out with PayPal' />
																				</p>
																			</form>
																			<br> <br>
																			<p align="center">
																				<img alt="Payment Paypal"
																					src="css/images/paypal.png" width="550"
																					height="250">
																			</p>
																		</div>
																	</fieldset>
																</div>



																<div id="chuyenkhoan" style="font-size: 12px">
																	<fieldset>
																		<legend>
																			<%=LanguegeBUS.getValue("tranfer", lang)%>
																		</legend>
																		<div>
																			<br>
																			<p><%=LanguegeBUS.getValue("t1a", lang)%>
																				<b>( 									
																				 <%=totalOrder%> &nbsp;<%=LanguegeBUS.getValue("dolar", lang)%>)</b>
																				<%=LanguegeBUS.getValue("t1b", lang)%></p>
																			<br>
																			<p>
																				<b><%=LanguegeBUS.getValue("note", lang)%>:</b>
																				<%=LanguegeBUS.getValue("t2a", lang)%>
																				(<b>HD00<%=order.getProductOrderId()%>/<%=d.getYear() + 1900%></b>)
																				<%=LanguegeBUS.getValue("t2b", lang)%></p>
																			<br />
																			<table style="border-collapse: collapse;" border="0"
																				cellpadding="0" cellspacing="0">
																				<tr class="aven" style="font-size: 12px">
																					<th class="first"
																						style="border: 1pt solid #808080; width: 5%; height: 25px;"><%=LanguegeBUS.getValue("no.", lang)%></th>
																					<th style="border: 1pt solid #808080; width: 20%"><%=LanguegeBUS.getValue("accountname", lang)%></th>
																					<th style="border: 1pt solid #808080; width: 15%"><%=LanguegeBUS.getValue("accountnumber", lang)%></th>

																					<th style="border: 1pt solid #808080; width: 30%"><%=LanguegeBUS.getValue("banking", lang)%></th>

																				</tr>
																				<%
																					Bank b = BankBUS.getBank(p.getUser(), lang);
																					String holder = "";
																					String cccNum = "";
																					String banking = "";
																					if (null != b) {
																						holder = b.getAccountholders();
																						cccNum = b.getAccountNumber();
																						banking = b.getBanking();
																					}
																				%>
																				<tr>
																					<td class="first" align="center"
																						style="border: 1pt solid #808080; height: 30px">
																						1</td>
																					<td style="border: 1pt solid #808080;" align="left">

																						<%=holder%></td>
																					<td style="border: 1pt solid #808080;"
																						align="center"><%=cccNum%></td>


																					<td style="border: 1pt solid #808080;" align="left">
																						<%=banking%></td>

																				</tr>

																			</table>

																			<br> <br> <br>
																			<hr>
																			------------------------------------------------------------------
																			<p>
																				&nbsp;+
																				<%=LanguegeBUS.getValue("t3", lang)%>
																			</p>
																			<p>
																				&nbsp;+
																				<%=LanguegeBUS.getValue("t4", lang)%>
																			</p>
																			<br>
																			<form action="paymentControler" method="POST">
																				<input type="hidden" name="act" value="CK" /> <input
																					type="hidden" name="pType" value="2" /> <input
																					type="hidden" name="orderId"
																					value="<%=pDetail.getProductOrderDetailId()%>" />
																				<p align="left">
																					<BUTTON type="submit" class="button marginleft110">
																						<SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("confirm", lang)%></SPAN>
																						</SPAN> </SPAN>
																					</BUTTON>
																				</p>
																			</form>
																		</div>
																	</fieldset>
																</div>
																
																<div id="nl_checkout" style="font-size: 11.5px">
																	<fieldset>
																		<legend>
																			<%=LanguegeBUS.getValue("nl_nganluong", lang)%>
																		</legend>
																		<div>
																			<%		
																			
																			
																			int total=Float.valueOf(totalOrder).intValue();
																			if("MALL_EN".equals(lang)){
																				
																				total=ConvertCurrency.convertUSDtoVND(totalOrder);
																			}else if("MALL_KR".equals(lang)){
																				
																				total=ConvertCurrency.convertKRWtoVND(totalOrder);
																			}
																				String returnURL = ResourcesDefault.RETURN_ULR;
																				//System.out.print("nganluong.getReceiver(): "+nganluong.getReceiver());
																				String receiver = (nganluong!=null)?nganluong.getReceiver(): ResourcesDefault.RECEIVER;
																				String transactionInfo = "Payment for shopping";
																				String orderCode = (pDetail != null) ? pDetail.getProductOrderDetailId()+"" : "0";
																				String price = total+"";
																				//System.out.print("total: "+price);
																				String url_nl = NL_Checkout.buildCheckoutUrl(returnURL, receiver,
																						orderCode, price, transactionInfo);
																			%>
																			<%if(!("MALL_VN".equals(lang))){ %>
																			<div>
																			<%=LanguegeBUS.getValue("total",lang) %> <%=totalOrder %>&nbsp;<%=LanguegeBUS.getValue("dolar",lang) %> (<%=total %>&nbsp;VND)
																			</div>
																			<br>
																			<%} %>
																			<a target="_parent"  href="<%=url_nl%>"> <img 
																				src="https://www.nganluong.vn/data/images/buttons/11.gif" />
																			</a>
																		</div>
																	</fieldset>
																</div>
															</div>
															<br> <br>

															<%
																String message = (String) request.getAttribute("Message");
																if (message != null) {
																	out.println("<p align='center'><font size='3pt' color='blue'>"
																			+ message + "</font></p>");
																}
															%>



															<div class="footer blog">
																<%@include file="WEB-INF/footer.jsp"%>
															</div>
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


				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>
				</DIV>

			</DIV>



		</DIV>
	</DIV>
</body>
</html>

