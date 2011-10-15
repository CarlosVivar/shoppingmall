<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>

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
	<%if(session.getAttribute("message")!=null){
		session.removeAttribute("message");
		%>
	$("#messages").show();
	<%} else{%>
	$("#messages").hide();
	<%}%>
});

</script>


<body>

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
														<br> 
														<label id="messages">You have contacted successfull !</label>
														<br> <br> 
														<h3>Welcome to khongmac.com</h3>
														
														<br> <br>
															<form name="supportform" action="supportcontroller">
																<table>
																	<tr>
																		<td align="right"
																			style="width: 100px; padding-right: 10px"
																			height="30px"><b>Name</b></td>
																		<td style="width: 200px" height="30px"><input name="name"
																			type="text"
																			style="width: 200px; padding: 2px; border: 1p solid;" />
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b>Email</b></td>
																		<td height="30px"><input name="email" type="text"
																			style="width: 200px; padding: 2px" />
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b>Phone</b></td>
																		<td height="30px"><input name="phone" type="text"
																			style="width: 200px; padding: 2px" />
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px"
																			height="30px"><b>Message</b></td>
																		<td height="30px"><textarea name="message" rows="8" cols="30"
																				style="width: 300px; height: 120px"></textarea>
																		</td>
																	</tr>
																	<tr>
																		<td align="right" style="padding-right: 10px;padding-bottom: 5px;vertical-align: bottom"
																			height="30px"><b>Code</b></td>
																		<td style="padding-top: 5px"><input type="text" name="code" id="code"
																			style="width: 50px; padding: 2px">
																			<img  src="<c:url value="captchaServlet.do"  />" width="150">																			
																			</td>
																	</tr>
																	<tr>
																	
																		<td colspan="2" align="center">
																		<script type="text/javascript">
																		function validSubmit(){
																			<%String captcha=(String)request.getSession().getAttribute("captcha");%>
																			alert('<%=captcha%>');
																			var code=document.getElementById('code').value;
																			//alert(code);
																			var captcha='<%=captcha%>';
																			//alert(captcha);
																			if(code==captcha){alert("true");}
																			else{ alert("false");}
																			return false;
																		}
																		</script>
																		<br>
																		<input
																			type="button" value="Submit" onclick="validSubmit()"/></td>

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
</html>


