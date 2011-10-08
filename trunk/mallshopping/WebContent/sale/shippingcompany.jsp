<%@page import="CONTROLLER.DeliverStatusController"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<%
	List<Shippingcompany> shippingcompanies = (List<Shippingcompany>) request
			.getAttribute("shippingCompanys");
	if (shippingcompanies == null) {
		request.getRequestDispatcher("/ShippingCompanyController")
				.forward(request, response);
	}
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
		$("#shEdit").hide();
		$("#shCreate").hide();
		$("#invalidSearchValue").hide();
	});

	function loadEdit(shID, shName, shAddress, shPhone, shFax, shWeb, shEmail) {
		$("#shEdit").show();
		$("#shCreate").hide();
		document.formEdit.shID.value = shID;
		document.formEdit.shName.value = shName;
		document.formEdit.shAddress.value = shAddress;
		document.formEdit.shPhone.value = shPhone;
		document.formEdit.shFax.value = shFax;
		document.formEdit.shWeb.value = shWeb;
		document.formEdit.shEmail.value = shEmail;
		
		//setFocus
		document.formEdit.shName.focus();

	}

	function loadCreate() {
		$("#shCreate").show();
		$("#shEdit").hide();
		resetAllFieldsCreate();
		
		//setFocus
		document.formCreate.shName.focus();
	}

	function resetAllFieldsCreate() {		
		document.formCreate.shName.value = "";
		document.formCreate.shAddress.value = "";
		document.formCreate.shPhone.value = "";
		document.formCreate.shFax.value = "";
		document.formCreate.shWeb.value = "";
		document.formCreate.shEmail.value = "";
	}

	function resetAllFieldsEdit() {
		document.formEdit.shName.value = "";
		document.formEdit.shAddress.value = "";
		document.formEdit.shPhone.value = "";
		document.formEdit.shFax.value = "";
		document.formEdit.shWeb.value = "";
		document.formEdit.shEmail.value = "";
	
	}
	
	function onSelectCBBSearch(){
		$("#invalidSearchValue").hide();
	}
	
	function validSearch(){
		if(document.formSearch.selectSearch.selectedIndex!="0" && document.formSearch.searchValue.value==""){
			$("#invalidSearchValue").show();
			return false;
		}
		$("#invalidSearchValue").hide();
		return true;
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
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("sh_shiping_company", lang)%></a>
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
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("sh_shiping_company", lang)%></label>
				</p>

				<p>
					<b><%=LanguegeBUS.getValue("sh_shiping_company", lang)%>:</b>
					<%=LanguegeBUS.getValue("sh_introduce", lang)%>
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
											class="title_deli"><%=LanguegeBUS.getValue("sh_manage", lang)%>
										</label>
									</div>
									<div class="space"></div>
									<div>
										<form name="formSearch" onsubmit="return validSearch();"
											action="<%=ServletUtils.getBaseUrl(request)%>/ShippingCompanyController">
											<table class=table_deli border="0" cellpadding="0"
												style="width: 730px;" cellspacing="0">
												<tbody>
													<tr>
														<td width="100" style=" background-color: #CCCCCC;text-align: left;">Select view</td>
														<td width="530" style="text-align: left;"><select
															name="selectSearch" onclick="onSelectCBBSearch()">
																<option value="0"><%=LanguegeBUS.getValue("sh_all", lang)%></option>
																<option value="name"><%=LanguegeBUS.getValue("sh_company_name", lang)%></option>
																<option value="address"><%=LanguegeBUS.getValue("sh_company_address", lang)%></option>
														</select> &nbsp; <input type="text" width="100" name="searchValue"
															onmousedown="onSelectCBBSearch()" /> &nbsp;<label
															id="invalidSearchValue" style="color: red">Invalid</label>
														</td>
														<td width="100"><button name="search"><%=LanguegeBUS.getValue("deli_view", lang)%></button>
														</td>
													</tr>

												</tbody>
											</table>
										</form>
									</div>
									<div class="space"></div>
									<div class="line_gray"></div>
									<div class="space"></div>
									<div style="overflow: auto; width: 740px">
										<table class="table_ucp" border="0" cellpadding="0"
											cellspacing="0" width="820">
											<tbody>
												<tr>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("deli_no", lang)%></td>
													<td class="lstitle" style="color: black" width="150"><%=LanguegeBUS.getValue("sh_company_name", lang)%></td>
													<td class="lstitle" style="color: black" width="200"><%=LanguegeBUS.getValue("sh_company_address", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("sh_company_phone", lang)%></td>
													<td class="lstitle" style="color: black" width="90"><%=LanguegeBUS.getValue("sh_company_fax", lang)%></td>
													<td class="lstitle" style="color: black" width="100"><%=LanguegeBUS.getValue("sh_company_web", lang)%></td>
													<td class="lstitle" style="color: black" width="100"><%=LanguegeBUS.getValue("sh_company_email", lang)%></td>

												</tr>
												<%
													if (shippingcompanies != null) {
														int count = 0;
														for (Shippingcompany shippingcompany : shippingcompanies) {
															String shID = shippingcompany.getShippingCompanyId() + "";
															String name = shippingcompany.getShippingCompanyName();
															String address = shippingcompany.getAddress();
															String phone = shippingcompany.getPhone();
															String fax = shippingcompany.getFax();
															String web = shippingcompany.getWeb();
															String email = shippingcompany.getEmail();
															count++;
												%>

												<tr class="order_row"
													onmouseover="this.style.backgroundColor='#FFEBDA'"
													onmouseout="this.style.backgroundColor='#FFFFFF'"
													onmousedown="this.style.backgroundColor='#FFEBDA'"
													onclick="loadEdit('<%=shID%>','<%=name%>','<%=address%>','<%=phone%>','<%=fax%>','<%=web%>','<%=email%>')">
													<td class="nonSearch"><label><%=count%></label>
													</td>
													<td class="nonSearch"><label><%=name%></label>
													</td>
													<td class="nonSearch"><label><%=address%></label>
													</td>
													<td class="nonSearch"><label><%=phone%></label>
													</td>
													<td class="nonSearch"><label><%=fax%></label>
													</td>
													<td class="nonSearch"><label><%=web%></label>
													</td>
													<td class="nonSearch"><label><%=email%></label>
													</td>


												</tr>
												<%
													}
													} else {
												%><tr>
													<td colspan="11"><label><%=LanguegeBUS.getValue(
						"deli_message_have_not_shipping_company", lang)%></label>
													</td>
												</tr>
												<%
													}
												%>

											</tbody>
										</table>

									</div>
									<div class="space"></div>
									<div style="padding-right: 5px">
										<button style="float: right;" id="createSh" type="button"
											onclick="loadCreate()"><%=LanguegeBUS.getValue("sh_create_shipping_comapany", lang)%></button>
									</div>
									<div class="space"></div>

									<div class="space"></div>
									<div id="shEdit">
										<div class="space"></div>
										<div class="space"></div>
										<div class="line_gray"></div>
										<div class="space"></div>
										<div style="padding-left: 5px">
											<label class="title_deli" style="display: block"><%=LanguegeBUS.getValue("deli_edit", lang)%></label>
										</div>
										<div class="space"></div>
										<div>
											<form name="formEdit" onsubmit="return validateForm(this)" method="post"
												action="<%=ServletUtils.getBaseUrl(request)%>/ShippingCompanyController">
												<table class=table_deli border="0" cellpadding="0"
													style="width: 730px;" cellspacing="0">
													<tbody>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_name", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shName" /></td>
															<td rowspan="6" valign="middle"
																style="vertical-align: middle; width: 200px"><input
																type="hidden" name="shID">
																<button type="submit" value="shUpdate" name="submit"><%=LanguegeBUS.getValue("deli_update", lang)%></button>
															</td>

														</tr>
														<tr>
															<td class="lstitle" width="150px"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_address", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 400px;" name="shAddress" /></td>

														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_phone", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shPhone" /></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_fax", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shFax" /></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_web", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shWeb" /></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_email", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shEmail" /></td>
														</tr>

													</tbody>
												</table>
												<div class="space"></div>

												<div class="space"></div>
												<div align="center"></div>
											</form>
										</div>
										<div class="space"></div>

									</div>
									<div id="shCreate">
										<div style="padding-left: 5px">
											<label class="title_deli" style="display: block"><%=LanguegeBUS.getValue("sh_create", lang)%></label>
										</div>
										<div class="space"></div>
										<div>
											<form name="formCreate" onsubmit="return validateForm(this)" method="post"
												action="<%=ServletUtils.getBaseUrl(request)%>/ShippingCompanyController">
												<table class=table_deli border="0" cellpadding="0"
													style="width: 730px;" cellspacing="0">
													<tbody>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_name", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shName" /></td>
															<td rowspan="6" valign="middle"
																style="vertical-align: middle; width: 200px"><input
																type="hidden" name="shID">
																<button type="submit" value="shCreate" name="submit"><%=LanguegeBUS.getValue("sh_create", lang)%></button>
															</td>

														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_address", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 400px;" name="shAddress" /></td>
														</tr>
														<tr>
															<td class="lstitle" width="150px"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_phone", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shPhone" /></td>

														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_fax", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shFax" /></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_web", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shWeb" /></td>
														</tr>
														<tr>
															<td class="lstitle"
																style="text-align: left !important; padding-left: 10px !important"><%=LanguegeBUS.getValue("sh_company_email", lang)%></td>
															<td
																style="text-align: left !important; padding-left: 10px !important"><input
																type="text" style="width: 200px;" name="shEmail" /></td>
														</tr>


													</tbody>
												</table>
												<div class="space"></div>

												<div class="space"></div>
												<div align="center"></div>
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