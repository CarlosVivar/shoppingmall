<%-- 
    Document   : review
    Created on : Jun 2, 2011, 10:15:33 AM
    Author     : admin
--%>
<%@include file="library.jsp" %>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
        HashMap nvp; 
%>
<%
	/*==================================================================
	 PayPal Express Checkout Call
	 ===================================================================
	*/
/* 
	This step indicates whether the user was sent here by PayPal 
	if this value is null then it is part of the regular checkout flow in the cart
*/

String token = (String)session.getAttribute("TOKEN");
//String token = request.getAttribute("token").toString();
if ( token != null)
{
%>
<%@include file="paypalfunctions.jsp" %>
<%
	/*
	'------------------------------------
	' Calls the GetExpressCheckoutDetails API call
	'
	' The GetShippingDetails function is defined in PayPalFunctions.jsp
	' included at the top of this file.
	'-------------------------------------------------
	*/
	
	nvp = GetShippingDetails(token, session);
	String strAck = nvp.get("ACK").toString();
        if(false)
	//if(strAck != null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")))
	{
		String email 			= nvp.get("EMAIL").toString(); // ' Email address of payer.
		String payerId 			= nvp.get("PAYERID").toString(); // ' Unique PayPal customer account identification number.
		String payerStatus		= nvp.get("PAYERSTATUS").toString(); // ' Status of payer. Character length and limitations: 10 single-byte alphabetic characters.
		String salutation		= nvp.get("SALUTATION").toString(); // ' Payer's salutation.
		String firstName		= nvp.get("FIRSTNAME").toString(); // ' Payer's first name.
		String middleName		= nvp.get("MIDDLENAME").toString(); // ' Payer's middle name.
		String lastName			= nvp.get("LASTNAME").toString(); // ' Payer's last name.
		String suffix			= nvp.get("SUFFIX").toString(); // ' Payer's suffix.
		String cntryCode		= nvp.get("COUNTRYCODE").toString(); // ' Payer's country of residence in the form of ISO standard 3166 two-character country codes.
		String business			= nvp.get("BUSINESS").toString(); // ' Payer's business name.
		String shipToName		= nvp.get("SHIPTONAME").toString(); // ' Person's name associated with this address.
		String shipToStreet		= nvp.get("SHIPTOSTREET").toString(); // ' First street address.
		String shipToStreet2	= nvp.get("SHIPTOSTREET2").toString(); // ' Second street address.
		String shipToCity		= nvp.get("SHIPTOCITY").toString(); // ' Name of city.
		String shipToState		= nvp.get("SHIPTOSTATE").toString(); // ' State or province
		String shipToCntryCode	= nvp.get("SHIPTOCOUNTRYCODE").toString(); // ' Country code. 
		String shipToZip		= nvp.get("SHIPTOZIP").toString(); // ' U.S. Zip code or other country-specific postal code.
		String addressStatus 	= nvp.get("ADDRESSSTATUS").toString(); // ' Status of street address on file with PayPal   
		String invoiceNumber	= nvp.get("INVNUM").toString(); // ' Your own invoice or tracking number, as set by you in the element of the same name in SetExpressCheckout request .
		String phonNumber		= nvp.get("PHONENUM").toString(); // ' Payer's contact telephone number. Note:  PayPal returns a contact telephone number only if your Merchant account profile settings require that the buyer enter one. 

		/*
		' The information that is returned by the GetExpressCheckoutDetails call should be integrated by the partner into his Order Review 
		' page		
		*/
	}
        //else
        if(false)	
	{  
		// Display a user friendly Error on the page using any of the following error information returned by PayPal
		
		String ErrorCode = nvp.get("L_ERRORCODE0").toString();
		String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
		String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
		String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
	}
}
		
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment review</title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
	        $(document).ready(function() {   
	                $('#s1').cycle('fade');
	        });
        </script>
    </head>
    <body>
    	<DIV class="site-container">
        <DIV class="page">
            
       <!-- ---------Begin Header--------------------- -->     
        <DIV class="header">	

            <%@include file="WEB-INF/header.jsp" %>
        </DIV>    
        <!-- -------------MIDDLE------------- -->
        <DIV class="col3-layout">
         <div class="clear"></div>
	        <div style="display: block;" class="ctnAlert">	
					 <div style="height: 208px;" class="spyWrapper">
					 <ul class="ctnAlert_inside spy">
					 
					 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>
					   </a>&nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="" class="viewmore"><%=LanguegeBUS.getValue("payment", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">
            	<DIV class="border-left">

                                <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                                <DIV class="corner-right-top">
                                                        <DIV class="corner-left-bot">
                                                                <DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">
		        <h2>Review payment information!</h2><br/>
		        
		        <ul style="margin-left:30px;line-height:18px">
		            <% 
		            	Set<String> keys = nvp.keySet();
		                Object[] key = keys.toArray();
		                Collection<String> values = nvp.values();
		                Object[] value = values.toArray();
		                for(int i=0;i<key.length;i++){
		            %>
		            <li> <b><%=key[i].toString() %></b> = <%=value[i].toString()%> </li>
		           <%  }  %>
		        </ul>    
		        <br/>
		        <form action='confirm.jsp' METHOD='POST'>
		        	<input type='image' name='submit' src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif' border='0' align='top' alt='Check out with PayPal'/>
		        </form>
		        
		        <br><br>
                <center>
                <img alt="Payment Paypal" src="css/images/paypal.png" width="600" height="250">
                </center> 
                
		        </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
	 		</DIV>  
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
        
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
            var pageTracker = _gat._getTracker("UA-5793468-6");
            pageTracker._trackPageview();
            } catch(err) {}
        </script>
        </DIV></DIV>	        
    </body>
</html>
