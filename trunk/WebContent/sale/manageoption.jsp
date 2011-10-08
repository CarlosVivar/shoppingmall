<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="DAO.OptionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>
<%@include file="../library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("delicharges", lang)%></title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />


<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css"
	media="screen" rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>


<%
	Object obj = request.getAttribute("ProductPOJOs");
	if (obj == null) {
		String url = "/ManageOptionController";
		getServletContext().getRequestDispatcher(url).forward(request,
				response);
	}
%>



<script type="text/javascript">
	function setProductID() {
		if(checkNumeric(document.getElementById('optionPrice'))){
			var rows = document.getElementById('tableProducts')
			.getElementsByTagName('tr');

			for ( var i = 1; i < rows.length; i++) {
				var tds = rows[i].getElementsByTagName('td');
				var radio = tds[0].getElementsByTagName('input');
				if (radio[0].checked) {

					document.getElementById("productID").value = radio[0].value;
					return true;
					break;
				}
				}
			return false;
			}		
	}

	function loadListOptionByProduct(input) {
		var tableID = 'tableOptions';
		deleteAllRow(tableID);

		//load options by product
<%List<Products> products = (List<Products>) request
					.getAttribute("ProductPOJOs");
			if (products != null) {
				for (Products product : products) {%>
					if(input.value==<%=product.getProductId()%>){
					<%List<Options> options = OptionBUS.getListOptionByProductID(
							product.getProductId(), lang);

					if (options != null) {%>
					var tableOptions= document.getElementById("tableOptions");
						
						<%for (int index = 0; index < options.size(); index++) {
							Options option = options.get(index);%>	
							var rowCount = tableOptions.rows.length;		
							var trs = tableOptions.insertRow(rowCount);	
								//alert("1");			
						trs.setAttribute("class","order_row");
						trs.setAttribute("onmouseover","this.style.backgroundColor='#FFEBDA'");
						trs.setAttribute("onmouseout","this.style.backgroundColor='#FFFFFF'");
						trs.setAttribute("onmousedown","this.style.backgroundColor='#FFEBDA'");
						
							var tds1=trs.insertCell(0);
							tds1.setAttribute("class","nonSearch");
							var inputs=document.createElement("input");inputs.setAttribute("type","radio");
							inputs.setAttribute("id", "<%=index%>");inputs.setAttribute("name", "radioOption");
							inputs.setAttribute("value", "<%=option.getOptionId()%>");
							inputs.setAttribute("onClick", "loadFormEdit(this,'<%=option.getDescription()%>','<%=option.getOptionPrice()%>','<%=option.getCreateDate()%>','<%=option.getUpdateDate()%>')");
							
							tds1.appendChild(inputs);
							
							var tds2=trs.insertCell(1);tds2.setAttribute("class","nonSearch");tds2.innerHTML="<%=option.getOptionId()%>";
							var tds3=trs.insertCell(2);tds3.setAttribute("class","nonSearch");tds3.innerHTML="<%=option.getOptionId()%>";
							var tds4=trs.insertCell(3);tds4.setAttribute("class","nonSearch");tds4.innerHTML="<%=option.getDescription()%>";
							var tds5=trs.insertCell(4);tds5.setAttribute("class","nonSearch");tds5.innerHTML="<%=option.getOptionPrice()%>";
							var tds6=trs.insertCell(5);tds6.setAttribute("class","nonSearch");tds6.innerHTML="<%=option.getCreateDate()%>";
							var tds7=trs.insertCell(6);tds7.setAttribute("class","nonSearch");
							tds7.innerHTML="<%if (option.getUpdateDate() != null) {%><%=option.getUpdateDate()%><%}%>";
							
														
						//alert("size: "+tableOptions.childNodes.length);
						//alert("sixe: "+ tableOptions.rows.length);
							<%if (index == options.size() - 1) {%>								
							document.getElementById("<%=index%>").focus();
							<%}%>
						<%}%>    
						
						
					<%}%>
					}
	<%}
			}%>
			resetAllField();
	}
	
	function resetAllField(){
		document.getElementById("optionDescription").value="";
		document.getElementById("optionPrice").value="";
		document.getElementById("updateDate").value="";
		document.getElementById("createDate").value="";
		document.getElementById("optionID").value="";		
	}
	
	function loadFormEdit(option,description,price,createDate,updateDate){
		     
		document.getElementById("optionDescription").value=description;
		document.getElementById("optionPrice").value=price;
		if(updateDate!="null"){
			document.getElementById("updateDate").value=updateDate;
		}
		
		document.getElementById("createDate").value=createDate;
		document.getElementById("optionID").value=option.value;
		document.getElementById("optionDescription").focus();		
		
		document.getElementById("submitButton").value="edit";
		
		//croll to the bottom window
       <%=ResourcesDefault.loadCrollBottom()%>
	}
	
	function onLoadListOptionByProduct(){
		var input=getProductIDIsCheck();
		if(input!=-1){
			loadListOptionByProduct(input);
		}		
	}
	
	function getProductIDIsCheck(){
		var rows = document.getElementById('tableProducts')
		.getElementsByTagName('tr');

		for ( var i = 1; i < rows.length; i++) {
			var tds = rows[i].getElementsByTagName('td');
			var radio = tds[0].getElementsByTagName('input');
			if (radio[0].checked) {
				return radio[0];
				break;
			}
		}return -1;
	}

	function deleteAllRow(tableID) {
		try {
			var table = document.getElementById("tableOptions");
			var rowCount = table.rows.length;	
			//alert("table: "+table);
			//alert("rowCount: "+rowCount);
			for ( var i = (rowCount - 1); i > 0; i--) {		
				//alert("i: "+i)
				table.deleteRow(i);
				
			}
		} catch (e) {
			alert(e);
		}
	}
function loadFormCreate(){
	resetAllField();
	resetAllOption();
	document.getElementById("submitButton").value="create";
	document.getElementById("optionDescription").focus();
	//croll to the bottom window
    <%=ResourcesDefault.loadCrollBottom()%>
	
}

function resetAllOption(){
	var rows = document.getElementById('tableOptions')
	.getElementsByTagName('tr');

	for ( var i = 1; i < rows.length; i++) {
		var tds = rows[i].getElementsByTagName('td');
		var radio = tds[0].getElementsByTagName('input');
		if (radio[0].checked) {
			radio[0].checked=false;
			break;
		}
	}
}

function isNumeric(evt)
{
    var key = (evt.which) ? evt.which : window.event.keyCode;
    var alphaExp = /^[a-zA-Z\s\,\?\/\;\:\'\"\-\=\[\]\|\`]+$/;
    var keyChar = String.fromCharCode(key);
    if (keyChar.valueOf().match(alphaExp)){
        return false;
    }
    return true;
}

function checkNumeric(elem){	
	var numericExpression = /^[0-9\.]+$/;
	if(elem.value.match(numericExpression)){		
		return true;
	}else{		
		elem.focus();
	
		return false;
	}
}


</script>

<style type="text/css">
input1 {
	display: block;
}

.hide1 {
	display: none;
}

.show {
	display: block;
}
</style>
</head>
<body id="travel" onload="onLoadListOptionByProduct()">
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
							rel="nofollow" href="#" class="viewmore"><%=LanguegeBUS.getValue("productoptions", lang)%></a>
						</li>
					</ul>
				</div>
				<a class="closeAlert"><img
					src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
					alt="close" width="8" height="8"> </a>
			</div>

			<br />
			<div class="bottom_userCPanel">
				<p class="sumMoney">
					<label><%=LanguegeBUS.getValue("productoptions", lang)%></label>
				</p>

				<p>
					<b><%=LanguegeBUS.getValue("manage_option", lang)%>:</b>
					<%=LanguegeBUS.getValue("manage_option_introduce", lang)%>
				</p>

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
								<div style="padding-left: 5px">

									<div id="usual2" style="width: 730px">
										<%
											List<Products> ds = (List<Products>) request
													.getAttribute("ProductPOJOs");
										%>
										<h2 class="title" style="margin-left: 5px;"><%=LanguegeBUS.getValue("lstproduct", lang)%>
										</h2>
										<div style="width: 705px">
											<div style="overflow: auto; height: 250px; width: 730px">
												<table id="tableProducts" class="table_ucp" border="0"
													cellpadding="0" cellspacing="0" width="810px">
													<tr>

														<td class="lstitle" width="100" colspan="2"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td class="lstitle" width="250"><%=LanguegeBUS.getValue("title", lang)%></td>

														<td class="lstitle" width="80"><%=LanguegeBUS.getValue("date", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("producttype", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("origin", lang)%></td>
														<td class="lstitle" width="80"><%=LanguegeBUS.getValue("price", lang)%>
															<br>(<%=LanguegeBUS.getValue("dolar", lang)%>)</td>

													</tr>

													<%
														if (ds == null || ds.isEmpty()) {
													%>
													<tr>
														<td class="order_row" colspan="8"><%=LanguegeBUS.getValue("mProduct", lang)%></td>
													</tr>

													<%
														} else {
															for (int i = 0; i < ds.size(); i++) {
																Products p = (Products) ds.get(i);
																Productphotos pic = ProductPhotoBUS
																		.lstProductPhoto(p, lang);
																CategoryChild cc = CategoryChildBUS.getCategoryChild(
																		p.getCategoryChildId(), lang);
																Origin o = OriginBUS.getOrigin(p.getOriginId(), lang);
																Producttype pt = ProducttypeBUS.getProducttype(
																		p.getProductTypeId(), lang);
													%>
													<tr class="order_row"
														onmouseover="this.style.backgroundColor='#FFEBDA'"
														onmouseout="this.style.backgroundColor='#FFFFFF'"
														onmousedown="this.style.backgroundColor='#FFEBDA'">
														<td class="nonSearch" style="border-right: none"><input
															name="checkProduct" type="radio"
															onclick="loadListOptionByProduct(this)"
															<%if (request.getAttribute("productID") != null) {
						if (request.getAttribute("productID").equals(
								p.getProductId() + "")) {%>
															checked="checked" <%}
					} %>
															 value="<%=p.getProductId()%>">
														</td>
														<td class="nonSearch"><%=p.getProductId()%></td>
														<td class="nonSearch" style="text-align: left">
															<%
																if (null != cc) {
															%><%=cc.getCategoryChildName()%> <%
 	}
 %>
														</td>
														<td class="nonSearch" style="text-align: left"><%=p.getProductName()%>
															<input type="hidden" id="title" size="255" name="title"
															value="<%=p.getProductName()%>"> <input
															type="hidden" id="size1" size="255" name="size1"
															value="<%=p.getSize()%>"> <input type="hidden"
															id="color1" size="255" name="color1"
															value="<%=p.getColor()%>"></td>

														<td class="nonSearch"><%=p.getUploadDate()%></td>
														<td class="nonSearch" style="text-align: left"><%=pt.getProductTypeName()%></td>
														<td class="nonSearch" style="text-align: left"><%=o.getOriginName()%></td>
														<td class="nonSearch" style="text-align: right;"><%=p.getPrice()%><textarea
																style="display: none;" name="detail" id="detail"><%=p.getDetail()%></textarea>
														</td>

													</tr>
													<%
														}
													%>

													<%
														}
													%>
												</table>
											</div>
											<br>
											<h2 class="title" style="margin-left: 5px;"><%=LanguegeBUS.getValue("productoptions", lang)%>
											</h2>
											<button type="button" onclick="loadFormCreate()"><%=LanguegeBUS.getValue("sh_create", lang)%></button>
											<div style="overflow: auto; height: 250px; width: 730px">
												<table class="table_ucp" border="0" cellpadding="0"
													id="tableOptions" cellspacing="0" width="810px">
													<tr>
														<td class="lstitle" width="100" colspan="2"><%=LanguegeBUS.getValue("no.", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("option_id", lang)%></td>
														<td class="lstitle" width="250"><%=LanguegeBUS.getValue("option_description", lang)%></td>

														<td class="lstitle" width="80"><%=LanguegeBUS.getValue("option_price", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("create_date", lang)%></td>
														<td class="lstitle" width="100"><%=LanguegeBUS.getValue("update_date", lang)%></td>
													</tr>
													<%
														if (ds == null || ds.isEmpty()) {
													%>
													<tr>
														<td colspan="7">The Options is empty.</td>
													</tr>
													<%
														} else {
															Products productFirst = (Products) ds.get(0);
															List<Options> options = OptionBUS.getListOptionByProductID(
																	productFirst.getProductId(), lang);

															if (options != null) {
																for (Options option : options) {
													%>
													<tr class="order_row"
														onmouseover="this.style.backgroundColor='#FFEBDA'"
														onmouseout="this.style.backgroundColor='#FFFFFF'"
														onmousedown="this.style.backgroundColor='#FFEBDA'">
														<td class="nonSearch" style="border-right: none"><input
															type="radio" value=""></td>
														<td class="nonSearch"></td>
														<td class="nonSearch"><%=option.getOptionId()%></td>
														<td class="nonSearch"><%=option.getDescription()%></td>
														<td class="nonSearch"><%=option.getOptionPrice()%></td>
														<td class="nonSearch"><%=option.getCreateDate()%></td>
														<td class="nonSearch"><%=option.getUpdateDate()%></td>

													</tr>
													<%
														}
															}
														}
													%>

												</table>
											</div>
											<br>
											<div id="formCreate">
												<form
													action="<%=ServletUtils.getBaseUrl(request)%>/ManageOptionController"
													method="post" onsubmit="setProductID()">
													<table width="100%" class="table_deli">
														<tr>
															<td width="20%" style="background-color: #cccccc"><%=LanguegeBUS.getValue("option_description", lang)%></td>
															<td width="30%"><input name="optionDescription"
																id="optionDescription" /></td>
															<td width="20%" style="background-color: #cccccc"><%=LanguegeBUS.getValue("create_date", lang)%></td>
															<td width="30%" style="border-right: none"><input
																name="createDate" id="createDate" disabled="disabled" />
															</td>
														</tr>
														<tr>
															<td style="background-color: #cccccc"><%=LanguegeBUS.getValue("price(won)", lang)%></td>
															<td><input name="optionPrice" id="optionPrice"
																onkeypress="return isNumeric(event)" /></td>
															<td style="background-color: #cccccc"><%=LanguegeBUS.getValue("update_date", lang)%></td>
															<td style="border-right: none"><input
																name="updateDate" id="updateDate" disabled="disabled" />
															</td>
														</tr>
														<tr>
															<td colspan="4" style="border-right: none"><input
																type="hidden" name="optionID" id="optionID" /> <input
																type="hidden" name="productID" id="productID" /><br>
																<button type="submit" name="submitButton"
																	id="submitButton" value="create"><%=LanguegeBUS.getValue("submit", lang)%></button>
															</td>
														</tr>
													</table>
													<br> <br> <br> <br> <br> <br>
													<br>
												</form>
											</div>
										</div>
										<br>
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
		<!--End content-->
		<div class="clear"></div>
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer"></div>
		<!--end footer-->
		<!--End footer-->
	</div>



</body>
</html>