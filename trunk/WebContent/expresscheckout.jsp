<%-- 
    Document   : expresscheckout
    Created on : Jun 2, 2011, 11:20:53 AM
    Author     : admin
--%>
<%@page import="UTIL.ServletUtils"%>
<%@page import="POJO.*"%>
<%@page import="BUS.*"%>
<%@page import="java.util.HashMap"%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	/*==================================================================
	 PayPal Express Checkout Call
	 ===================================================================
	*/
%>
<%@include file="paypalfunctions.jsp" %>
<%

	/*
	'-------------------------------------------
	' The paymentAmount is the total value of 
	' the shopping cart, that was set 
	' earlier in a session variable 
	' by the shopping cart page
	'-------------------------------------------
	*/
		String detailId = (String)request.getParameter("Id");
		Productorderdetail pDetail = ProductorderdetailBUS.getProductorderdetail(Integer.parseInt(detailId),lang); 
		Productorder order = ProductorderBUS.getProductorder(pDetail.getProductorder().getProductOrderId(),lang);
		Products p = ProductBUS.getProducts(pDetail.getProductId(),lang);
		float Payment_Amount = 0;
		 float optionPrice=0,shippingCost=0;
         if(pDetail.getOption() !=null){
         	Options option= OptionBUS.getOptionByID(pDetail.getOption().getOptionId(),lang);
         	if(option!=null){
         		optionPrice=option.getOptionPrice();
         	}
         }
         
			if(null!=p.getDeliverCost()){
				Delivercost dc = DeliverCostBUS.getDeliverCostById(p.getDeliverCost().getDeliverCostId(),lang);	
				Stateorder st = StateorderBUS.getStateorder(order.getStateorder().getStateOrderId(), lang); 
				shippingCost = DeliverCostBUS.getDeliverCostByProduct(p,p.getPrice()*pDetail.getProductNumber(),order.getTransportId(),lang);
				//if(st.getStateOrderId()==1){ 
				//	shippingCost=dc.getCost() ;
				//}else{ 
				//	shippingCost=dc.getCost()+ dc.getFeeExtra();
				//}
			} 
		
			Payment_Amount = ResourcesDefault.getTotalMoney(p.getPrice(),pDetail.getProductNumber(),optionPrice,shippingCost);
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
     		session.setAttribute("CurrentUSDRate",ConvertCurrency.getCurrentUSDRate());
   			session.setAttribute("Payment_Amount",String.valueOf(Payment_Amount));
			String paymentAmount = (String) session.getAttribute("Payment_Amount");

	/*
	'------------------------------------
	' The currencyCodeType and paymentType 
	' are set to the selections made on the Integration Assistant 
	'------------------------------------
	*/

	String currencyCodeType = "USD";
	String paymentType = "Order";

	/*
	'------------------------------------
	' The returnURL is the location where buyers return to when a
	' payment has been succesfully authorized.
	'
	' This is set to the value entered on the Integration Assistant 
	'------------------------------------
	*/

	String returnURL =  ServletUtils.getBaseUrl(request)+"/review.jsp";

	/*
	'------------------------------------
	' The cancelURL is the location buyers are sent to when they hit the
	' cancel button during authorization of payment during the PayPal flow
	'
	' This is set to the value entered on the Integration Assistant 
	'------------------------------------
	*/
	String cancelURL = ServletUtils.getBaseUrl(request)+"/error.jsp";

	/*
	'------------------------------------
	' Calls the SetExpressCheckout API call
	'
	' The CallShortcutExpressCheckout function is defined in the file PayPalFunctions.asp,
	' it is included at the top of this file.
	'-------------------------------------------------
	*/

	HashMap nvp = CallShortcutExpressCheckout (paymentAmount, currencyCodeType, paymentType, returnURL, cancelURL, session);
	String strAck = nvp.get("ACK").toString();
	if(strAck !=null && strAck.equalsIgnoreCase("Success"))
	{
		//' Redirect to paypal.com
		//System.out.print("InSuccess");
		RedirectURL( nvp.get("TOKEN").toString(), response);
	}
	else
	{  
		// Display a user friendly Error on the page using any of the following error information returned by PayPal
		session.removeAttribute("orderDetailID");		
		String ErrorCode = nvp.get("L_ERRORCODE0").toString();
		String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
		String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
		String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
		response.sendRedirect("error.jsp");
	}
%>