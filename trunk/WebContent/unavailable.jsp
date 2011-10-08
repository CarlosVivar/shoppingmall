<%-- 
    Document   : payment
    Created on : 30-05-2011, 20:07:21
    Author     : Mr Long
--%>
<%@include file="library.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="UTIL.NL_Checkout" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("payment", lang)%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/PaymentValidator.js"></script>

</head>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">

				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/leftmenu.jsp"%>
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
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<div class="tube">
															<Br>												
															<div  style="font-size: 12pt;text-align: center">
																	
																<h4><%=LanguegeBUS.getValue("url_unavailable",lang) %></h4>
																<div>
																<a href="index.html"><%=LanguegeBUS.getValue("home",lang) %></a>
																</div>
															</div>
															<br> <br>

															<div class="footer blog">
																<%@include file="WEB-INF/footer.jsp"%>
															</div>
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


				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>
				</DIV>

			</DIV>



		</DIV>
	</DIV>
</body>
</html>
