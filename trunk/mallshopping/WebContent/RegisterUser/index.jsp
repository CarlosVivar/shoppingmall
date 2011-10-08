<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.*, UTIL.*, POJO.*, BUS.*" %>
<%@include file="../library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/style.css" rel="stylesheet" type="text/css"/>
<title>Untitled Document</title>
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script> 
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/dateValidator.js"></script>
<script type="text/javascript">
function register(){
	username();
	password();
	confirmPassword();
	fullname();
	address();
	phone();
	email();
	if($("#validUsername").text()!="" || $("#validPassword").text()!="" || $("#validConfirmPassword").text()!="" || $("#validFullname").text()!=""
		 && $("#validAddress").text()!="" || $("#validPhone").text()!="" || $("#validEmail").text()!=""){
		return false;
	}
	return true;
}


$(document).ready(function(){
	$("#username").blur(function(){
		username();
	});
	$("#password").blur(function(){
		password();
	});
	$("#confirmPassword").blur(function(){
		confirmPassword();
	});
	$("#fullname").blur(function(){
		fullname();
	});
	$("#address").blur(function(){
		address();
	});
	$("#phone").blur(function(){
		phone();
	});
	$("#email").blur(function(){
		email();
	});
});
	
	var regexUsername = new RegExp ( "^[A-Za-z](?=[A-Za-z0-9_.]{3,31}$)[a-zA-Z0-9_]*\.?[a-zA-Z0-9_]*$");
	var regexPhone = new RegExp ( "^(\\d{5,15})$");
	var regexEmail = new RegExp("^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
	var blank = "<%=LanguegeBUS.getValue("error_blank",lang)%>";

	
	
	function username(){
		if ($("#username").val().length==0){
			$("#validUsername").text(blank);	
		}else if( $("#username").val().length < 5 || $("#username").val().length > 20){
			$("#validUsername").text("<%=LanguegeBUS.getValue("error_username_length",lang)%>");	
		}else if(regexUsername.test($("#username").val())==false){
			$("#validUsername").text("<%=LanguegeBUS.getValue("error_username_invalid",lang)%>");	
		}else{
			checkUser();
		}
	}
	
	function password(){
		if ($("#password").val().length==0){
			$("#validPassword").text(blank);	
		}else if( $("#password").val().length < 5 || $("#password").val().length > 20){
			$("#validPassword").text("<%=LanguegeBUS.getValue("error_password_length",lang)%>");	
		}else{
			$("#validPassword").text("");	
		}
	}
	
	function confirmPassword(){
		if ($("#confirmPassword").val().length==0){
			$("#validConfirmPassword").text(blank);	
		}else if( $("#confirmPassword").val()!= $("#password").val()){
			$("#validConfirmPassword").text("<%=LanguegeBUS.getValue("error_password_match",lang)%>");	
		}else{
			$("#validConfirmPassword").text("");	
		}
	}
	
	function fullname(){
		if ($("#fullname").val().length < 3){
			$("#validFullname").text(blank);	
		}else{
			$("#validFullname").text("");	
		}
	}
	
	function address(){
		if ($("#address").val().length < 5){
			$("#validAddress").text(blank);	
		}else{
			$("#validAddress").text("");	
		}
	}
	
	function phone(){
		if ($("#phone").val().length ==0){
			$("#validPhone").text(blank);	
		}else if(regexPhone.test($("#phone").val())==false){
			$("#validPhone").text("<%=LanguegeBUS.getValue("error_phone_invalid",lang)%>");
		
		}else{
			$("#validPhone").text("");	
		}
	}
	
	function email(){
		if ($("#email").val().length ==0){
			$("#validEmail").text(blank);	
		}else if(regexEmail.test($("#email").val())==false){
			$("#validEmail").text("<%=LanguegeBUS.getValue("error_email_invalid",lang)%>");
		
		}else{
			$("#validEmail").text("");	
		}
	}
	
	function checkUser(){ 				
		$(document).ready(function(){
	   		var user = $("#username").val();
	   	$.ajax({                		
	      		type: "POST",
	      		url: "../checkAvalableUsernameController", // day la cai servlet                   		
	      		data: "username="+user,
	      		success: function(msg){
	      			if(msg=="no"){
	      				$("#validUsername").text("<%=LanguegeBUS.getValue("error_username_exist",lang)%>");   
	      			} else{
	      				$("#validUsername").text("");
	      			}
	      		}
	   		}); 
	   	});	   	
	}



</script>
<style>
	.vuhong_error{
	font-size:11px;
	font-family:verdana;
		color: #AA0000;
	}
</style>



</head>

<body style="background-color: #ddd">
<form method="post" id="registerUser" onsubmit="return register()" action="../registerControler">
<div id="main">
    <H1><%=LanguegeBUS.getValue("register",lang)%></H1>
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("username",lang)%></p>    
    </div>
    <div class="right">
    <p><input id="username" name="username" type="text" />
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validUsername"></label>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("password",lang)%></p>
    </div>
    <div class="right">
    <p><input id="password" name="password" type="password" />
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validPassword"></label>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("re-password",lang)%></p>
    </div>
    <div class="right">
    <p><input id="confirmPassword" name="confirmPassword" type="password" />
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validConfirmPassword"></label>
    </p>
    </div>
    </div>
    
    
	<H1></H1>
    
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("fullname",lang)%></p>    
    </div>
    <div class="right">
    <p>
    	<input type="text"  id="fullname" name="fullname"/>
    </p>
    <p>
		<label class="vuhong_error" style="color:#BB0000" id="validFullname"></label>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("sex",lang)%></p>
    </div>
    <div class="right">
    <p>
    	<select name="sex">
    		<option>Male</option>
    		<option>Female</option>
    	</select>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("birth",lang)%></p>
    </div>
    <div class="right">
    <p>
	    <select id="dd" name="day" style="width: 50px;" >
	    <%for (int i = 1; i < 32;i++) {%>
		<option><%=i%></option>
		<%} %>
		</select>
		<select id="mm" name="month" style="width: 50px;" onchange="adaptDay()">
         <%for (int i = 1; i < 13;i++) {%>
		<option value="<%=i%>"><%=i%></option>
		<%} %>
		</select>
		<select id="yyyy" name="year" style="width: 100px;" onchange="adaptDay()">
		<% Calendar cal=Calendar.getInstance();
		int y = cal.get(Calendar.YEAR)-10;
		for (int i = 1; i < 60;i++) {%>
		<option value="<%=y%>"><%=y--%></option>
		<%} %>
		</select>              
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("address",lang)%></p>
    </div>
    <div class="right">
    <p><input type="text"  id="address" name="address"/>
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validAddress"></label>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p><%=LanguegeBUS.getValue("phone",lang)%></p>
    
    </div>
    <div class="right">
    <p><input  id="phone" name="phone" type="text"/>
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validPhone"></label>
    </p>
    </div>
    </div>
    
    <div id="contain">
	<div class="left">
    <p>Email</p>
    
    </div>
    <div class="right">
    <p><input  id="email" name="email" type="text"/>
    <br/>
		<label class="vuhong_error" style="color:#BB0000" id="validEmail"></label>
    </p>
    </div>
    </div>
    <H1></H1>
    <p style="text-align:center"><input class="inputs" name="ok" type="submit" value="<%=LanguegeBUS.getValue("register",lang)%>" /> <input class="inputs" name="reset" type="reset" value="<%=LanguegeBUS.getValue("reset",lang)%>" /></p>
</div>
</form>
</body>
</html>
