<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<%@page import="java.util.Date, POJO.*, BUS.*,UTIL.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("adduser", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/jquery.validate.pack.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/dateValidator.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/datetimepicker_css.js"></script>
        
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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a>&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="user.html" class="viewmore"><%=LanguegeBUS.getValue("uUSER", lang) %></a>	&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;		
	 <a rel="nofollow"  href="userform.html" class="viewmore"><%=LanguegeBUS.getValue("uADDUSER", lang) %></a></li>				
						
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="Close" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="#"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
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
					<form id="frm" name="frm" method="post" action="<%=ServletUtils.getBaseUrl(request)%>/manageRegisterController">
					<!--input type="hidden" id="item_survey_description" name="item[survey_description]" value="">
					<input id="hid_error" name="hid_error" type="hidden" value="0" /-->
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("adduser", lang) %></h2>						
						<div class="creat_shop">
							
							<ul id="warning-box" >
                                <li class="first"> <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
				                        }
				                 %>         </li>


                            </ul>
							<h3 class="n1"><%=LanguegeBUS.getValue("accInfor", lang) %></h3>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("username", lang) %>:</label>

									</div>
									<input id="username" name="username" type="text" value="" class="account_text_input show_tip required email" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label ><%=LanguegeBUS.getValue("role", lang) %>:&nbsp;&nbsp;</label>
									
									<select id="role" name="role" class="role" style="width:70px;" >
											<% List<Role> lstRole = (List<Role>)RoleBUS.lstRole(lang);
												for(int i=0;i<lstRole.size();i++){
													Role r = (Role)lstRole.get(i);	
												
											%>
				                            	<option value="<%=r.getRoleId() %>" <%if(r.getRoleId()==4){ %>selected <%}%> > <%=r.getRoleName() %> </option>
				                           
				                           <%} %>
				                    </select>
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("password", lang) %>:</label>
									</div>
									<input  id="password" name="password" type="password" value="" class="account_text_input show_tip required email" />
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("re-password", lang) %>:</label>
									</div>
									<input  id="password_confirm" name="password_confirm" type="password" value="" class="account_text_input show_tip required email" />
									
								</div>

								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("email", lang) %>:</label>
									</div>
									<input id="email" name="email" type="text" value="" class="register_text_input required show_tip required" />

									<!-- input id="item_check_email" type="button" class="checking" value="Check"><p id="checking_email" class="clear notice_text"></p-->										
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
							
							<div class="line clear"></div>
							<h3 class="n2"><%=LanguegeBUS.getValue("userInfor", lang) %></h3>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("fullname", lang) %>:</label>
									</div>
									<input id="fullname" name="fullname" type="text" value="" class="register_text_input show_tip required" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label ><%=LanguegeBUS.getValue("sex", lang) %>:&nbsp;&nbsp;</label>
									
									<select id="sex" name="sex" class="sex"  style="width:70px;">
				                            <option value="Male" > <%=LanguegeBUS.getValue("male", lang) %> </option>
				                            <option value="Female" > <%=LanguegeBUS.getValue("female", lang) %> </option>
				                             
				                    </select>
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("birth", lang) %>:</label>

									</div>
									<input type="text" name="birthday" id="datepicker" value="0000-00-00" title="Input Exp Date" style="width: 120px"/>
				                      <a href="javascript:NewCssCal('datepicker','yyyymmdd')">
				                     <img src="scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
																		
									
								</div>
								
								<div class="listing_textarea">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("address", lang) %>:</label>
									</div>
									<!--input id="address" name="address" type="text" value="" class="register_text_input required show_tip required" /-->
									<textarea name="address" id="address" rows="3" cols="43" ></textarea>
									
								</div>			
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("phone", lang) %>:</label>
									</div>
									<input id="phone" name="phone" type="text" value="" class="medium_text_input show_tip required number"/>

									
								</div>
													
													
							</div>

							<div class="button_listing_input">									
								<input id="cmd_submit" name="cmd_submit"   type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
								<input  id="cmd_reset" name="cmd_reset"  type="reset" value="<%=LanguegeBUS.getValue("reset", lang) %>" />
							</div>
							<div class="clear"></div>		
						</div>
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