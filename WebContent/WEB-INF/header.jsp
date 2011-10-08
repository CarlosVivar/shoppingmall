<%-- 
    Document   : header
    Created on : May 19, 2011, 2:09:59 PM
    Author     : admin
--%>

<%@page import="CONTROLLER.productDetailController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, POJO.*, BUS.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<% 
ServletContext happ=getServletContext();
String hlang = (String)happ.getAttribute("MALL_LA"); %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script>	
         <link href="css/style-header.css" rel="stylesheet" type="text/css"/>
         <link href="css/style.css" rel="stylesheet" type="text/css"/>       

<!-- disabled mouse click right -->
<script type="text/javascript">
	var message_prevent="<%=LanguegeBUS.getValue("prevent_click_right",hlang )%>";
</script>
	<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/prevent.js"></script>
	<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/FancyBox/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/FancyBox/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=ServletUtils.getBaseUrl(request)%>/FancyBox/fancybox/jquery.fancybox-1.3.4.css"/>
 	<link rel="stylesheet" href="<%=ServletUtils.getBaseUrl(request)%>/style.css" />
 	<script type="text/javascript">
 	$(document).ready(function(){
 		$("#logout").click(function(){
		if(confirm("Are you sure?"))
			return true;
		else return false;		
	});
	$("#register").fancybox({
		'width'				: 750,
		'height'			: 750,
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'type'				: 'iframe',
		'hideOnOverlayClick':false,
	      'hideOnContentClick':false
	});	
	$("#seller").fancybox({
		'width'				: 650,
		'height'			: 650,
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'type'				: 'iframe',
		'hideOnOverlayClick':false,
	      'hideOnContentClick':false
	});	
	$("#login1").fancybox({
		'width'				: 500,
		'height'			: 302,
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'type'				: 'iframe',
		'hideOnOverlayClick':false,
	      'hideOnContentClick':false
	});});
	</script>
		
		 <script type="text/javascript">
		 
		 
		    $(document).ready(function(){
		        $(document).click(function() {
		            $("#content_menu_expand").hide();
		        });
		        $('#content_menu_expand').click(function(e) {
		            e.stopPropagation();
		        });
		
		        $('#menu_expand').click(function() {
		            if ($('#content_menu_expand').is(":hidden")) {
		                $('#content_menu_expand').show();
		            }
		            else {
		                $('#content_menu_expand').hide();
		            }
		            return false;
		        });
		        $('#close_menu').click(function() {
		            $('#content_menu_expand').hide();
		            return false;
		        });
		
		        $("ul.menu_inside li a").hover(function() {
		            $(this).parent().find("ul.subnav").slideDown(0).show();
		            $(this).parent().hover(function() {
		            }, function(){
		                $(this).parent().find("ul.subnav").slideUp(0);
		            });
		        }).hover(function() {
		            $(this).addClass("subhover");
		        }, function(){
		            $(this).removeClass("subhover");
		        });
		
		    });		    
		   

		</script>
		
    </head>
  
    <body>      
       
    <div id="header">	    	
     <a id="branding" href=""><div style="width: 160px;height: 50px"></div></a> 
 
    <div class="search">
        
        <div class="tipSearch">&nbsp;&nbsp;Khongmac Center <!--Cached Time: 16:34 06/06/2011--></div>
    </div>
    <div >
    <form action="" name="loginHead" id="loginHead" method="post">
   <ul class="miniBox" id="_loginAlr" >
			
				<%
                    if(session.getAttribute("username") == null){
         		%>    
				 	<li><a id="login1" href="LoginForm/index.jsp"><%=LanguegeBUS.getValue("login",hlang)%></a></li>
				<%}else{ %> 
				 	<li><span class="me_uname"><%=LanguegeBUS.getValue("welcome",hlang) %>,&nbsp;
				 	 <a href="accountdetail.html"><b><%=session.getAttribute("username")%></b></a></span>
				 	&nbsp;(<a href="logoutController" id="logout"><%=LanguegeBUS.getValue("logout",hlang) %></a>)</li>
				 	<% if(session.getAttribute("Role").equals("Seller")){%>
				 		<li><a rel="nofollow" href="<%=ServletUtils.getBaseUrl(request)%>/sale/notice.html" ><%=LanguegeBUS.getValue("manage", hlang) %></a></li>
				 	<% }else{%>
				 		
				 	<%}
				 		int amount = 0;
				 		List<Productorderdetail> cart = (List<Productorderdetail>)session.getAttribute("cart");
				 		if(cart != null && !cart.isEmpty()){
				 			amount = cart.size();
				 		}
				 	%>	
				 	<li><a rel="nofollow" href="<%=ServletUtils.getBaseUrl(request)%>/cart.html" ><%=LanguegeBUS.getValue("cart", hlang) %>(<%=amount%>)</a></li>
				<%} %>
				<%if(session.getAttribute("Role")==null){%>
				<li><a id="register" href="RegisterUser/index.jsp" ><%=LanguegeBUS.getValue("register", hlang) %></a></li>
				<% }else if(session.getAttribute("Role").equals("User")){%>
				<li><a id="seller" href="RegisterSeller/index.jsp" ><%=LanguegeBUS.getValue("seller_register", hlang) %></a></li>
				<%} %>
				 
				 <li class="end"><a rel="nofollow" href="javascript:OpenWin('/guide.html',600,590);"><%=LanguegeBUS.getValue("help", hlang)%></a></li>
			 </ul>
    </form>
    </div>
    

<br/><br/><br/>    
    <div id="menu">
        <ul class="menu_inside">
        	
        	<li class="menu_home">
        	<%
                    if(null!=session.getAttribute("username")){
         	%> 
			<a href="index.html">&nbsp;</a>
				<ul class="subnav">
				
         			<% if(session.getAttribute("Role").equals("Seller")){%>
						<li class="subtitle"><a rel="nofollow" href="accountdetail.html"><%=LanguegeBUS.getValue("seller", hlang)%></a></li>
						<li class="sublink"><a rel="nofollow" href="upload.html">+ <%=LanguegeBUS.getValue("newupload", hlang)%></a></li>
						<li class="sublink"><a rel="nofollow" href="seller.html">+ <%=LanguegeBUS.getValue("productmanage", hlang)%></a></li>
						<li class="sublink"><a rel="nofollow" href="sale.html">+ <%=LanguegeBUS.getValue("salemanage", hlang)%></a></li>
					<%} %>
					<li class="subtitle"><a rel="nofollow" href="accountdetail.html"><%=LanguegeBUS.getValue("buyer", hlang)%></a></li>
					<li class="sublink"><a rel="nofollow" href="accountdetail.html">+ <%=LanguegeBUS.getValue("accInfor", hlang)%></a></li>
					<li class="sublink"><a rel="nofollow" href="order.html?defaultId=1">+ <%=LanguegeBUS.getValue("ordermanage", hlang)%></a></li>
				
				</ul>
			<%} %>	
			</li>
			<li class="cat">
			<a rel="permalink" href="index.html"><%=LanguegeBUS.getValue("home", hlang)%></a>
				
			</li>
			 <%
            List<Category> lstCate = (List<Category>)CategoryBUS.lstCategory(hlang);
            for(int t=0;t<lstCate.size();t++){
                Category cat = (Category)lstCate.get(t); 
                List<CategoryChild> lstChild = (List<CategoryChild>)CategoryChildBUS.lstCategoryChild(cat,hlang);
        	%>     
			<li class="cat">
			
			<a rel="permalink" href="categories.html?caID=<%=cat.getCategoryId()%>"><%=cat.getCategoryName() %> 	
			<!--img class="hot" src="css/images/icon_hot.gif" width="21" height="16" alt="hot" /--></a>
			<ul class="subnav">
					<% 
		                for(int k=0;k<lstChild.size();k++){
		                    CategoryChild child = (CategoryChild)lstChild.get(k); 
		    
		            %>    
		                    <li class="subcat"><a rel="permalink" href="product.html?Id=<%=child.getCategoryChildId()%>"><%=child.getCategoryChildName()%></a></li>
		            <% } %>       
	
				</ul>
			</li>
			<% } %>  
			  
            <li class="end"><a id="menu_expand" href="#"><%=LanguegeBUS.getValue("all", hlang)%>&nbsp;<img class="hot" src="css/images/icon_menu_up.1.0.1.jpg" alt="<%=LanguegeBUS.getValue("all", hlang)%>" /> </a></li>
        </ul>
        <div id="content_menu_expand" style="display:none">            
          <%
            
            for(int t=0;t<lstCate.size();t++){
                Category cat = (Category)lstCate.get(t); 
                List<CategoryChild> lstChild = (List<CategoryChild>)CategoryChildBUS.lstCategoryChild(cat,hlang);
         %>    
           			<ul class="object_menu">

					 <li class="first"><a rel="permalink" href="product.html"><%=cat.getCategoryName() %></a></li>
					 <% 
		                for(int k=0;k<lstChild.size();k++){
		                    CategoryChild child = (CategoryChild)lstChild.get(k); 
		    
		            %>    
		                    <li><a rel="permalink" href="product.html?Id=<%=child.getCategoryChildId()%>"><%=child.getCategoryChildName()%></a></li>
		            <% } %>   
					
					 </ul>
				<% } %> 	 
					
				<a id="close_menu" href="#"><img width="52" height="16" src="http://static.123mua.vn/c/images/close_menu.1.0.1.jpg" alt="Close" /></a>
        </div>
		
        <div class="end_menu">
           <form action="<%=ServletUtils.getBaseUrl(request)%>/languageController" method="POST" id="languageForm" > 
               <div  class="fl">              
	                 <a href="welcome.html?lang=1"><img title="<%=LanguegeBUS.getValue("en", hlang)%>" width="24" height="15" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/flag_en.gif"></a>
	                 &nbsp;&nbsp;&nbsp;
	             </div>
	             <div  class="fl">              
	                 <a href="welcome.html?lang=2"><img title="<%=LanguegeBUS.getValue("ko", hlang)%>" width="24" height="15" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/flag_kr.gif"></a>
	                 &nbsp;
	             </div>
	            
       		   <div  style="display: block;" class="jewel hidden">
                	<div class="jewelToggler" >
                	<a href="welcome.html?lang=3"><img title="<%=LanguegeBUS.getValue("vi", hlang)%>" width="26" height="16" src="<%=ServletUtils.getBaseUrl(request)%>/css/images/flag_vn.gif"></a>
	              </div>
	           </div>   
            </form>
        </div>
    </div>

</div>
<!--end header-->  		
<br/><br/>

    </body>
</html>
