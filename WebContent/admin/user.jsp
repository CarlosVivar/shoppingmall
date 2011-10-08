<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>

 <%
            Object obj = request.getAttribute("lstUsers");
 			Object obj2 = request.getAttribute("lstSellers");
 			Object obj3 = request.getAttribute("lstAdmins");
            if (obj == null || obj2 == null || obj3 == null) {
                String url = "/manageUserController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("usermanage", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/favicon.ico" /> 
        
		<link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
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
				    $("#tabs1").hide();
                    $("#tabs2").hide();
                    $("#tabs3").hide();
                    $("#tabs4").show();
                    $("#tabs44").hide();
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
				
				function addContent(id,index) {		
					if(index=="4"){
						 $("#tabs44").show();
					}else{
						$("#tabs44").hide();
					}
					
					<% List<User> lst = UserBUS.lstUser(lang);%>
					
					<%
						if(lst!=null || !lst.isEmpty()){
							for(int i=0;i<lst.size();i++ ){
								User ur = (User)lst.get(i);
								Role r = RoleBUS.getRole(ur.getRole().getRoleId(),lang);
					%>
						var uid = "<%=ur.getAccount()%>";
						if(uid==id){
								document.getElementById("Id").value = "<%=ur.getAccount()%>";
								document.getElementById("username").value = "<%=ur.getAccount()%>";
								document.getElementById("registerDate").value = "<%=ur.getRegisterDate()%>";  
								document.getElementById("email").value = "<%=ur.getEmail()%>";
								document.getElementById("role").value = "<%=r.getRoleName()%>";  
								document.getElementById("fullname").value = "<%=ur.getFullName()%>";
								document.getElementById("address").value = "<%=ur.getAddress()%>";
								document.getElementById("phone").value = "<%=ur.getPhone()%>";
								document.getElementById("sex").value = "<%=ur.getSex()%>";
								<%
									Bank b = BankBUS.getBank(ur,lang);
									if(null!=b){
								%>
									document.getElementById("acc_number").value = "<%=b.getAccountNumber()%>";
									document.getElementById("banking").value = "<%=b.getBanking()%>";
									document.getElementById("holder").value = "<%=b.getAccountholders()%>";
									
								<%}else{%>
									document.getElementById("acc_number").value = "";
									document.getElementById("banking").value = "";
									document.getElementById("holder").value = "";
								<%}%>
								<%
									Company  co = CompanyBUS.getCompany(ur,lang);
									if(null!=co){
								%>
									document.getElementById("co_name").value = "<%=co.getCompanyName()%>";
									document.getElementById("buss_number").value = "<%=co.getBusinessNumber()%>";
									document.getElementById("co_address").value = "<%=co.getAddress()%>";
									document.getElementById("co_phone").value = "<%=co.getPhone()%>";
									document.getElementById("co_established").value = "<%=co.getEstablished()%>";
									document.getElementById("co_employees").value = "<%=co.getEmployees()%>";
									document.getElementById("co_bussinesstype").value = "<%=co.getBusinessType()%>";
									document.getElementById("co_mainproduct").value = "<%=co.getMainProduct()%>";
									document.getElementById("co_web").value = "<%=co.getWeb()%>";
									document.getElementById("co_representative").value = "<%=co.getRepresentative()%>";
									document.getElementById("co_capital").value = "<%=co.getCapital()%>";
									document.getElementById("co_fax").value = "<%=co.getFax()%>";
									document.getElementById("co_settlement").value = "<%=co.getSettlement()%>";
								<%}else{%>
									document.getElementById("co_name").value = "";
									document.getElementById("buss_number").value = "";
									document.getElementById("co_address").value = "";
									document.getElementById("co_phone").value = "";
									document.getElementById("co_established").value = "";
									document.getElementById("co_employees").value = "";
									document.getElementById("co_bussinesstype").value = "";
									document.getElementById("co_mainproduct").value = "";
									document.getElementById("co_web").value = "";
									document.getElementById("co_representative").value = "";
									document.getElementById("co_capital").value = "";
									document.getElementById("co_fax").value = "";
									document.getElementById("co_settlement").value = "";
								<%}%>
						}
					<%}
					}%>
			  }
         </script>
          <script type="text/javascript">
                function confirmDeletion() {
                        return confirm("Are you sure you want to lock this account?");
                }
                function confirmDeletion1() {
                    return confirm("Are you sure you want to unlock this account?");
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
	 
	 <li style="height: 26px; opacity: 1; display: block;">
	 <a rel="nofollow"  href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>
	   </a>&nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html" class="viewmore"><%=LanguegeBUS.getValue("uUSER", lang) %></a></li>					
						
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="<%=ServletUtils.getBaseUrl(request)%>/admin/inbox.html"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		      <li class="active"><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>    
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
                    <div class="box_ucp_inside">
                        <h2 class="title"><%=LanguegeBUS.getValue("usermanage", lang) %></h2>
                        <div id="usual2">

                            <ul class="tab">
                            	<li><a rel="tabs4" href="#tabs4" class="selected"><span><%=LanguegeBUS.getValue("seller", lang) %> <%=LanguegeBUS.getValue("register", lang) %></span></a></li>
                                <li><a rel="tabs1" href="#tabs1" ><span><%=LanguegeBUS.getValue("user", lang) %></span></a></li>
                                <li><a rel="tabs2" href="#tabs2"><span><%=LanguegeBUS.getValue("seller", lang) %></span></a></li>
                                <li><a rel="tabs3" href="#tabs3"><span><%=LanguegeBUS.getValue("admin", lang) %></span></a></li>
                                <li style="float: right ! important;"><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/userform.html"> <span><%=LanguegeBUS.getValue("newuser", lang) %></span></a></li>
                            </ul>
                            <div class="clear"></div>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">

                                <tbody><tr>
                                	<td class="lstitle" width="10">&nbsp;</td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("username", lang) %></td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("fullname", lang) %></td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("rDate", lang) %></td>
                                    <td class="lstitle" width="180"><%=LanguegeBUS.getValue("email", lang) %></td>                                 
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("role", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("state", lang) %></td>
                                </tr>
                            
                           			<%
                               			List<User> lstUser = (List<User>)request.getAttribute("lstUsers"); 
                               			if(lstUser==null || lstUser.isEmpty()){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="8" align="center"><%=LanguegeBUS.getValue("mUser", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstUser.size();i++){
                               					User u = (User)lstUser.get(i);
                               					Role r = RoleBUS.getRole(u.getRole().getRoleId(),lang);
                               					
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=u.getAccount()%>',1);return false;">
                               			<td class="nonSearch"> <input name="userId" id="userId" type="checkbox" value="<%=u.getAccount()%>">
                               			<td class="nonSearch" style="text-align:left"><a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=u.getAccount()%>" ><%=u.getAccount() %></a></td>
                               			<td class="nonSearch" style="text-align:left"><%=u.getFullName() %></td>
                               			<td class="nonSearch"><%=u.getRegisterDate() %></td>
                               			<td class="nonSearch" style="text-align:left"><%=u.getEmail() %></td>
                               			<td class="nonSearch"><%=r.getRoleName() %></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="userform1.html?Id=<%=u.getAccount() %>" title="Update">
				                                <img alt="save" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <% if(u.getState().equals("unlock")){ %>
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u.getAccount() %>" title="Lock" onclick="Inbox.deleteInbox();">
				                                    <img alt="lock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/unlock.png" width="18" />
				                                </a>
				                            <%}else if(u.getState().equals("lock")){ %>
				                            
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u.getAccount() %>" title="Unlock" onclick="Inbox.deleteInbox();">
				                                    <img alt="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u.getAccount() %>" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/lock.png" width="18" />
				                                </a>
				                            <%} %>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
                            	<tr>
										<td colspan="6">
											<%	NavigationInfo pagedcust = (NavigationInfo)session.getAttribute("pagedcust"); 
				                            	if(pagedcust!=null && pagedcust.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust.isFirstPage()){%>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust.getIndexList().length;i++){
								                		 if(i!=pagedcust.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust.isLastPage()){	 
								                 %>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=(pagedcust.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
										</td>
								</tr>		
								<%} %>
                            </tbody></table>
                            
                            <table  id="tabs2" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="10">&nbsp;</td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("username", lang) %></td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("fullname", lang) %></td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("rDate", lang) %></td>
                                    <td class="lstitle" width="180"><%=LanguegeBUS.getValue("email", lang) %></td>                                 
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("role", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("state", lang) %></td>
                                </tr>
                                
                                <%
                               			List<User> lstSeller = (List<User>)request.getAttribute("lstSellers"); 
                               			if(lstSeller==null || lstSeller.isEmpty()){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="8" align="center"><%=LanguegeBUS.getValue("mUser", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				for(int i2=0;i2<lstSeller.size();i2++){
                               					User u2 = (User)lstSeller.get(i2);
                               					Role r2 = RoleBUS.getRole(u2.getRole().getRoleId(),lang);
                               					
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=u2.getAccount()%>','2');return false;">
                               			<td class="nonSearch"> <input name="userId" id="userId" type="checkbox" value="<%=u2.getAccount()%>">
                               			<td class="nonSearch" style="text-align:left"><a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=u2.getAccount()%>" ><%=u2.getAccount() %></a></td>
                               			<td class="nonSearch" style="text-align:left"><%=u2.getFullName() %></td>
                               			<td class="nonSearch"><%=u2.getRegisterDate() %></td>
                               			<td class="nonSearch" style="text-align:left"><%=u2.getEmail() %></td>
                               			<td class="nonSearch"><%=r2.getRoleName() %></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="userform1.html?Id=<%=u2.getAccount() %>" title="Update">
				                                <img alt="save" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <% if(u2.getState().equals("unlock")){ %>
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u2.getAccount() %>" title="Lock" onclick="Inbox.deleteInbox();">
				                                    <img alt="lock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/unlock.png" width="18" />
				                                </a>
				                            <%}else if(u2.getState().equals("lock")){ %>
				                            
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u2.getAccount() %>" title="Unlock" onclick="Inbox.deleteInbox();">
				                                    <img alt="unlock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/lock.png" width="18" />
				                                </a>
				                            <%} %>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="6">
											<%	NavigationInfo pagedcust2 = (NavigationInfo)session.getAttribute("pagedcust2"); 
				                            	if(pagedcust2.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust2.isFirstPage()){%>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust2.getIndexList().length;i++){
								                		 if(i!=pagedcust2.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust2.isLastPage()){	 
								                 %>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=(pagedcust2.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
										</td>
									</tr>	
									<%} %>
                            </tbody></table>
							
								
                            <table  id="tabs3" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="10">&nbsp;</td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("username", lang) %></td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("fullname", lang) %></td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("rDate", lang) %></td>
                                    <td class="lstitle" width="180"><%=LanguegeBUS.getValue("email", lang) %></td>                                 
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("role", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("state", lang) %></td>
                                </tr>
                                
                                	<%
                               			List<User> lstAdmin = (List<User>)request.getAttribute("lstAdmins"); 
                               			if(lstAdmin==null || lstAdmin.isEmpty()){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="8" align="center"><%=LanguegeBUS.getValue("mUser", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstAdmin.size();i++){
                               					User u3 = (User)lstAdmin.get(i);
                               					Role r3 = RoleBUS.getRole(u3.getRole().getRoleId(),lang);
                               					
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=u3.getAccount()%>','3');return false;">
                               			<td class="nonSearch"> <input name="userId" id="userId" type="checkbox" value="<%=u3.getAccount()%>">   </td>
                               			<td class="nonSearch" style="text-align:left"><a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=u3.getAccount()%>" ><%=u3.getAccount() %></a></td>
                               			<td class="nonSearch" style="text-align:left"><%=u3.getFullName() %></td>
                               			<td class="nonSearch"><%=u3.getRegisterDate() %></td>
                               			<td class="nonSearch" style="text-align:left"><%=u3.getEmail() %></td>
                               			<td class="nonSearch"><%=r3.getRoleName() %></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="userform1.html?Id=<%=u3.getAccount() %>" title="Update">
				                                <img alt="save" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <% if(u3.getState().equals("unlock")){ %>
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u3.getAccount() %>" title="Lock" onclick="return confirmDeletion1();">
				                                    <img alt="lock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/unlock.png" width="18" />
				                                </a>
				                            <%}else if(u3.getState().equals("lock")){ %>
				                            
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u3.getAccount() %>" title="Unlock" onclick="return confirmDeletion();">
				                                    <img alt="unlock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/lock.png" width="18" />
				                                </a>
				                            <%} %>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="6">
											 <%	NavigationInfo pagedcust3 = (NavigationInfo)session.getAttribute("pagedcust3"); 
				                            	if(pagedcust3.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust3.isFirstPage()){%>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust3.getIndexList().length;i++){
								                		 if(i!=pagedcust3.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust3.isLastPage()){	 
								                 %>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=(pagedcust3.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
										</td>
									</tr>
									<%} %>
                            </tbody></table>
                            
                            <table  id="tabs4" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="10">&nbsp;</td>
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("username", lang) %></td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("fullname", lang) %></td>
                                    <td class="lstitle" width="120"><%=LanguegeBUS.getValue("rDate", lang) %></td>
                                    <td class="lstitle" width="180"><%=LanguegeBUS.getValue("email", lang) %></td>                                 
                                    <td class="lstitle" width="150"><%=LanguegeBUS.getValue("role", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("state", lang) %></td>
                                </tr>
                                
                                	<%
                               			List<User> lstRequest = (List<User>)request.getAttribute("lstRequests"); 
                               			if(lstRequest==null || lstRequest.isEmpty()){
                               		%>
                               		
                                    	<tr class="order_row"><td class="nonSearch" colspan="8" align="center"><%=LanguegeBUS.getValue("mUser", lang) %></td></tr>
                                   	
									<%
                               			}else{
                               				for(int i=0;i<lstRequest.size();i++){
                               					User u4 = (User)lstRequest.get(i);
                               					Role r4 = RoleBUS.getRole(u4.getRole().getRoleId(),lang);
                               					
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               						onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=u4.getAccount()%>',4);return false;">
                               			<td class="nonSearch"> <input name="userId" id="userId" type="checkbox" value="<%=u4.getAccount()%>">   </td>
                               			<td class="nonSearch" style="text-align:left"><a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.html?Id=<%=u4.getAccount()%>" ><%=u4.getAccount() %></a></td>
                               			<td class="nonSearch" style="text-align:left"><%=u4.getFullName() %></td>
                               			<td class="nonSearch"><%=u4.getRegisterDate() %></td>
                               			<td class="nonSearch" style="text-align:left"><%=u4.getEmail() %></td>
                               			<td class="nonSearch"><%=r4.getRoleName() %></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="userform1.html?Id=<%=u4.getAccount() %>" title="Update">
				                                <img alt="save" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <% if(u4.getState().equals("unlock")){ %>
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u4.getAccount() %>" title="Lock" onclick="return confirmDeletion1();">
				                                    <img alt="lock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/unlock.png" width="18" />
				                                </a>
				                            <%}else if(u4.getState().equals("lock")){ %>
				                            
				                                <a  href="<%=ServletUtils.getBaseUrl(request)%>/admin/lock.html?Id=<%=u4.getAccount() %>" title="Unlock" onclick="return confirmDeletion();">
				                                    <img alt="unlock" height="18" src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/lock.png" width="18" />
				                                </a>
				                            <%} %>
				                        </td>
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
									<tr>
										<td colspan="6">
											 <%	NavigationInfo pagedcust4 = (NavigationInfo)session.getAttribute("pagedcust4"); 
				                            	if(pagedcust4.getPageCount()- 1 > 0){ %>
				                             <div class="paging grey page_item">
				                              <div class="wrap">
				                              <div class="pageOn">
				                               <% 
								               
								                if(!pagedcust4.isFirstPage()){%>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=0">First</a></span>
				                               <% }
								                	 for(int i=1;i< pagedcust4.getIndexList().length;i++){
								                		 if(i!=pagedcust4.getCurrentPage()){    	                
								               %>
				                              <!-- span class="active">1</span-->
				                              <span><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=i%>" class="currentpage"><%=i%></a></span>
				                              <%}else{ %>	
								                 	<span class="active"><%=i%></span>
								                 <%}
								                	 }
								                	if(!pagedcust4.isLastPage()){	 
								                 %>
				                              <span ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/user.html?page=<%=(pagedcust4.getPageCount()- 1)%>">Last</a></span>
				                               <%}%>   
								                
				                              <!-- span class="total">(Có <b>3837</b> kết quả)</span--></div></div></div>  
												<% } %>
										</td>
									</tr>
									<%} %>
                            </tbody></table>
							
                        </div>
                    
                
                <br><br>
                <h2 class="title"><%=LanguegeBUS.getValue("exc_cart", lang) %></h2>
                <div class="creat_shop">
							
						
							<% String message = (String) request.getAttribute("Message");
				            	if (message != null) {
				            %>	
								<ul id="warning-box" class="warning" >
	                                <li class="first"> <%=message%></li>
	                            </ul>
	                        <%} %>
							<h3 class="n1"><%=LanguegeBUS.getValue("accInfor", lang) %></h3>
							<div class="group_listing_input">
							
							<table>
									<tr>
										<td>	
											<div class="info_profile_inside">
												<div class="listing_input">
													
													<div class="post_label_container">
														<label class="postLabel"><b><%=LanguegeBUS.getValue("username", lang) %>:</b></label>
													</div>
													<input id="username" name="username" type="text"  style="width:150px"  disabled="disabled"  class="medium_text_input show_tip required" />
										    	</div>
											</div>
										</td>
										<td>
											<div class="info_profile_inside">
												<div class="listing_input">
									
													<div class="post_label_container">
														<label class="postLabel"><b><%=LanguegeBUS.getValue("register", hlang) %>&nbsp;<%=LanguegeBUS.getValue("date", lang) %>:</b></label>
													</div>
													<input  id="registerDate" name="registerDate" type="text"  style="width:150px"  disabled="disabled"  class="medium_text_input show_tip required" />
													
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="info_profile_inside">
												<div class="listing_input hgauto">
													<div class="post_label_container">
														<label class="postLabel"><b><%=LanguegeBUS.getValue("email", lang) %>:</b></label>
													</div>
													<span></span>	
													<input id="email" name="email" type="text" disabled="disabled" style="width:200px"  class="medium_text_input show_tip required" />								
												</div>	
											</div>
										</td>
										<td>
											<div class="info_profile_inside">
													<div class="listing_input hgauto">
														<div class="post_label_container">
															<label class="postLabel"><b><%=LanguegeBUS.getValue("role", lang) %>:</b></label>
														</div>
														<input id="role" name="role" type="text" style="width:100px"  disabled="disabled"  class="medium_text_input show_tip required" />
														<span></span>									
													</div>	
											</div>
										</td>
									</tr>
							</table>
						
							</div>
							
							<div class="line clear"></div>
							<h3 class="n2"><%=LanguegeBUS.getValue("userInfor", lang) %>
							
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
									<input id="fullname" name="fullname" type="text"  style="width:200px" disabled="disabled" class="medium_text_input show_tip required" />
									
								</div>
								
																								
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><b><%=LanguegeBUS.getValue("address", lang) %>:</b></label>
									</div>
									<input id="address" name="address" type="text" disabled="disabled"  style="width:210px"  class="medium_text_input show_tip required" />
									
								</div>			
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("accountnumber", lang) %>:</b></label>

									</div>
									<input id="acc_number" name="acc_number" disabled="disabled" type="text"  style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b>Banking:</b></label>

									</div>
									<input id="banking" name="banking" disabled="disabled" type="text"  style="width:200px"  class="medium_text_input show_tip required" />
								</div>	
								 			
							</div>
							</td>
							<td>
								<div class="info_profile_inside">
								
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("sex", lang) %>:</b></label>

									</div>
									<input id="sex" name="sex" disabled="disabled" type="text"  style="width:80px"  class="medium_text_input show_tip required" />
									
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("birth", lang) %>:</b></label>

									</div>
									<input readonly type="text" name="birth"  id="birth" disabled="disabled"  style="width: 120px"  class="medium_text_input show_tip required"/>
				                      <a href="javascript:NewCssCal('birth','yyyymmdd')">
				                     <img src="<%=ServletUtils.getBaseUrl(request)%>/scripts/datetimepicker/images/cal.gif" width="8" height="9" alt=""></a>
									
									
								</div>
								
									
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("phone", lang) %>:</b></label>
									</div>
									<input id="phone" name="phone" type="text"  style="width:100px" disabled="disabled"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b>Account holder:</b></label>
									</div>
									<input id="holder" name="holder" type="text" disabled="disabled"  style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								 			
							</div>
							</td>
							</tr>
							</table>
								
							
						</div>
							
							<div class="line clear"></div>
							<h3 class="n3"><%=LanguegeBUS.getValue("companyinfo", lang) %>
							
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
									<input id="co_name" name="co_name" type="text" disabled="disabled"   style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("bussnumber", lang) %>:</b></label>

									</div>
									<input id="buss_number" name="buss_number" disabled="disabled" type="text" disabled="disabled" style="width:140px"  class="medium_text_input show_tip required" />
									
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("address", lang) %>:</b></label>

									</div>
									<input id="co_address" name="co_address" type="text" disabled="disabled" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("established", lang) %>:</b></label>

									</div>
									<input id="co_established" name="co_established" type="text" disabled="disabled" style="width:150px"  class="medium_text_input show_tip required" />
								</div>		
														
								 <div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("businesstype", lang) %>:</b></label>

									</div>
									<input id="co_bussinesstype" name="co_bussinesstype" type="text" disabled="disabled" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								 <div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("employees", lang) %>:</b></label>

									</div>
									<input id="co_employees" name="co_employees" type="text" disabled="disabled" style="width:150px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("mainproduct", lang) %>:</b></label>

									</div>
									<input id="co_mainproduct" name="co_mainproduct" type="text" disabled="disabled" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("web", lang) %>:</b></label>

									</div>
									<input id="co_web" name="co_web" type="text" disabled="disabled" style="width:210px"  class="medium_text_input show_tip required" />
								</div>	
											
							</div>
							</td>
							<td>
								<div class="info_profile_inside">
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("representative", lang) %>:</b></label>

									</div>
									<input id="representative" name="representative" disabled="disabled" type="text"  style="width:150px"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("phone", lang) %>:</b></label>
									</div>
									<input id="co_phone" name="co_phone" type="text"  style="width:100px" disabled="disabled"   class="medium_text_input show_tip required" />

								</div>
								
									
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("fax", lang) %>:</b></label>
									</div>
									<input id="co_fax" name="co_fax" type="text"  disabled="disabled" style="width:100px"  class="medium_text_input show_tip required" />
									
								</div>
								
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><b><%=LanguegeBUS.getValue("capital", lang) %>:</b></label>

									</div>
									<input id="co_capital" name="co_capital" type="text" disabled="disabled" style="width:150px"  class="medium_text_input show_tip required" />
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
									<input id="co_settlement" name="co_settlement" type="text" disabled="disabled" style="width:150px"  class="medium_text_input show_tip required" />
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
							<br>
						<form id="frm" name="frm" method="post" action="<%=ServletUtils.getBaseUrl(request)%>/manageUserUpdateController">	
							<div class="button_listing_input"  id="tabs44">		
								<input type="hidden" id="Id" name="Id" > 				
								<input type="hidden" id="act" name="act" value="Accept Seller" > 					
								<input id="upload_button" name="upload_button" class="btn_submit"  type="submit" value="<%=LanguegeBUS.getValue("confirm", lang)%>" />
								<input id="reset_button" name="reset_button" class="btn_submit"  type="reset" value="<%=LanguegeBUS.getValue("cancel", lang)%>" />
							</div>
							<br>
							<div class="clear"></div>	
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

	 </div>

	 </div>
	<br/><br/>
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

