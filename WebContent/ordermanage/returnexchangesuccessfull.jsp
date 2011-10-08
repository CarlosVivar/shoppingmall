<%-- 
    Document   : manageorders
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@include file="../library.jsp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%
	String myAccount = (String) session.getAttribute("username");

	if (myAccount == null) {
		request.getRequestDispatcher("/login.html").forward(request,
				response);
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("ordermanage", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="Googlebot" content="index,follow,archive">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

<script type="text/javascript">
	
</script>

</head>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="../WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">

				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>&nbsp; <img
								src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
								<a rel="nofollow" href="order.html?defaultId=1" class="viewmore"><%=LanguegeBUS.getValue("return_exchange", lang)%></a>
							</li>

						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8"> </a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="../WEB-INF/sellermenu.jsp"%>
				</DIV>

				<!-- -------------Content------------- -->
				<DIV class="col-main">
					<br />

					<DIV class="main-block">
						<DIV class="border-bot">
							<DIV class="border-left">
								<DIV class="border-right">
									<DIV class="corner-left-top">
										<DIV class="corner-right-top">

											<DIV class="corner-left-bot">
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<div class="tube">
															<div class="tab_show">

																<div
																	style="background-color: #fbfbfb; border: 2px solid #e6e6e6; padding: 10px 10px">
																	<h4><%=LanguegeBUS.getValue("return_exchange_step2", lang)%>:&nbsp;

																		<%=LanguegeBUS.getValue("return_exchange_successfull", lang)%></h4>

																</div>
																<br>

																<h4><%=LanguegeBUS.getValue("cancel_result", lang)%>
																</h4>

																<div
																	style="background-color: #fbfbfb; border: 2px solid #e6e6e6; text-align: center; padding: 10px 10px">
																	<%
																		if (request.getAttribute("sucessfull") != null) {
																	%>
																	<%=LanguegeBUS.getValue("notice_re_successfull", lang)%>
																	<div><%=LanguegeBUS.getValue("cancel_thanks", lang)%></div>
																	<%
																		} else {
																	%>
																	<%=LanguegeBUS.getValue("notice_re_unsuccessfull", lang)%>
																	<div><%=LanguegeBUS.getValue("cancel_appologies", lang)%></div>
																	<%
																		}
																	%>
																</div>
																<br>

																<div style="text-align: center">
																	<a href="order.html?defaultId=1">
																		<button type="button" style="padding: 0 10px"><%=LanguegeBUS.getValue("shopping_list", lang)%></button>
																	</a> <a href="index.html"><button type="button"
																			style="padding: 0 10px"><%=LanguegeBUS.getValue("home", lang)%></button>
																	</a>
																</div>
															</div>

															<div class="footer blog">
																<%@include file="../WEB-INF/footer.jsp"%>
															</div>

														</DIV>

													</DIV>
												</DIV>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>

				</DIV>

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="../WEB-INF/rightmenu.jsp"%>

				</DIV>

			</DIV>

		</DIV>
	</DIV>

</body>
</html>
