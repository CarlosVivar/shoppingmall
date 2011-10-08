<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("delicharges", lang)%></title>
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
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>

<%
	List<Delivercost> listDeliverCost = (List<Delivercost>) request
			.getAttribute("listDeliverCost");
	String showTab2 = (String) request.getAttribute("showTab2");
%>

<%
	if (listDeliverCost == null && showTab2 == null) {

		request.getRequestDispatcher("/DeliverCostController").forward(
				request, response);
	}
	NavigationInfo pagedcust = (NavigationInfo) request
			.getAttribute("pagedcust");
	String baseURL = ServletUtils.getBaseUrl(request);
%>

<script type="text/javascript">
	$(function() {

		$("#workFlow").hide();
		hideFeesType();		
		
		$("#extraCost").hide();
		hideAllInvalid();
	});

	$(document).ready(function() {
		$("#viewDetail").click(function() {
			//alert($("#viewDetail").val() );
		
			if ($("#viewDetail").val() == "view") {
				$("#viewDetail").attr("value","close");
				$("#viewDetail").text("<%=LanguegeBUS.getValue("de_cost_close_workflow", lang)%>");
				$("#workFlow").show();
			} else {
				$("#viewDetail").attr("value","view");
				$("#viewDetail").text("<%=LanguegeBUS.getValue("de_cost_view_workflow", lang)%>");
				$("#workFlow").hide();
			}
		});

	});
	
	function resetAllFields(){
		document.form1.deliverName.value="";
		document.form1.typeFee[0].checked="checked";
		document.form1.cost1.value="";
		document.form1.cost2.value="";
		document.form1.cost3.value="";
		document.form1.yesno1[0].checked="checked";
		document.form1.yesno2[0].checked="checked";
		document.form1.yesno3[0].checked="checked";
		document.form1.conditionFee2.value="";
		document.form1.conditionFee3.value="";
		document.form1.userConditionFree.checked=false;
		document.form1.conditionFee3.disabled=true;		
		hideFeesType();
		
		document.form1.checkExtraCost.checked=false;
		document.form1.extraCost.value="";
		hideExtraCost();
		
	}
	
	function hideExtraCost(){
		$("#extraCost").hide();
	}

	function loadFormCreate() {
		//$("#edit").css("display", "none");
		//$("#create").css("display", "block");		
		
		document.getElementById("save").value = "save";
		
		resetAllFields();
		hideAllInvalid();
	}
	function loadFormEdit(row,delivercostID,deliverCostName,type,fee,conditionFree,feeExtra,useornot,IsDefault) {	
		document.getElementById("save").value = "edit";
		
		<%List<Delivercost> list = (List<Delivercost>) request
					.getAttribute("listDeliverCost");
			if (listDeliverCost != null) {

				for (Delivercost delivercost : list) {
					String typeFee = delivercost.getTypeFee();%>
		if(delivercostID == <%=delivercost.getDeliverCostId()%>){		
			document.getElementById("save").value = "edit";
			document.form1.deliverCostIDEdit.value=delivercostID;
			document.getElementById("deliverName").value=deliverCostName;
			if(type=="Has fee"){
				hideFeesType();
				$("#hasFee").show();
				document.form1.typeFee[1].checked="checked"; 
				document.form1.cost1.value=fee;
				if("Y"==useornot){
					document.form1.yesno1[0].checked="checked";
				}
				else{
					document.form1.yesno1[1].checked="checked";
				}
			}
			else if(type=="Free has condition"){
				hideFeesType();
				$("#freeHasCondition").show();
				document.form1.typeFee[2].checked="checked";
				document.form1.cost2.value=fee;
				document.form1.conditionFee2.value=conditionFree;
				if("Y"==useornot){
					document.form1.yesno2[0].checked="checked";
				}
				else{
					document.form1.yesno2[1].checked="checked";
				}
				
			}
			else if(type=="Prepay"){
				hideFeesType();
				$("#prepay").show();
				document.form1.typeFee[3].checked="checked"; 
				document.form1.cost3.value=fee;
				if(document.form1.userConditionFree.checked){
					document.form1.conditionFee3.disabled=false;
					document.form1.conditionFee3.value=conditionFree;
				}
				else{
					document.form1.conditionFee3.disabled=true;
					document.form1.conditionFee3.value="";
				}
							
				if("Y"==useornot){
					document.form1.yesno3[0].checked="checked";
				}
				else{
					document.form1.yesno3[1].checked="checked";
				}
				
			}
		
			if("false"==IsDefault){
				document.form1.feeDefault.checked=false;
			}
			else{
				document.form1.feeDefault.checked=true;
			}
			
			if(feeExtra==feeExtra){
				document.form1.checkExtraCost.checked=false;
				document.form1.extraCost.value="";
			}
			else{
				document.form1.checkExtraCost.checked=true;
				document.form1.extraCost.value=feeExtra;
			}
			//setFocus
			document.getElementById("deliverName").focus();
		}
		<%}
			}%>
		
			setCheckRadio(row);
			//scroll to the bottom window
			<%=ResourcesDefault.loadCrollBottom()%>
	}
	
	function setCheckRadio(index) {	
							
		var rows = document.getElementById('table_deli_cost').getElementsByTagName('tr');
		//xoa cancel
		for ( var i = 1; i < rows.length; i++) {
			var tds = rows[i].getElementsByTagName('td');
			var radio = tds[0].getElementsByTagName('input');	
						
			if (i==index.rowIndex) {
				radio[0].checked="checked";break;
			} 
		}		

	}
	

	function hideFeesType() {
		$("#hasFee").hide();
		$("#freeHasCondition").hide();
		$("#prepay").hide();
	}

	function selectFeeType(feeType) {

		if (feeType == "Free") {
			$("#hasFee").hide();
			$("#freeHasCondition").hide();
			$("#prepay").hide();
		} else if (feeType == "Has fee") {
			$("#hasFee").show();
			$("#freeHasCondition").hide();
			$("#prepay").hide();
		} else if (feeType == "Free has condition") {
			$("#hasFee").hide();
			$("#freeHasCondition").show();
			$("#prepay").hide();
		} else if (feeType == "Prepay") {
			$("#hasFee").hide();
			$("#freeHasCondition").hide();
			$("#prepay").show();
		}
	}
	
	function enableText(){
		if(document.form1.userConditionFree.checked){
			document.form1.conditionFee3.disabled=false;
		}
		else{
			document.form1.conditionFee3.disabled=true;
		}
	}
	
	function hideAllInvalid(){
		$("#invalidDeliverName").hide();		
		$("#invalidExtraCost").hide();
		$("#invalidHasFee").hide();
		$("#invalidCost2").hide();
		$("#invalidConditionFee2").hide();
		$("#invalidCost3").hide();
		$("#invalidConditionFee3").hide();
	}
	
	function hideAllTypeValid(){
		$("#invalidHasFee").hide();			
		$("#invalidCost2").hide();
		$("#invalidConditionFee2").hide();
		$("#invalidCost3").hide();
		$("#invalidConditionFee3").hide();
	}
	
	function validCreate(){
		var valid=true;
		if(IsEmpty(document.form1.deliverName.value)){
			$("#invalidDeliverName").show();
			valid= false;
			
		}
		else{
			$("#invalidDeliverName").hide();
		
		}
		if(document.form1.checkExtraCost.checked){
			if(IsEmpty(document.form1.extraCost.value)){			
				$("#invalidExtraCost").show();	
				valid= false;
			}
			else{
				$("#invalidExtraCost").hide();	
				
			}
		}
		
		
		if(document.form1.typeFee[1].checked){
			if(IsEmpty(document.form1.cost1.value)){
				$("#invalidHasFee").show();
				valid=false;
			}
			else{
				$("#invalidHasFee").hide();
			}
		}
		if(document.form1.typeFee[2].checked){
			if(IsEmpty(document.form1.cost2.value)){
				$("#invalidCost2").show();
				valid=false;
			}
			else{
				$("#invalidCost2").hide();
			}
			if(IsEmpty(document.form1.conditionFee2.value)){
				$("#invalidConditionFee2").show();
				valid=false;
			}
			else{
				$("#invalidConditionFee2").hide();
			}
		}
		if(document.form1.typeFee[3].checked){
			if(IsEmpty(document.form1.cost3.value)){
				$("#invalidCost3").show();
				valid=false;
			}
			else{
				$("#invalidCost3").hide();
			}		
		if(document.form1.userConditionFree.checked){
			if(IsEmpty(document.form1.conditionFee3.value)){
				$("#invalidConditionFee3").show();
				valid=false;
			}
			else{
				$("#invalidConditionFee3").hide();
			}
		}
		}
		
		
		return valid;
		
		
	}
	
	function IsEmpty(ele){
		var str=ele;	
		if(str.length==0){
			return true;
		}
		else return false;
	}
	
	function onCheckExtraCost(){
		if(document.form1.checkExtraCost.checked){
			$("#extraCost").show();
		}
		else{
			$("#extraCost").hide();
		}
	}

	function isNumeric(evt)
    {
        var key = (evt.which) ? evt.which : window.event.keyCode;
        var alphaExp = /^[a-zA-Z\s\,\?\/\;\:\'\"\-\=\[\]\|\`]+$/;
        var keyChar = String.fromCharCode(key);
        if (keyChar.valueOf().match(alphaExp)){
            return false;
        }
        return true;
    }
	
	function validDeliverName(){		
		if(document.getElementById("deliverName").value.length==0){
			$("#invalidDeliverName").show();
		}
		else{
			$("#invalidDeliverName").hide();
		}
	}
	
	function validCost1(evt){
		if(isNumeric(evt)){
			if(document.getElementById("cost1").value.length==0){
			
			}
			else{
				$("#invalidHasFee").hide();
			}
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
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("delicharges", lang)%></a>
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
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("delicharges", lang)%></label>
				</p>

				<p>
					<b>Delivery charges:</b> user to set up and manage deliver charges
					of seller
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
									<h2 class="title" style="margin-left: 5px"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("delicharges", lang)%></h2>

									<div id="usual2" style="width: 730px">
										<ul class="tab">

											<li><a rel="ntabs1" class="selected" href="#tabs1"><span><%=LanguegeBUS.getValue("de_cost_setting_charges", lang)%></span>
											</a>
											</li>
											<li><a rel="ntabs2" href="<%=baseURL%>/sale/delivercostforproduct.html" id="showTab2"><span><%=LanguegeBUS.getValue(
					"de_co_setting_de_charges_for_product", lang)%></span> </a>
											</li>
											<!-- <li><a rel="ntabs3" href="#tabs1"><span>Setting
														exchange and return cost</span> </a>
											</li> -->

											<!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
										</ul>
										<div style="width: 100%;">
											<button type="button" style="float: right" id="viewDetail"
												value="view"><%=LanguegeBUS.getValue("de_cost_view_workflow", lang)%></button>
										</div>
										<div class="space"></div>
										<div class="space"></div>
										<div class="space"></div>
										<div id="workFlow"
											style="border-bottom: 2px solid #6B9EE3; padding-left: 3px">
											<div class="bullet"><%=LanguegeBUS.getValue("de_cost_view_workflow", lang)%></div>

											<div style="border-top: 2px solid #6B9EE3;">
												<div class="space"></div>
												<div>
													<div
														style="background: url('../admin/images/1.png') no-repeat; padding-left: 27px; padding-top: 8px; color: #0962C8; font-size: 12px; font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_workflow1", lang)%>
													</div>
													<div
														style="padding-left: 27px; line-height: 20px; font-size: 12px"><%=LanguegeBUS.getValue("de_cost_workflow1_txt", lang)%></div>
												</div>
												<div class="space"></div>
												<div>
													<div
														style="background: url('../admin/images/2.png') no-repeat; padding-left: 27px; padding-top: 8px; color: #0962C8; font-size: 12px; font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_workflow2", lang)%>
													</div>
													<div
														style="padding-left: 27px; line-height: 20px; font-size: 12px"><%=LanguegeBUS.getValue("de_cost_workflow2_txt", lang)%></div>
												</div>
												<div class="space"></div>
												<div>
													<div
														style="background: url('../admin/images/3.png') no-repeat; padding-left: 27px; padding-top: 5px; color: #0962C8; font-size: 12px; font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_workflow3", lang)%>
													</div>

													<div
														style="padding-left: 27px; line-height: 20px; font-size: 12px"><%=LanguegeBUS.getValue("de_cost_workflow3_txt", lang)%></div>
												</div>
												<div class="space"></div>
												<div>
													<div
														style="background: url('../admin/images/4.png') no-repeat; padding-left: 27px; padding-top: 5px; color: #0962C8; font-size: 12px; font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_workflow4", lang)%>
													</div>
													<div
														style="padding-left: 27px; line-height: 20px; font-size: 12px"><%=LanguegeBUS.getValue("de_cost_workflow4_txt", lang)%></div>
												</div>
											</div>
											<div class="space"></div>
										</div>
										<div style="width: 705px">
											<div id="ntabs1" class="tab_class">
												<form name="form1" method="post"
													action="<%=ServletUtils.getBaseUrl(request)%>/DeliverCostController"
													onsubmit="return validCreate();">
													<table id="" class=table_deli border="0" cellpadding="0"
														style="width: 730px;" cellspacing="0">
														<tbody>

															<tr>
																<td class="bgtop" style="text-align: left; width: 100px"><label
																	style="font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_mothod_charges", lang)%></label>
																</td>
																<td class="bgtop" style="text-align: left; width: 600px">
																	<div class="bullet">
																		<label><%=LanguegeBUS.getValue("de_cost_introduce_mothed_charges",
					lang)%> </label>

																	</div>
																</td>
															</tr>
															<tr>
																<td class="bgtitle"
																	style="text-align: left !important; width: 100px"><label
																	style="font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_setting_new_fee", lang)%></label>
																</td>
																<td style="text-align: left; width: 600px">
																	<div>
																		<%
																			if (pagedcust.getPageCount() - 1 > 0) {
																		%>
																		<div class="paging grey page_item">
																			<div class="wrap">
																				<div class="pageOn">
																					<%
																						if (!pagedcust.isFirstPage()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercost.html?page=0"><%=LanguegeBUS.getValue("first", lang)%></a>
																					</span>&nbsp;&nbsp;
																					<%
																						}
																							if (pagedcust.hasIndexPrev()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercost.html?page=<%=pagedcust.getIndexPrev()%>"><%=LanguegeBUS.getValue("prev.", lang)%></a>
																					</span>
																					<%
																						}
																							for (int i = pagedcust.getIndexStart(); i < pagedcust
																									.getIndexLast(); i++) {
																								if (i != pagedcust.getCurrentPage()) {
																					%>
																					<!-- span class="active">1</span-->
																					<span><a
																						href="<%=baseURL%>/sale/delivercost.html?page=<%=i%>"><%=i%></a>
																					</span>
																					<%
																						} else {
																					%>
																					<span class="active"><%=i%></span>
																					<%
																						}
																							}

																							if (pagedcust.hasIndexNext()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercost.html?page=<%=pagedcust.getIndexNext()%>"><%=LanguegeBUS.getValue("next", lang)%></a>
																					</span>
																					<%
																						}
																							if (pagedcust.isLastPage() == false) {
																					%>
																					&nbsp;&nbsp;<span><a
																						href="<%=baseURL%>/sale/delivercost.html?page=<%=(pagedcust.getPageCount() - 1)%>"><%=LanguegeBUS.getValue("last", lang)%></a>
																					</span>
																					<%
																						}
																					%>

																					<!-- span class="total">(Có <b>3837</b> kết quả)</span-->
																				</div>
																			</div>
																		</div>
																		<%
																			}
																		%>
																	</div>
																	<table id="tabs5" class="table_ucp" border="0"
																		width="600px" cellpadding="0" cellspacing="0"
																		width="335">
																		<tbody>
																			<tr>
																				<td>
																					<%
																						if (listDeliverCost != null && listDeliverCost.size() > 0) {
																					%>
																					<div style="overflow: auto; width: 600px;">
																						<table class="table_deli_cost" cellspacing="0"
																							id="table_deli_cost" style="width: 820px"
																							cellpadding="0" border="0">
																							<tr>
																								<td class="listtitle" style="width: 50px"><%=LanguegeBUS.getValue("deli_select", lang)%></td>
																								<td class="listtitle" style="width: 100px"><%=LanguegeBUS.getValue("de_cost_id", lang)%></td>
																								<td class="listtitle" style="width: 150px"><%=LanguegeBUS.getValue("de_cost_fee_name", lang)%></td>
																								<td class="listtitle" style="width: 100px"><%=LanguegeBUS.getValue("de_cost_fee_type", lang)%></td>
																								<td class="listtitle" style="width: 90px"><%=LanguegeBUS.getValue("de_cost_fee", lang)%></td>
																								<td class="listtitle" style="width: 90px"><%=LanguegeBUS.getValue("de_cost_condition_free", lang)%></td>
																								<td class="listtitle" style="width: 90px"><%=LanguegeBUS.getValue("de_cost_fee_extra", lang)%></td>
																								<td class="listtitle" style="width: 100px"><%=LanguegeBUS.getValue("de_cost_amount_product_apply",
						lang)%></td>
																								<td class="listtitle" style="width: 50px"><%=LanguegeBUS.getValue("de_cost_use_or_not", lang)%></td>
																							</tr>
																							<%
																								for (Delivercost delivercost : listDeliverCost) {
																										String deliverCostID = delivercost.getDeliverCostId() + "";
																										String deliverCostName = delivercost.getDeliverCostName();
																										String type = delivercost.getTypeFee();
																										String conditionFree = delivercost.getConditionForFree()
																												+ "";
																										String feeExtra = delivercost.getFeeExtra() + "";
																										String fee = delivercost.getCost() + "";

																										conditionFree = ("null".equals(conditionFree) || (null == conditionFree)) ? "--"
																												: conditionFree;

																										feeExtra = ("null".equals(feeExtra)) ? "--" : feeExtra;
																										String useornot = delivercost.getIsUser();
																										String IsDefault = delivercost.getDeliverCostDefault();
																							%>
																							<tr class="order_row"
																								onmouseover="this.style.backgroundColor='#FFEBDA'"
																								onmouseout="this.style.backgroundColor='#FFFFFF'"
																								onmousedown="this.style.backgroundColor='#FFEBDA'"
																								onClick="loadFormEdit(this,'<%=deliverCostID%>','<%=deliverCostName%>','<%=type%>','<%=fee%>','<%=conditionFree%>','<%=feeExtra%>','<%=useornot%>','<%=IsDefault%>')">
																								<td><input type="radio" name="select">
																								</td>
																								<td><label><%=deliverCostID%></label>
																								</td>
																								<td><label><%=deliverCostName%></label>
																								</td>
																								<td><label><%=type%></label>
																								</td>
																								<td><label><%=fee%></label>
																								</td>
																								<td><label><%=conditionFree%></label>
																								</td>
																								<td><label><%=feeExtra%></label>
																								</td>
																								<td><label>--</label>
																								</td>
																								<td>
																									<%
																										if (ResourcesDefault.YES.equals(useornot)) {
																									%>Y<%
																										} else {
																									%>N<%
																										}
																									%>
																								</td>
																							</tr>
																							<%
																								}
																							%>
																						</table>
																					</div> <%
 	}
 %>

																					<div class="space"></div>
																					<div class="space"></div>
																					<button type="button" style="float: right"
																						onclick="loadFormCreate()"><%=LanguegeBUS.getValue("de_cost_create_deliver_cost", lang)%></button>
																				</td>
																			</tr>
																			<tr>
																				<td width="600px" style="text-align: left">
																					
																					<div id="create">
																						<table>
																							<tr>
																								<td
																									style="border: none !important; text-align: left; width: 100px"><label
																									class="bullet"><%=LanguegeBUS.getValue("de_cost_deliver_cost_name", lang)%></label>
																								</td>
																								<td
																									style="border: none !important; text-align: left; width: 430px"><input
																									type="text" style="width: 200px"
																									name="deliverName" id="deliverName"
																									onkeyup="validDeliverName()" /> <label
																									style="color: red" id="invalidDeliverName"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																								</td>
																							</tr>
																							<tr>
																								<td
																									style="border: none !important; text-align: left"><label
																									style="width: 200px" class="bullet"><%=LanguegeBUS.getValue("de_cost_fees", lang)%></label>
																								</td>
																								<td
																									style="border: none !important; text-align: left">
																									<input type="radio" name="typeFee" value="Free"
																									onClick="selectFeeType(this.value)"
																									checked="checked"><%=LanguegeBUS.getValue("de_cost_free", lang)%>&nbsp;&nbsp;
																									<input type="radio" name="typeFee"
																									value="Has fee"
																									onClick="selectFeeType(this.value)"><%=LanguegeBUS.getValue("de_cost_has_fee", lang)%>&nbsp;&nbsp;
																									<input type="radio" name="typeFee"
																									onClick="selectFeeType(this.value)"
																									value="Free has condition"><%=LanguegeBUS.getValue("de_cost_fee_has_condition", lang)%>&nbsp;&nbsp;
																									<input type="radio" name="typeFee"
																									onClick="selectFeeType(this.value)"
																									value="Prepay"><%=LanguegeBUS.getValue("de_cost_prepay", lang)%>
																									<div id="hasFee"
																										style="background-color: #FFEBDA">
																										<%=LanguegeBUS.getValue("de_cost_deliver_cost", lang)%>&nbsp;&nbsp;
																										<input type="text" name="cost1" id="cost1"
																											style="width: 50px; font-size: 12px; height: 10px;"
																											onkeypress="return isNumeric(event)"
																											onkeyup="validCost1(event)" /><%=LanguegeBUS.getValue("dolar", lang)%>
																										<label style="color: red" id="invalidHasFee"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																										<div>
																											<%=LanguegeBUS.getValue("de_cost_use_or_not", lang)%>&nbsp;&nbsp;<input
																												type="radio" name="yesno1" value="Y" checked /><%=LanguegeBUS.getValue("de_cost_yes", lang)%>
																											<input type="radio" name="yesno1" value="N" /><%=LanguegeBUS.getValue("de_cost_no", lang)%>
																										</div>
																									</div>
																									<div id="freeHasCondition"
																										style="background-color: #FFEBDA">
																										<%=LanguegeBUS.getValue("de_cost_deliver_cost", lang)%>&nbsp;&nbsp;
																										<input type="text" name="cost2" id="cost2"
																											style="width: 50px; font-size: 12px; height: 10px;"
																											onkeypress="return isNumeric(event)" /><%=LanguegeBUS.getValue("dolar", lang)%>
																										<label style="color: red" id="invalidCost2"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																										<div>
																											<input type="text" name="conditionFee2"
																												style="width: 50px; font-size: 12px; height: 10px;"
																												onkeypress="return isNumeric(event)" /><%=LanguegeBUS.getValue("dolar", lang)%>&nbsp;&nbsp;
																											<%=LanguegeBUS.getValue("de_cost_total_has_free", lang)%>
																											<%=LanguegeBUS.getValue("de_cost_use_or_not", lang)%>&nbsp;&nbsp;<input
																												type="radio" name="yesno2" checked value="Y" /><%=LanguegeBUS.getValue("de_cost_yes", lang)%>
																											<input type="radio" name="yesno2" value="N" /><%=LanguegeBUS.getValue("de_cost_no", lang)%>
																											<label style="color: red"
																												id="invalidConditionFee2"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																										</div>
																									</div>
																									<div id="prepay"
																										style="background-color: #FFEBDA">
																										<%=LanguegeBUS.getValue("de_cost_deliver_cost", lang)%>&nbsp;&nbsp;
																										<input type="text" name="cost3" id="cost3"
																											style="width: 50px; font-size: 12px; height: 10px;"
																											onkeypress="return isNumeric(event)" /><%=LanguegeBUS.getValue("dolar", lang)%>
																										<label style="color: red" id="invalidCost3"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																										<div>
																											<input type="checkbox"
																												name="userConditionFree"
																												onclick="enableText()" />&nbsp;&nbsp;
																											<%=LanguegeBUS.getValue("de_cost_use_fee_condition", lang)%></div>
																										<div>

																											<input type="text"
																												onkeypress="return isNumeric(event)"
																												id="conditionFee3" name="conditionFee3"
																												disabled="disabled"
																												style="width: 50px; font-size: 12px; height: 10px;" />&nbsp;&nbsp;
																											<%=LanguegeBUS.getValue("de_cost_total_has_free", lang)%>
																											<%=LanguegeBUS.getValue("de_cost_use_or_not", lang)%><input
																												type="radio" name="yesno3" checked value="Y" /><%=LanguegeBUS.getValue("de_cost_yes", lang)%>
																											<input type="radio" name="yesno3" value="N" /><%=LanguegeBUS.getValue("de_cost_no", lang)%><label
																												style="color: red" id="invalidConditionFee3"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
																										</div>
																									</div></td>
																							</tr>
																							<tr>
																								<td colspan="2"
																									style="border: none !important; text-align: left"><input
																									type="checkbox" name="feeDefault" /> <label><%=LanguegeBUS.getValue("de_cost_setting_fee_default", lang)%></label>
																								</td>

																							</tr>
																						</table>
																					</div></td>
																			</tr>

																		</tbody>
																	</table>
																</td>
															</tr>
															<tr>
																<td class="bgtitle" style="text-align: left"><label
																	style="font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_setting_extra_cost", lang)%></label>
																</td>
																<td style="text-align: left; padding-left: 22px">
																	<div>
																		<input type="checkbox" onClick="onCheckExtraCost()"
																			name="checkExtraCost" /> <label><%=LanguegeBUS.getValue("de_cost_setting_fee_remote_area",
					lang)%></label>
																	</div>
																	<div style="background-color: #FFEBDA; width: 200px"
																		id="extraCost">
																		<input type="text" name="extraCost"
																			style="width: 50px; font-size: 12px; height: 10px;"
																			onkeypress="return isNumeric(event);" /><label><%=LanguegeBUS.getValue("dolar", lang)%></label><label
																			style="color: red" id="invalidExtraCost"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>

																	</div>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<div class="space"></div> <input type="hidden"
																	name="deliverCostIDEdit" />
																	<button type="submit" name="save" id="save"
																		value="save"><%=LanguegeBUS.getValue("de_cost_save", lang)%></button>
																</td>
															</tr>
														</tbody>
													</table>
													<%
										
											if(request.getParameter("page")!=null){%><input type="hidden" name="page" value="<%=request.getParameter("page")%>"/><%} %>
												</form>
											</div>

										</div>
										<br>
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



		<!--End content-->
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer"></div>
		<!--end footer-->
		<!--End footer-->
	</div>



</body>
</html>