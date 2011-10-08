<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp"%>
<%@page import="POJO.*,BUS.*,UTIL.*,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Emailconfigure emailConfigure = (Emailconfigure) request
			.getAttribute("emailConfigure");
	if (emailConfigure == null) {
		getServletContext().getRequestDispatcher(
				"/UpdateEmailConfigureController").forward(request,
				response);
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("usermanage", lang)%></title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />

<link href="css/style.css" media="screen" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="../scripts/datetimepicker/datetimepicker_css.js"></script>
<script type="text/javascript" src="../scripts//jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript">
$(document)
.ready(function() {
	hideAllInvalid();
		$("#testconfig").click(
				function() {
					
					//email name  password hotname port ssl
					var email = document.getElementById("email").value;
				
					var name = document.getElementById("name").value;
				
					var password = document.getElementById("password").value;
				
					var hotname = document.getElementById("hotname").value;
				
					var port = document.getElementById("port").value;
			
					var ssl = document.getElementById("ssl").checked;					
					$.post("../TestEmailConfigureController?email=" + email
							+ "&name=" + name + "&password=" + password
							+ "&hotname="+hotname+"&port=" + port + "&ssl=" + ssl, function(j) {
						if (j =="successful" ) {							
							alert("<%=LanguegeBUS.getValue("test_success",lang)%>");	
						}
						if (j =="fault" ) {	
							alert("<%=LanguegeBUS.getValue("test_fault",lang)%>");
						}
					});
				});
	});
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

function checkNumeric(elem){	
	var numericExpression = /^[0-9\.]+$/;
	if(elem.value.match(numericExpression)){		
		return true;
	}else{		
		elem.focus();
	
		return false;
	}
}
function validAllField(){
	var email = document.getElementById("email").value;
	
	var name = document.getElementById("name").value;

	var password = document.getElementById("password").value;

	var hotname = document.getElementById("hotname").value;

	var port = document.getElementById("port").value;
	var valid=true;
	if(email.length==0){
		//input.focus();
		valid=false;
	}
	if(CheckEmail(email)){
		$("#invalidEmail").hide();
	}
	else{
		$("#invalidEmail").show();
		valid=false;
	}
	if(name.length==0){
		valid=false;
	}
	if(password.length==0){
		valid=false;
	}
	if(hotname.length==0){
		valid=false;
	}
	if(port.length==0){
		valid=false;
	}
	if(!checkNumeric(document.getElementById("port"))) vald=false;
	return valid;
}
function hideAllInvalid(){	     
	$("#invalidEmail").hide();
	$("#invalidName").hide();
	$("#validPassword").hide();
	$("#invalidHotname").hide();
	$("#invalidPort").hide();
}
function validEmail(){
	var email = document.getElementById("email").value;
	if(email.length==0){
		$("#invalidEmail").show();
	}
	else{
		$("#invalidEmail").hide();
	}
	if(CheckEmail(email)){
		$("#invalidEmail").hide();
	}
	else{
		$("#invalidEmail").show();
	}
}
function validName(){
	var name = document.getElementById("name").value;
	if(name.length==0){
		$("#invalidName").show();
	}
	else{
		$("#invalidName").hide();
	}
}
function validPassword(){
	var password = document.getElementById("password").value;
	if(password.length==0){
		$("#validPassword").show();
	}
	else{
		$("#validPassword").hide();
	}
}
function validHotname(){
	var hotname = document.getElementById("hotname").value;
	if(hotname.length==0){
		$("#invalidHotname").show();
	}
	else{
		$("#invalidHotname").hide();
	}
}
function validPort(){
	var port = document.getElementById("port").value;
	if(port.length==0){
		$("#invalidPort").show();
	}
	else{
		$("#invalidPort").hide();
	}
}
function CheckEmail(val)
{
 
   var reg = new RegExp ( "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
   if(reg.test(val)==false){
        return false;
   }
   else return true;
}   

</script>
</head>

<body id="travel">
	<div id="wrapper">

		<div id="header">
			<%@include file="template/header.jsp"%>
		</div>
		<!--end header-->

		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>
						</a>&nbsp; <img
							src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
							<a rel="nofollow" href="updateemailconfigure.html"
							class="viewmore"><%=LanguegeBUS.getValue("update", lang)%></a>
						</li>

					</ul>
				</div>
				<a class="closeAlert"><img src="css/images/icon_closeAlert.gif"
					alt="Đóng" width="8" height="8"> </a>
			</div>

			<div id="col1">
				<div class="left_content_ucp">
					<div class="box_msg">
						<p>
							<a class="msg clear" href="#">Messages (<strong>0</strong>)</a>
						</p>
					</div>


					<div class="module_ucp boxRadius">
						<h4 class="title"><%=LanguegeBUS.getValue("manage", lang)%></h4>
						<ul>
							<li><a href="index.html"><%=LanguegeBUS.getValue("home", lang)%></a>
							</li>
							<li class="active"><a href="user.html"><%=LanguegeBUS.getValue("user", lang)%></a>
							</li>
							<li><a
								href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang)%></a>
							</li>
							<li><a href="product.html"><%=LanguegeBUS.getValue("product", lang)%></a>
							</li>
							<li><a href="order.html"><%=LanguegeBUS.getValue("order", lang)%></a>
							</li>
						</ul>
					</div>
				</div>
				<%@include file="template/leftmenu.jsp"%>
			</div>
			<!--col1-->
			<div id="col2">
				<div class="right_content_ucp">
					<div class="box_ucp">

						<div class="top_box_ucp">
							<div class="ltop_box_ucp"></div>
							<div class="rtop_box_ucp"></div>
						</div>
						<div class="center_box_ucp">
							<form id="frm" name="frm" method="post"
								onsubmit="return validAllField()"
								action="../UpdateEmailConfigureController">
								<input type="hidden" id="item_survey_description"
									name="item[survey_description]" value=""> <input
									id="hid_error" name="hid_error" type="hidden" value="0" />
								<%
									if (emailConfigure == null) {

									} else {
								%>
								<div class="box_ucp_inside">
									<h2 class="title"><%=LanguegeBUS.getValue("configure_email",lang) %></h2>
									<div class="clear"></div>
									<div>
										<div class="group_listing_input">
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("email", lang)%>:</label>
												</div>
												<input id="email" name="email" type="text" onblur="validEmail()"
													value="<%=VuHong_MD5.decodeBase64(emailConfigure.getEmail())%>"
													class="account_text_input required email" />&nbsp; <label id="invalidEmail" style="color:red"><%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>

											</div>
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("email_name", lang)%>:</label>

												</div>
												<input id="name" name="Name" type="text"
													value="<%=emailConfigure.getEmailName()%>" onblur="validName()"
													class="account_text_input required email" /> <label style="color:red"
													id="invalidName">&nbsp;<%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>

											</div>
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("password", lang)%>:</label>
												</div>
												<input id="password" name="password" type="password" onblur="validPassword()"
													value="<%=VuHong_MD5.decodeBase64(emailConfigure.getPassword())%>" value=""
													class="account_text_input required email"
													style="width: 150px" /> <label style="color:red" id="validPassword">&nbsp;<%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
											</div>

											<div class="listing_input">
												<div class="post_label_container">

													<label class="postLabel"><%=LanguegeBUS.getValue("hotname", lang)%>:</label>
												</div>
												<input id="hotname" name="hotname" type="text"
													value="<%=emailConfigure.getHostName()%>" onblur="validHotname()"
													class="account_text_input required email"
													style="width: 150px" /> <label id="invalidHotname" style="color:red">&nbsp;<%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>

											</div>

											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("port_number", lang)%>:</label>
												</div>

												<input id="port" type="text" name="port" onblur="validPort()"
													onkeypress="return isNumeric(event)"
													value="<%=emailConfigure.getPortNumber()%>"
													class="medium_text_input show_tip required number" /> <label style="color:red"
													id="invalidPort">&nbsp;<%=LanguegeBUS.getValue("de_cost_invalid", lang)%></label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<%=LanguegeBUS.getValue("ssl", lang)%>:&nbsp;&nbsp; <input
													id="ssl" name="ssl" type="checkbox"
													<%if ("true".equals(emailConfigure.getSsl())) {%>
													checked="checked" <%}%>
													class="medium_text_input show_tip required number" />
											</div>

										</div>
										<div class="button_listing_input">

											<input name="update" type="submit"
												value="><%=LanguegeBUS.getValue("submit", lang)%>" /> <input
												id="testconfig" name="testconfig" type="button"
												value="<%=LanguegeBUS.getValue("test", lang)%>" />
										</div>
										<div class="clear"></div>

									</div>
								</div>
								<%
									}
								%>
							</form>
						</div>
						<div class="bottom_box_ucp">

							<div class="lbottom_box_ucp"></div>
							<div class="rbottom_box_ucp"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>

		</div>

		<!--End content-->
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer">
			<%@include file="template/footer.jsp"%>
		</div>
		<!--end footer-->
		<!--End footer-->
	</div>


</body>
</html>