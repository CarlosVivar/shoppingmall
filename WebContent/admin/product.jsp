<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj = request.getAttribute("lstProducts");
            if (obj == null) {
            	System.out.print("obj: "+obj);
                String url = "/manageProductController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><%=LanguegeBUS.getValue("productmanage", lang) %></title>
		<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.popupWindow.js"></script>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/service.1.0.6.js"></script>  
		
		 <script type="text/javascript">
				$(function() { 
				    $('.tab a:first-child').click(function(){
				        switch_tabs($(this));
				        return false;
				    }); 
				    switch_tabs($('.selected'));
				    $("#tabs1").show();
                    $("#tabs2").hide();
                    $("#tabs3").hide();
				});
		
				function switch_tabs(obj)
				{
				    $('.table_ucp').hide();
				    $('.tab a:first-child').removeClass("selected");
				    var id = obj.attr("rel");
				    $('#'+id).show();
				    obj.addClass("selected");
				}
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				function PopupWin(page,IEWidth,IEHeight,NNWidth,NNHeight) {

	                  var MyBrowser = navigator.appName;

	                  if (MyBrowser == "Netscape") {
	                  var myWinWidth = (window.screen.width/2) - (NNWidth/2);
	                  var myWinHeight = (window.screen.height/2) - ((NNHeight/2) + 50);

	                  var myWin = window.open(page,"MainWin","width=" + NNWidth + ",height=" + NNHeight + ",screenX=" + myWinWidth + ",screenY=" + myWinHeight + ",left=" + myWinWidth + ",top=" + myWinHeight + ",scrollbars=yes,toolbar=0,status=1,menubar=0,resizable=0,titlebar=no");

	                  }else {
	                  var myWinWidth = (window.screen.width/2) - (IEWidth/2);
	                  var myWinHeight = (window.screen.height/2) - ((IEHeight/2) + 50);

	                  var myWin = window.open(page,"MainWin","width=" + IEWidth + ",height=" + IEHeight + ",screenX=" + myWinWidth + ",screenY=" + myWinHeight + ",left=" + myWinWidth + ",top=" + myWinHeight + ",scrollbars=yes,toolbar=0,status=1,menubar=0,resizable=0,titlebar=no");

	                  }
	                  myWin.focus();

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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a> &nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="product.html" class="viewmore"><%=LanguegeBUS.getValue("uPRODUCT", lang) %></a></li>
								
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="inbox.html"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		
		      <li ><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li class="active"><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
		      <li ><a href="category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li> 
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
                    <div class="box_ucp_inside">
                        <h2 class="title"><%=LanguegeBUS.getValue("productmanage", lang) %></h2>
                        						
                                                <p class="numUp"><%=LanguegeBUS.getValue("productnumber", lang) %>: <strong><%=ProductBUS.lstProduct(lang).size() %></strong>
                                                <a id="cmd_uporder1" style="cursor: pointer;">
                                                </a></p>
                        <div id="usual2">
                            <ul class="tab">

                                <li><a rel="tabs1" class="selected" href="#tabs1"><span> <%=LanguegeBUS.getValue("all", lang) %> </span></a></li>
                                <li><a rel="tabs2" href=""><span><%=LanguegeBUS.getValue("Inventory", lang) %></span></a></li>
                                <li><a rel="tabs3" href=""><span><%=LanguegeBUS.getValue("extend_request", lang) %></span></a></li>
                                <!--li  style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
                            </ul>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="70"><%=LanguegeBUS.getValue("photo", lang) %></td>	
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("productname", lang) %></td>
                                    <!--td class="lstitle" width="100"></td-->
                                    <td class="lstitle" width="70"> <%=LanguegeBUS.getValue("seller", lang) %><br/>(<%=LanguegeBUS.getValue("upload", lang) %>) </td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("date", lang) %> <br/>(<%=LanguegeBUS.getValue("upload", lang) %>)</td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("price", lang) %> <br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                               
                               		<%
                               			List<Products> lstPr = (List<Products>)request.getAttribute("lstProducts");
                               			if(lstPr==null  || lstPr.isEmpty()){
                               		%>
                               		<tr>
                                    	<td class="nontable" colspan="7"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>	
									<%
                               			}else{
                               				for(int i=0;i<lstPr.size();i++){
                               					Products p = (Products)lstPr.get(i);
                               					CategoryChild cc = CategoryChildBUS.getCategoryChild(p.getCategoryChildId(),lang);
                               					Productphotos pic = ProductPhotoBUS.lstProductPhoto(p,lang);
                               					
                               		%>
                               		<tr class="order_row">
                               			
                               			<td class="nonSearch"><a title="View product information" href="productdetail.html?Id=<%=p.getProductId()%>" >
	                               			 <% if(pic == null){ %>
	                                               <img  src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/DefaultImage.gif" alt="<%=p.getProductName()%>" width="40" height="40" />
	                                        <% }else { %>
	                                               <img src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/<%=pic.getProductPhotoName()%>" width="40" height="40" />
	                                        <% } %>    
                               			
                               			</a></td>
                               			<td class="nonSearch" style="text-align:left;"><a title="View product information" href="productdetail.html?Id=<%=p.getProductId()%>" ><%=p.getProductName()%></a></td>
                               			
                               			<!--td class="nonSearch">
                               			</a></td-->
                               			<td class="nonSearch"><a title="View product information" href="userdetail.html?Id=<%=p.getUser().getAccount()%>" ><%=p.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=p.getUploadDate()%></td>
                               			<td class="nonSearch" style="text-align:right;"><%=p.getPrice()%>&nbsp;&nbsp; </td>
                               			<td class="nonSearch" align="center">
				                            <a href="#" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/productdelete.html?Id=<%=p.getProductId() %>" title="Delete" onclick="confirmDeletion();">
				                                <img alt="save" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
                                    <tr>
                                    	<td colspan="8">
                                    			<%NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pageAll");
                                    			
									                if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(pagedcust.isFirstPage()==false){%>
					                              <span ><a href="product.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
					                               <% }
									                	 for(int i=1;i<pagedcust.getIndexList().length;i++){
									                		 if(i!=pagedcust.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="product.html?page=<%=i%>" ><%=i%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i%></span>
									                 <%}
									                	 }
									                	if(pagedcust.isLastPage()==false){	 
									                 %>
					                              <span ><a href="product.html?page=<%=(pagedcust.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    	</td>
                                    </tr>
                                    <%} %>
                             </tbody></table>
                             
                              <table  id="tabs2" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width=70"><%=LanguegeBUS.getValue("photo", lang) %></td>	
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("productname", lang) %></td>
                                    <!--td class="lstitle" width="100"></td-->
                                    <td class="lstitle" width="70"> <%=LanguegeBUS.getValue("seller", lang) %><br/>(<%=LanguegeBUS.getValue("upload", lang) %>) </td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("date", lang) %> <br/>(<%=LanguegeBUS.getValue("upload", lang) %>)</td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("price", lang) %> <br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("limit_date", lang) %> </td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                               
                               		<%
                               			List<Inventory> lstStock = (List<Inventory>)request.getAttribute("lstStocks");
                               			if(lstStock==null || lstStock.isEmpty()){
                               		%>
                               		<tr>
                                    	<td class="nontable" colspan="7"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>	
									<%
                               			}else{
                               				for(int i=0;i<lstStock.size();i++){
                               					Inventory stock = (Inventory)lstStock.get(i);
                               					Products p1 = ProductBUS.getProducts(stock.getProductId(), lang);
                               					if(p1 !=null){
	                               					CategoryChild cc = CategoryChildBUS.getCategoryChild(p1.getCategoryChildId(),lang);
	                               					Productphotos pic = ProductPhotoBUS.lstProductPhoto(p1,lang);
                               					
                               		%>
                               		<tr class="order_row">
                               			
                               			<td class="nonSearch"><a title="View product information" href="productdetail.html?Id=<%=p1.getProductId()%>" >
	                               			 <% if(pic == null){ %>
	                                               <img  src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/DefaultImage.gif" alt="<%=p1.getProductName()%>" width="40" height="40" />
	                                        <% }else { %>
	                                               <img src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/<%=pic.getProductPhotoName()%>" width="40" height="40" />
	                                        <% } %>    
                               			
                               			</a></td>
                               			<td class="nonSearch" style="text-align:left;"><a title="View product information" href="productdetail.html?Id=<%=p1.getProductId()%>" ><%=p1.getProductName()%></a></td>
                               			
                               			<!--td class="nonSearch">
                               			</a></td-->
                               			<td class="nonSearch"><a title="View user information" href="userdetail.html?Id=<%=p1.getUser().getAccount()%>" ><%=p1.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=p1.getUploadDate()%></td>
                               			<td class="nonSearch" style="text-align:right;"><%=p1.getPrice()%> &nbsp;&nbsp; </td>
                               			<td class="nonSearch" align="center" style="color:red;"> <%=stock.getLimitDate() %>	</td>
                               			<td class="nonSearch" align="center">
				                            <a href="#" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/productdelete.html?Id=<%=p1.getProductId() %>" title="Delete" onclick="confirmDeletion();">
				                                <img alt="save" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			}
									%>
                                     <tr>
                                    	<td colspan="8">
                                    			<%NavigationInfo pagedcust2 = (NavigationInfo)session.getAttribute("pageStocks");
									                if(pagedcust2.getPageCount()- 1 > 0){
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(pagedcust2.isFirstPage()==false){%>
					                              <span ><a href="product.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
					                               <% }
									                	 for(int i=1;i<pagedcust2.getIndexList().length;i++){
									                		 if(i!=pagedcust2.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="product.html?page=<%=i%>" ><%=i%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i%></span>
									                 <%}
									                	 }
									                	if(pagedcust2.isLastPage()==false){	 
									                 %>
					                              <span ><a href="product.html?page=<%=(pagedcust2.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    	</td>
                                    </tr>
                                    <%} %>
                             </tbody></table>
                           
                           		

                              <table  id="tabs3" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="70"><%=LanguegeBUS.getValue("photo", lang) %></td>	
                                    <td class="lstitle" width="200"><%=LanguegeBUS.getValue("productname", lang) %></td>
                                    <!--td class="lstitle" width="100"></td-->
                                    <td class="lstitle" width="70"> <%=LanguegeBUS.getValue("seller", lang) %><br/>(<%=LanguegeBUS.getValue("upload", lang) %>) </td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("date", lang) %> <br/>(<%=LanguegeBUS.getValue("upload", lang) %>)</td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("price", lang) %> <br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("limit_date", lang) %> </td>
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("limitdatenum", lang)%></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("confirm", lang) %></td>
                                </tr>
                               
                               		<%
                               			List<Extension> lstExtend = (List<Extension>)request.getAttribute("lstExtends");
                               			if(lstExtend==null || lstExtend.isEmpty()){
                               		%>
                               		<tr>
                                    	<td class="nontable" colspan="7"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>	
									<%
                               			}else{
                               				for(int i=0;i<lstExtend.size();i++){
                               					Extension ext = (Extension)lstExtend.get(i);
                               					Products p2 = ProductBUS.getProducts(ext.getProductId(), lang);
                               					if(p2 !=null){
	                               					CategoryChild cc = CategoryChildBUS.getCategoryChild(p2.getCategoryChildId(),lang);
	                               					Productphotos pic = ProductPhotoBUS.lstProductPhoto(p2,lang);
                               					
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               							onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'">
                               			
                               			<td class="nonSearch"><a title="View product information" href="productdetail.html?Id=<%=p2.getProductId()%>" >
	                               			 <% if(pic == null){ %>
	                                               <img  src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/DefaultImage.gif" alt="<%=p2.getProductName()%>" width="40" height="40" />
	                                        <% }else { %>
	                                               <img src="<%=ServletUtils.getBaseUrl(request)%>/images/fashion/<%=pic.getProductPhotoName()%>" width="40" height="40" />
	                                        <% } %>    
                               			
                               			</a></td>
                               			<td class="nonSearch" style="text-align:left;"><a title="View product information" href="productdetail.html?Id=<%=p2.getProductId()%>" ><%=p2.getProductName()%></a></td>
                               			
                               			<!--td class="nonSearch">
                               			</a></td-->
                               			<td class="nonSearch"><a title="View user information" href="userdetail.html?Id=<%=p2.getUser().getAccount()%>" ><%=p2.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=p2.getUploadDate()%></td>
                               			<td class="nonSearch" style="text-align:right;"><%=p2.getPrice()%> &nbsp;&nbsp; </td>
                               			<td class="nonSearch" align="center" style="color:red;"> <%=ext.getLimitDateOld() %>	</td>
                               			<td class="nonSearch" align="center"> <%=ext.getLimitDateNum() %>	</td>
                               			<td class="nonSearch" align="center" >
                               				<form name="formAccept" id="formAccept"  action="<%=ServletUtils.getBaseUrl(request) %>/manageProductUpdateController" method="post">
				                           
				                                <input type="hidden" name="Id" value="<%=ext.getExtensionId() %>"> 
				                                <a title="<%=LanguegeBUS.getValue("accept", lang) %>" onclick="confirmAccept();">
				                                	<img alt="save" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/filtercheck.jpg" width="16" />
				                            	</a>
				                            </form>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			}
									%>
                                     <tr>
                                    	<td colspan="8">
                                    			<%NavigationInfo pagedcust3 = (NavigationInfo)session.getAttribute("pageExtends");
									                if(pagedcust3.getPageCount()- 1 > 0){
									              %>
					                              <div class="paging grey page_item">
					                              <div class="wrap">
					                              <div class="pageOn">
					                               <% 
									                if(pagedcust3.isFirstPage()==false){%>
					                              <span ><a href="product.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
					                               <% }
									                	 for(int i=1;i<pagedcust3.getIndexList().length;i++){
									                		 if(i!=pagedcust3.getCurrentPage()){    	                
									               %>
					                              <!-- span class="active">1</span-->
					                              <span><a href="product.html?page=<%=i%>" ><%=i%></a></span>
					                              <%}else{ %>	
									                 	<span class="active"><%=i%></span>
									                 <%}
									                	 }
									                	if(pagedcust3.isLastPage()==false){	 
									                 %>
					                              <span ><a href="product.html?page=<%=(pagedcust3.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
					                               <%} 
									                	%>   
									                
					                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>                        
					                             <%} 
					                             %>
                                    	</td>
                                    </tr>
                                    <%} %>
                             </tbody></table>
                             
                        </div>
                    </div>

                </div>
                <div class="bottom_box_ucp">
                    <div class="lbottom_box_ucp"></div>
                    <div class="rbottom_box_ucp"></div>
                </div>
            </div>
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
<script language="javascript" type="text/javascript">
	var Inbox = {	
		deleteInbox: function()
		{
			
			if (confirm("Are you sure you want to delete this product?")) 
			{
				$('#Are you sure you want to delete this product?').submit();
			}		
		}
		
	};
	function confirmAccept() {
        if(confirm("Are you sure you want to confirm this product?")){
        	document.formAccept.submit();
        }
	}
	function confirmDeletion() {
		
        	return confirm("Are you sure you want to delete this product?");
		
	}
</script>	
		<%  String message = (String) request.getAttribute("Message");
			if(message!=null && !message.isEmpty()){%>
				<input type="hidden" id="txtMessage" value="<%=message%>" />
				<script type="text/javascript">
						alert(document.getElementById("txtMessage").value);
				</script>
		<%}%>	 
</html>

