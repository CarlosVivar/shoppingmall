<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<%@page import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj = request.getAttribute("userPOJO");
            if (obj == null) {
                String url = "/manageUserDetailController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("userInfor", lang) %></title>
		<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
		 <script type="text/javascript">
             function openPage(path) {   window.location.href = path;   }
         </script>
</head>
<body>
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="template/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %> </a>&nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="user.html" class="viewmore"><%=LanguegeBUS.getValue("uUSER", lang) %></a></li>	
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="inbox.html">Messages (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		      <li class="active"><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
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
				<% User u = (User)request.getAttribute("userPOJO"); 
					if(u != null){
				%>
					<input type="hidden" id="item_survey_description" name="item[survey_description]" value="">
					<input id="hid_error" name="hid_error" type="hidden" value="0" />
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("accInfor", lang) %></h2>						
						<div class="creat_shop">
							
							
							<ul id="warning-box" class="warning" style="display:none">
                                <li class="first"> <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
				                        }
				                 %>         </li>


                            </ul>
							<h3 class="n1"><%=LanguegeBUS.getValue("accInfor", lang) %></h3>
							<div class="group_listing_input">
							<div class="info_profile_inside">
								<div class="listing_input">
									
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("username", lang) %>:</b></label>
									</div>
									<span><%=u.getAccount() %></span>
								</div>
								<%Role r = (Role)request.getAttribute("rolePOJO"); %>
								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("role", lang) %>:</b></label>
									</div>
									<span><%=r.getRoleName() %></span>									
								</div>		

								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("email", lang) %>:</b></label>
									</div>
									<span><%=u.getEmail() %></span>									
								</div>			
								
							  <!--div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">Hình thức thanh toán:</label>

									</div>
																											
									<span class="ht3">									
									<input class="nonbdr" id="item_payment_id_list" name="item[payment_id_list][]" type="checkbox" value="1" checked="checked" />
									Tiền mặt</span>
																											
									<span class="ht3">									
									<input class="nonbdr" id="item_payment_id_list" name="item[payment_id_list][]" type="checkbox" value="2"  />
									Chuyển khoản</span>
																		 
								</div-->
								</div>
							</div>
							
							<div class="line clear"></div>
							<h3 class="n2"><%=LanguegeBUS.getValue("userInfor", lang) %></h3>
							<div class="group_listing_input">
								<div class="info_profile_inside">
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("fullname", lang) %>:</b></label>
									</div>
									<span><%=u.getFullName() %></span>
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("sex", lang) %>:</b></label>

									</div>
									<span><%=u.getSex() %></span>
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("birth", lang) %>:</b></label>

									</div>
									<span><%=u.getBirthday() %></span>
									
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><b><%=LanguegeBUS.getValue("address", lang) %>:</b></label>
									</div>
									<span><%=u.getAddress() %></span>
									
								</div>			
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("phone", lang) %>:</b></label>
									</div>
									<span><%=u.getPhone() %></span>

									
								</div>
								 <div class="listing_input">
								 	
									<a href="#" onclick="openPage('userform1.html?Id=<%=u.getAccount() %>').call(this)" title="Update user infomation">																									
										<span style="float: right ! important;">	
										<BUTTON class="button" type="button" value="value="<%=LanguegeBUS.getValue("update", lang) %>">
				                        	<SPAN><SPAN><SPAN>&nbsp;&nbsp; <%=LanguegeBUS.getValue("update", lang) %>&nbsp;&nbsp;</SPAN></SPAN></SPAN>
				                    	</BUTTON>									
									</span></a>		&nbsp; &nbsp;	
						 			<% if((u.getAccount().equals((String)session.getAttribute("username")))){ %>
									 	<a href="#" title="Change password" onclick="openPage('changepass.html').call(this)">																									
											<span style="float: right ! important;">	
											<BUTTON class="button" type="button" value="value="<%=LanguegeBUS.getValue("changepass", lang) %>">
				                        		<SPAN><SPAN><SPAN>&nbsp;&nbsp; <%=LanguegeBUS.getValue("changepass", lang) %>&nbsp;&nbsp;</SPAN></SPAN></SPAN>
				                    		</BUTTON>								
											
										</span></a>	&nbsp; &nbsp;	
									<%} %>
								
							</div>						
													
							</div>


							<div class="clear"></div>		
						</div>
					</div>
					<%} %>
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