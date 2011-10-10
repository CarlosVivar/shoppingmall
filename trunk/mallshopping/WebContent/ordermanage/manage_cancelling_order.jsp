<%-- 
    Document   : manageorders
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@include file="../library.jsp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%
	
	List<Productorderdetail> lst = (List<Productorderdetail>) request
	.getAttribute("listOrderCancel");
	if(lst==null){
		getServletContext().getRequestDispatcher("/ManageOrderCancelController").forward(request, response);
	}
	NavigationInfo pagedcust = (NavigationInfo)request.getAttribute("pagedcust");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("ordermanage", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="Googlebot" content="index,follow,archive">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>
<script type="text/javascript">
	function onSubmit2() {
		var form = document.getElementById("choosekindorder");
		form.submit();
	}
	function showLinkCancel(check) {
		var val = check.value;

		var row, cell;
		cell = check.parentNode;
		row = cell.parentNode;
		var rows = document.getElementById('tab2_table').getElementsByTagName(
				'tr');
		//xoa cancel
		for ( var i = 1; i < rows.length; i++) {
			var tds = rows[i].getElementsByTagName('td');
			var as = tds[7].getElementsByTagName('a');
			var radio = tds[0].getElementsByTagName('input');

			if (radio[0].checked) {
				as[0].style.color = "red";
				as[0].innerHTML = "Cancel";
			} else {
				as[0].innerHTML = "";
			}
		}
		//them cacel

	}
	
	//function onPageLoad() {
///	init_mymenucalendar(search_event_adaptor);
	//	
	//}
	
	function loadApplyCanceOrder(){
		location.replace("<%=ServletUtils.getBaseUrl(request)%>/orderapplycancel.html");
	}
</script>

</head>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="../WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">

				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>&nbsp; <img
								src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("ordermanage", lang)%></a>
							</li>

						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8"> </a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="../WEB-INF/sellermenu.jsp"%>
				</DIV>

				<!-- -------------Content------------- -->
				<DIV class="col-main">



					<br />
					<h2><%=LanguegeBUS.getValue("ordermanage", lang)%></h2>
					<DIV class="main-block">
						<DIV class="border-bot">
							<DIV class="border-left">
								<DIV class="border-right">
									<DIV class="corner-left-top">
										<DIV class="corner-right-top">

											<DIV class="corner-left-bot">
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<ul class="tab" style="padding: 5">
															<li><a rel="tabs1" href="order.html?defaultId=1"><span><%=LanguegeBUS.getValue("shopping_list", lang)%>
																</span> </a>
															</li>
															<li><a rel="tabs2" href="#tabs2" class="selected"><span><%=LanguegeBUS.getValue("cancel", lang)%></span>
															</a>
															</li>
															<li><a rel="tabs3"
																href="applyreturnexchangeorder.html"><span><%=LanguegeBUS.getValue("return_exchange", lang)%></span>
															</a>
															</li>


															<!--li style="float: right ! important;"><a href="" onclick="openPage('orderform.html').call(this)"><span><--%=LanguegeBUS.getValue("neworder") %></span></a></li-->
														</ul>

														<div class="tube">
															<div>
																<form
																	action="<%=ServletUtils.getBaseUrl(request)%>/ManageOrderCancelController"
																	method="post">
																	<%if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){	
														              %>
														              <input type="hidden" name="page" value="<%=pagedcust.getCurrentPage()%>"/> 
														            <%} %>
																	<table class="Search" width="100%">
																		<tbody>
																			<tr>
																				<th width="15%" class="select"><%=LanguegeBUS.getValue("cancel", lang)%></th>
																				<td width="85%" class="select"><input onclick="loadApplyCanceOrder()"
																						type="radio" id="rdo_cancel_1" name="rdo_cancel" />
																				<label for="rdo_cancel_1"
																					style="margin-right: 40px;"><%=LanguegeBUS.getValue("apply_for_cancel", lang)%>
																				</label> <a><input type="radio" id="rdo_cancel_2"
																						name="rdo_cancel" checked="checked" />
																				</a><label for="rdo_cancel_2"><%=LanguegeBUS.getValue("cancelling", lang)%></label>
																				</td>
																			</tr>
																			<tr>
																				<th class="select"><%=LanguegeBUS.getValue("deli_select_date", lang)%></th>
																				<td class="select"><input type="text"
																					name="fromDate" value="" id="datepickerdateFrom"
																					title="Input Exp Date" style="width: 120px" /> <a
																					href="javascript:NewCssCal('datepickerdateFrom','yyyymmdd')">
																						<img
																						src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																						width="16" height="17" alt="">
																				</a> &nbsp;&nbsp; <input type="text" name="toDate"
																					value="" id="datepickerdateTo"
																					title="Input Exp Date" style="width: 120px" /> <a
																					href="javascript:NewCssCal('datepickerdateTo','yyyymmdd')">
																						<img
																						src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																						width="16" height="17" alt="">
																				</a> &nbsp;&nbsp;
																					<button type="submit" name="search"><%=LanguegeBUS.getValue("search", lang)%></button>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</form>
															</div>
															<br>
															<div id="tabs2" class="tab_show">

																<form id="orderform" name="orderform"
																	action="orderdetailController" method="post">
																	<table width="100%" class="manageorderTable"
																		id="tab2_table">

																		<tr>
																			<th class="title" width="20%"><%=LanguegeBUS.getValue("orderNo.", lang)%><div>
																					(<%=LanguegeBUS.getValue("oDate", lang)%>)
																				</div>
																			<th class="title" width="20%"><%=LanguegeBUS.getValue("item", lang)%>
																			<th class="title" width="12%"><%=LanguegeBUS.getValue("deli_quantity", lang)%>
																			<th class="title" width="12%"><%=LanguegeBUS.getValue("price", lang)%>
																			<th class="title" width="12%"><%=LanguegeBUS.getValue("shipping", lang)%>
																			<th class="title" width="14%"><%=LanguegeBUS.getValue("exc_status", lang)%>
																			<th class="title" width="10%"><%=LanguegeBUS.getValue("apply_remark", lang)%>
																		</tr>
																		<%
																			if (lst != null) {
																				for (Productorderdetail productODetail : lst) {
																					Productorder prod = ProductorderBUS.getProductorder(
																							productODetail.getProductorder()
																									.getProductOrderId(), lang);

																					int id_ProductOrder = prod.getProductOrderId();
																					int pODetailID = productODetail.getProductOrderDetailId();
																					Date orderdate = prod.getOrderDate();

																					Date d = new Date();
																					Products product = ProductBUS.getProducts(
																							productODetail.getProductId(), lang);
																					float price = product.getPrice();
																					float quantity = productODetail.getProductNumber();
																					String deliverCost = DeliverCostBUS
																							.getDeliverCostByProduct(product,
																									price * quantity,prod.getTransportId(), lang)
																							+ "";
																					Deliver deliver = DeliverBUS.getDeliverByPODetail(
																							pODetailID, lang);
																					Deliverstatus deliverStatus = DeliverStatusBUS
																							.getDeliverStatus(deliver.getDeliverstatusID(),
																									lang);
																					;
																					Ordercancel orderCancel = OrdercancelBUS
																							.getOrdercancelByPODetailID(pODetailID, lang);
																					Cancelstatus cancelStatus = CancelstatusBUS
																							.getCancelstatusById(
																									orderCancel.getCancelStatusId(), lang);
																		%>
																		<tr>
																			<td style="border-left: none !important;"><a
																				href="paymentmanage.html?id=<%=id_ProductOrder%>">
																					HD00<%=id_ProductOrder%>/<%=d.getYear() + 1900%> </a><br>(<%=orderdate%>)</td>
																			<td align="center"><a style="color: #0066BC "
																				href="<%if (cancelStatus != null
							&& cancelStatus.getCancelStatusId() == 3) {%>productdetail.html?Id=<%=product.getProductId()%><%} else {%>orderdetailinfo.html?id=<%=pODetailID%><%}%>"><%=product.getProductName()%></a>
																			</td>
																			<td align="center"><%=quantity%></td>
																			<td align="right"><%=price%></td>
																			<td align="right"><%=deliverCost%></td>
																			<td align="right">
																				<%
																					if (cancelStatus != null) {
																				%><%=cancelStatus.getCancelStatusName()%> <%
 	}
 %>
																			</td>
																			<td align="center"><a style="color: #0066BC "
																				href="cancel_refund_info.html?id=<%=pODetailID%>"
																				style="">See detail</a>
																			</td>
																		</tr>
																		<%
																			}
																			}
																		%>
<tr>
                                    	<td colspan="8">
                                    			<%                                 			
									                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(!pagedcust.isFirstPage()){%>
					                              <span ><a href="applyreturnexchangeorder.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>&nbsp;&nbsp;
					                               <% }
					                               if(pagedcust.hasIndexPrev()){
					                            	   %>
					                            	    <span><a href="applyreturnexchangeorder.html?page=<%=pagedcust.getIndexPrev()%>" ><%=LanguegeBUS.getValue("prev.",lang) %></a></span>
					                               <%}
									                	 for(int i=pagedcust.getIndexStart();i<pagedcust.getIndexLast();i++){
									                		 if(i!=pagedcust.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="applyreturnexchangeorder.html?page=<%=i%>" ><%=i+1%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i+1%></span>
									                 <%}
									                	 }
									                	
									               if(pagedcust.hasIndexNext()){									            	 
									            	   %>
									            	   <span><a href="applyreturnexchangeorder.html?page=<%=pagedcust.getIndexNext()%>" ><%=LanguegeBUS.getValue("next",lang) %></a></span>
									               <%}
									                	if(pagedcust.isLastPage()==false){	 
									                 %>
					                              &nbsp;&nbsp;<span ><a href="applyreturnexchangeorder.html?page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    	</td>
                                    </tr>
																	</table>
																</form>
															</div>
															<div class="footer blog">
																<%@include file="../WEB-INF/footer.jsp"%>
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

				</DIV>

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="../WEB-INF/rightmenu.jsp"%>

				</DIV>

			</DIV>

		</DIV>
	</DIV>

</body>
</html>
