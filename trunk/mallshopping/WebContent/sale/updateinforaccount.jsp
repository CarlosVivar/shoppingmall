<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object obj = request.getAttribute("getcompany");
	if (obj == null) {
		String url = "/updateInforAccountController";
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

			<br/>
			<div class="bottom_userCPanel">
				<p class="sumMoney"><label><%=LanguegeBUS.getValue("sellerinfo", lang) %></label></p>
				<ul>
					<li class="transaction">&nbsp; </li>
					<li class="transaction"><%=LanguegeBUS.getValue("sellerinformationcccountchange", lang)%>.</li>
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
							<%
								Company company = (Company) request.getAttribute("getcompany");
								String sellername = (String) session.getAttribute("username");
						        User user = UserBUS.getUser(sellername, (String) lang);
							%>

							<div class="center_box_ucp">
								<div class="box_ucp_inside">
									<h2 class="title">
										<%=LanguegeBUS.getValue("username", lang)%>&nbsp;&nbsp; <input
											value="<%=user.getAccount()%>" name="textfield"
											type="text" disabled="disabled" readonly="true" />
										&nbsp;&nbsp;<%=LanguegeBUS.getValue("fullname", lang)%>&nbsp;&nbsp;<input
											name="textfield" value="<%=user.getFullName()%>"
											type="text" disabled="disabled" readonly="true" />
									</h2>
									<p class="numUp">
										<%=LanguegeBUS.getValue("thispage", lang)%><br>
										<%=LanguegeBUS.getValue("change", lang)%>
										<br>
										<%=LanguegeBUS.getValue("paper", lang)%>
										<br>
										<%=LanguegeBUS.getValue("result", lang)%>
										<br>


									</p>
									<p>&nbsp;</p>
									<p class="numUp"></p>
									
									
								</div>
							</div>
							<div class="center_box_ucp">
								<div class="box_ucp_inside">
									<p class="numUp">

										<a id="cmd_uporder1" style="cursor: pointer;"> </a>
									</p>

								</div>
							</div>


							<form
								action="<%=ServletUtils.getBaseUrl(request)%>/updateInforAccountController"
								method="POST">
								<div class="center_box_ucp">
									<div class="box_ucp_inside">
										<h2 class="title">
											<%=LanguegeBUS.getValue("please", lang)%></h2>


										<div class="creat_shop">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<h3 class="n1">
												<%=LanguegeBUS.getValue("certification", lang)%></h3>
												<input id="co_established" name="co_established" type="hidden" value="<%=company.getEstablished() %>" style="width:150px" />
											<table width="685" border="0">
												<tr>
													<td width="232"><div align="right">
															<strong> <%=LanguegeBUS.getValue("registration", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;
															</strong>
														</div></td>
													<td width="437"><input name="textfield22" type="text "
														disabled="disabled" readonly="true"
														value="<%=company.getBusinessNumber()%>" /></td>
												</tr>

												<tr>
													<td><div align="right">
															<strong><%=LanguegeBUS.getValue("companyname", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;
															</strong>
														</div></td>
													<td><input type="text" name="txtCompanyname" style="width:150px"
														value="<%=company.getCompanyName()%>" /></td>
												</tr>
												<tr>
													<td><div align="right">
															<strong><%=LanguegeBUS.getValue("addresscompany", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><input type="text" style="width:250px" name="txtCompanyAddress"
														value="<%=company.getAddress()%>" /></td>
												</tr>
												<tr>
													<td><div align="right">
															<strong><%=LanguegeBUS.getValue("taxtype", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><select name="cbBTaxtype" style="width: 100px">
															<option value="Normal Tax">Normal Tax</option>
															<option value="Reduce Tax">Reduce Tax</option>
													</select></td>
												</tr>
												<tr>
													<td><div align="right">
															<strong><%=LanguegeBUS.getValue("businesstype", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><input type="text" name="textfield522"
														value="<%=company.getBusinessType()%>" /></td>
												</tr>
												<tr>
													<td></td>

												</tr>
											</table>
										</div>
										<div class="creat_shop">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<h3 class="n1"><%=LanguegeBUS.getValue("Representative", lang)%></h3>
											<table width="698" border="0">
												<tr>
													<td width="233" height="26"><div align="right">
															<strong><%=LanguegeBUS.getValue("representativename", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;
															</strong>
														</div></td>
													<td width="449"><input type="text" name="txtRepresen" style="width:200px"
														value="<%=company.getRepresentative()%>" /></td>
												</tr>
												<tr>
													<td height="23"><div align="right">
															<strong><%=LanguegeBUS.getValue("Identitycardnumber", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><input type="text" name="txtIndentityCard"
														value="<%=company.getIdentityCard()%>" /> <%=LanguegeBUS.getValue("case", lang)%></td>
												</tr>
												<tr>
													<td height="23"><div align="right">
															<strong><%=LanguegeBUS.getValue("nationality", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div>
													</td>
													
													<td>
													<% List<Origin> lstOr = (List<Origin>)OriginBUS.lstOrigin(lang);
														for(int j=0;j<lstOr.size()-1;j++){
															Origin o = (Origin)lstOr.get(j);
													%>
													<input name="rdoInternational" type="radio"
														value="<%=o.getOriginId()%>"
														<%if (company.getNationality()==o.getOriginId()) {%>
														checked="checked" <%}%> /><%=o.getOriginName()%> 
														&nbsp;
													<%} %>	
													</td>
												</tr>
											</table>
										</div>
										<%
											Bank bank = (Bank) request.getAttribute("getBank");
										%>
										<div class="creat_shop">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<h3 class="n1"><%=LanguegeBUS.getValue("bankinfo", lang)%></h3>
											<table width="697" border="0">
												<tr>
													<td width="241" height="26"><div align="right">
															<strong><%=LanguegeBUS.getValue("Accountholdersname", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td width="440"><input type="text" name="txtHolder" style="width:200px"
														value="<%=bank.getAccountholders()%>" /></td>
												</tr>
												<tr>
													<td height="26"><div align="right">
															<strong><%=LanguegeBUS.getValue("banking", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><input type="text" style="width:250px" name="cbBBank"
														value="<%=bank.getBanking()%>" /></td>
												</tr>
												<tr>
													<td height="26">
														<div align="right">
															<strong><%=LanguegeBUS.getValue("accountnumber", lang)%>:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
														</div></td>
													<td><p>
															<input type="text" name="txtNumber"
																value="<%=bank.getAccountNumber()%>" />
														</p></td>
												</tr>
											</table>
											<br/>
											<div align="left">
												
												<BUTTON class="button" type="submit" name="btnUpdate"  value="<%=LanguegeBUS.getValue("requestchange", lang)%>">
							                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("requestchange", lang)%></SPAN></SPAN></SPAN>
							                    </BUTTON>
											</div>

										</div>

									</div>

								</div>

							</form>
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