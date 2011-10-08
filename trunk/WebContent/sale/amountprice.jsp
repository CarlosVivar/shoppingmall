<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object obj = request.getAttribute("lstProduct");
	if (obj == null) {
		String url = "/amountPriceController";
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}
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
<link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />

<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css"
	media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>

<script type="text/javascript">
				
		
				
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				 function addContent(id, title) {
					
					<%
						User user = UserBUS.getUser((String) session.getAttribute("username"), lang);
			 			List<Products> lstproduct = (List<Products>) ProductBUS.lstProduct(user, lang);
			 			for (int i = 0; i < lstproduct.size(); i++) {
						Products p1 = (Products) lstproduct.get(i);
						int p1id = p1.getProductId();
						int amount = p1.getAmount();
						String poductname = p1.getProductName();
						float price = p1.getPrice();
					%>
							var pid = "<%=p1id%>";
							var amount="<%=amount%>";
							var price="<%=price%>";
							if(id==pid){			
								document.getElementById("pid").value=pid;
								document.getElementById("pId").value=pid;
								document.getElementById("amount").value=amount;
								document.getElementById("poductname").value=title;
								document.getElementById("price").value=price;
								document.getElementById("amount").focus();
							}
					<%}%>
				}
         </script>
         
         <script type="text/javascript">
              
    //remove all options from selected box
  	function removeAllOptions(selectedObj) {
  		selectedObj.options.length = 0;
  	}
         
         function addSelectOption(selectObj, text, value, isSelected) {
        	  	//    if (selectObj != null ) {
        	  	    	var objOption = document.createElement("option");
        	  	    	objOption.text = text;
        	  	    	objOption.value = value;
        	  	    	objOption.selected = isSelected;
        	  	        selectObj.options[selectObj.options.length] = objOption;
        	  	 //  }
        	  	}
        	  		function setvalueforcate()
        	  		{
        	  			var flagnew=0;	
        	  			var selectCatogory = document.getElementById("selectCatogory").value;
        	  			var selectCatogoryChild = document.getElementById("selectCatogoryChild");
        	  			removeAllOptions(selectCatogoryChild);
        	  			addSelectOption(selectCatogoryChild,"-<%=LanguegeBUS.getValue("categorychild", lang)%>-",0,0);
        	  			$("#selectCatogoryChild").show();
        	  			var th=0;
        	  			<%
        	  			 List<CategoryChild> lstcategorychild = CategoryChildBUS.lstCategoryChild(lang);
        	              if (lstcategorychild != null) {
        	                  for (int i = 0; i < lstcategorychild.size(); i++) {
        	                  //	for (int i = 0; i < 5; i++) {
        	                      CategoryChild categorychild = lstcategorychild.get(i);
        	                      String id_CatoChild= categorychild.getCategoryId();
        	                      %>
        	                      var ids="<%=id_CatoChild %>";
        	  					 
        	  					 if(selectCatogory==ids){
        	  							$("#selectCatogoryChild").show();
        	  						 	var nm="<%= categorychild.getCategoryChildName()%>";
        	  		                    var vl="<%=categorychild.getCategoryChildId()%>";
        	  		                    addSelectOption(selectCatogoryChild,nm,vl, th);
        	  		                    th++;
        	  		                    flagnew++;
        	  					
        	  					 }
        	  				 		
        	  			 						<% 
        	                  }
        	  			 }
        	              %>
        	              
        	  		}
                                
                                function setvalueforcatesub()
        	  		{
        	  			var flagnew1=0;	
        	  			var selectCatogoryChild = document.getElementById("selectCatogoryChild").value;
        	  			var selectCatogorySub = document.getElementById("selectCatogorySub");
        	  			removeAllOptions(selectCatogorySub);
        	  			addSelectOption(selectCatogorySub,"-<%=LanguegeBUS.getValue("categorysub", lang)%>-",0,0);
        	  			$("#selectCatogorySub").show();
        	  			var th=0;
        	  			<%
        	  			 List<CategorySub> lstcategorysub = CategorySubBUS.lstCategorySub(lang);
        	              if (lstcategorysub != null) {
        	                  for (int i = 0; i < lstcategorysub.size(); i++) {
        	                  //	for (int i = 0; i < 5; i++) {
        	                      CategorySub categorysub = lstcategorysub.get(i);
        	                      String id_CatoChild= categorysub.getCategoryChildId();
        	                      %>
        	                      var ids="<%=id_CatoChild %>";
        	  					 
        	  					 if(selectCatogoryChild==ids){
        	  							$("#selectCatogorySub").show();
        	  						 	var nm="<%=categorysub.getCategorySubName()%>";
        	  		                    var vl="<%=categorysub.getCategorySubId()%>";
        	  		                    addSelectOption(selectCatogorySub,nm,vl, th);
        	  		                    th++;
        	  		                    flagnew1++;
        	  					
        	  					 }
        	  				 		
        	  			 						<% 
        	                  }
        	  			 }
        	              %>
        	              
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
							rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("amount", lang)%>/<%=LanguegeBUS.getValue("price", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="Đóng" width="8" height="8"> </a>
			</div>
			<div class="breadcrumb">
				<img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_link.gif"
					width="12" height="12" alt="Icon Link" /> <span><b> <%=LanguegeBUS.getValue("mamagerpriceandamount",
					lang)%> </b> </span>
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
									<h2 class="title">
										<%=LanguegeBUS.getValue("listproductandamount", lang)%>
									</h2>
									<div class="creat_shop">
										<h3 class="n1">
											<%=LanguegeBUS.getValue("youcan", lang)%>
										</h3>
										<div style="overflow: auto; height: 350px; width: 705px">
										<form action="<%=ServletUtils.getBaseUrl(request)%>/searchproamountController" method="post">
											<table width="725" border="0" class="table_ucp">
												<tr>
												
													<td colspan="7" bgcolor="#CCCCCC"><div align="right">
												
															<input type="submit" name="btnSearch" value="<%=LanguegeBUS.getValue("search", lang)%>" /> 
														</div>
													</td>
												</tr>
												<tr>
												
												
													<td height="31" colspan="7" style="text-align:left"><%=LanguegeBUS.getValue("category", lang)%>: <select
														 name="selectCatogory" id="selectCatogory" onchange="setvalueforcate()" style="width: 130px">
															<option>== <%=LanguegeBUS.getValue("category", lang)%> ==</option>
															<%
																List<Category> lstcategory=CategoryBUS.lstCategory(lang);
															if(lstcategory!=null){
																for(int i=0;i<lstcategory.size();i++){
																	Category category=lstcategory.get(i);
															%>
												<option value="<%=category.getCategoryId()%>">
												<%=category.getCategoryName() %>
												</option>
												<%
															}
															}
												%>
													</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
                                                                                                           onchange="setvalueforcatesub()" name="selectCatogoryChild" id="selectCatogoryChild"  style="width: 130px">
															<option>==<%=LanguegeBUS.getValue("categorychild", lang)%>==</option>
															
													</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
														id="selectCatogorySub" name="selectCatogorySub" style="width: 130px">
															<option>==<%=LanguegeBUS.getValue("categorysub", lang)%>==</option>
															
													</select>
													</td>
													
												</tr>
												
												<tr>
													<td width="30" bgcolor="#A79BCA">ID</td>
													<td width="70" bgcolor="#A79BCA"><%=LanguegeBUS.getValue("amount", lang)%></td>
													
													<td width="200" bgcolor="#A79BCA"><%=LanguegeBUS.getValue("productname", lang)%></td>
													<td width="80" bgcolor="#A79BCA"><%=LanguegeBUS.getValue("price", lang)%><br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>
													<td width="80" bgcolor="#A79BCA"><%=LanguegeBUS.getValue("pricepayment", lang)%></td>
													<td width="80" bgcolor="#A79BCA"><%=LanguegeBUS.getValue("interest", lang)%></td>
												</tr>
												<%
													ArrayList<Products> lstPro = (ArrayList<Products>) request.getAttribute("lstProduct");
													if(null==lstPro || lstPro.isEmpty() ){
												%>
												<tr>
														<td class="order_row" colspan="6" style="color:red"><%=LanguegeBUS.getValue("productnotexist", lang)%></td>
												</tr>
												<% 
												}else{
													for (int i = 0; i < lstPro.size(); i++) {
														Products pro = (Products) lstPro.get(i);
														Origin or = (Origin) OriginBUS.getOrigin(pro.getOriginId(),
																lang);
												%>
												<tr class="order_row"
													onmouseover="this.style.backgroundColor='#FFEBDA'"
													onmouseout="this.style.backgroundColor='#FFFFFF'"
													onmousedown="this.style.backgroundColor='#FFEBDA'"
													onclick="addContent('<%=pro.getProductId()%>','<%=pro.getProductName()%>');">
													<td><%=pro.getProductId()%></td>
													<td><%=pro.getAmount()%></td>
													
													<td style="text-align:left"><%=pro.getProductName()%></td>
													<td style="text-align:right"><%=pro.getPrice()%></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<%
													}
												}
												%>
											</table>
											</form>
										</div>
									</div>
								</div>

								<div class="box_ucp_inside">
									<h2 class="title">
										<%=LanguegeBUS.getValue("priceandamountofaproduct", lang)%>
									</h2>
									<div class="creat_shop">
										<h3 class="n1">
											<%=LanguegeBUS.getValue("updatepriceandamount", lang)%>
										</h3>
										<form action="<%=ServletUtils.getBaseUrl(request)%>/amountPriceController" method="post">
										<table width="596" border="0" class="table_ucp">
											<tr>
											 <td class="nonSearch" colspan="8">
    		                                 <%
    				                            String message = (String) request.getAttribute("Message");
    				                            if (message != null) {
    				                                out.println("<p align='center'><font size='2pt' color='red'>" + message + "</font></p>");
    				                            }
    				                         %>
                            				
                            			</td>
												<td colspan="2">
													<div align="right">
														<input id="pId"  name="txtIdpro" type="hidden" />
														<input type="submit" name="btnAmout" value="<%=LanguegeBUS.getValue("submit", lang)%>" />
														
													</div>
												</td>
											</tr>
											<tr>
												<td width="201"><div align="right"><%=LanguegeBUS.getValue("code", lang)%> /
														<%=LanguegeBUS.getValue("productname", lang)%></div></td>
												<td width="379">
												<div align="left">
													<input id="pid" disabled="disabled"  type="text" style="width:70px" readonly="true"/>
													<input id="poductname" disabled="disabled" name="txtname" size="255" style="width:250px" type="text" readonly="true"/>
												</div>
													</td>
											</tr>
											<tr>
												<td><div align="right"><%=LanguegeBUS.getValue("amount", lang)%></div></td>
												<td><div align="left">
														<input type="text" name="txtAmount" id="amount"/>&nbsp; (<%=LanguegeBUS.getValue("dvtDef", lang)%>)
													</div></td>
											</tr>

											<tr>
												<td><div align="right"><%=LanguegeBUS.getValue("payment", lang)%></div></td>
												<td><div align="left">
														<input type="text" name="textfield24" />
													</div></td>
											</tr>
											<tr>
												<td><div align="right"><%=LanguegeBUS.getValue("price", lang)%></div></td>
												<td><div align="left">
														<input type="text" name="txtPrice" id="price" /> &nbsp; (<%=LanguegeBUS.getValue("dolar", lang)%>)
													</div></td>
											</tr>

										</table>
										</form>

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
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer"></div>
		<!--end footer-->
		<!--End footer-->
	</div>



</body>
</html>