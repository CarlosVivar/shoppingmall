<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>
<%
	Object obj = request.getAttribute("lstNotice1");
	if (obj == null) {
		String url = "/sellerMainController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("seller", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
         <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.4.2.min.js"></script>
		 
		  <script type="text/javascript">
				$(function() { 
					 $("#updateUser").click(function() {
						    $(".updateUser").fadeIn('normal').show();
					});
				    $('.tab a:first-child').click(function(){
				        switch_tabs($(this));
				        return false;
				    }); 
				    switch_tabs($('.selected'));
				    $("#ntabs1").show();
				    $("#ntabs2").hide();
				    $("#ntabs3").hide();
				    $("#ntabs4").hide();
				    $("#tabs5").show();
				    $("#tabs7").show();
				    $("#tabs_sos").show();
                    
				});
		
				function switch_tabs(obj)
				{
				    $('.table_ucp').hide();
				    $('.tab a:first-child').removeClass("selected");
				    var id = obj.attr("rel");
				    $('#'+id).show();
				    obj.addClass("selected");
				    $("#tabs5").show();
				    $("#tabs7").show();
				    $("#tabs_sos").show();
				}
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				

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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("sale", lang) %></a>
	 </li>					
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <br/>
	<div class="bottom_userCPanel">
				<p class="sumMoney"><label>GMS Main</label></p>
				<ul>
					<li class="transaction">&nbsp; </li>
					<li class="transaction">&nbsp;</li>
				</ul>
				<div class="clear"></div>
	</div>		
        
		<div class="content_ucp">

    		<div class="right_content_ucp wid960">
    				  				
         	<div class="box_ucp wid960">
				<div class="top_box_ucp">
					<div class="ltop_box_ucp"></div>
					<div class="rtop_box_ucp"></div>
				</div>
				<div class="full_center_box_ucp">
					<div class="box_ucp_inside wid910">
						<h2 class="title">GMS main</h2>

						<div class="info_profile" >
						
							<div class="info_profile_inside" style="overflow: auto;width:330px;border:1px solid #ededed">
							<div class="top_newsPersonal">
								<div class="ltop_newsPersonal"></div>
								<h2 class="lstitle"><%=LanguegeBUS.getValue("lstproduct", lang) %></h2>
								<a rel="nofollow" class="viewmore" href="amountprice.html" >조회</a>

								<div class="rtop_newsPersonal"></div>
							</div>
                          
                            <table id="tabs5"  class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="330">
                                <tbody>
                               <%
									List<Products> lstPro = (List<Products>) request.getAttribute("lstProduct");
									if (lstPro == null || lstPro.isEmpty()) {
								%>					              
                               		<tr>
                                    	<td class="nontable" colspan="2"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>
                                <%
									} else {
										for (int i = 0; i < lstPro.size(); i++) {
											Products pro = (Products)lstPro.get(i);											
								%>    
								<tr>
                                		
                                    <td style="text-align:left;" class="lstitle" width="290"><%=pro.getProductName() %></td>
                                    <td style="text-align:left;" class="lstitle" width="30"><a  href="amountprice.html" ><%=LanguegeBUS.getValue("detail", lang) %></a>
                                    </td>
                                    
                                </tr>
                                <%
										}
									}
								%>
									
                             </tbody></table>
                            </div>	
                            <br>
                            <div class="info_profile_inside" style="overflow: auto;width:330px;border:1px solid #ededed">
							<div class="top_newsPersonal">
								<div class="ltop_newsPersonal"></div>
								<h2 class="lstitle">Business processes (based on last month).</h2>
								<a rel="nofollow" class="viewmore" href="sellerinfo.html" >조회</a>

								<div class="rtop_newsPersonal"></div>
							</div>
                                                     
                            <table id="tabs7"  class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="330">
                                <tbody>
                                <tr>
                                	<td style="text-align:left;" class="lstitle" width="250">배송 요청 건수 </td>	
                                	<td class="lstitle" width="50"><a  href="#" ><%=LanguegeBUS.getValue("detail", lang) %></a></td>	                                    
                                </tr>
                               	 <tr>
                                	<td class="lstitle" style="text-align:left;">반품 요청 건수  </td>	
                                	<td class="lstitle" ><a  href="#" ><%=LanguegeBUS.getValue("detail", lang) %></a></td>	                                    
                                </tr>				              
                               	<tr>
                                	<td class="lstitle" style="text-align:left;">취소 요청 건수   </td>	
                                	<td class="lstitle" ><a  href="#" ><%=LanguegeBUS.getValue("detail", lang) %></a></td>	                                    
                                </tr>	
                                <tr>
                                	<td class="lstitle" style="text-align:left;">교환 요청 건수  </td>	
                                	<td class="lstitle" ><a  href="#" ><%=LanguegeBUS.getValue("detail", lang) %></a></td>	                                    
                                </tr>		                                    									
                             </tbody></table>
                            </div>	
                        </div>			
										
						<div class="newsPersonal ">
															
								<ul class="tab">

	                                <li><a rel="ntabs1" class="selected" href="#ntabs1"><span><%=LanguegeBUS.getValue("allnotice", lang)%></span></a></li>
	                                <li><a rel="ntabs2" href="#ntabs1"><span><%=LanguegeBUS.getValue("generalnotice", lang)%></span></a></li>
	                                <li><a rel="ntabs3" href="#ntabs1"><span><%=LanguegeBUS.getValue("usageguide", lang)%></span></a></li>
	                                <li><a rel="ntabs4" href="#ntabs1"><span><%=LanguegeBUS.getValue("systemnotice", lang)%></span></a></li>
	                                
	                                <!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
	                              
	                            </ul>
														
							<div class="newsPersonal_inside">								
							<div id="usual2" style="overflow: auto;height:250px;width:540px">
                            
                            <table id="ntabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="550">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice1 = (List<Notice>) request.getAttribute("lstNotice1");
														if (lstNotice1 == null) {
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
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="openPage('notice.html').call(this)">

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
											
											<table id="ntabs2" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="550">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice2 = (List<Notice>) request.getAttribute("lstNotice2");
														if (lstNotice2 == null) {
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
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="openPage('notice.html').call(this)">

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
											
											<table id="ntabs4" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="550">
												<tbody>
													<tr>
														<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="300"><%=LanguegeBUS.getValue("title", lang)%></td>
														<td class="lstitle" width="70"><%=LanguegeBUS.getValue("Date", lang)%></td>
													</tr>
													<%
														List<Notice> lstNotice5 = (List<Notice>)request.getAttribute("lstNotice4");
														if (null==lstNotice5 || !lstNotice5.isEmpty() ) {
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
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="openPage('notice.html').call(this)">

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
							</div>
						</div>
						<div class="newsPersonal" >
							<div class="tag_hot"><img src="http://static.123mua.vn/c/images/tag_hot.png" alt="Hot News" /></div>
							<div class="top_newsPersonal">
								<div class="ltop_newsPersonal"></div>
								<h2 class="lstitle">쇼핑 SOS</h2>
								<a rel="nofollow" class="viewmore" href="#" target="_blank">view</a>

								<div class="rtop_newsPersonal"></div>
							</div>
						<div style="overflow: auto;height:100px;width:540px">
							<table id="tabs_sos"  class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="550">
                                <tbody><tr>
                                	<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang) %></td>	
                                	<td class="lstitle" width="50"><%=LanguegeBUS.getValue("category", lang) %></td>	
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("title", lang) %></td>
                                  
                                    <td class="lstitle" width="50"> <%=LanguegeBUS.getValue("date", lang) %></td>
                                    
                                </tr>
                               
					              
                               		<tr>
                                    	<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>
                                    	
                             </tbody></table>	
                        </div>     					
						</div>

						<div class="clear"></div>
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
      <div class="relProduct">
  		<div class="relProduct_inside">
  			<h3>
  					Promotions
  					<a href="/product/search" class="button_cont"><img src="http://static.123mua.vn/c/images/button_viewmore.jpg" width="57" height="15" alt="Xem tiếp" /></a>
  					  			</h3>					
  			<div class="relProduct_inside_bdr">
  			
  				
				 <div class="showcase f4">

 <div class="showcase_inside">
 <div class="banner_showcase">
 <div id="content_profile" class="info_shop_ex">
                                                    <div class="top_info_shop">
                                                        <div class="ltop_info_shop"></div>
                                                        <div class="rtop_info_shop"></div>
                                                        <h3>Sale</h3>
                                                    </div>

                                                    <div class="info_shop_inside">

                                                        <div class="private_user">
                                                                        <p class="homephone"><a id="cmd_contact" name="cmd_contact" style="cursor:pointer">upload</a></p>
                                                                        <p class="homephone"><a rel="nofollow" href="ymsgr:sendIM?bop_shop">manage</a></p>
                                                                        <p class="homephone">sale</p>
                                                                        <p class="homephone">sale guide</p>
                                                                    </div>
                                                                </div>

                         </div>
 </div>

  <ul class="tab" style="width:950px">

                                <li><a rel="tabs5" class="selected" href="#tabs1"><span>Keyword Ad </span></a></li>
	                            <li><a rel="tabs6" href="#tabs1"><span>Category Ad</span></a></li>
	                            <li><a rel="tabs7" href="#tabs1"><span>Main Ad</span></a></li>
	                            <li><a rel="tabs8" href="#tabs1"><span>Other Ads</span></a></li>
                                
                                <!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
                            </ul>          
                      
 <div class="showcase_list clearfix">

 <div id="usual2" style="overflow: auto;height:200px;width:700px">
                  
                            
                            <table  id="tabs7" class="table_ucp" border="0" cellpadding="0" cellspacing="0" style="width:700px">
                                <tbody><tr>
                                	<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang) %></td>	
                                	<td class="lstitle" width="50"><%=LanguegeBUS.getValue("category", lang) %></td>	
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("title", lang) %></td>
                                  
                                    <td class="lstitle" width="50"> <%=LanguegeBUS.getValue("date", lang) %></td>
                                    
                                </tr>
                               
					               
                               		<tr>
                                    	<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>
                                   
                             </tbody></table>
                           
                        </div>		

 </div>
 </div>
 </div>
				<div class="clear"></div>
  			</div><!--End relProduct_inside_bdr-->
  			
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