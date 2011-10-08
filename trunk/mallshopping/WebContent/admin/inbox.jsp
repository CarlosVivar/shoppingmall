<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("message", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
        
		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %> </a>&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="<%=ServletUtils.getBaseUrl(request)%>/admin/inbox.html" class="viewmore"><%=LanguegeBUS.getValue("uMESSAGE", lang) %></a></li>	
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="<%=ServletUtils.getBaseUrl(request)%>/admin/inbox.html"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li class="active"><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
		      <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li> 
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
					<div class="box_ucp_inside">
						<h2 class="title"><span><%=LanguegeBUS.getValue("message", lang) %></span></h2>
						<div class="func_all"><a id="checkAll" href="#">Check All</a><span>|</span><a id="uncheckAll" href="#">Uncheck All</a>
						<a class="func" href="javascript:void(0);" onclick="Inbox.deleteInbox();"><img src="css/images/icon_del.jpg" alt="Delete" /></a></div>
						<form action="/messagebox/delete" method="POST" id="frmInbox">

						<table id="tabs1" class="table_ucp" width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="10" class="lstitle"></td>
								<td width="480" class="lstitle">Subject</td>
								<td width="110" class="lstitle">Sender</td>
								<td width="80" class="lstitle">Send date</td>								
							</tr>
							<tr>

								<td colspan="4" align="center">No messages in this section.</td>
							</tr>							
						</table>
						</form>													
					    						
					</div>				
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

<script language="javascript" type="text/javascript">
	var Inbox = {	
		deleteInbox: function()
		{
			var count = $("input:checked").length;		
			if( count == 0 )
			{
				alert('You haven`t selected any messages.');
				return;
			}		
			if (confirm("Are you sure you want to delete this message?")) 
			{
				$('#Are you sure you want to delete this message?').submit();
			}		
		}
	};
	$(document).ready(function(){
		$("#checkAll").click(function() {
			$.each($("input[type='checkbox']"), function() {
				$(this).attr('checked',true);
			});
		});
		$("#uncheckAll").click(function() {
			$.each($("input[type='checkbox']"), function() {
				$(this).attr('checked',false);
			});
		});
	});
</script>

</html>

  