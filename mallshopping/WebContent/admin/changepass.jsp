<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, POJO.*, BUS.*,UTIL.*"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("changepass", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
         <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script src="<%=ServletUtils.getBaseUrl(request)%>/scripts/common_script.js" type="text/javascript"></script>  
		 <script type="text/javascript">
			 function validChangePass(){
				 $("#validOldPass").text("");
	   	            $("#validNewPass").text("");
	   	         	$("#validConfirmNewPass").text("");
	   	         
	   	         
	   	            var oldpass = $("#passOld").val();
	   	            var newpass = $("#passNew").val();
	   	         	var renewpass = $("#password_confirm").val();
	   	         
	   	         
	   	         	if(oldpass.length==0){
		                $("#validOldPass").text("Please enter Old Password!!");
		                return false;
		            }
	   	     		if(newpass.length==0){
	                	$("#validNewPass").text("Please enter New Password!!");
	                	return false;
	                	
	            	}
		         
	   	         	if(renewpass.length==0){
		                $("#validConfirmNewPass").text("Please enter Confirm New Password!!");
		                return false;
	   	         	}else
	   	         	{
	            		var textbox_RePassword = document.getElementById("password_confirm");
	                 	var Repassword = textbox_RePassword.value;
	                  	var textbox_password = document.getElementById("passNew");
	                 	var Password = textbox_password.value;

	                  	if(Password != Repassword){
	                	  $("#validConfirmNewPass").text("Comfirm new password was wrong!!");
	  	                	return false;  
	                  	}
		            }
	   	         
		
		    }
        </script>
			
</head>
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="template/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a>&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="user.html" class="viewmore"><%=LanguegeBUS.getValue("uUSER", lang) %></a>	&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;		
	 <a rel="nofollow"  href="userform.html" class="viewmore"><%=LanguegeBUS.getValue("uADDUSER", lang) %></a></li>				
						
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="Close" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="#"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		      <li class="active"><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
		      <li><a href="category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li>
			</ul>
		 </div>
		</div>
	 	 <%@include file="template/leftmenu.jsp" %>
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
					<form action="<%=ServletUtils.getBaseUrl(request)%>/manageAccountController" method="post" onsubmit="return validChangePass();">
					<!--input type="hidden" id="item_survey_description" name="item[survey_description]" value="">
					<input id="hid_error" name="hid_error" type="hidden" value="0" /-->
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("changepass", lang) %></h2>						
						<div class="creat_shop">
							
							<ul id="warning-box" >
                                <li class="first"> 
                                <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
				                        }
				                 %>         
				                 </li>


                            </ul>
							<br/>
							<% String username =  (String)session.getAttribute("username");
								User user = UserBUS.getUser(username,lang);
							%>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("username", lang) %>:</label>

									</div>
									<input id="username" name="username" type="text"  disabled="disabled" value="<%=user.getAccount() %>" class="account_text_input show_tip required email" />
									
									
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("oldpass", lang) %>:</label>
									</div>
									<input  id="passOld" name="passOld" type="password" value="" class="account_text_input show_tip required email" />
									
									<label class="error" id="validOldPass"></label>
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("newpass", lang) %>:</label>
									</div>
									<input  id="passNew" name="passNew" type="password" value="" class="account_text_input show_tip required email" />
									 <label class="error" id="validNewPass"></label>   
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("re-password", lang) %>:</label>
									</div>
									<input  id="password_confirm" name="password_confirm" type="password" value="" class="account_text_input show_tip required email" />
									<label class="error" id="validConfirmNewPass"></label> 
								</div>
								

													
													
							</div>
							

							<div class="button_listing_input">	
								<input type="hidden" value="add" name="act">								
								<input id="cmd_submit" name="cmd_submit"   type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
								<input  id="cmd_reset" name="cmd_reset"  type="reset" value="<%=LanguegeBUS.getValue("reset", lang) %>" />
							</div>
							<div class="clear"></div>		
						</div>
					</div>
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
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	 <div id="footer">
			<%@include file="template/footer.jsp" %>
	</div><!--end footer-->
	<!--End footer-->
	 </div>
	 
	
</body>
</html>