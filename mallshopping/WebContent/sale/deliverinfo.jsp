<%@page import="CONTROLLER.DeliverStatusController"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("deliverinfo", lang)%></title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />

<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css"
	media="screen" rel="stylesheet" type="text/css" />

<!-- disabled mouse click right -->
<script type="text/javascript">
	var message_prevent="<%=LanguegeBUS.getValue("prevent_click_right",lang)%>";
</script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/prevent.js">
	
	</script>
<!-- disabled mouse click right -->
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/datetimepicker_css.js"></script>
         <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.js"></script>	
<%
if((String)request.getAttribute("hasLogin")==null){
	request.getRequestDispatcher("/DeliverInfoController").forward(
			request, response);
}
%>
</head>

<body id="travel">
	<div id="wrapper">
		<div id="header">
			<%@include file="layout/header.jsp"%>
		</div>


		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("deliverinfo", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="close" width="8" height="8"> </a>
			</div>

			<br />
			<div class="bottom_userCPanel">
				<p class="sumMoney">
					<label><%=LanguegeBUS.getValue("manage", lang)%>/<%=LanguegeBUS.getValue("deliverinfo", lang)%></label>
				</p>

				<p>
					<b><%=LanguegeBUS.getValue("deliverinfo", lang)%></b>
				</p>
				<div class="clear"></div>
			</div>

			<div class="content_inside">
				<div class="content_shop">

					<div class="left_content_shop">

						<div class="box_sale">
							<div class="top_box_ucp">
								<div class="ltop_box_ucp"></div>
								<div class="rtop_box_ucp"></div>

							</div>
							<div class="center_box_ucp">
								<div style="padding: 4px 12px">

									<div class="space"></div>

									<div style="line-height: 20px; font-size: 12px">
										<label
											style="display: block; text-align: left !important; padding-left: 10px; height: 20px !important"
											class="title_deli"><%=LanguegeBUS.getValue("delititle", lang)%></label>

										<div style="padding-left: 0px; font-size: 13px;">
											<%=LanguegeBUS.getValue("delicontent", lang)%>
											<div class="space"></div>
											<div
												style="font-weight: bold; height: 30px; background-color: gray; color: white; vertical-align: middle; padding: 5px 10px 0px 10px; display: block;">
												<%=LanguegeBUS.getValue("delititle1", lang)%>
											</div>
											<div class="space"></div>
											<div>
												<%=LanguegeBUS.getValue("delicontent1", lang)%>
											</div>
											<div class="space"></div>
											<div
												style="font-weight: bold; height: 30px; background-color: gray; color: white; vertical-align: middle; padding: 5px 10px 0px 10px;">
												<%=LanguegeBUS.getValue("delititle2", lang)%>
											</div>
											<div class="space"></div>
											<div>
												<%=LanguegeBUS.getValue("delicontent2", lang)%>
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="bottom_box_ucp">
								<div class="lbottom_box_ucp"></div>
								<div class="rbottom_box_ucp"></div>
							</div>
						</div>

					</div>
					<div class="right_content_shop">
						<%@include file="layout/menuright.jsp"%>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>