<%-- 
    Document   : payment
    Created on : 30-05-2011, 20:07:21
    Author     : Mr Long
--%>
<%@include file="library.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="UTIL.NL_Checkout"%>
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
<%
if(request.getAttribute("payment")==null){
	getServletContext().getRequestDispatcher("/NLCompletedController")
	.forward(request, response);
}else{
	if(request.getAttribute("payment")!=null){
		response.sendRedirect("unavailable.jsp");
	}
}

%>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">
<div class="clear"></div>
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
															<div id="bill" style="font-size: 12pt; text-align: center"></div>
															<br> <br>
															<%		
															if(request.getAttribute("payment")!=null){
																if ((Boolean)request.getAttribute("payment")) {
															%>
															<h4><%=LanguegeBUS.getValue("payment_successfull",lang) %></h4>
															<div>
																<%=LanguegeBUS.getValue("comeback",lang) %>&nbsp;<a href="order.html"><%=LanguegeBUS.getValue("shopping_list", lang)%></a>
															</div>
															<%
																} else {
															%>
															<h4><%=LanguegeBUS.getValue("payment_fault",lang) %></h4>
															<%
																}}
																	
																
															%>
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
