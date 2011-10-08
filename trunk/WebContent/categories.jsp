<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("home", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

</head>
<%
String categoryID=request.getParameter("caID");
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
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><img
								src="admin/css/images/icon-arrow1.gif">&nbsp;<a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>
						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8">
					</a>
				</div>
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

															<%
																if (categoryID != null) {
																	Category category = CategoryBUS.getCategory(categoryID, lang);
																	if (category != null) {
															%>

															<div
																style="width: 598px; height: 30px; border-bottom: #1272e8 solid 2px; clear: both; padding-top: 10px">
																<h4
																	style="padding: 0 10px 0 10px; margin: 0;padding-top:8px;padding-bottom:5px; background: url('images/11_03.gif') repeat-x; height: 30px; color: white; float: left"><%=category.getCategoryName()%></h4>
															</div>
															<UL class="prodlist" style="clear: left">
																<%
																	List<Products> lst = (List<Products>) ProductBUS
																					.getListProductByCategory(category.getCategoryId(),
																							lang);
																			for (int p = 0; p < lst.size(); p++) {
																				Products pr = (Products) lst.get(p);
																				Productphotos pic = ProductPhotoBUS.lstProductPhoto(pr,
																						lang);
																%>


																<li><div class="outterimgframe">
																		<div class="innerimgframe">
																			<A
																				href="productdetail.html?Id=<%=pr.getProductId()%>">

																				<%
																					if (pic == null) {
																				%> <img
																				src="images/fashion/DefaultImage.gif"
																				alt="<%=pr.getProductName()%>" /> <%
 	} else {
 %> <img
																				width="140" height="200" style="z-index: 0"
																				src="images/fashion/<%=pic.getProductPhotoName()%>"
																				alt="<%=pr.getProductName()%>" /> <%
 	}
 %> </A>
																		</div>
																	</div> <img src="images/hot.gif" />
																	<p>
																		<span class="title"><%=pr.getProductName()%></span>
																	</p>
																	<p class="price"><%=pr.getPrice()%>$
																	</p>
																</li>
																<%
																	}
																%>
															</ul>

															<%
																}
																}
															%>

															<br class="clr">


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


