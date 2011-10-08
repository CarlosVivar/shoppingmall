    <%-- 
    Document   : register
    Created on : May 24, 2011, 9:51:25 AM
    Author     : admin
--%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("register", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
              
                function emailcheck(){
                 var x=document.signupform.email.value;
                 var y = document.signupform.email.value;
                 if (x.indexOf("@")==-1)
                 {
                    
                   //  alert("It seems you entered an invalid email address.")
                   alert("Email was wrong!");
                    this.document.signupform.email.focus();
                 }
                 else{
                      if(y.indexOf(".")==-1){
                          alert("Not exist this domain");
                      }
                 }
                     
             }
              
          
               function CheckEmail()
            {
               var textbox_Email = document.getElementById("email");
               var reg = new RegExp ( "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
               if(reg.test(textbox_Email.value)==false){
                   alert ("Please check your email again!")
                    return;
               }
           
                
            }
               function isNumeric(evt)
               {
                   var key = (evt.which) ? evt.which : window.event.keyCode;
                   var alphaExp = /^[a-zA-Z\,\?\/\;\:\'\"\-\=\[\]\|\`]+$/;
                   var keyChar = String.fromCharCode(key);
                   if (keyChar.valueOf().match(alphaExp)){
                       return false;
                   }
                   return true;
               } 
               
             
               
               function validRegister(){
            	$("#validFullname").text("");
            	$("#validBirth").text("");
            	$("#validEmail").text("");
            	
            	$("#validAddress").text("");
            	$("#validPhone").text("");
   	            $("#validUser").text("");
   	            $("#validPass").text("");
   	         	$("#validConfirmPass").text("");
   	         
   	         	var fullname = $("#fullname").val();
   	     		var birth =$("#datepicker").val();
   	         	var email = $("#email").val();
   	        
   	         	var address = $("#address").val();
   	        	var phone = $("#phone").val();
   	            var user = $("#username").val();
   	            var pass = $("#password").val();
   	         	var repass = $("#password_confirm").val();
   	         
   	         
   	         	if(fullname.length==0){
	                $("#validFullname").text("Please enter Fullname!!");
	                return false;
	            }
   	     		if(birth.length==0){
                	$("#validBirth").text("Please enter Birthday!!");
                	return false;
            	}
	         
   	         	if(email.length==0){
	                $("#validEmail").text("Please enter Your Email!!");
	                return false;
	            }else{
	            	 var textbox_Email = document.getElementById("email");
	                 var reg = new RegExp ( "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
	                 if(reg.test(textbox_Email.value)==false){
	                	 $("#validEmail").text("Please check your Email again!!");
	                     return false;
	                 }
	            }
   	         
   	         	
   	         	if(address.length==0){
	                $("#validAddress").text("Please enter Address!!");
	                return false;
	            }
   	         	if(phone.length==0){
	                $("#validPhone").text("Please enter Your Phone!!");
	                return false;
	            }
   	            if(user.length==0){
   	                $("#validUser").text("Please enter Username!!");
   	                return false;
   	            }else{
	   	            	if(user.length < 5){
	   	            		$("#validUser").text("Username must be at least 5 characters long!!");
	   	   	                return false;
	   	            	}
   	            }
   	            
   	            if(pass.length==0){
   	                $("#validPass").text("Please enter Password!!");
   	                return false;
   	         	}else{
		            	if(pass.length < 5){
		            		$("#validPass").text("Password must be at least 5 characters long!!");
		   	                return false;
		            	}
   	            }
   	         if(repass.length==0){
	                $("#validConfirmPass").text("Please enter Confirm Password!!");
	                return false;
	            }else{
	            	 var textbox_RePassword = document.getElementById("password_confirm");
	                 var Repassword = textbox_RePassword.value;
	                  var textbox_password = document.getElementById("password");
	                 var Password = textbox_password.value;

	                  if(Password != Repassword){
	                	  $("#validConfirmPass").text("Comfirm password was wrong!!");
	  	                return false;
	                    
	                  }
	            }
   	
   	        }
               
        </script>
       

    </head>
    <body>
         <DIV class="site-container">
        <DIV class="page">
            
       <!-- ---------Begin Header--------------------- -->     
        <DIV class="header">	

            <%@include file="WEB-INF/header.jsp" %>
        </DIV>    
        <!-- -------------MIDDLE------------- -->
        <DIV class="col3-layout">
	        <div class="clear"></div>
		        <div style="display: block;" class="ctnAlert">	
					 <div style="height: 208px;" class="spyWrapper">
					 <ul class="ctnAlert_inside spy">
					 
					 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>
					   </a>&nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="register.html" class="viewmore"><%=LanguegeBUS.getValue("register", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
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
                                                                <DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">
                                                                            
                 <%
                        String message = (String) request.getAttribute("Message");
                        if (message != null) {
                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                        }
                 %>
                 
                <Br>
                <h2><%=LanguegeBUS.getValue("customerInfo", lang) %></h2>
                <div class="tooltip"></div>
                <form id="signupform" name="signupform" action="registerControler" method="post" onsubmit="return validRegister();">
                <table class="sign" style="font-size:8.5pt">
                <tr>

                <td class="label"><%=LanguegeBUS.getValue("fullname", lang) %>:</td>
                <td><input type="text" name="fullname" value="" id="fullname" title="Write your full name" /></td>
				<td class="error" id="validFullname"></td>               
                </tr>
                <tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("sex", lang) %>:</td>
                <td>
                	 <select id="sex" name="sex">
                             <option value="Male" > <%=LanguegeBUS.getValue("male", lang) %> </option>
                             <option value="Female" > <%=LanguegeBUS.getValue("female", lang) %> </option>
                     </select>
                </td>
                </tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("birth", lang) %>:</td>
                <td><input readonly type="text" name="birthday" value="" id="datepicker" title="Input Exp Date;Please,get day image icon beside" style="width: 120px"/>
                      <a href="javascript:NewCssCal('datepicker','yyyymmdd')">
                     <img src="scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
                </td>
                <td class="error" id="validBirth"></td>
				</tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("email", lang) %>:</td>
                <td><input type="text" name="email" maxlength="50" value="" id="email" title="used transport for sale"  /></td>
                <td class="error" id="validEmail"></td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("address", lang) %>:</td>
                <td><textarea name="address" cols="" rows="" id="address" title="house number,name street,city,country"></textarea></td>
                <td class="error" id="validAddress"></td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("phone", lang) %>:</td>
                <td><input type="text" name="phone" maxlength="15" value="" id="phone" title="VD: 090 989 8126, ..." onkeypress="return isNumeric(event)"/></td>
                <td class="error" id="validPhone"></td>
                </tr>

                </table>

                  <br><h2><%=LanguegeBUS.getValue("loginInfo", lang) %></h2>

                <table class="sign">
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("username", lang) %>:</td>
                <td><input type="text" name="username" maxlength="20" id="username" title="Username must be at least 5 characters long"  /></td>
                <td class="error" id="validUser"></td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("password", lang) %>:</td>
                <td><input type="password" name="password" maxlength="20" id="password" title="Password must be at least 5 characters long"  /></td>
              	<td class="error" id="validPass"></td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("re-password", lang) %>:</td>
                <td><input type="password" name="password_confirm" maxlength="20" id="password_confirm" title="password and confirm password must be same" /></td>
				<td class="error" id="validConfirmPass"></td>
                </tr>

                </table>
                <Table class="sign">
              

                <tr>
                <td>
                    <BUTTON type="submit" class="button" >
                        
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("submit", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>&nbsp;&nbsp;
                    <BUTTON type="reset" class="button">
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("reset", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>
                </td>
                </tr>
                </Table>

                </form>



                <div class="footer blog">
                 	<%@include file="WEB-INF/footer.jsp" %>
                </div>
                </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
            </DIV>
 
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
   
        </DIV></DIV> 
    </body>
</html>
