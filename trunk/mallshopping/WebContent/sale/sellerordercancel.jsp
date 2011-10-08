<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,POJO.View.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<%
	Object obj = request.getAttribute("lstOrderCancels");
	if (obj == null) {
		String url = "/sellerOrderCancelController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
	List<ManageCancelView> ds = (List<ManageCancelView>) request
	.getAttribute("lstOrderCancels");
	NavigationInfo pagedcust = (NavigationInfo)request.getAttribute("pagedcust");
	String baseURL=ServletUtils.getBaseUrl(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("productcancel", lang)%></title>
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
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>
<script type="text/javascript">
$('#memoToCustomer').live('keydown', function(e) { 
	  var keyCode = e.keyCode || e.which; 

	  if (keyCode == 9) { 
	    e.preventDefault(); 
	    // call custom function here
	  } 
	});
$('#confirmCancelStatus').live('keydown', function(e) { 
	  var keyCode = e.keyCode || e.which; 

	  if (keyCode == 9) { 
	    e.preventDefault(); 
	    // call custom function here
	  } 
	});

		$(function() { 
					 $("#updateUser").click(function() {
						    $(".updateUser").fadeIn('normal').show();
					});
				    $('.tab a:first-child').click(function(){
				        switch_tabs($(this));
				        return false;
				    }); 
				    switch_tabs($('.selected'));
				    $("#tabs1").show();
				    $("#tabs2").hide();
				});
		
				function switch_tabs(obj)
				{
				    $('.table_ucp').hide();
				    $('.tab a:first-child').removeClass("selected");
				    var id = obj.attr("rel");
				    $('#'+id).show();
				    obj.addClass("selected");
				   
				}
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				function addContent(id) {		
					<%List<ManageCancelView> lst = (List<ManageCancelView>) request
					.getAttribute("lstOrderCancels");
			if (null != lst && !lst.isEmpty()) {
				for (int j = 0; j < lst.size(); j++) {
					ManageCancelView mcv = lst.get(j);%>
						var od = '<%=mcv.getProductOrderDetailID()%>';
						if(od==id){
							
								document.getElementById("signedNumber").value = id;
							  	document.getElementById("productName").value = "<%=mcv.getProductName()%>";  
								document.getElementById("signedDate").value = "<%=mcv.getDateOrder()%>";
								document.getElementById("totalSigned").value = "<%=mcv.getSubTotal()%>";  
								document.getElementById("requestDate").value = "<%=mcv.getDateRequestCancel()%>";
								document.getElementById("finishDate").value = "<%if(!("null".equals(mcv.getDateFinishedCancel()))){%><%=mcv.getDateFinishedCancel()%><%}%>";
								<%Ordercancel ordercancel = OrdercancelBUS
							.getOrdercancelByID(
									Integer.parseInt(mcv.getOrderCancelID()),
									lang);
					if (ordercancel != null) {%>
								document.getElementById("orderCancel").value="<%=ordercancel.getOrderCancelId()%>";
								document.getElementById("memo").value="<%=ordercancel.getMemo()%>";								
								
								//set cancel status
								var x_ = document.getElementById("confirmCancelStatus");
								var option_;
								var i_;
								for (i_ = 0; i_ < x_.length; i_++) {
									option_ = x_.options[i_].value;
									
									if (option_==<%=ordercancel.getCancelStatusId()%>) {
										x_.options[i_].selected = "selected";
										
									}
								}
								//set penalty money	
								document.getElementById("penalty_money").disabled=false;	
								document.getElementById("penalty_money").value="<%=ordercancel.getCancellationPenalty()%>";
								//get current confirm
								<%
								Confirm currentConfirm=ConfirmBUS.getCurrentCancelConfirm(ordercancel.getOrderCancelId(),"S", lang);
								if(currentConfirm!=null){%>
								document.getElementById("memoToCustomer").value="<%=currentConfirm.getMemo()%>";
<%}								
								}
								%>
	document.getElementById("memoToCustomer").focus();
	//scroll to the bottom window
	<%=ResourcesDefault.loadCrollBottom()%>

		}
<%}
			}%>
	}
				function validForSubmitEdit(){
					if(document.getElementById("orderCancel").value==""){
						alert("<%=LanguegeBUS.getValue("de_status_alert_select_record",lang)%>");
						return false;
					}
					return true;
				}
</script>

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
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("productcancel", lang)%></a>
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
					<label><%=LanguegeBUS.getValue("productcancel", lang)%></label>
				</p>
				<ul>
					<li class="transaction">&nbsp;</li>
					<li class="transaction">&nbsp;</li>
				</ul>
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
								<div class="box_ucp_inside">
									<h2 class="title"><%=LanguegeBUS.getValue("cancel_manage", lang)%></h2>

									<div id="usual2">
										<form
											action="<%=ServletUtils.getBaseUrl(request)%>/sellerOrderCancelController"
											method="post">
											<table class=table_deli border="0" cellpadding="0"
												style="width: 705px; text-align: left;" cellspacing="0">
												<tbody>
													<tr>
														<td class="bg_criteria_search"><%=LanguegeBUS.getValue("quick_search", lang)%></td>
														<td style="text-align: left;"><select id="selectDate"
															name="selectDate" style="width: 130px">
																<option value="0"><%=LanguegeBUS.getValue("deli_select", lang)%></option>
																<option value="1">
																	<%=LanguegeBUS.getValue("exc_required_date", lang)%>
																</option>
																<option value="2">
																	<%=LanguegeBUS.getValue("deli_order_date", lang)%>
																</option>
																<option value="3"><%=LanguegeBUS.getValue("deli_finished_date", lang)%>
																</option>
														</select> &nbsp;<%=LanguegeBUS.getValue("from", lang)%>:<input
															type="text" name="fromDate" value="" id="fromDate"
															style="width: 70px" /> <a
															href="javascript:NewCssCal('fromDate','yyyymmdd')"> <img
																src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																width="14" height="15" alt=""> </a> &nbsp;<%=LanguegeBUS.getValue("to", lang)%>:<input
															type="text" name="toDate" value="" id="toDate"
															title="Input Exp Date" style="width: 70px" /> <a
															href="javascript:NewCssCal('toDate','yyyymmdd')"> <img
																src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																width="14" height="15" alt=""> </a>
														</td>
														<td class="bg_criteria_search"><%=LanguegeBUS.getValue("cancel_status", lang)%></td>
														<td rowspan="2" style="vertical-align: middle;">
															<BUTTON class="button" type="submit" name="search"
																value="search">
																<%=LanguegeBUS.getValue("deli_view", lang)%>
															</BUTTON>
														</td>
													</tr>
													<tr>
														<td class="bg_criteria_search"><%=LanguegeBUS.getValue("advanced_search", lang)%></td>
														<td style="text-align: left;"><select
															id="selectAdvanced" name="selectAdvanced"
															style="width: 120px">
																<option value="0"><%=LanguegeBUS.getValue("deli_select", lang)%></option>
																<option value="1"><%=LanguegeBUS.getValue("signed_code", lang)%></option>
																<option value="2">
																	<%=LanguegeBUS.getValue("order_code", lang)%>
																</option>
																<option value="3">
																	<%=LanguegeBUS.getValue("deli_buyer_name", lang)%></option>
																<option value="4">
																	<%=LanguegeBUS.getValue("recievername", lang)%>
																</option>
														</select> <input type="text" style="width: 200px" name="textSearch">
														</td>
														<td><select id="selectCancelStatus"
															name="selectCancelStatus" style="width: 100px">
																<option value="0">
																	<%=LanguegeBUS.getValue("all", lang)%>
																</option>
																<%
																List<Cancelstatus> lstCS = CancelstatusBUS.lstCancelstatus(lang);
																for (int i = 0; i < lstCS.size(); i++) {
																	Cancelstatus cs = (Cancelstatus) lstCS.get(i);
															%>
																<option value="<%=cs.getCancelStatusId()%>">
																	<%=cs.getCancelStatusName()%>
																</option>
																<%
																}
															%>
														</select>
														</td>

													</tr>
												</tbody>
											</table>
											
										</form>
										<div>
                                    			<%                                 			
									                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(!pagedcust.isFirstPage()){%>
					                              <span ><a href="<%=baseURL%>/sale/cancelorder.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>&nbsp;&nbsp;
					                               <% }
					                               if(pagedcust.hasIndexPrev()){
					                            	   %>
					                            	    <span><a href="<%=baseURL%>/sale/cancelorder.html?page=<%=pagedcust.getIndexPrev()%>" ><%=LanguegeBUS.getValue("prev.",lang) %></a></span>
					                               <%}
									                	 for(int i=pagedcust.getIndexStart();i<pagedcust.getIndexLast();i++){
									                		 if(i!=pagedcust.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="<%=baseURL%>/sale/cancelorder.html?page=<%=i%>" ><%=i%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i%></span>
									                 <%}
									                	 }
									                	
									               if(pagedcust.hasIndexNext()){									            	 
									            	   %>
									            	   <span><a href="<%=baseURL%>/sale/cancelorder.html?page=<%=pagedcust.getIndexNext()%>" ><%=LanguegeBUS.getValue("next",lang) %></a></span>
									               <%}
									                	if(pagedcust.isLastPage()==false){	 
									                 %>
					                              &nbsp;&nbsp;<span ><a href="<%=baseURL%>/sale/cancelorder.html?page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    	</div>
										<div style="overflow: auto; height: 250px; width: 705px">
											<table id="tabs1" class="table_ucp" border="0"
												cellpadding="0" cellspacing="0" width="1950">
												<tbody>
													<tr>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("cancel_status", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("deli_finished_date", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("exc_required_date", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("exc_signed_date", lang)%></td>

														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("signed_code", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("product_code", lang)%></td>
														<td class="lstitle" width="150"><%=LanguegeBUS.getValue("productname", lang)%>
														</td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("amount", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("price", lang)%>
															<br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("total", lang)%>
															<br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>
														<td class="lstitle" width="150"><%=LanguegeBUS.getValue("deli_buyer_name", lang)%></td>
														<td class="lstitle" width="150"><%=LanguegeBUS.getValue("recievername", lang)%></td>
														<td class="lstitle" width="250"><%=LanguegeBUS.getValue("exc_buy_address", lang)%></td>
														<td class="lstitle" width="250"><%=LanguegeBUS.getValue("exc_receiver_address", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("order_code", lang)%></td>
													</tr>

													<%
														
														if (ds == null || ds.isEmpty()) {
													%>
													<tr>
														<td class="order_row" colspan="15"><%=LanguegeBUS.getValue("mOrder", lang)%></td>
													</tr>

													<%
														} else {
															for (int i = 0; i < ds.size(); i++) {
																ManageCancelView mcv = ds.get(i);
													%>
													<tr class="order_row"
														onmouseover="this.style.backgroundColor='#FFEBDA'"
														onmouseout="this.style.backgroundColor='#FFFFFF'"
														onmousedown="this.style.backgroundColor='#FFEBDA'"
														onclick="addContent('<%=mcv.getProductOrderDetailID()%>');return false;">
														<td class="nonSearch"><%=mcv.getCancelStatus()%></td>
														<td class="nonSearch">
															<%if(mcv.getDateFinishedCancel()==null){ %><%=mcv.getDateFinishedCancel()%>
															<%}else {%>--<%}%></td>
														<td class="nonSearch"><%=mcv.getDateRequestCancel()%>
														</td>
														<td class="nonSearch"><%=mcv.getDateOrder()%></td>
														<td class="nonSearch"><%=mcv.getProductOrderDetailID()%>
														</td>
														<td class="nonSearch"><%=mcv.getProductID()%></td>
														<td class="nonSearch" style="text-align: left"><%=mcv.getProductName()%></td>
														<td class="nonSearch"><%=mcv.getAmount()%></td>
														<td class="nonSearch" style="text-align: right;"><%=mcv.getPrice()%></td>
														<td class="nonSearch" style="text-align: right;"><%=mcv.getSubTotal()%></td>
														<td class="nonSearch" style="text-align: left"><%=mcv.getBuyerName()%></td>
														<td class="nonSearch" style="text-align: left"><%=mcv.getReceiverName()%></td>
														<td class="nonSearch" style="text-align: left"><%=mcv.getBuyerAddress()%></td>
														<td class="nonSearch" style="text-align: left"><%=mcv.getReceiverAddress()%></td>
														<td class="nonSearch"><%=mcv.getProductOrderID()%></td>
													</tr>
													<%
														}
													%>

													<%
														}
													%>
													
												</tbody>
											</table>
										</div>
										<br>



									</div>
									<br>
									<h2 class="title"><%=LanguegeBUS.getValue("transaction_infor", lang)%></h2>
									<div class="line clear"></div>

									<div class="group_listing_input">
										<table>
											<tr>
												<td>
													<div class="info_profile_inside">

														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("signed_code", lang)%>:</b>
																</label>
															</div>
															<input id="signedNumber" name="signedNumber"
																disabled="disabled" type="text" value=""
																style="width: 100px"
																class="medium_text_input show_tip required" />

														</div>


														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("productname", lang)%>:</b>
																</label>

															</div>
															<input id="productName" name="productName" type="text"
																disabled="disabled" value="" style="width: 250px"
																class="medium_text_input show_tip required" />

														</div>
													</div>
												</td>
												<td>
													<div class="info_profile_inside">


														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("exc_signed_date", lang)%>:</b>
																</label>

															</div>
															<input id="signedDate" name="signedDate"
																disabled="disabled" type="text" value=""
																style="width: 100px"
																class="medium_text_input show_tip required" />

														</div>

														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("exc_money", lang)%>:</b>
																</label>
															</div>
															<input id="totalSigned" name="totalSigned"
																disabled="disabled" type="text" value=""
																style="width: 100px"
																class="medium_text_input show_tip required" />

														</div>

													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div class="info_profile_inside">
														<div class="listing_input">
															<div class="post_label_container">

																<label class="postLabel"><b><%=LanguegeBUS.getValue("option_infor", lang)%>:</b>
																</label>
															</div>
															<input id="Optional Information"
																name="Optional Information" disabled="disabled"
																type="text" value="" style="width: 500px"
																class="medium_text_input show_tip required" />

														</div>
													</div>
												</td>
										</table>
									</div>
									<br>
									<h2 class="title"><%=LanguegeBUS.getValue("cancel_request", lang)%></h2>
									<div class="line clear"></div>

									<div class="group_listing_input">

										<table>
											<tr>
												<td>
													<div class="info_profile_inside">
														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("exc_required_date", lang)%>:</b>
																</label>
															</div>
															<input id="requestDate" name="requestDate"
																disabled="disabled" type="text" value=""
																style="width: 100px"
																class="medium_text_input show_tip required" />
														</div>
													</div>
												</td>
												<td>
													<div class="info_profile_inside">
														<div class="listing_input">
															<div class="post_label_container">
																<label class="postLabel"><b><%=LanguegeBUS.getValue("deli_finished_date", lang)%>:</b>
																</label>

															</div>
															<input id="finishDate" name="finishDate"
																disabled="disabled" type="text" value=""
																style="width: 100px"
																class="medium_text_input show_tip required" />

														</div>
													</div>
												</td>
											</tr>

											<tr>
												<td colspan="2">
													<div class="info_profile_inside">
														<div class="listing_input">
															<div class="post_label_container">

																<label class="postLabel">&nbsp;</label>
															</div>
															<select id="select" name="select" style="width: 180px"
																disabled="disabled">
																<option
																	value="<%=LanguegeBUS.getValue("cancel_cause1", lang)%>"><%=LanguegeBUS.getValue("order_cancel",lang) %></option>

															</select><br />
														</div>
														<div class="listing_input">
															<div class="post_label_container">

																<label class="postLabel"> <b><%=LanguegeBUS.getValue("cancel_cause", lang)%>:</b>
																</label>
															</div>

															<textarea id="memo" rows="2" cols="80"
																disabled="disabled" readonly="readonly"></textarea>
														</div>
													</div>
												</td>
											</tr>
										</table>


									</div>

									<br /> <br />
									<h2 class="title"><%=LanguegeBUS.getValue("confirm_cancel", lang)%>
									</h2>
									<div class="line clear"></div>
									<div class="group_listing_input">
										<form
											action="<%=ServletUtils.getBaseUrl(request)%>/sellerOrderCancelController"
											method="post" onsubmit="return validForSubmitEdit()">
											<table>

												<tr>

													<td colspan="2">
														<div class="info_profile_inside">

															<div class="listing_input">
																<div class="post_label_container">

																	<label class="postLabel"><b><%=LanguegeBUS.getValue("penalty_money", lang)%></b>
																	</label>
																</div>
																<input id="penalty_money" name="penalty_money"
																	disabled="disabled" type="text" value=""
																	style="width: 100px"
																	class="medium_text_input show_tip required" />
															</div>
														</div>
													</td>
												</tr>

												<tr>
													<td colspan="2">
														<div class="info_profile_inside">
															<div class="listing_input">
																<div class="post_label_container">

																	<label class="postLabel">&nbsp;</label>
																</div>

																<select id="confirmCancelStatus"
																	name="confirmCancelStatus" style="width: 180px">
																	<%
																	List<Cancelstatus> cancelStatuss = CancelstatusBUS
																			.lstCancelstatus(lang);
																	if (cancelStatuss.size() > 0) {
																		for (Cancelstatus cancelstatus : cancelStatuss) {
																%>
																	<option value="<%=cancelstatus.getCancelStatusId()%>"><%=cancelstatus.getCancelStatusName()%></option>
																	<%
																	}
																	}
																%>
																</select><br />
															</div>
															<div class="listing_input">
																<div class="post_label_container">

																	<label class="postLabel"> <b><%=LanguegeBUS.getValue("memo_to_buyer", lang)%></b> </label>
																</div>

																<textarea id="memoToCustomer" rows="2" cols="80"
																	name="memoToCustomer"></textarea>
															</div>
														</div>
													</td>
												</tr>
											</table>
											<br />
											<br />
											<div style="text-align: center">
												<input type="hidden" name="orderCancel" id="orderCancel" />
												<input id="upload_button" name="confirmCancel"
													class="btn_submit" type="submit"
													value="<%=LanguegeBUS.getValue("submit", lang)%>" /> <input
													id="reset_button" name="reset_button" class="btn_submit"
													type="submit"
													value="<%=LanguegeBUS.getValue("cancel", lang)%>" />
											</div>
											<%
										
											if(request.getParameter("page")!=null){%><input type="hidden" name="page" value="<%=request.getParameter("page")%>"/><%} %>
										</form>
										<div class="clear"></div>
										
									</div>

									

									<div class="line clear"></div>

									
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