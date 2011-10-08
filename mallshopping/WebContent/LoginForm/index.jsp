<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script> 
<script type="text/javascript">
function login(){
	
	var user = $("#username").val();
	var pass = $("#password").val();
	if(user==""||pass==""){
		alert("<%=LanguegeBUS.getValue("pleaselogin",lang) %>");
		return;
	}
	$.post("../loginControler?username="+ user+ "&password="+ pass,	function(j) {
			if (j == "user") {
				parent.location.reload();
			} else if (j == "seller") {
				parent.location = "../sale/notice.html";
			} else if (j == "lock") {
				alert("<%=LanguegeBUS.getValue("accountlocked",lang) %>");
			} else {
				alert("<%=LanguegeBUS.getValue("wronglogin",lang) %>");
			}
	});
}

$(document).ready(function() {
	$('#loginForm').bind('keypress',function(e) {
		if (e.keyCode == 13) {
			login();
		}
	});
	$('#ok').click(function(){
		login();
	});
});
</script>

</head>
<body bgcolor="#eeeeee">
	<form action="#" method="post" id="loginForm">
		<div id="login_contain">
			<div class="header" style="margin: none">
				<p><%=LanguegeBUS.getValue("login",lang) %></p>
			</div><br/><br/>		
			<div id="inputs">
				<div >
					<input id="username" name="user" type="text" placeholder="<%=LanguegeBUS.getValue("username",lang) %>"/>
				</div>
			</div>
			<div id="inputs">
				<div>
					<input id="password" name="pass" type="password" placeholder="<%=LanguegeBUS.getValue("password",lang) %>"/>
				</div>
			</div>
			<div id="bt">
				<a href="#"><%=LanguegeBUS.getValue("lpass",lang) %></a>
				<button class="submits" type="button" name="ok" id="ok"><%=LanguegeBUS.getValue("login",lang) %></button>
			</div>
			<div id="footer">
				
			</div>
		</div>
	</form>
</body>
</html>
