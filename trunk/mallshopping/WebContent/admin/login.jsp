<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="POJO.*, UTIL.*,java.util.*"%>
 <%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
session.removeAttribute("username");
session.removeAttribute("Role");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=LanguegeBUS.getValue("login", lang) %></title>
        <meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.4.2.min.js"></script>	
		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript"  language="javascript">
			 function validLogin(){
		            $("#validUser").text("");
		            $("#validPass").text("");
		            var user = $("#username").val();
		            var pass = $("#password").val();
		            if(user.length==0){
		                $("#validUser").text("Please enter username!!");
		                return false;
		            }
		            if(pass.length==0){
		                $("#validPass").text("Please enter password!!");
		                return false;
		            }
		
		        }
        </script>
       
        
</head>
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">		
    
</div>
<!--end header-->  	<!--End header-->  	
<br/><br/><br/><br/><br/><br/><br/><br/>
	<div id="content">
		<div class="breadcrumb" style="padding-left:30px;padding-bottom:5px">
	           <img src="css//images/intech.png" width="65" height="25" alt="logo mall" align="right" />
		</div>
		<div class="clear"></div>
		<div class="other_content">
	
			<div class="top_other_content">
				<div class="ltop_other_content"></div>
				<div class="rtop_other_content"></div>	
			</div>
			<form id="frm" name="frm" method="post" action="<%=ServletUtils.getBaseUrl(request)%>/mangeLoginController" onsubmit="return validLogin();">
			
			<div class="login">
				<div class="banner_login"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/banner_login.jpg" width="420" height="250" alt="Đăng nhập" /></div>
				<div class="box_login">
					<div class="top_box_login">
						<div class="ltop_box_login"></div>
						<div class="rtop_box_login"></div>
					</div>
					<div class="center_box_login">
	
						<h2 class="title"><%=LanguegeBUS.getValue("login", lang) %></h2>
						  	<div class="group_listing_input">
						  	<%
			                        String message = (String) request.getAttribute("Message");
			                        if (message != null) {
			                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
			                        }
			                 %>
			                 <div id="validPass" style="color:red" align='center'></div> 
			                 <div id="validUser" style="color:red" align='center'></div> 
							<div class="listing_input">
								<div class="post_label_container">
									<label class="postLabel"><%=LanguegeBUS.getValue("username", lang) %>:</label>
								</div>
								<input id="username" name="username" type="text" class="login_text_input" />
								
							</div>
	
							<div class="listing_input">
								<div class="post_label_container">
									<label class="postLabel"><%=LanguegeBUS.getValue("password", lang) %>:</label>
								</div>
								<input id="password" name="password" type="password" class="login_text_input" />
								
								
							</div>						
							<div class="text_remember"><input name="" id="remember_me" type="checkbox" value="" class="nonbdr" />
							<label for="remember_me"><%=LanguegeBUS.getValue("rlogin", lang) %></label>  |  <label><a rel="nofollow" href=""><%=LanguegeBUS.getValue("lpass", lang) %></a></label></div>
	
							<div class="button_listing_input"><input class="btn_submit" name="submit" type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
							<a rel="nofollow" href="?ref=http://www.123mua.vn/user/session?redirect=%2Fmyaccount%2Foverview&amp;getsession=1">
							<input class="btn_submit" name="reset" type="reset" value="<%=LanguegeBUS.getValue("reset", lang) %>" /></a></div>
							<div class="note_login"> <strong><%=LanguegeBUS.getValue("welcometo", lang) %> ELI Mall Admin</strong></div>
						</div>
					</div>
					<div class="bottom_box_login">
						<div class="lbottom_box_login"></div>
	
						<div class="rbottom_box_login"></div>
					</div>
				</div>
				<div class="clear"></div>
				
			</div>
			</form>
			<div class="bottom_other_content">
				<div class="lbottom_other_content"></div>
				<div class="rbottom_other_content"></div>
	
			</div>
		</div>
	</div>  	<!--End content-->

	
	<!--End content-->
	 <div class="clear"></div>
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	
	 </div>
	 
	
	 </body>
	 </html>