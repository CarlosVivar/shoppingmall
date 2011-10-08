<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<%@page import="POJO.*,BUS.*,UTIL.*,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

Emailconfigure emailConfigure = (Emailconfigure)request.getAttribute("emailConfigure"); 
if(emailConfigure==null){
	getServletContext().getRequestDispatcher("/EmailConfigureController").forward(request,response);
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("usermanage", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		
        <script type="text/javascript" src="../scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="../scripts//jquery.min.js"></script>
        
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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("manage", lang) %>  </a>&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="emailconfigure.html" class="viewmore"><%=LanguegeBUS.getValue("configure_email", lang) %></a>	
	 </li>
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="#">Messages (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		      <li class="active"><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
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
					<form id="frm" name="frm" method="post" action="../EmailConfigureController">
					<input type="hidden" id="item_survey_description" name="item[survey_description]" value="">
					<input id="hid_error" name="hid_error" type="hidden" value="0" />
					<div class="box_ucp_inside">
						<h2 class="title">Configure email</h2>
						<div class="clear"></div>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">

                                <tbody><tr>
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("email", lang) %></td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("email_name", lang) %></td>
                                    <td class="lstitle" width="140"><%=LanguegeBUS.getValue("hotname", lang) %></td>
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("port_number", lang) %></td>                                 
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("ssl", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("create_date", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update_date", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                </tr>
                            
                           			 <%
                           			
                               			if(emailConfigure==null){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="7" align="center"><%=LanguegeBUS.getValue("msEmailConfigure", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				
                               					
                               		%>
                               		<tr class="order_row">
                               			<td class="nonSearch"><%=VuHong_MD5.decodeBase64(emailConfigure.getEmail())%></td>
                               			<td class="nonSearch"><%=emailConfigure.getEmailName()%></td>
                               			<td class="nonSearch"><%=emailConfigure.getHostName()%></td>
                               			<td class="nonSearch"><%=emailConfigure.getPortNumber()%></td>
                               			<td class="nonSearch" ><%=emailConfigure.getSsl()%></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <%=emailConfigure.getDateInserted()%>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                           <%=emailConfigure.getDateLastUpdated()%>
				                        </td>
				                        <td class="nonSearch" align="center">
				                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/updateEmailconfigure.html" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               		</tr>	
                               		<%			
                               			}
                               			
									%>
									
									
                            </tbody></table>
						
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