<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object obj = request.getAttribute("lstNotice1");
	if (obj == null) {
		String url = "/sellerNoticeController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
	//
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("salemanage", lang)%></title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />

<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css"
	media="screen" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.js"></script>	

<script type="text/javascript">
				$(function() { 
				    $('.tab a:first-child').click(function(){
				        switch_tabs($(this));
				        return false;
				    }); 
				    switch_tabs($('.selected'));
				    $("#tabs1").show();
                    $("#tabs2").hide();
                    $("#tabs3").hide();
                    $("#tabs4").hide();
                    $("#tabs5").hide();
				});
		
				function switch_tabs(obj)
				{
				    $('.table_ucp').hide();
				    $('.tab a:first-child').removeClass("selected");
				    var id = obj.attr("rel");
				    $('#'+id).show();
				    obj.addClass("selected");
				}
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				
				function addContent(title,content) {		
					
						document.getElementById("title").innerHTML = " ";
						document.getElementById("noidung").innerHTML = " ";  
						document.getElementById("title").innerHTML = title;
						document.getElementById("noidung").innerHTML = content;  
				 }
         </script>
</head>
<body id="travel">
	<div id="wrapper">

		<div id="header">
			<%@include file="layout/header.jsp"%>
		</div>
		<!--end header-->

		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("notice", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="Đóng" width="8" height="8">
				</a>
			</div>
			<br/>
			<div class="bottom_userCPanel">
				<p class="sumMoney"><label><%=LanguegeBUS.getValue("notice", lang) %></label></p>
				<ul>
					<li class="transaction">&nbsp; </li>
					<li class="transaction"><%=LanguegeBUS.getValue("mNotice1", lang) %></li>
				</ul>
				<div class="clear"></div>
			</div>		
			


			<div class="clear"></div>
			<div class="content_inside">
				<div class="content_shop">

					<div class="left_content_shop">

						<div class="box_sale">
							<div class="top_box_ucp">
								<div class="ltop_box_ucp"></div>
								<div class="rtop_box_ucp"></div>

							</div>
							<div class="center_box_ucp">
								<div class="box_ucp_inside">
									<h2 class="title"><%=LanguegeBUS.getValue("notice", lang)%></h2>

									

									<div id="usual2">
										<ul class="tab">

											<li><a rel="tabs1" class="selected" href="#tabs1"><span><%=LanguegeBUS.getValue("allnotice", lang)%></span>
											</a>
											</li>
											<li><a rel="tabs2" href="#tabs2"><span><%=LanguegeBUS.getValue("generalnotice", lang)%></span>
											</a>
											</li>
											<li><a rel="tabs3" href="#tabs3"><span><%=LanguegeBUS.getValue("safeNotice", lang)%></span>
											</a>
											</li>
											<li><a rel="tabs4" href="#tabs4"><span><%=LanguegeBUS.getValue("advnotice", lang)%></span>
											</a>
											</li>
											<li><a rel="tabs5" href="#tabs5"><span><%=LanguegeBUS.getValue("systemnotice", lang)%></span>
											</a>
											</li>

											<!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
										</ul>
										<div style="overflow: auto; height: 250px; width: 705px">
											<table id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice1 = (List<Notice>) request.getAttribute("lstNotice1");
														if (lstNotice1 == null || lstNotice1.isEmpty()) {
													%>
													<tr>
														<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mNotice", lang)%></td>
													</tr>

													<%
														} else {
															for (int i = 0; i < lstNotice1.size(); i++) {
																Notice notice1 = (Notice)lstNotice1.get(i);
																Typenotice tn1 = TypeNoticeBUS.getTypenotice(notice1.getTypenotice().getTypeNoticeId(), lang);
													%>
													<tr class="order_row"  onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=notice1.getTitle()%>','<%=notice1.getContentNotice()%>');return false;">

														<td class="nonSearch"><%=notice1.getNoticeId()%></td>
														<td class="nonSearch" style="text-align: left"><%=tn1.getNameTypeNotice() %></td>
														<td class="nonSearch" style="text-align: left"><%=notice1.getTitle()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice1.getDateNotice()%></td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</tbody>
												
											</table>


											<table id="tabs2" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice2 = (List<Notice>) request.getAttribute("lstNotice2");
														if (lstNotice2 == null || lstNotice2.isEmpty()) {
													%>
													<tr>
														<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mNotice", lang)%></td>
													</tr>

													<%
														} else {
															for (int j = 0; j < lstNotice2.size(); j++) {
																Notice notice2 = (Notice)lstNotice2.get(j);		
																Typenotice tn2 = TypeNoticeBUS.getTypenotice(notice2.getTypenotice().getTypeNoticeId(), lang);
																
													%>
													<tr class="order_row"  onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=notice2.getTitle()%>','<%=notice2.getContentNotice()%>');return false;">

														<td class="nonSearch"><%=notice2.getNoticeId()%></td>
														<td class="nonSearch" style="text-align: left"><%=tn2.getNameTypeNotice()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice2.getTitle()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice2.getDateNotice()%></td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</tbody>
											</table>
											
											
											<table id="tabs3" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice3 = (List<Notice>) request.getAttribute("lstNotice3");
														if (lstNotice3 == null || lstNotice3.isEmpty()) {
													%>
													<tr>
														<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mNotice", lang)%></td>
													</tr>

													<%
														} else {
															for (int k = 0; k < lstNotice3.size(); k++) {
																Notice notice3 = (Notice)lstNotice3.get(k);		
																Typenotice tn3 = TypeNoticeBUS.getTypenotice(notice3.getTypenotice().getTypeNoticeId(), lang);
																
													%>
													<tr class="order_row"  onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=notice3.getTitle()%>','<%=notice3.getContentNotice()%>');return false;">

														<td class="nonSearch"><%=notice3.getNoticeId()%></td>
														<td class="nonSearch" style="text-align: left"><%=tn3.getNameTypeNotice()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice3.getTitle()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice3.getDateNotice()%></td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</tbody>
											</table>
											
											<table id="tabs4" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice4 = (List<Notice>) request.getAttribute("lstNotice4");
														if (null==lstNotice4 || lstNotice4.isEmpty()) {
													%>
													<tr>
														<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mNotice", lang)%></td>
													</tr>

													<%
														} else {
															for (int k4 = 0; k4 < lstNotice4.size(); k4++) {
																Notice notice4 = (Notice)lstNotice4.get(k4);	
																Typenotice tn4 = TypeNoticeBUS.getTypenotice(notice4.getTypenotice().getTypeNoticeId(), lang);
																
																
													%>
													<tr class="order_row"  onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=notice4.getTitle()%>','<%=notice4.getContentNotice()%>');return false;">

														<td class="nonSearch"><%=notice4.getNoticeId()%></td>
														<td class="nonSearch" style="text-align: left"><%=tn4.getNameTypeNotice()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice4.getTitle()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice4.getDateNotice()%></td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</tbody>
											</table>
											
											<table id="tabs5" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice5 = (List<Notice>)request.getAttribute("lstNotice4");
														if (null==lstNotice5 || lstNotice5.isEmpty() ) {
													%>
													<tr>
														<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mNotice", lang)%></td>
													</tr>

													<%
														} else {
															for (int i5 = 0; i5 < lstNotice5.size(); i5++) {
																Notice notice5 = (Notice)lstNotice5.get(i5);	
																Typenotice tn5 = TypeNoticeBUS.getTypenotice(notice5.getTypenotice().getTypeNoticeId(), lang);
																
													%>
													<tr class="order_row"  onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=notice5.getTitle()%>','<%=notice5.getContentNotice()%>');return false;">

														<td class="nonSearch"><%=notice5.getNoticeId()%></td>
														<td class="nonSearch" style="text-align: left"><%=tn5.getNameTypeNotice()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice5.getTitle()%></td>
														<td class="nonSearch" style="text-align: left"><%=notice5.getDateNotice()%></td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</tbody>
											</table>
											
										</div>





										<div class="summary_info">
											<div class="summary_info_box clearfix"
												style="overflow: auto; height: 500px; width: 705px">
												<h3>
													<a href="#" title="shop_kabi"><%=LanguegeBUS.getValue("title", lang)%>:&nbsp;&nbsp; <span id="title"></span></a>
												</h3>

												<div class="summary_info_inside clear"
													style="height: 600px; width: 720px;">
													<p style="padding-left:20px">
														<span id="noidung" class="info" style="display:inline; margin-left:0;font-size:12pt "></span>
													</p>

												</div>

											</div>

										</div>

										<br />
										<br />

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
		<!--End content-->



		<!--End content-->
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer"></div>
		<!--end footer-->
		<!--End footer-->
	</div>



</body>
</html>