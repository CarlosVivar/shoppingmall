<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("sellerinfo", lang) %></title>
		<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/datetimepicker_css.js"></script>
		 <script type="text/javascript">
             function openPage(path) {   window.location.href = path;   }
         </script>
</head>         
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="layout/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="#" class="viewmore"><%=LanguegeBUS.getValue("sellerinfo", lang) %></a>
	 </li>					
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
	
	<br/>
	<div class="bottom_userCPanel">
		<p class="sumMoney"><label><%=LanguegeBUS.getValue("sellerinfo", lang) %></label></p>
		<ul>
			<li class="transaction">&nbsp; </li>
			<li class="transaction"><b>Seller information:</b> help sellers manage their personal information.</li>
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
				<% User u = (User)UserBUS.getUser((String)session.getAttribute("username"),lang); 
					
					if(u != null){
						Bank b = BankBUS.getBank(u, lang);
				%>
					
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("sellerinfo", lang) %></h2>	
						 										
						<div class="creat_shop">
							
						<form id="frm" name="frm" method="post" action="<%=ServletUtils.getBaseUrl(request)%>/sellerInfoContronller">
							<% String message = (String) request.getAttribute("Message");
				            	if (message != null) {
				            %>	
								<ul id="warning-box" class="warning" >
	                                <li class="first"> <%=message%></li>
	                            </ul>
	                        <%} %>
							<h3 class="n1"><%=LanguegeBUS.getValue("accInfor", lang) %></h3>
							<div class="group_listing_input">
							<div class="info_profile_inside">
								<div class="listing_input">
									
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("username", lang) %>:</b></label>
									</div>
									<input type="text" value="<%=u.getAccount() %>" style="width:150px"  disabled="disabled"  class="medium_text_input show_tip required" />
									
								</div>
								<div class="listing_input">
									
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("password", lang) %>:</b></label>
									</div>
									<BUTTON class="button" type="button"  onclick="openPage('<%=ServletUtils.getBaseUrl(request)%>/changepass.html').call(this)">
				                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("changepass", lang) %></SPAN></SPAN></SPAN>
				                    </BUTTON>
									
								</div>
								<%Role r = (Role)RoleBUS.getRole(u.getRole().getRoleId(),lang); %>
								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("role", lang) %>:</b></label>
									</div>
									<input type="text" value="<%=r.getRoleName() %>" style="width:100px"  disabled="disabled"  class="medium_text_input show_tip required" />
									<span></span>									
								</div>		

								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("email", lang) %>:</b></label>
									</div>
									<span></span>	
									<input id="email" name="email" type="text" value="<%=u.getEmail() %>" style="width:200px"  class="medium_text_input show_tip required" />								
								</div>			
								<div class="listing_input">
									
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("register", hlang) %>&nbsp;<%=LanguegeBUS.getValue("date", lang) %>:</b></label>
									</div>
									<input type="text" value="<%=u.getRegisterDate() %>" style="width:150px"  disabled="disabled"  class="medium_text_input show_tip required" />
									
								</div>
							 
								</div>
							</div>
							
							<div class="line clear"></div>
							<h3 class="n2"><%=LanguegeBUS.getValue("userInfor", lang) %>
							<span style="float: right ! important;">
									<input type="hidden" name="userId" value="<%=u.getAccount() %>"/>				
									
									<BUTTON  class="button" type="submit" name="user_submit" value="user_submit">
				                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("update", lang) %></SPAN></SPAN></SPAN>
				                    </BUTTON>
							</span>
							</h3>
							
							<div class="group_listing_input">
							<table>
							<tr>
							<td>
								<div class="info_profile_inside">
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("fullname", lang) %>:</b></label>
									</div>
									<input id="fullname" name="fullname" type="text" value="<%=u.getFullName() %>" style="width:200px"  class="medium_text_input show_tip required" />
									
								</div>
								
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("birth", lang) %>:</b></label>

									</div>
									<input readonly type="text" name="birth" value="<%=u.getBirthday() %>" id="birth"  style="width: 120px"  class="medium_text_input show_tip required"/>
				                      <a href="javascript:NewCssCal('birth','yyyymmdd')">
				                     <img src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
									
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><b><%=LanguegeBUS.getValue("address", lang) %>:</b></label>
									</div>
									<input id="address" name="address" type="text" value="<%=u.getAddress() %>" style="width:210px"  class="medium_text_input show_tip required" />
									
								</div>			
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("accountnumber", lang) %>:</b></label>

									</div>
									<input id="acc_number" name="acc_number" disabled="disabled" type="text" value="<%=b.getAccountNumber() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b>Banking:</b></label>

									</div>
									<input id="banking" name="banking" disabled="disabled" type="text" value="<%=b.getBanking()%>" style="width:200px"  class="medium_text_input show_tip required" />
								</div>	
								 			
							</div>
							</td>
							<td>
								<div class="info_profile_inside">
								
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("sex", lang) %>:</b></label>

									</div>
									<select id="sex" name="sex" class="yyyy required" style="width: 80px" >
				                            
				                             <option value="Male" <%if(u.getSex().equals("Male")){%> selected="selected"<%}%> > <%=LanguegeBUS.getValue("male", lang) %> </option>
				                            <option value="Female" <%if(u.getSex().equals("Female")){%> selected="selected"<%}%> > <%=LanguegeBUS.getValue("female", lang) %> </option>
				                             
				                    </select>
									
								</div>
								
								<div class="listing_input">
									&nbsp;
									
								</div>
								
									
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("phone", lang) %>:</b></label>
									</div>
									<input id="phone" name="phone" type="text" value="<%=u.getPhone() %>" style="width:100px"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b>Account holder:</b></label>
									</div>
									<input id="holder" name="holder" type="text" disabled="disabled" value="<%=b.getAccountholders() %>" style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								 			
							</div>
							</td>
							</tr>
							</table>
								
							
						</div>
							<%  Company co = CompanyBUS.getCompany(u,lang);
								
							%>
							<div class="line clear"></div>
							<h3 class="n3"><%=LanguegeBUS.getValue("companyinfo", lang) %>
							<span style="float: right ! important;">
									<input type="hidden" name="comId" value="<%=co.getCompanyId() %>"/>				
								
									<BUTTON  class="button" type="submit" name="co_submit"  value="co_submit">
				                        <%=LanguegeBUS.getValue("update", lang) %>
				                    </BUTTON>
							</span>
							</h3>
							
							<div class="group_listing_input">
							<table>
							<tr>
							<td>
								<div class="info_profile_inside">
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("companyname", lang) %>:</b></label>
									</div>
									<input id="co_name" name="co_name" type="text" disabled="disabled" value="<%=co.getCompanyName() %>"  style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("bussnumber", lang) %>:</b></label>

									</div>
									<input id="buss_number" name="buss_number" disabled="disabled" type="text" value="<%=co.getBusinessNumber() %>" style="width:140px"  class="medium_text_input show_tip required" />
									
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("address", lang) %>:</b></label>

									</div>
									<input id="co_address" name="co_address" type="text" value="<%=co.getAddress() %>" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("established", lang) %>:</b></label>

									</div>
									<input id="co_established" name="co_established" type="text" value="<%=co.getEstablished() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>		
														
								 <div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("businesstype", lang) %>:</b></label>

									</div>
									<input id="co_bussinesstype" name="co_bussinesstype" type="text" value="<%=co.getBusinessType() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								 <div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("employees", lang) %>:</b></label>

									</div>
									<input id="co_employees" name="co_employees" type="text" value="<%=co.getEmployees() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("mainproduct", lang) %>:</b></label>

									</div>
									<input id="co_mainproduct" name="co_mainproduct" type="text" value="<%=co.getMainProduct() %>" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("web", lang) %>:</b></label>

									</div>
									<input id="co_web" name="co_web" type="text" value="<%=co.getWeb() %>" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
											
							</div>
							</td>
							<td>
								<div class="info_profile_inside">
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("representative", lang) %>:</b></label>

									</div>
									<input id="representative" name="representative" disabled="disabled" type="text" value="<%=co.getRepresentative() %>" style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("phone", lang) %>:</b></label>
									</div>
									<input id="co_phone" name="co_phone" type="text" value="<%=co.getPhone() %>" style="width:100px"   class="medium_text_input show_tip required" />

								</div>
								
									
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("fax", lang) %>:</b></label>
									</div>
									<input id="co_fax" name="co_fax" type="text" value="<%=co.getFax() %>" style="width:100px"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("capital", lang) %>:</b></label>

									</div>
									<input id="co_capital" name="co_capital" type="text" value="<%=co.getCapital() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>		
														
								 <div class="listing_input">
									<div class="post_label_container">
										&nbsp;
									</div>
									
								</div>		
								
								 <div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("settlement", lang) %>:</b></label>

									</div>
									<input id="co_settlement" name="co_settlement" type="text" value="<%=co.getSettlement() %>" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										&nbsp;
									</div>
									
								</div>		
								<div class="listing_input">
									<div class="post_label_container">
										&nbsp;
									</div>
									
								</div>		
								 			
							</div>
							</td>
							</tr>
							</table>
								
							
						</div>
							<div class="clear"></div>	
						</form>
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
        
			<div class="right_content_shop">            

			 		<%@include file="layout/menuright.jsp" %>               
			</div>	
			</div>
			</div>
	</div>  	<!--End content-->

  	
	
	<!--End content-->
	 <div class="clear"></div>
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	 <div id="footer">
			
	</div><!--end footer-->
	<!--End footer-->
	 </div>

</body>
</html>