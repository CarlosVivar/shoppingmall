<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, POJO.*, BUS.*,UTIL.*"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("addcategory", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
         <script type="text/javascript"	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>

		 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script src="<%=ServletUtils.getBaseUrl(request)%>/scripts/common_script.js" type="text/javascript"></script>  
		 <script type="text/javascript">
        		$(function(){
                        $("#tab1").hide();
                        $("#tab2").hide();
                        $("#tab3").hide();
                        
                });               
                function showtab1(){                
                	
                	 var id = $("#cateId").val();
                     switch(id){            
                         case '0':
                        	$("#tab1").show();
                         	$("#tab2").hide();
                         	$("#tab4").hide();
                             break;
                         default:
                        	 $("#tab2").show();
                     		 $("#tab1").hide();
                     		 $("#tab4").hide();
                             break;
                     }
            	}
                
                function showtab2(){                
                	
                	 var id = $("#childId").val();
                     switch(id){            
                         
                         default:
                        	 $("#tab3").show();
                     		 
                             break;
                     }
            	}
                function validCate(){
		            $("#cateId_new").text("");
		            $("#catename").text("");
		            var cateId = $("#cateId_new").val();
		            var name = $("#catename").val();
		            if(cateId.length==0){
		                $("#validCate").text("Please enter Category ID!!");
		                return false;
		            }
		            if(name.length==0){
		                $("#validCate").text("Please enter Category name!!");
		                return false;
		            }
		
		        }
                function validChild(){
		            $("#childId_new").text("");
		            $("#childname").text("");
		            var childId = $("#childId_new").val();
		            var name = $("#childname").val();
		            if(childId.length==0){
		                $("#validChild").text("Please enter Category ID!!");
		                return false;
		            }
		            if(name.length==0){
		                $("#validChild").text("Please enter Category name!!");
		                return false;
		            }
		
		        }
                function validSub(){
		            $("#subId_new").text("");
		            $("#subname").text("");
		            var subId = $("#subId_new").val();
		            var name = $("#subname").val();
		            if(subId.length==0){
		                $("#validSub").text("Please enter Category ID!!");
		                return false;
		            }
		            if(name.length==0){
		                $("#validSub").text("Please enter Category name!!");
		                return false;
		            }
		
		        }
        </script>
			
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
	 <a rel="nofollow"  href="category.html" class="viewmore"><%=LanguegeBUS.getValue("uCATEGORY", lang) %></a>	&nbsp; 
	 <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;		
	 <a rel="nofollow"  href="categoryadd.html" class="viewmore"><%=LanguegeBUS.getValue("uADDCATE", lang) %></a></li>				
						
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
		      <li><a href="category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li>
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
					<form action="<%=ServletUtils.getBaseUrl(request)%>/manageCategoryActionController" method="post">
					<!--input type="hidden" id="item_survey_description" name="item[survey_description]" value="">
					<input id="hid_error" name="hid_error" type="hidden" value="0" /-->
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("addcategory", lang) %></h2>						
						<div class="creat_shop">
							
							<ul id="warning-box" >
                                <li class="first"> <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font size='3pt' color='red'>"+message+"</font></p>");
				                        }
				                 %>
				                </li>


                            </ul>
							<br/>
							
							<div class="group_listing_input">
							
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("category", lang) %>:</label>

									</div>
									<select id="cateId" name="cateId" class="role" style="width:140px;" onchange="showtab1();" >
											<option value="" > --<%=LanguegeBUS.getValue("select", lang) %>&nbsp;<%=LanguegeBUS.getValue("category", lang) %>-- </option>
											<option value="0" > << <%=LanguegeBUS.getValue("addcategory", lang) %> >> </option>
											<% List<Category> lstCate = (List<Category>)CategoryBUS.lstCategory(lang);
												for(int i=0;i<lstCate.size();i++){
													Category cate = (Category)lstCate.get(i);	
													
											%>
				                            	<option value="<%=cate.getCategoryId() %>" > <%=cate.getCategoryName() %></option>
				                           
				                           <%} %>
				                    </select>
									
									
										
									
								</div>
								<br/>
								<div id="tab1">
									<div class="listing_input hgauto" >
										<div class="post_label_container">
											<label class="postLabel">ID:</label>
										</div>
										<input id="cateId_new" name="cateId_new" type="text"/>
										<span class="error" id="validCate" ></span>	
									</div><div class="listing_input hgauto">		
											<div class="post_label_container">
											<label ><%=LanguegeBUS.getValue("catename", lang) %>:</label></div>
											<input id="catename" name="catename" type="text" class="register_text_input required show_tip required"/>
											<input type="hidden" value="add" name="act">
											<input type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" onclick="return validCate();"/>
									</div>		
											
								</div>
								<br/>
								
								<div id="tab2" >
									<div class="listing_input hgauto" >
										<div class="post_label_container">
											<label class="postLabel">ID:</label>
										</div>
										<input id="childId_new" name="childId_new" type="text" />
										<label class="error" id="validChild" ></label>
									</div><div class="listing_input hgauto">		
										<div class="post_label_container">
											<label class="postLabel"><%=LanguegeBUS.getValue("catename", lang) %>:</label>
										</div>
										<input id="childname" name="childname" type="text" class="register_text_input required show_tip required" />
										<input type="hidden" value="add" name="act">								
										<input id="cmd_submit" name="cmd_submit"   type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" onclick="return validChild();"/>			
									</div>			
								</div>
							
							</div>
							
							<div id="tab4" class="group_listing_input">
							
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("categorychild", lang) %>:</label>

									</div>
									<select id="childId" name="childId" class="role" style="width:150px;" onchange="showtab2();" >
											<option value="" > --<%=LanguegeBUS.getValue("select", lang) %>&nbsp;<%=LanguegeBUS.getValue("category", lang) %>-- </option>
											<% List<CategoryChild> lstChild = (List<CategoryChild>)CategoryChildBUS.lstCategoryChild(lang);
												for(int i=0;i<lstChild.size();i++){
													CategoryChild cc = (CategoryChild)lstChild.get(i);	
													
											%>
				                            	<option value="<%=cc.getCategoryChildId() %>" > <%=cc.getCategoryChildName() %></option>
				                           
				                           <%} %>
				                    </select>
									
									
								</div>
								<br/>
								<div id="tab3" >
								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel">ID:</label>
									</div>
									<input id="subId_new" name="subId_new" type="text" />
									<label class="error" id="validSub" ></label>
								</div><div class="listing_input hgauto">	
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("catename", lang) %>:</label>
									</div>
									<input id="subname" name="subname" type="text" class="register_text_input required show_tip required" />
									<input type="hidden" value="add" name="act">								
									<input id="cmd_submit" name="cmd_submit"   type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>"  onclick="return validSub();"/>			
								</div>			
								
							</div>
							</div>
							
							

							<div class="button_listing_input">	
								<br/><br/><br/>
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