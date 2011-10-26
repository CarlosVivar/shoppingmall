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
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script>	
		<link href="<%=ServletUtils.getBaseUrl(request)%>/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		<link type='text/css' href='css/vuhong_style.css' rel='stylesheet' media='screen' />

       <script type="text/javascript">
            $('document').ready(function(){	
                $('#oks').click(function(){
                	
                	var user = $("#lusername").val();
                    var pass = $("#lpassword").val();
                	$.ajax({                		
                   		type: "POST",
                   		url: "loginControler", // day la cai servlet                   		
                   		data: "username="+user+"&password="+pass,
                   		success: function(msg){
                     			if("seller"==msg){          
                     				location = "sale/notice.html"; 
	                			}else if (msg=="lock"){
	                				document.getElementById("Message").innerHTML = "Your account had been locked";
	                			}else if (msg=="user"){
	                				location = "index.html"; 
	                			}else{	                				 
	                				document.getElementById("Message").innerHTML = "Username or password is invalid";
	                			}	                			
                   		}
                 	});
                	
                });
            	
            });            
          
		</script>
        
</head>
<body id="travel" >
	 <div id="wrapper"> 
	
<%String action = (String)request.getParameter("action");
if("active".equals(action)){ %>    
</div>
	<h1 class="vuhong_title">Kích hoạt thành công</h1>
	<label class="vuhong_intro">Chúc mừng bạn đã kích hoạt Email thành công, bây giờ bạn có thể đăng nhập vào hệ thống để mua hàng.
	<br/>Chúc bạn có một ngày vui vẻ!
	<br/><b>khongmac.com</b></label>
<div>
<%} %>

</div>

	<div id="content" style="margin:200px auto;width: 800px">
			<form>			
        	<div style="background-color: white;float:left;">
        		<a href="index.html"><img alt="" src="css/images/eli_logo.png"></a>
        	</div>   
        	<div style="float:left;">
	        	<div id=Message class="vuhong_error" style=" padding-top: 10px "></div>
	        	<div style="padding-bottom: 5px;width: 300px; text-align: right;padding-top: 10px" >
	        	<label class="label"><%=LanguegeBUS.getValue("username",lang) %></label>
	        				<input type="text" class="input_text" maxlength="20" name="username" id="lusername"> 
	        	</div>        	
	        	<label id="validUser"></label>
	        	<div style="padding-bottom: 5px;width: 300px; text-align: right" id="validPass">
	        	<label class="label"><%=LanguegeBUS.getValue("password", lang) %></label>
	        				<input type="password" class="input_text" maxlength="20" name="password" id="lpassword"> 
	        	</div>
	        	<label id="validPass"></label>  
	        	<div style="font-size: 12px;text-align: right;width: 300px">
	        	<input type="checkbox"/> Remember me | <a>Forgot your Password ?</a>  
	        	</div>
	        	
	        	<div style="text-align: right;width: 300px">
	        	<input type="button" name="oks" id="oks" value="Login" class="bt" style="width: 100px;" />  
	        	</div>
	        </div>
        
     </form>
			
	</div> 	<!--End content-->

	
	<!--End content-->
	 <div class="clear"></div>
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	
	 
	 
	
	 </body>
	 </html>