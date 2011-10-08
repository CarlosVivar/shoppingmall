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

		request.getRequestDispatcher("/DeliverCostForProductController").forward(
				request, response);
	}
	NavigationInfo pagedcust = (NavigationInfo) request
			.getAttribute("pagedcust");
	NavigationInfo pagedcust2 = (NavigationInfo) request
	.getAttribute("pagedcust2");
	String baseURL = ServletUtils.getBaseUrl(request);
%>

<script type="text/javascript">
	$(function() {

		$("#workFlow").hide();
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
	
	function enableText(){
		if(document.form1.userConditionFree.checked){
			document.form1.conditionFee3.disabled=false;
		}
		else{
			document.form1.conditionFee3.disabled=true;
		}
	}
	
	
</script>

<script type="text/javascript">
//handle for tab2


function onmouseoverRowTable1(row_table1){
	 var rows = document.getElementById('table2').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFEBDA";
}

function onmouseoutRowTable1(row_table1){
	 var rows = document.getElementById('table2').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFFFFF";
}
function onmousedowRowTable1(row_table1){
	 var rows = document.getElementById('table2').getElementsByTagName('tr');
	 rows[row_table1.rowIndex].style.backgroundColor="#FFEBDA";
}

function onmouseoverRowTable2(row_table2){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table2.rowIndex].style.backgroundColor="#FFEBDA";
}

function onmouseoutRowTable2(row_table2){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table2.rowIndex].style.backgroundColor="#FFFFFF";
}
function onmousedowRowTable2(row_table2){
	 var rows = document.getElementById('table1').getElementsByTagName('tr');
	 rows[row_table2.rowIndex].style.backgroundColor="#FFEBDA";
}

function onCheckRow(check){
	var row , cell;
	cell=check.parentNode;
	row=cell.parentNode;
	var rows_table1,rows_table2;
	
	if(check.checked){
		
	}
	else{
		
	}
	
}

function setvalueforcate()
	{
		var flagnew=0;	
		var selectCatogory = document.getElementById("selectCatogory").value;
		var selectCatogoryChild = document.getElementById("selectCatogoryChild");
		removeAllOptions(selectCatogoryChild);
		addSelectOption(selectCatogoryChild,"-<%=LanguegeBUS.getValue("categorychild", lang)%>-",0,0);
		$("#selectCatogoryChild").show();
		var th=0;
		<%List<CategoryChild> lstcategorychild = CategoryChildBUS
					.lstCategoryChild(lang);// .lstCategoryChild((String)session.getAttribute("lang"));
			if (lstcategorychild != null) {
				for (int i = 0; i < lstcategorychild.size(); i++) {
					//	for (int i = 0; i < 5; i++) {
					CategoryChild categorychild = lstcategorychild.get(i);
					String id_CatoChild = categorychild.getCategoryId();%>
              var ids="<%=id_CatoChild%>";
				 
				 if(selectCatogory==ids){
						$("#selectCatogoryChild").show();
					 	var nm="<%=categorychild.getCategoryChildName()%>";
	                    var vl="<%=categorychild.getCategoryChildId()%>";
	                    addSelectOption(selectCatogoryChild,nm,vl, th);
	                    th++;
	                    flagnew++;
				
				 }
			 		
		 						<%}
			}%>
      
	}
			
	   //remove all options from selected box
  	function removeAllOptions(selectedObj) {
  		selectedObj.options.length = 0;
  	}       
    function addSelectOption(selectObj, text, value, isSelected) {
        	  	 var objOption = document.createElement("option");
        	  	    	objOption.text = text;
        	  	    	objOption.value = value;
        	  	    	objOption.selected = isSelected;
        	  	        selectObj.options[selectObj.options.length] = objOption;
      }
    
    function setvalueforcatesub()
		{
			var flagnew1=1;	
			var selectCatogoryChild = document.getElementById("selectCatogoryChild").value;
			var selectCatogorySub = document.getElementById("selectCatogorySub");
			removeAllOptions(selectCatogorySub);
			addSelectOption(selectCatogorySub,"-<%=LanguegeBUS.getValue("categorysub", lang)%>-",0,0);
			$("#selectCatogorySub").show();
			var th=0;
			<%List<CategorySub> lstcategorysub = CategorySubBUS
					.lstCategorySub(lang);// .lstCategoryChild((String)session.getAttribute("lang"));
			if (lstcategorysub != null) {
				for (int i = 0; i < lstcategorysub.size(); i++) {
					//	for (int i = 0; i < 5; i++) {
					CategorySub categorysub = lstcategorysub.get(i);
					String id_CatoChild = categorysub.getCategoryChildId();%>
                  var ids="<%=id_CatoChild%>";
					 
					 if(selectCatogoryChild==ids){
							$("#selectCatogorySub").show();
						 	var nm="<%=categorysub.getCategorySubName()%>";
		                    var vl="<%=categorysub.getCategorySubId()%>";
		                    addSelectOption(selectCatogorySub,nm,vl, th);
		                    th++;
		                    flagnew1++;
					
					 }
				 		
			 						<%}
			}%>
			
			}
	function validFormTab2(){
		//
		var ischeckBox="false";
		 var row=document.getElementById('table1').getElementsByTagName('tr');
		 for(var i=1;i<(row.length);i++){
			 var check=row[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0];
			 if(check.checked){
				 ischeckBox="true";
			 }
		 }
		 
		 if(ischeckBox=="false"){
			 alert("<%=LanguegeBUS.getValue("de_cost_alert_invalid_checkbox",
					lang)%>");
			 return false;
		 }
		//
		
		
		if(!isCheckDeliverCost()){
			alert("<%=LanguegeBUS.getValue("de_cost_alert_invalid_radio", lang)%>");
			return false;
		 }
		
		return true;
	}
	
	function isCheckDeliverCost(){		
		var rows = document.getElementById('table_test').getElementsByTagName(
				'tr');
		//xoa cancel
		for ( var i = 1; i < rows.length; i++) {
			var tds = rows[i].getElementsByTagName('td');
			var radio = tds[0].getElementsByTagName('input');

			if (radio[0].checked) {
				return true;
			} 
		}
		return false;
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

											<li><a rel="ntabs1"  href="<%=baseURL%>/sale/delivercost.html"><span><%=LanguegeBUS.getValue("de_cost_setting_charges", lang)%></span>
											</a>
											</li>
											<li><a rel="ntabs2" class="selected" href="#tabs1" id="showTab2"><span><%=LanguegeBUS.getValue(
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

											<div id="ntabs2" class="tab_class" style="text-align: left;">
												<form method="post"
													action="<%=ServletUtils.getBaseUrl(request)%>/DeliverCostForProductController"
													name="formTab2">
													<table class=table_deli border="0" cellpadding="0"
														style="width: 730px;" cellspacing="0">
														<tr>
															<td style="background-color: #cccccc; width: 150px"><%=LanguegeBUS.getValue("category", lang)%>:</td>
															<td style="width: 500px; text-align: left"><select
																name="selectCatogory" id="selectCatogory"
																onchange="setvalueforcate()" style="width: 130px">
																	<option value="0">
																		==
																		<%=LanguegeBUS.getValue("category", lang)%>
																		==
																	</option>
																	<%
																		List<Category> lstcategory = CategoryBUS.lstCategory(lang);
																		if (lstcategory != null) {
																			for (int i = 0; i < lstcategory.size(); i++) {
																				Category category = lstcategory.get(i);
																	%>
																	<option value="<%=category.getCategoryId()%>">
																		<%=category.getCategoryName()%>
																	</option>
																	<%
																		}
																		}
																	%>
															</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
																onchange="setvalueforcatesub()"
																name="selectCatogoryChild" id="selectCatogoryChild"
																style="width: 130px">
																	<option value="0">
																		==<%=LanguegeBUS.getValue("categorychild", lang)%>==
																	</option>

															</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
																id="selectCatogorySub" name="selectCatogorySub"
																style="width: 130px">
																	<option value="0">
																		==<%=LanguegeBUS.getValue("categorysub", lang)%>==
																	</option>

															</select></td>
															<td rowspan="2"
																style="vertical-align: middle; width: 100px">
																<button type="submit" name="searchDeliverCosts"
																	value="searchDeliverCosts"><%=LanguegeBUS.getValue("deli_view", lang)%></button>
															</td>
														</tr>
														<tr>
															<td style="background-color: #cccccc"><%=LanguegeBUS.getValue("deli_selected_view", lang)%></td>
															<td style="text-align: left;"><select
																name="selectView" style="width: 130px">
																	<option value="-1">
																		==<%=LanguegeBUS.getValue("sh_all", lang)%>==
																	</option>
																	<option value="Product name"><%=LanguegeBUS.getValue("deli_product_name", lang)%></option>
															</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
																name="contentView" style="width: 130px">
															</td>
														</tr>
													</table>

													<div>
																		<%
																			if (pagedcust2.getPageCount() - 1 > 0) {
																		%>
																		<div class="paging grey page_item">
																			<div class="wrap">
																				<div class="pageOn">
																					<%
																						if (!pagedcust2.isFirstPage()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page2=0&page=<%=pagedcust.getCurrentPage()%>"><%=LanguegeBUS.getValue("first", lang)%></a>
																					</span>&nbsp;&nbsp;
																					<%
																						}
																							if (pagedcust2.hasIndexPrev()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page2=<%=pagedcust2.getIndexPrev()%>&page=<%=pagedcust.getCurrentPage()%>"><%=LanguegeBUS.getValue("prev.", lang)%></a>
																					</span>
																					<%
																						}
																							for (int i = pagedcust2.getIndexStart(); i < pagedcust2
																									.getIndexLast(); i++) {
																								if (i != pagedcust2.getCurrentPage()) {
																					%>
																					<!-- span class="active">1</span-->
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page2=<%=i%>&page=<%=pagedcust.getCurrentPage()%>"><%=i%></a>
																					</span>
																					<%
																						} else {
																					%>
																					<span class="active"><%=i%></span>
																					<%
																						}
																							}

																							if (pagedcust2.hasIndexNext()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page2=<%=pagedcust2.getIndexNext()%>&page=<%=pagedcust.getCurrentPage()%>"><%=LanguegeBUS.getValue("next", lang)%></a>
																					</span>
																					<%
																						}
																							if (pagedcust2.isLastPage() == false) {
																					%>
																					&nbsp;&nbsp;<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page2=<%=(pagedcust2.getPageCount() - 1)%>&page=<%=pagedcust.getCurrentPage()%>"><%=LanguegeBUS.getValue("last", lang)%></a>
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
														width="730px" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td style="width: 720px">																	
																	<div
																		style="overflow: auto; width: 716px; height: 300px">
																		<table class="table_deli_cost" cellspacing="0"
																			id="table1" cellpadding="0" border="0" width="1130">
																			<tr>
																				<td class="listtitle" width="30"><%=LanguegeBUS.getValue("deli_select", lang)%>
																				</td>
																				<td class="listtitle" width="90"><%=LanguegeBUS.getValue("deli_product_id", lang)%>
																				</td>
																				<td class="listtitle" width="200"><%=LanguegeBUS.getValue("deli_product_name", lang)%>
																				</td>
																				<td class="listtitle" width="150"><%=LanguegeBUS.getValue("de_cost_manufaturer_name", lang)%>
																				</td>
																				<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_delvier_id", lang)%>
																				</td>
																				<td class="listtitle" width="120"><%=LanguegeBUS.getValue("de_cost_deliver_cost_id", lang)%>
																				</td>
																				<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_deliver_cost", lang)%>
																				</td>
																				<td class="listtitle" width="120"><%=LanguegeBUS.getValue("de_cost_condition_free", lang)%>
																				</td>
																				<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_fee_extra", lang)%>
																				</td>
																				<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_handle_date", lang)%>
																				</td>

																			</tr>

																			<%
																				String userAccount = (String) session.getAttribute("username");
																				String whereSearch = (String) request.getAttribute("whereSearch");
																				
																				List<DeliverCostView> deliverCostViews = (List<DeliverCostView>)request.getAttribute("deliverCostViews");

																				for (DeliverCostView deliverCostView : deliverCostViews) {
																			%>
																			<tr class="order_row"
																				onmouseover="this.style.backgroundColor='#FFEBDA'; onmouseoverRowTable1(this)"
																				onmouseout="this.style.backgroundColor='#FFFFFF'; onmouseoutRowTable1(this)"
																				onmousedown="this.style.backgroundColor='#FFEBDA'; onmousedowRowTable1(this)">
																				<td><input type="checkbox"
																					name="deID_<%=deliverCostView.getProductID()%>">
																				</td>
																				<td><label><%=deliverCostView.getProductID()%></label>
																				</td>
																				<td><label><%=deliverCostView.getProductName()%></label>
																				</td>
																				<td><label><%=deliverCostView.getManufacturerName()%></label>
																				</td>
																				<td><label><%=deliverCostView.getDeliverID()%></label>
																				</td>
																				<td><label><%=deliverCostView.getDeliverCostID()%></label>
																				</td>
																				<td><label><%=deliverCostView.getDeliverFee()%></label>
																				</td>
																				<td><label><%=deliverCostView.getConditionFree()%></label>
																				</td>
																				<td><label><%=deliverCostView.getDeliverFeeExtra()%></label>
																				</td>
																				<td><label> <%
 	if (deliverCostView.getHandleDate() != null) {
 %><%=deliverCostView.getHandleDate()%> <%
 	}
 %> </label></td>

																			</tr>
																			<%
																				}
																			%>
																		</table>
																	</div></td>
															</tr>
														</tbody>
													</table>




													<table id="" class=table_deli border="0" cellpadding="0"
														style="width: 730px;" cellspacing="0">
														<tbody>
															<tr>
																<td class="bgtitle"
																	style="text-align: left !important; width: 100px"><label
																	style="font-weight: bold;"><%=LanguegeBUS.getValue("de_cost_setting_new_fee", lang)%></label>
																</td>
																<td style="text-align: left; width: 600px">
																	<div class="space"></div>
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
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page=0&page2=<%=pagedcust2.getCurrentPage()%>"><%=LanguegeBUS.getValue("first", lang)%></a>
																					</span>&nbsp;&nbsp;
																					<%
																						}
																							if (pagedcust.hasIndexPrev()) {
																					%>
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page=<%=pagedcust.getIndexPrev()%>&page2=<%=pagedcust2.getCurrentPage()%>"><%=LanguegeBUS.getValue("prev.", lang)%></a>
																					</span>
																					<%
																						}
																							for (int i = pagedcust.getIndexStart(); i < pagedcust
																									.getIndexLast(); i++) {
																								if (i != pagedcust.getCurrentPage()) {
																					%>
																					<!-- span class="active">1</span-->
																					<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page=<%=i%>&page2=<%=pagedcust2.getCurrentPage()%>"><%=i%></a>
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
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page=<%=pagedcust.getIndexNext()%>&page2=<%=pagedcust2.getCurrentPage()%>"><%=LanguegeBUS.getValue("next", lang)%></a>
																					</span>
																					<%
																						}
																							if (pagedcust.isLastPage() == false) {
																					%>
																					&nbsp;&nbsp;<span><a
																						href="<%=baseURL%>/sale/delivercostforproduct.html?page=<%=(pagedcust.getPageCount() - 1)%>&page2=<%=pagedcust2.getCurrentPage()%>"><%=LanguegeBUS.getValue("last", lang)%></a>
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
																		width="600px" cellpadding="0" cellspacing="0">
																		<tbody>
																			<tr>
																				<td>
																					<%
																					
																						if (listDeliverCost != null && listDeliverCost.size() > 0) {
																							
																							
																						
																					%>
																					<div
																						style="overflow: auto; width: 600px; height: 300px">																						
																						
																						<table class="table_deli_cost" cellspacing="0"
																							cellpadding="0" border="0" width="640" id="table_test">
																							<tr>
																								<td class="listtitle" width="30"><%=LanguegeBUS.getValue("deli_select", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_deliver_cost_id", lang)%>
																								</td>
																								<td class="listtitle" width="150"><%=LanguegeBUS.getValue("de_cost_fee_name", lang)%></td>
																								<td class="listtitle" width="100"><%=LanguegeBUS.getValue("de_cost_fee_type", lang)%></td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_fee", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_condition_free", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_fee_extra", lang)%>
																								</td>

																							</tr>
																							<%
																								for (Delivercost delivercost : listDeliverCost) {																										
																											String deliverCostID = delivercost.getDeliverCostId()
																													+ "";
																											String deliverCostName = delivercost
																													.getDeliverCostName();
																											String type = delivercost.getTypeFee();
																											String conditionFree = delivercost
																													.getConditionForFree() + "";
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
																								<td><input type="radio" name="de_CostID"
																									value="<%=deliverCostID%>"></td>
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
																				</td>
																			</tr>


																		</tbody>
																	</table></td>
															</tr>

															<tr>
																<td colspan="2">
																	<div class="space"></div> <input type="hidden"
																	name="deliverCostIDEdit" />
																	<button type="submit" name="saveDCostPOrder"
																		value="save" onclick="return validFormTab2();"><%=LanguegeBUS.getValue("de_cost_save", lang)%></button>
																</td>
															</tr>
														</tbody>
													</table>
													<%if(request.getParameter("page")!=null){%><input type="hidden" name="page" value="<%=request.getParameter("page")%>"/><%} %>
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