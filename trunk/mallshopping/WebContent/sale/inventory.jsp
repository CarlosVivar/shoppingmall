
<%@page import="DAO.InventoryStateDAO"%>
<%@page import="DAO.InventoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object obj = request.getAttribute("lstInven");
	if (obj == null) {
		String url = "/inventoryController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("salemanage", lang)%></title>
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
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				 function addContent(id, title) {
					<%	
					List<Inventory> lstInventory=InventoryDAO.lstInventory((String) session.getAttribute("username"), lang);
					for(int j = 0; j <lstInventory.size();j++){
						Inventory inven=lstInventory.get(j);
						Products product=ProductBUS.getProducts(inven.getProductId(),lang);
						int productId=product.getProductId();
						String productName=product.getProductName();
						int invenId=inven.getInventoryId();
						Date invenDate=inven.getLimitDate();
					
					%>
					 var productId="<%=productId%>";
					 var invenId= "<%=invenId%>";
					 var invenDate="<%=invenDate%>";
					 var productName="<%=productName%>";
					 

					 if (id == invenId) {
			       		document.getElementById("invenId").value = invenId;
						document.getElementById("invenDate").value = invenDate;
						//document.getElementById("invenDate1").value = invenDate;
						document.getElementById("productId").value=productId;
						document.getElementById("productName").value=productName;

					}
					<%}%>
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
							rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("sale", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="Đóng" width="8" height="8"> </a>
			</div>
			<div class="breadcrumb">
				<img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_link.gif"
					width="12" height="12" alt="Icon Link" /> <span><b> <%=LanguegeBUS.getValue("managerstock", lang)%>
				</b> </span>
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
									<h2 class="title">
										<%=LanguegeBUS.getValue("lstproductstock", lang)%>
									</h2>
									<div class="creat_shop">

										<div style="overflow: auto; height: 80px; width: 705px">
											<h3 class="n1">
												<%=LanguegeBUS.getValue("youcansearchdate", lang)%>
											</h3>
										</div>

										<div style="overflow: auto; height: 400px; width: 705px">
											<form
												action="<%=ServletUtils.getBaseUrl(request)%>/SearchInvenCotroller"
												method="post">
												<table width="800" border="0" class="table_ucp">
													<tr>
														<td bgcolor="#CCCCCC" colspan="6" width="95"><div
																align="right">
																<input type="submit" name="Submit" value="Submit" />
															</div>
														</td>
														<td bgcolor="#CCCCCC" width="95"> &nbsp; </td>
													</tr>

													<tr>
														<td colspan="7" style="text-align:left"><div align="center">
																<%=LanguegeBUS.getValue("datefrom", lang)%>: <input
																	type="text" name="datepickerdateFrom" value=""
																	id="datepickerdateFrom" title="Input Exp Date"
																	style="width: 120px" /> <a
																	href="javascript:NewCssCal('datepickerdateFrom','yyyymmdd')">
																	<img
																	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																	width="16" height="17" alt=""> </a>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<%=LanguegeBUS.getValue("dateto", lang)%>: <input
																	type="text" name="datepickerdateTo" value=""
																	id="datepickerdateTo" title="Input Exp Date"
																	style="width: 120px" /> <a
																	href="javascript:NewCssCal('datepickerdateTo','yyyymmdd')">
																	<img
																	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																	width="16" height="17" alt=""> </a>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<%=LanguegeBUS.getValue("productname", lang)%>: <input
																	type="text" name="txtkeyName" />
																<h1></h1>
																<br>Manufacture <select style="width: 130px"
																	name="optionManuId">
																	<option value="0">
																		-<%=LanguegeBUS.getValue("manufactural", lang)%>
																		-
																	</option>
																	<%
																		List<Manufacturer> listManu = ManufacturerBUS.lstManufacturer(lang);
																		if (listManu != null) {
																			for (int i = 0; i < listManu.size(); i++) {
																				Manufacturer Manu = listManu.get(i);
																	%>
																	<option value="<%=Manu.getManufacturerId()%>">
																		<%=Manu.getManufacturerName()%>
																	</option>
																	<%
																		}
																		}
																	%>
																</select> <%-- &nbsp;&nbsp;&nbsp;&nbsp;<%=LanguegeBUS.getValue("invenstate", lang)%> --%>
																<%-- <select style="width: 130px" name="optionStateInvenId">
																	<option value="0">
																		-
																		<%=LanguegeBUS.getValue("invenstate", lang)%>
																		-
																	</option>
																	<option value="1"><%=LanguegeBUS.getValue("inputsto", lang)%>
																	</option>
																	<option value="2"><%=LanguegeBUS.getValue("outputsto", lang)%></option>
																	<option value="3"><%=LanguegeBUS.getValue("orther", lang)%>
																	</option>
																</select> --%>
															</div>
														</td>


													</tr>
												</table>
											</form>
											<table width="800" border="0" class="table_ucp">
												<tr>

													<td bgcolor="#A79BCA" width="80"><%=LanguegeBUS.getValue("productid", lang)%></td>
													<td bgcolor="#A79BCA" width="113"><%=LanguegeBUS.getValue("productname", lang)%></td>
													<td bgcolor="#A79BCA" width="113"><%=LanguegeBUS.getValue("productprice", lang)%></td>
													<td bgcolor="#A79BCA" width="81"><%=LanguegeBUS.getValue("manufac", lang)%></td>
													<td bgcolor="#A79BCA" width="111"><%=LanguegeBUS.getValue("nventoryid", lang)%></td>
													<td bgcolor="#A79BCA" width="78"><%=LanguegeBUS.getValue("expDate", lang)%></td>
													<%-- <td bgcolor="#A79BCA" width="78"><%=LanguegeBUS.getValue("invenstate", lang)%></td> --%>


												</tr>
												<%
													ArrayList<Inventory> lstInven = (ArrayList<Inventory>) request.getAttribute("lstInven");
													if (lstInven == null) {

													} else {
														for (int i = 0; i < lstInven.size(); i++) {
															Inventory inven = lstInven.get(i);

															Products pro = ProductBUS.getProducts(inven.getProductId(),
																	lang);
															Invenstate insta = InventoryStateDAO.getInvenState(
																	inven.getSateId(), lang);
															Manufacturer manu = ManufacturerBUS.getManufacturer(
																	pro.getManufacturerId(), lang);
												%>

												<tr class="order_row"
													onmouseover="this.style.backgroundColor='#FFEBDA'"
													onmouseout="this.style.backgroundColor='#FFFFFF'"
													onmousedown="this.style.backgroundColor='#FFEBDA'"
													onclick="addContent('<%=inven.getInventoryId()%>');">

													<td><%=inven.getProductId()%></td>
													<td><%=pro.getProductName()%></td>
													<td><%=pro.getPrice()%></td>
													<td><%=manu.getManufacturerName()%></td>
													<td><%=inven.getInventoryId()%></td>
													<td><%=inven.getLimitDate()%></td>
													<%-- <td colspan="1"><%=insta.getStateName()%></td> --%>


												</tr>

												<%
													}
													}
												%>
												<tr>
													<td colspan="10">
														<%
															String message = (String) request.getAttribute("Message");
															if (message != null) {
																out.println("<p align='center'><font size='2pt' color='red'>"
																		+ message + "</font></p>");
															}
														%>
													</td>
												</tr>

											</table>
										</div>

									</div>
								</div>
							</div>
							<div class="center_box_ucp">
								<div class="box_ucp_inside">
									<h2 class="title">
										<%=LanguegeBUS.getValue("sendrequest", lang)%>
									</h2>
									<div class="creat_shop">

										<div style="overflow: auto; height: 80px; width: 705px">
											<h3 class="n1">
												<%=LanguegeBUS.getValue("click", lang)%>
											</h3>
										</div>

										<div style="height: 300px; width: 705px">
					<form action="<%=ServletUtils.getBaseUrl(request)%>/extensionController" method="get">					
											<table width="600" border="0" class="table_ucp">
											
											  <tr>
													<td colspan="5">
														<div align="center">
															<%
															String message1 = (String) request.getAttribute("Message1");
															if (message1 != null) {
																out.println("<p align='center'><font size='2pt' color='red'>"
																		+ message1 + "</font></p>");
															}
														%>
														</div></td>
												</tr>
												<tr>
													<td colspan="2">
														<div align="right">
															<input type="submit" name="btnInsert" value="<%=LanguegeBUS.getValue("btnsendrequest", lang)%>" />
														</div></td>
												</tr>
												<tr>
													<td><%=LanguegeBUS.getValue("productid", lang)%></td>
													<td><div align="left">
															<input type="text" name="txtProductId"  id="productId"
																readonly="true"  /> &nbsp;&nbsp;<%=LanguegeBUS.getValue("productname", lang)%>: <input
																type="text" name="textfield5" id="productName"
																readonly="true" />
														</div></td>
												</tr>
												<tr>
													<td width="89"><%=LanguegeBUS.getValue("inventoryid", lang)%></td>
													<td><div align="left">
															<input type="text" name="txtInventoryId"  id="invenId" 
																readonly="true" />
														</div></td>
												</tr>
												<tr>
													<td><%=LanguegeBUS.getValue("limit_date", lang)%></td>
													<td><div align="left">
															<input type="text" name="txtLimitDateOld"  id="invenDate" readonly="true"  />
														</div></td>
												</tr>
												<tr>
													<td><%=LanguegeBUS.getValue("limitdatenum", lang)%></td>
													<td><div align="left">
															<select name="selectLimitDateNum" style="width: 85px">
															<option value="0">-<%=LanguegeBUS.getValue("select", lang)%>-</option>
															<option value="1">1</option>
															<option value="2">3</option>
															<option value="3">5</option>
															<option value="5">7</option>
															<option value="6">10</option>
															<option value="7">15</option>
															<option value="8">30</option>
															<option value="9">60</option>
															<option value="10">90</option>
			
															</select> (<%=LanguegeBUS.getValue("day", lang)%>)
														</div></td>
												</tr>
											</table>
											</form>
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
