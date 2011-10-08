<%-- 
    Document   : review
    Created on : Jun 2, 2011, 10:15:33 AM
    Author     : admin
--%>
<%@include file="library.jsp"%>
<%@page import="POJO.*"%>
<%@page import="BUS.*"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!HashMap nvp=null;%>
<%
	/*==================================================================
	 PayPal Express Checkout Call
	 ===================================================================
	 */
	String token = (String) session.getAttribute("TOKEN");
	if (token != null) {
%>
<%@include file="paypalfunctions.jsp"%>
<%
	/*
							'------------------------------------
							' Get the token parameter value stored in the session 
							' from the previous SetExpressCheckout call
							'------------------------------------
		 */
		//String token =  session.getAttribute("TOKEN")toString();

		/*
		'------------------------------------
		' The paymentAmount is the total value of 
		' the shopping cart, that was set 
		' earlier in a session variable 
		' by the shopping cart page
		'------------------------------------
		 */
		float Payment_Amount = 0;
		if (session.getAttribute("orderDetailID") != null) {
			/*String detailId = (String) session
					.getAttribute("orderDetailID");

			Productorderdetail pDetail = ProductorderdetailBUS
					.getProductorderdetail(Integer.parseInt(detailId),
							lang);
			Productorder order = ProductorderBUS
					.getProductorder(pDetail.getProductorder()
							.getProductOrderId(), lang);
			Products p = ProductBUS.getProducts(pDetail.getProductId(),
					lang);

			float optionPrice = 0, shippingCost = 0;
			if (pDetail.getOption() != null) {
				Options option = OptionBUS.getOptionByID(pDetail
						.getOption().getOptionId(), lang);
				if (option != null) {
					optionPrice = option.getOptionPrice();
				}
			}

			if (null != p.getDeliverCost()) {
				Delivercost dc = DeliverCostBUS.getDeliverCostById(p
						.getDeliverCost().getDeliverCostId(), lang);
				Stateorder st = StateorderBUS.getStateorder(order
						.getStateorder().getStateOrderId(), lang);
				shippingCost = DeliverCostBUS.getDeliverCostByProduct(
						p, p.getPrice() * pDetail.getProductNumber(),
						order.getTransportId(), lang);
			}

			Payment_Amount = ResourcesDefault.getTotalMoney(
					p.getPrice(), pDetail.getProductNumber(),
					optionPrice, shippingCost);*/
		

		//session.setAttribute("Payment_Amount",String.valueOf(Payment_Amount));
		String finalPaymentAmount = session.getAttribute(
				"Payment_Amount").toString();
		/*
		'------------------------------------
		' Calls the DoExpressCheckoutPayment API call
		'
		' The ConfirmPayment function is defined in the file PayPalFunctions.jsp,
		' that is included at the top of this file.
		'-------------------------------------------------
		 */

		nvp = ConfirmPayment(finalPaymentAmount, session, request);
		session.removeAttribute("TOKEN");
		session.removeAttribute("Payment_Amount");
		String strAck = nvp.get("ACK").toString();
		if (false)
		//if(strAck !=null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")))
		{
			/*
			'********************************************************************************************************************
			'
			' THE PARTNER SHOULD SAVE THE KEY TRANSACTION RELATED INFORMATION LIKE 
			'                    transactionId & orderTime 
			'  IN THEIR OWN  DATABASE
			' AND THE REST OF THE INFORMATION CAN BE USED TO UNDERSTAND THE STATUS OF THE PAYMENT 
			'
			'********************************************************************************************************************
			 */

			String transactionId = nvp.get("TRANSACTIONID").toString(); // ' Unique transaction ID of the payment. Note:  If the PaymentAction of the request was Authorization or Order, this value is your AuthorizationID for use with the Authorization & Capture APIs. 
			String transactionType = nvp.get("TRANSACTIONTYPE")
					.toString(); //' The type of transaction Possible values: l  cart l  express-checkout 
			String paymentType = nvp.get("PAYMENTTYPE").toString(); //' Indicates whether the payment is instant or delayed. Possible values: l  none l  echeck l  instant 
			String orderTime = nvp.get("ORDERTIME").toString(); //' Time/date stamp of payment
			String amt = nvp.get("AMT").toString(); //' The final amount charged, including any shipping and taxes from your Merchant Profile.
			String currencyCode = nvp.get("CURRENCYCODE").toString(); //' A three-character currency code for one of the currencies listed in PayPay-Supported Transactional Currencies. Default: USD. 
			String feeAmt = nvp.get("FEEAMT").toString(); //' PayPal fee amount charged for the transaction
			String settleAmt = nvp.get("SETTLEAMT").toString(); //' Amount deposited in your PayPal account after a currency conversion.
			String taxAmt = nvp.get("TAXAMT").toString(); //' Tax charged on the transaction.
			String exchangeRate = nvp.get("EXCHANGERATE").toString(); //' Exchange rate if a currency conversion occurred. Relevant only if your are billing in their non-primary currency. If the customer chooses to pay with a currency other than the non-primary currency, the conversion occurs in the customer’s account.

			/*
			' Status of the payment: 
					'Completed: The payment has been completed, and the funds have been added successfully to your account balance.
					'Pending: The payment is pending. See the PendingReason element for more information. 
			 */

			String paymentStatus = nvp.get("PAYMENTSTATUS").toString();

			/*
			'The reason the payment is pending:
			'  none: No pending reason 
			'  address: The payment is pending because your customer did not include a confirmed shipping address and your Payment Receiving Preferences is set such that you want to manually accept or deny each of these payments. To change your preference, go to the Preferences section of your Profile. 
			'  echeck: The payment is pending because it was made by an eCheck that has not yet cleared. 
			'  intl: The payment is pending because you hold a non-U.S. account and do not have a withdrawal mechanism. You must manually accept or deny this payment from your Account Overview. 		
			'  multi-currency: You do not have a balance in the currency sent, and you do not have your Payment Receiving Preferences set to automatically convert and accept this payment. You must manually accept or deny this payment. 
			'  verify: The payment is pending because you are not yet verified. You must verify your account before you can accept this payment. 
			'  other: The payment is pending for a reason other than those listed above. For more information, contact PayPal customer service. 
			 */

			String pendingReason = nvp.get("PENDINGREASON").toString();

			/*
			'The reason for a reversal if TransactionType is reversal:
			'  none: No reason code 
			'  chargeback: A reversal has occurred on this transaction due to a chargeback by your customer. 
			'  guarantee: A reversal has occurred on this transaction due to your customer triggering a money-back guarantee. 
			'  buyer-complaint: A reversal has occurred on this transaction due to a complaint about the transaction from your customer. 
			'  refund: A reversal has occurred on this transaction because you have given the customer a refund. 
			'  other: A reversal has occurred on this transaction due to a reason not listed above. 
			 */

			String reasonCode = nvp.get("REASONCODE").toString();
		}
		//else
		if (false) {
			// Display a user friendly Error on the page using any of the following error information returned by PayPal

			String ErrorCode = nvp.get("L_ERRORCODE0").toString();
			String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0")
					.toString();
			String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
			String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0")
					.toString();
		}
	}}else{
		//System.out.print("adf");
		response.sendRedirect("unavailable.jsp");
	}
		
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("payment", lang)%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/PaymentValidator.js"></script>

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
														<div class="tube" style="line-height:18px">
															<%
															String strAck="";
															if(nvp!=null){
																strAck = (String) nvp.get("ACK");
															}
															if (strAck.equalsIgnoreCase("Success")) {
															%>
															<br>
															<h4><%=LanguegeBUS.getValue("payment_successfull",lang) %></h4>
															<div>
																<%=LanguegeBUS.getValue("comeback",lang) %>&nbsp;<a href="order.html"><%=LanguegeBUS.getValue("shopping_list", lang)%></a>
															</div>
															
															<%		if(session.getAttribute("orderDetailID")!=null){
																//System.out.print("confirm1");
																final String orderCode=(String)session.getAttribute("orderDetailID");		
																//System.out.print("confirm2: "+orderCode);
																TransactionMethod transaction=new TransactionMethod(){
																protected void doMethod(org.hibernate.Session session, String lang){
																	//System.out.print("confirm2");
																	Productorderdetail pODetail= ProductorderdetailBUS.getProductorderdetail(Integer.parseInt(orderCode), lang);
																	pODetail.setOrderDetailStatusId(2);
																	update(pODetail, session);
																	//System.out.print("confirm3");
																	Deliver deliver=DeliverBUS.getDeliverByPODetail(Integer.parseInt(orderCode), lang);
																	deliver.setDeliverstatusID(1);
																	update(deliver, session);
																	
																}
																
															};
															transaction.executeTransaction(lang);
															session.removeAttribute("orderDetailID");
															}else{
																response.sendRedirect("unavailable.jsp");
															}
																
																}else{session.removeAttribute("orderDetailID");
															%>
															<br>
															<h4><%=LanguegeBUS.getValue("payment_fault",lang) %></h4>
															<%} %>
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

