<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>

<%@page import="nl.captcha.CaptchaBean"%>
<%@page import="nl.captcha.Captcha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("home", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

</head>

<script type="text/javascript">
	
</script>
<style type="text/css">
#fancybox-content {
	height: none !important;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
	$("#messages").hide();
	$("#invalidName").hide();
	$("#invalidEmail").hide();
	$("#invalidPhone").hide();
	$("#invalidCode").hide();
	$("#invalidMessage").hide();
	
	<%if(session.getAttribute("message")!=null){
		session.removeAttribute("message");
		%>
	alert("<%=LanguegeBUS.getValue("alertcontactsuccessfull",lang)%>");
	<%}%>

	validCode();
});

function validCode(){
	<%if(session.getAttribute("invalidCode")!=null){
		session.removeAttribute("invalidCode");
		%>
	$("#invalidCode").show();
	<%}%>
}
function hidenInvalidName(){
	$("#invalidName").hide();
}
function hidenInvalidEmail(){
	$("#invalidEmail").hide();
}
function hidenInvalidPhone(){
	$("#invalidPhone").hide();
}
function hidenInvalidMessage(){
	$("#invalidMessage").hide();
}
function hidenInvalidCode(){
	$("#invalidCode").hide();
}

</script>


<body onload="validCode()">

	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">
				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><img
								src="admin/css/images/icon-arrow1.gif">&nbsp;<a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>
						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8"> </a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/leftmenu.jsp"%>
				</DIV>

				<!-- -------------Content------------- -->
				<DIV class="col-main">
					<DIV class="main-block">
						<DIV class="border-bot">
							<DIV class="border-left">
								<DIV class="border-right">
									<DIV class="corner-left-top">
										<DIV class="corner-right-top">
											<DIV class="corner-left-bot">
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														
														<div align="center">
													
														<br> <br> 
														<label style="font-weight: bold;font-size: 16"><%=LanguegeBUS.getValue("welcometowebsite",lang)%></label>
													
														
														<br> <br>
															<form name="supportform" action="supportcontroller" onsubmit="return validSubmit();">
																<table>
																	<tr>
																		<td align="right"
																			style="width: 100px; padding-right: 10px"
																			height="30px"><b><%=LanguegeBUS.getValue("fullname",lang)%></b></td>
																		<td style="width: 200px" height="30px"><input name="name" id="name"
																			type="text"
																			style="width: 200px; padding: 2px; border: 1p solid;" onchange="hidenInvalidName()"/>
																			<span style="color: red" id="invalidName">x</span>
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b><%=LanguegeBUS.getValue("email",lang)%></b></td>
																		<td height="30px"><input name="email" type="text" id="email"  onchange="hidenInvalidEmail()"
																			style="width: 200px; padding: 2px" />
																			<span style="color: red" id="invalidEmail">x</span>
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b><%=LanguegeBUS.getValue("exc_phone",lang)%></b></td>
																		<td height="30px"><input name="phone" type="text" id="phone"  onchange="hidenInvalidPhone()"
																			style="width: 200px; padding: 2px" />
																			<span style="color: red" id="invalidPhone">x</span>
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b><%=LanguegeBUS.getValue("message",lang)%></b></td>
																		<td height="30px" width="320px"><textarea name="message" rows="8" cols="30" id="message"  onchange="hidenInvalidMessage()"
																				style="width: 300px; height: 120px"></textarea>
																				<span style="color: red" id="invalidMessage">x</span>
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px;padding-bottom: 5px;vertical-align: bottom"
																			height="30px"><b><%=LanguegeBUS.getValue("exc_id",lang)%></b></td>
																		<td style="padding-top: 5px"><input type="text" name="code" id="code"  onchange="hidenInvalidCode()"
																			style="width: 50px; padding: 2px">
																			<span style="color: red" id="invalidCode">x</span>
																			<img id="imageCaptcha" src="captchaServlet.do" width="150">	
																			<span style="text-decoration: underline;color: gray;cursor: pointer;" id="refresh" onclick="window.location.href=window.location.href"><%=LanguegeBUS.getValue("refresh",lang)%></span>																		
																			</td>
																	</tr>
																	<tr>
																	
																		<td colspan="2" align="center">
																		
																		
																		<br>
																		<input
																			type="submit" value="Submit" /></td>

																	</tr>
																</table>
															</form>
															<br class="clr">


															<div class="footer blog">
																<%@include file="WEB-INF/footer.jsp"%>
															</div>
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

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>
				</DIV>

			</DIV>


		</DIV>
	</DIV>

</body>
<script type="text/javascript">
																	
																		function validSubmit(){
																			if(document.getElementById('name').value.length==0){
																				$("#invalidName").show();
																				return false;
																			}
																			if(document.getElementById('email').value.length==0){
																				$("#invalidEmail").show();
																				return false;
																			}
																			if(document.getElementById('phone').value.length==0){
																				$("#invalidPhone").show();
																				return false;
																			}
																			if(document.getElementById('message').value.length==0){
																				$("#invalidMessage").show();
																				return false;
																			}
																			if(document.getElementById('code').value.length==0){
																				$("#invalidCode").show();
																				return false;
																			}
																			else{
																				return true;
																			}
																		}
																		</script>
</html>


