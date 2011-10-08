<%-- 
    Document   : account
    Created on : Jun 10, 2011, 10:54:22 PM
    Author     : TRONGHAI
--%>
  
<%@page import="java.util.ArrayList"%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("changepass", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
               
             function CheckOldPassword()
            {
               var textbox_pass = document.getElementById("oldpassword");
               var len = textbox_pass.value.toString().length;

                if(len < 5){
                     alert ("Xin xem lại mật khẩu! Mật khẩu phải dài hơn 5 kí tự")
                    return;
                }
     
            }
             function CheckPassword()
            {
               var textbox_pass = document.getElementById("password");
               var len = textbox_pass.value.toString().length;

                if(len < 5){
                     alert ("Xin xem lại mật khẩu! Mật khẩu phải dài hơn 5 kí tự")
                    return;
                }
     
            }
            function CheckRePassword()
            {
               var textbox_RePassword = document.getElementById("password_confirm");
               var Repassword = textbox_RePassword.value;
                var textbox_password = document.getElementById("password");
               var Password = textbox_password.value;

                if(Password != Repassword){
                    
                    alert ("Xin xem lại mật khẩu nhập lại!")
                    return;
                }
                
            }
 function validChangePass(){
            	
   	            $("#validOldPass").text("");
   	            $("#validNewPass").text("");
   	         	$("#validConfirmNewPass").text("");
   	         
   	         
   	            var oldpass = $("#oldpassword").val();
   	            var newpass = $("#password").val();
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
                  	var textbox_password = document.getElementById("password");
                 	var Password = textbox_password.value;

                  	if(Password != Repassword){
                	  $("#validConfirmNewPass").text("Comfirm new password was wrong!!");
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
					 <a rel="nofollow"  href="changepass.html" class="viewmore"><%=LanguegeBUS.getValue("changepass", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/sellermenu.jsp" %>
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
              
                    String myacc = (String)session.getAttribute("username") ;

                    User myUser = new User();
            
                    myUser = UserBUS.getUser(myacc,lang);
 
      %>
                <Br>
              
                <form id="changePasswordform" class="cssform" name="changePasswordform" action="changePasswordController" method="post" onsubmit="return validChangePass();" >
               
                  <br><h2><%=LanguegeBUS.getValue("changepass", lang) %></h2>

                <table class="sign" style="font-size:8.5pt">
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("username", lang) %>:</td>
                <td>
                    <b>
                        <font color='green'>
                           <%= myUser.getAccount() %>
                        </font>
                    </b>
               
                </td>
                </tr>
                
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("oldpass", lang) %>:</td>
                <td><input type="password" name="password_old" maxlength="20" id="oldpassword" title="Cần Ít Nhất 5 Chữ"  />
                </td>
                <td class="error" id="validOldPass"></td>   
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("newpass", lang) %>:</td>
                <td><input type="password" name="password" maxlength="20" id="password" title="Cần Ít Nhất 5 Chữ"  />
                </td>
                <td class="error" id="validNewPass"></td>   
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("renewpass", lang) %>:</td>
                <td><input type="password" name="password_confirm" maxlength="20" id="password_confirm" title="Giống Như 'Mật khẩu' Ở Trên"   /></td>
				 <td class="error" id="validConfirmNewPass"></td>   
                </tr>

               
                </table>
                <Table class="sign">
               
                <tr>
                <td>
                    <BUTTON type="submit" class="button">
                        
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("changepass", lang) %></SPAN></SPAN></SPAN>
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
         
        
                 
               
            
        </script>
        </DIV></DIV> 
    </body>
</html>
