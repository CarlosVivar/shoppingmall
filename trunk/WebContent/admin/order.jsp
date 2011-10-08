<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<%@page import="POJO.*,BUS.*,UTIL.*, java.util.List,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj1 = request.getAttribute("lstOrders1");
			Object obj2 = request.getAttribute("lstOrders2");
			Object obj3 = request.getAttribute("lstOrders3");
            if (obj1 == null || obj2 == null || obj3 == null) {
                String url = "/manageOrderController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><%=LanguegeBUS.getValue("ordermanage", lang) %></title>
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
	 <a rel="nofollow"  href="order.html" class="viewmore"><%=LanguegeBUS.getValue("uORDER", lang) %></a></li>					
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
	
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
		      <li ><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li class="active"><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>   
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
                        <h2 class="title"><%=LanguegeBUS.getValue("ordermanage", lang) %></h2>
                        <div id="usual2">

                            <ul class="tab">
                                <li><a rel="tabs1" href="#tabs1" class="selected"><span><%=LanguegeBUS.getValue("orderhandle", lang) %></span></a></li>
                                <li><a rel="tabs2" href="#tabs2"><span><%=LanguegeBUS.getValue("ordercomplete", lang) %></span></a></li>
                                <li><a rel="tabs3" href="#tabs3"><span><%=LanguegeBUS.getValue("orderpending", lang) %></span></a></li>
                                <!--li style="float: right ! important;"><a href="" onclick="openPage('orderform.html').call(this)"><span><--%=LanguegeBUS.getValue("neworder") %></span></a></li-->
                            </ul>
                            <div class="clear"></div>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">

                                <tbody><tr>
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("orderNo.", lang) %></td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("buyer", lang) %></td>
                                    <td class="lstitle" width="140"><%=LanguegeBUS.getValue("total", lang) %><br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("oDate", lang) %></td>                                 
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("state", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                            
                           			 <%
                               			List<Productorder> lstOrder1 = (List<Productorder>)request.getAttribute("lstOrders3"); 
                               			if(lstOrder1==null){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="6" align="center"><%=LanguegeBUS.getValue("mOrder", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstOrder1.size();i++){
                               					Productorder pd1 = (Productorder)lstOrder1.get(i);
                               					Date d = new Date();
                               					Stateorder s = (Stateorder)StateorderBUS.getStateorder(pd1.getStateorder().getStateOrderId(),lang);
                               					
                               		%>
                               		<tr class="order_row">
                               			<td class="nonSearch"><a title="View order information" href="orderdetail.html?Id=<%=pd1.getProductOrderId()%>" >HD00<%=pd1.getProductOrderId()%>/<%=d.getYear()+1900%></a></td>
                               			<td class="nonSearch"><a title="View user information" href="userdetail.html?Id=<%=pd1.getUser().getAccount()%>" ><%=pd1.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=pd1.getTotalMoney() %></td>
                               			<td class="nonSearch"><%=pd1.getOrderDate() %></td>
                               			<td class="nonSearch" ><SPAN style="color:blue;"><%=s.getStateOrderName() %></SPAN></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="#" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="orderdelete.html?Id=<%=pd1.getProductOrderId() %>" title="Delete" onclick="Inbox.deleteInbox();">
				                                <img alt="save" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="7">
												 <%	NavigationInfo pagedcust1 = (NavigationInfo)session.getAttribute("pagedcust1"); 
			                            	if(pagedcust1.getPageCount()- 1 > 0){ %>
			                             <div class="paging grey page_item">
			                              <div class="wrap">
			                              <div class="pageOn">
			                               <% 
							               
							                if(!pagedcust1.isFirstPage()){%>
			                              <span ><a href="order.html?page=0"><%=LanguegeBUS.getValue("first", lang) %></a></span>
			                               <% }
							                	 for(int i=1;i< pagedcust1.getIndexList().length;i++){
							                		 if(i!=pagedcust1.getCurrentPage()){    	                
							               %>
			                              <!-- span class="active">1</span-->
			                              <span><a href="order.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
			                              <%}else{ %>	
							                 	<span class="active"><%=i%></span>
							                 <%}
							                	 }
							                	if(!pagedcust1.isLastPage()){	 
							                 %>
			                              <span ><a href="order.html?page=<%=(pagedcust1.getPageCount()- 1)%>"><%=LanguegeBUS.getValue("last", lang) %></a></span>
			                               <%}%>   
							                
			                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
											<% } %>				
										</td>
									</tr>
									<% } %>	
									
                            </tbody></table>
									
                            <table  id="tabs2" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                     <td class="lstitle" width="70"><%=LanguegeBUS.getValue("orderNo.", lang) %></td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("buyer", lang) %></td>
                                    <td class="lstitle" width="140"><%=LanguegeBUS.getValue("total", lang) %><br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("oDate", lang) %></td>                                 
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("state", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                           
                             		<%
                               			List<Productorder> lstOrder2 = (List<Productorder>)request.getAttribute("lstOrders1"); 
                               			if(lstOrder2==null){
                               		%>
                               		
                                    	 <tr class="order_row"><td class="nonSearch" colspan="6" align="center">Currently, don`t have any orders.2</td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstOrder2.size();i++){
                               					Productorder pd2 = (Productorder)lstOrder2.get(i);
                               					Date d = new Date();
                               					Stateorder s = (Stateorder)StateorderBUS.getStateorder(pd2.getStateorder().getStateOrderId(),lang);
                               					
                               		%>
                               		<tr class="order_row">
                               			<td class="nonSearch"><a title="View order information" href="orderdetail.html?Id=<%=pd2.getProductOrderId()%>" >HD00<%=pd2.getProductOrderId()%>/<%=d.getYear()+1900%></a></td>
                               			<td class="nonSearch"><a title="View user information" href="userdetail.html?Id=<%=pd2.getUser().getAccount()%>" ><%=pd2.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=pd2.getTotalMoney() %></td>
                               			<td class="nonSearch"><%=pd2.getOrderDate() %></td>
                               			<td class="nonSearch" ><SPAN style="color:blue;"><%=s.getStateOrderName()%></SPAN></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="#" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="orderdelete.jsp?Id=<%=pd2.getProductOrderId() %>" title="Delete" onclick="Inbox.deleteInbox();">
				                                <img alt="save" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="7">
											<%	NavigationInfo pagedcust2 = (NavigationInfo)session.getAttribute("pagedcust2"); 
				                            	if(pagedcust2.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust2.isFirstPage()){%>
				                              <span ><a href="order.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust2.getIndexList().length;i++){
								                		 if(i!=pagedcust2.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="order.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust2.isLastPage()){	 
								                 %>
				                              <span ><a href="order.html?page=<%=(pagedcust2.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
										</td>
									</tr>	
									<% } %>
                            </tbody></table>
							
								
                            <table  id="tabs3" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                     <td class="lstitle" width="70"><%=LanguegeBUS.getValue("orderNo.", lang) %></td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("buyer", lang) %></td>
                                    <td class="lstitle" width="140"><%=LanguegeBUS.getValue("total", lang) %><br/>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("oDate", lang) %></td>                                 
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("state", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="30"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                           
                            		<%
                               			List<Productorder> lstOrder3 = (List<Productorder>)request.getAttribute("lstOrders2"); 
                               			if(lstOrder3==null){
                               		%>
                               		
                                    	  <tr class="order_row"><td class="nonSearch" colspan="6" align="center">Currently, don`t have any orders.3</td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstOrder3.size();i++){
                               					Productorder pd3 = (Productorder)lstOrder3.get(i);
                               					Date d = new Date();
                               					Stateorder s = (Stateorder)StateorderBUS.getStateorder(pd3.getStateorder().getStateOrderId(),lang);
                               					
                               		%>
                               		<tr class="order_row">
                               			<td class="nonSearch"><a title="View order information" href="orderdetail.html?Id=<%=pd3.getProductOrderId()%>" >HD00<%=pd3.getProductOrderId()%>/<%=d.getYear()+1900%></a></td>
                               			<td class="nonSearch"><a title="View user information" href="userdetail.html?Id=<%=pd3.getUser().getAccount()%>" ><%=pd3.getUser().getAccount() %></a></td>
                               			<td class="nonSearch"><%=pd3.getTotalMoney() %></td>
                               			<td class="nonSearch"><%=pd3.getOrderDate() %></td>
                               			<td class="nonSearch" ><SPAN style="color:blue;"><%=s.getStateOrderName()%></SPAN></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="#" title="Update">
				                                <img alt="save" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="orderdelete.html?Id=<%=pd3.getProductOrderId() %>" title="Delete" onclick="Inbox.deleteInbox();">
				                                <img alt="save" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="7">
											<%	NavigationInfo pagedcust3 = (NavigationInfo)session.getAttribute("pagedcust3"); 
				                            	if(pagedcust3.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust3.isFirstPage()){%>
				                              <span ><a href="order.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust3.getIndexList().length;i++){
								                		 if(i!=pagedcust3.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="order.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust3.isLastPage()){	 
								                 %>
				                              <span ><a href="order.html?page=<%=(pagedcust3.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
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
	<br/>
	 </div>
	<br/>
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
</script>	
</html>
