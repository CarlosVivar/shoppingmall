<%@page import="CONTROLLER.DeliverStatusController"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<%
	List<DeliverView> delivers = (List<DeliverView>) request
			.getAttribute("delivers");
	//String hadLoad = (String) request.getAttribute("hadLoad");
	String seller = (String) session.getAttribute("username");
	
	if (delivers == null) {
		String url = "/DeliverstatusController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
	NavigationInfo pagedcust = (NavigationInfo)request.getAttribute("pagedcust"); 
	String baseURL=ServletUtils.getBaseUrl(request);
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
	$(function() {
		
		document.getElementById('quantity').disabled=true;
		//$("#invalidQuantity").hide();

	});

	function IsNumeric(evt)
    {
        var key = (evt.which) ? evt.which : window.event.keyCode;
        //var alphaExp = /^[a-zA-Z\s\,\?\/\.\;\:\'\"\-\=\[\]\|\`]+$/;   
        var alphaExp = /^[\d\b]+$/;
        var keyChar = String.fromCharCode(key);
        if (keyChar.valueOf().match(alphaExp)){
            return true;
        }
        return false;
    }
	//function IsNumeric(input){
	 //   var RE = /^-{0,1}\d*\.{0,1}\d+$/;
	//    return (RE.test(input));
	//}


	function isNotEmpty(elem) {		
			var str = elem;
			var re = /.+/;
			if (!str.match(re)) {
				//$("#invalidQuantity").show();
				return false;
			} else {
				//$("#invalidQuantity").hide();
				return true;
			}
	
		
	}
	function validOnkeyUp(elem) {
		if(IsNumeric(elem)){			
			if (document.getElementById("quantity").value.length==0) {
				//$("#invalidQuantity").show();
				return false;
			} else {
				//$("#invalidQuantity").hide();
				return true;
			}
		}
		
	}
	
	function validateForm(form) {
	    if (isNotEmpty(form.quantity.value)) {
	              return true;	            
	    }
	    else{
	    	alert("<%=LanguegeBUS.getValue("de_status_alert_select_record",
					lang)%>");
	    	return false;
	    }
	}

	function focusElement(formName, elemName) {
		var elem = document.forms[formName].elements[elemName].hiden();
		elem.focus();
		elem.select();
	}
	

	
</script>

<script type="text/javascript">
	
<%DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String currentDate = dateFormat.format(date);%>
			
	function addContentToEditForm(productOrderID, productID, receiver,
			deliverAddress, productName, quantity, Deliverstatus, orderDate,
			deliverID, productOrderDetailID, orderStatus,ShippingCompanyName,options) {
		
<%if (delivers != null) {
				for (DeliverView dView : delivers) {%>
	var poID = productOrderID;
		var receiver = receiver;
		var deliverAddress = deliverAddress;
		var deliverstatus = Deliverstatus;
		
		if (productOrderDetailID == <%=dView.getProductOrderDetailId()%>) {	
			
			//document.getElementById('quantity').disabled=false;
			document.getElementById('productOrderID').value = poID;
			document.getElementById('ProductName').value = productName;
			document.getElementById('options').value = options;
			document.getElementById('quantity').value = quantity;
			document.getElementById('orderDate').value = orderDate;
			document.getElementById('receiver').value = receiver;
			document.getElementById('deliverAddress').value = deliverAddress;
			document.getElementById('orderStatus').value = orderStatus;			
			
			
			document.getElementById("submit").value = productOrderDetailID
					+ " " + deliverID;
			//document.forms["formSubmit"].elements["productID"].value=productOrderDetailID;
			//alert("aadf");
			var x = document.getElementById("Deliverstatus");
			//var option;
			var i=0;
			//alert("Ship Estimated "=="Ship Estimated");
			//for (i = 0; i < x.length; i++) {
			//	option = x.options[i].text;
				//alert(Deliverstatus);
				//alert(option);
				//alert(Deliverstatus == option);
				
			//	if (deliverstatus==option) {
				//	x.options[i].selected = "selected";
				//}
			//}
			//remove options of deliverstatus
			removeOptionDeliverStatus();
			<%
			Deliver de=DeliverBUS.getDeliverByPODetail(dView.getProductOrderDetailId(),lang);
				List<Deliverstatus> listDeliverstatus = DeliverStatusBUS.getList(lang);
				for (Deliverstatus deliverstatus : listDeliverstatus) {
					String status = deliverstatus.getDeliverStatus().trim();
					String id = deliverstatus.getDeliverStatusId() + "";
					if(deliverstatus.getDeliverStatusId().intValue()>=de.getDeliverstatusID()){
				%>
				 var newOption = document.createElement('option');
				 newOption.text = "<%=deliverstatus.getDeliverStatus()%>";
				 newOption.value = "<%=deliverstatus.getDeliverStatusId()%>";

				x.options.add(newOption,i);
				i++;
				<%}}%>
			
			var x_ = document.getElementById('selectShippingCompany');
			var option_;
			var i_;
			for (i_ = 0; i_ < x_.length; i_++) {
				option_ = x_.options[i_].text;
				
				if (ShippingCompanyName == option_) {
					x_.options[i_].selected = "selected";
					document.getElementById("shippingCompanyName").value=ShippingCompanyName;
				}
			}
		
			document.getElementById("deliverIDForShipping").value=deliverID;
			document.getElementById("deliverIDShippingValue").value=deliverID;
			
			//setFocus
			document.getElementById("Deliverstatus").focus();
			
			//scroll to the bottom window
			<%=ResourcesDefault.loadCrollBottom()%>
			
		}

<%}
			}%>
	}
	function removeOptionDeliverStatus(){
		var x = document.getElementById("Deliverstatus");
		var i;
		for (i = x.length - 1; i>=0; i--) {
			x.remove(i);
		}
	}
</script>

<script type="text/javascript">

function fillShippingCompanyName(select){	
	if(select.value != "0"){
		var val=select.options[select.selectedIndex].text;
		document.manageDeliverStatus.shippingCompanyName.value=val;
		document.manageDeliverStatus.shippingCompanyName.disabled=true;
	}
	else {
		document.manageDeliverStatus.shippingCompanyName.value="";
	
	}

}

function onClickConfirm(){
	
	
		var val=document.getElementById("deliverIDForShipping").value;
		if(val!=""){
			
			if(document.manageDeliverStatus.selectShippingCompany.value == "0"){
				alert("<%=LanguegeBUS.getValue("de_status_shipping_company", lang)%>");
			}
			else{
				
				document.getElementById("confirmValue").value=val;
			}			
		}
		else{
			alert("<%=LanguegeBUS.getValue("de_status_alert_select_record",
					lang)%>");
		}
}

function resetConfirmValue(){
	document.getElementById("confirmValue").value="";
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
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("delistatus", lang)%></a>
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
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("delistatus", lang)%></label>
				</p>

				<p>
					<b><%=LanguegeBUS.getValue("delistatus", lang)%>:</b><%=LanguegeBUS.getValue("sh_h_introduce", lang)%>:
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
											class="title_deli"><%=LanguegeBUS.getValue("deli_manage_detail", lang)%>
										</label>
									</div>
									<div class="space"></div>
									<div>
										<form name="formSubmit" method="post"
											action="<%=ServletUtils.getBaseUrl(request)%>/DeliverstatusController">
											<%if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){	
														              %>
														              <input type="hidden" name="page" value="<%=pagedcust.getCurrentPage()%>"/> 
														            <%} %> 
											<table id="" class=table_deli border="0" cellpadding="0"
												style="width: 730px;" cellspacing="0">
												<tbody>
													<tr>

														<td
															style="text-align: left !important; padding-left: 10px !important; background-color: #cccccc"><%=LanguegeBUS.getValue("deli_deliver_status", lang)%>
														</td>
														<td class="lstitle" style="text-align: left !important;">
															<select name="Deliverstatus" style="width: 100px">
																<option value="-1"><%=LanguegeBUS.getValue("sh_all", lang)%></option>
																<%
																	List<Deliverstatus> listDeliverstatusForSearch = DeliverStatusBUS
																			.getList(lang);

																	for (Deliverstatus Deliverstatus : listDeliverstatusForSearch) {
																		String status = Deliverstatus.getDeliverStatus();
																		String id = Deliverstatus.getDeliverStatusId() + "";
																		if(Deliverstatus.getDeliverStatusId()!=1){
																%>
																<option value="<%=id%>"><%=status%></option>
																<%
																	}}
																%>
														</select></td>
														<td style="background-color: #cccccc"><%=LanguegeBUS.getValue("deli_selected_view", lang)%>
														</td>
														<td class="lstitle"><select style="width: 100px"
															name="selectView">
																<option value="-1"><%=LanguegeBUS.getValue("sh_all", lang)%></option>
																<option value="Order id"><%=LanguegeBUS.getValue("deli_order_id", lang)%></option>
																<option value="Receiver name"><%=LanguegeBUS.getValue("deli_receiver_name", lang)%></option>
																<option value="Buyer name"><%=LanguegeBUS.getValue("deli_buyer_name", lang)%></option>
														</select>
														</td>
														<td class="lstitle" width="100px"><input type="text"
															name="txtSelectView" style="width: 100px !important" />
														</td>
													</tr>
													<tr>
														<td
															style="text-align: left !important; padding-left: 10px; background-color: #cccccc"><%=LanguegeBUS.getValue("deli_select_date", lang)%></td>
														<td class="lstitle" align="left" style="padding-left: 0px"
															colspan="2">
															<div align="left">
																<table>
																	<tr>
																		<td style="border-bottom: none; padding-left: 3px"><select
																			name="selectedDate" style="width: 100px">
																				<option value="-1"><%=LanguegeBUS.getValue("sh_all", lang)%></option>
																				<option value="Order date"><%=LanguegeBUS.getValue("deli_order_date", lang)%></option>

																				<option value="finished date"><%=LanguegeBUS.getValue("deli_finished_date", lang)%></option>
																		</select>
																		</td>
																		<td
																			style="border-right: none !important; border-bottom: none !important; width: 400px; text-align: left;">
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
																	</tr>

																</table>
															</div></td>
														<td class="lstitle"></td>

														<td class="lstitle"><button type="submit" name="view"
																value="view"><%=LanguegeBUS.getValue("deli_view", lang)%></button>
														</td>
													</tr>

												</tbody>
											</table>
										</form>
									</div>
									<div class="space"></div>
									<div class="line_gray"></div>
									<div class="space"></div>
									<div
										style="overflow: auto;<%if (delivers != null && delivers.size() > 5) {%>delivers != null<%}%>; width: 740px">
										
                                    			<%       
                                    			
									                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
									                	
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(!pagedcust.isFirstPage()){%>
					                              <span ><a href="<%=baseURL%>/sale/deliverstatus.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>&nbsp;&nbsp;
					                               <% }
					                               if(pagedcust.hasIndexPrev()){
					                            	   %>
					                            	    <span><a href="<%=baseURL%>/sale/deliverstatus.html?page=<%=pagedcust.getIndexPrev()%>" ><%=LanguegeBUS.getValue("prev.",lang) %></a></span>
					                               <%}
									                	 for(int i=pagedcust.getIndexStart();i<pagedcust.getIndexLast();i++){
									                		 if(i!=pagedcust.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="<%=baseURL%>/sale/deliverstatus.html?page=<%=i%>" ><%=i+1%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i+1%></span>
									                 <%}
									                	 }
									                	
									               if(pagedcust.hasIndexNext()){									            	 
									            	   %>
									            	   <span><a href="<%=baseURL%>/sale/deliverstatus.html?page=<%=pagedcust.getIndexNext()%>" ><%=LanguegeBUS.getValue("next",lang) %></a></span>
									               <%}
									                	if(pagedcust.isLastPage()==false){	 
									                 %>
					                              &nbsp;&nbsp;<span ><a href="<%=baseURL%>/sale/deliverstatus.html?page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    
										<table class="table_ucp" border="0" cellpadding="0"
											cellspacing="0" width="1700">
											<tbody>
												<tr>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_no", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("de_delvier_id", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_order_id", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_product_id", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_deliver_status", lang)%></td>
													<td class="lstitle" style="color: black" width="200"><%=LanguegeBUS.getValue("deli_receiver", lang)%></td>
													<td class="lstitle" style="color: black" width="200"><%=LanguegeBUS.getValue("deli_receiving_address", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_deliver_type", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("de_status_shipping_company", lang)%></td>
													<td class="lstitle" style="color: black" width="300"><%=LanguegeBUS.getValue("deli_product_name", lang)%></td>
													<td class="lstitle" style="color: black" width="300"><%=LanguegeBUS.getValue("option", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_quantity", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_promotion_product", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_confirms_payment", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_order_date", lang)%></td>
												</tr>
												<%
													if (delivers != null) {
														int count = 0;
														for (DeliverView deliverView : delivers) {
															String TransportName = deliverView.getTransportName();
															String Deliverstatus = deliverView.getDeliverstatus().trim();
															String Reciever = deliverView.getReciever();
															String ProductOrderID = deliverView.getProductOrderID()
																	+ "";
															String ProductID = deliverView.getProductID() + "";
															String ProductName = deliverView.getProductName();
															String ProductNumber = deliverView.getProductNumber() + "";
															String PromotionType = deliverView.getPromotionType();
															String StateOrderName = deliverView.getStateOrderName();
															String OrderDate = deliverView.getOrderDate();
															String DeliverID = deliverView.getDeliverID() + "";
															String productOrderDetailID = deliverView
																	.getProductOrderDetailId() + "";
															String ShippingCompanyName = deliverView
																	.getShippingCompanyName();
															String option="";
															if(deliverView.getOption()!=null){
																option=deliverView.getOption();
															}
															count++;
												%>

												<tr class="order_row"
													onmouseover="this.style.backgroundColor='#FFEBDA'"
													onmouseout="this.style.backgroundColor='#FFFFFF'"
													onmousedown="this.style.backgroundColor='#FFEBDA'"
													onclick="addContentToEditForm('<%=ProductOrderID%>', '<%=ProductID%>','<%=Reciever%>', '<%=deliverView.getAddress()%>',
													 '<%=ProductName%>', '<%=ProductNumber%>', '<%=Deliverstatus%>','<%=OrderDate%>','<%=DeliverID%>',
													 '<%=productOrderDetailID%>','<%=StateOrderName%>','<%=ShippingCompanyName%>','<%=option%>')">
													<td class="nonSearch"><label><%=count%></label></td>
													<td class="nonSearch"><label><%=DeliverID%></label></td>
													<td class="nonSearch"><label><%=ProductOrderID%></label>
													</td>
													<td class="nonSearch"><label><%=ProductID%></label>
													</td>
													<td class="nonSearch"><label><%=Deliverstatus%></label>
													</td>
													<td class="nonSearch"><label><%=Reciever%></label></td>
													<td class="nonSearch"><label><%=deliverView.getAddress()%></label>
													</td>
													<td class="nonSearch"><label><%=TransportName%></label>
													</td>
													<td class="nonSearch"><label>
															<%
																if (ShippingCompanyName != null) {
															%><%=ShippingCompanyName%>
															<%
																} else {
															%>--<%
																}
															%>
													</label></td>
													<td class="nonSearch"><label><%=ProductName%></label>
													</td>
													<td class="nonSearch"><label><%=option%></label>
													</td>
													<td class="nonSearch"><label><%=ProductNumber%></label>
													</td>
													<td class="nonSearch"><label> <%
 	if (PromotionType != null) {
 %><%=PromotionType%> <%
 	} else {
 %> -- <%
 	}
 %> </label>
													</td>
													<td class="nonSearch"><label><%=StateOrderName%></label>
													</td>
													<td class="nonSearch"><label><%=OrderDate%></label></td>

												</tr>
												<%
													}

													} else {
												%><tr>
													<td colspan="11"><label><%=LanguegeBUS.getValue("deli_message_have_not_order",
						lang)%></label></td>
												</tr>
												<%
													}
												%>
												
												
											</tbody>
										</table>
									</div>
									<div class="space"></div>
									<div class="line_gray"></div>
									<div class="space"></div>
									<div>
										<div style="padding-left: 5px">
											<label class="title_deli" style="display: block"><%=LanguegeBUS.getValue("deli_edit", lang)%></label>
										</div>
										<div class="space"></div>
										<div style="padding-left: 10px">
											<label><%=LanguegeBUS.getValue("deli_order_id", lang)%></label>
											<input type="text" disabled="disabled" style="width: 50px"
												id="productOrderID" /> <label><%=LanguegeBUS.getValue("deli_product_name", lang)%></label>
											<input style="width: 200px !important" id="ProductName"
												disabled="disabled" />
										</div>
										<div class="space"></div>
										<div>
											<form name="manageDeliverStatus"
												onsubmit="return validateForm(this)" method="post"
												action="<%=ServletUtils.getBaseUrl(request)%>/DeliverstatusController">
												<table id="" class=table_deli border="0" cellpadding="0"
													style="width: 730px;" cellspacing="0">
													<tbody>
														<tr>
															<td class="lstitle" width="150px"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("option", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" id="options" style="width: 400px;"
																name="option" disabled="disabled" />
															</td>


														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_quantity", lang)%></td>
															<td colspan="2"
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" id="quantity" style="width: 50px;"
																name="quantity" onkeypress="return IsNumeric(event);"
																onkeyup="validOnkeyUp(event)" disabled="disabled" /> <label
																style="padding-left: 30px; width: 200px"><%=LanguegeBUS.getValue("deli_order_date", lang)%></label>
																<input readonly type="text" value="" id="orderDate"
																disabled="disabled" style="width: 120px"
																class="medium_text_input show_tip required" /> <!-- <div id="invalidQuantity" style="color: red"></div> -->
															</td>

														</tr>
														<tr>
															<td class="lstitle" width="150px"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_receiver", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" id="receiver" style="width: 400px;"
																name="receiver" disabled="disabled" />
															</td>


														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_deliver_address", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" id="deliverAddress" style="width: 400px;"
																name="deliverAddress" disabled="disabled" />
															</td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_order_status", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" id="orderStatus" style="width: 400px;"
																name="orderStatus" disabled="disabled" />
															</td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("deli_deliver_status", lang)%></td>
															<td colspan="2"
																style="text-align: left !important; padding-left: 10px !important">
																<select id="Deliverstatus" name="newStatus">
															</select>
															</td>
														</tr>


													</tbody>
												</table>
												<div class="space"></div>
												<div style="padding-left: 5px">
													<label class="title_deli" style="display: block">Sellect
														shipping company</label>
												</div>
												<div class="space"></div>
												<table id="" class=table_deli border="0" cellpadding="0"
													style="width: 730px;" cellspacing="0">
													<tbody>
														<tr>
															<td class="lstitle"
																style="width: 150px; text-align: left;"><%=LanguegeBUS.getValue("sh_select_company", lang)%></td>
															<td class="lstitle" style="text-align: left !important;"><select
																style="width: 150px;" name="selectShippingCompany"
																id="selectShippingCompany"
																onchange="fillShippingCompanyName(this)">
																	<option value="0"><%=LanguegeBUS.getValue("sh_select_cbb_company", lang)%></option>
																	<%
																		List<Shippingcompany> shippingCompanys = ShippingCompanyBUS
																				.getListShippingcompanyBySeller(seller, "", lang);
																		for (Shippingcompany shippingcompany : shippingCompanys) {
																	%>
																	<option
																		value="<%=shippingcompany.getShippingCompanyId()%>"><%=shippingcompany.getShippingCompanyName()%></option>
																	<%
																		}
																	%>
															</select> &nbsp; <input name="shippingCompanyName"
																id="shippingCompanyName" type="text"
																style="width: 300px" disabled="disabled" />
															</td>
															<td rowspan="2"
																style="width: 50px; vertical-align: middle"><input
																type="hidden" name="deliverIDShippingValue"
																id="deliverIDShippingValue" /> <input type="hidden"
																name="confirmValue" id="confirmValue" />
																<button type="button" name="confirm"
																	onclick="onClickConfirm()"><%=LanguegeBUS.getValue("sh_comfirm", lang)%></button>
															</td>
														</tr>
														<tr>
															<td style="text-align: left;"><label><%=LanguegeBUS.getValue("sh_deliver_id_for_shipping", lang)%></label>
															</td>
															<td align="left" style="text-align: left;"><input
																disabled="disabled" type="text" style="width: 100px"
																name="deliverIDForShipping" id="deliverIDForShipping" />
															</td>
														</tr>
													</tbody>
												</table>
												<div class="space"></div>
												<div class="space"></div>
												<div align="center">
													<input type="hidden" name="productID"> <input
														type="hidden" name="deliverID">
													<button type="submit" id="submit" value="adf" name="submit"><%=LanguegeBUS.getValue("deli_update", lang)%></button>
												</div>
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