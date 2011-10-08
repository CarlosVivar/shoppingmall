<%-- 
    Document   : header
    Created on : May 19, 2011, 2:09:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,UTIL.*,POJO.*,BUS.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<link
	href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style-header.css"
	rel="stylesheet" type="text/css">
<!-- disabled mouse click right -->
	<%
	ServletContext happ=getServletContext();;
	String hlang = (String)happ.getAttribute("MALL_LA");%>
<script type="text/javascript">

	var message_prevent="<%=LanguegeBUS.getValue("prevent_click_right",hlang )%>";

</script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/prevent.js">
	
	</script>
<!-- disabled mouse click right -->
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
		<a id="branding" href=""><img width="160" height="50"
			src="<%=ServletUtils.getBaseUrl(request)%>/css//images/intech.png"
			alt="" />
		</a>

		<form action="" name="loginHead" id="loginHead" method="post">
			<ul class="miniBox" id="_loginAlr">

				<%
                    if(session.getAttribute("username") == null){
         		%>
				<li><a rel="nofollow"
					href="<%=ServletUtils.getBaseUrl(request)%>/login.html"><%=LanguegeBUS.getValue("login", hlang) %></a>
				</li>
				<%}else{ %>
				<li><span class="me_uname"><%=LanguegeBUS.getValue("welcome", hlang) %>,&nbsp;
						<a href="<%=ServletUtils.getBaseUrl(request)%>/accountdetail.html"><b><%=session.getAttribute("username")%></b>
					</a>
				</span> &nbsp;&nbsp;(<a
					href="<%=ServletUtils.getBaseUrl(request)%>/logoutController"><%=LanguegeBUS.getValue("logout", hlang) %></a>)
				</li>
				<li><a rel="nofollow"
					href="<%=ServletUtils.getBaseUrl(request)%>/sale/sellerinfo.html"><%=LanguegeBUS.getValue("manage", hlang) %></a>
				</li>
				<%} %>
				<li class="end"><a rel="nofollow"
					href="javascript:OpenWin('<%=ServletUtils.getBaseUrl(request)%>/guide.html',600,590);"><%=LanguegeBUS.getValue("help", hlang)%></a>
				</li>
			</ul>


		</form>
		<br />
		<br />
		<br />
		<div id="menu">
			<ul class="menu_inside">

				<li class="cat"><a rel="permalink"
					href="<%=ServletUtils.getBaseUrl(request)%>/index.html"><%=LanguegeBUS.getValue("home", hlang)%></a>

				</li>

				<li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("general", hlang)%>
						<!--img class="hot" src="css/images/icon_hot.gif" width="21" height="16" alt="hot" /-->
				</a>
					<ul class="subnav">

						
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/notice.html"><%=LanguegeBUS.getValue("infosection", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/sellerinfo.html"><%=LanguegeBUS.getValue("sellinfo", hlang)%></a>
						</li>
						<!--li class="subcat"><a rel="permalink" href="#"><--%=LanguegeBUS.getValue("certifyseller", hlang)%></a></li-->
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/changeaccount.html"><%=LanguegeBUS.getValue("changeaccount", hlang)%></a>
						</li>
						<!--li class="subcat"><a rel="permalink" href="#"><--%=LanguegeBUS.getValue("buyguide", hlang)%></a></li-->
						<li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("sellguide", hlang)%></a>
						</li>
					</ul></li>
				<li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("product", hlang)%></a>
					<ul class="subnav">

						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/upload.html"><%=LanguegeBUS.getValue("upload", hlang)%>/<%=LanguegeBUS.getValue("manage", hlang)%>
						</a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/manageoption.html"><%=LanguegeBUS.getValue("productoptions", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/amountprice.html"><%=LanguegeBUS.getValue("price", hlang)%>/<%=LanguegeBUS.getValue("amount", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/inventory.html"><%=LanguegeBUS.getValue("inventory", hlang)%></a>
						</li>

					</ul></li>
				<%-->li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("promotion", hlang)%></a>	
				<ul class="subnav">
					
		                    <li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("saleoff", hlang)%> </a></li>
		                    <li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("event", hlang)%></a></li>    		
				</ul>
			</li--%>
				<li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("delivery", hlang)%></a>
					<ul class="subnav">

						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/deliverstatus.html"><%=LanguegeBUS.getValue("delistatus", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/delivercost.html"><%=LanguegeBUS.getValue("de_cost_deliver_cost", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/shippingcompany.html"><%=LanguegeBUS.getValue("shipping_com", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/deliverinfo.html"><%=LanguegeBUS.getValue("deliservice", hlang)%></a>
						</li>
					</ul></li>
				<li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("cancel", hlang)%>/<%=LanguegeBUS.getValue("return", hlang)%>/<%=LanguegeBUS.getValue("exchange", hlang)%></a>
					<ul class="subnav">

						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/cancelorder.html"><%=LanguegeBUS.getValue("productcancel", hlang)%></a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/exchangeorder.html"><%=LanguegeBUS.getValue("productreturn", hlang)%> </a>
						</li>
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/exchangeorder.html"><%=LanguegeBUS.getValue("productexchange", hlang)%> </a>
						</li>
					</ul></li>
				<li class="cat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("tab_sell_price", hlang)%></a>
					<ul class="subnav">
						<li class="subcat"><a rel="permalink"
							href="<%=ServletUtils.getBaseUrl(request)%>/sale/homedeliver.html"><%=LanguegeBUS.getValue("link_home_deliver", hlang)%></a>
						</li>

					</ul></li>

				<li class="end"><a id="menu_expand" href="#"><%=LanguegeBUS.getValue("all", hlang)%>&nbsp;&nbsp;
						<img class="hot"
						src="<%=ServletUtils.getBaseUrl(request)%>/css/images/icon_menu_up.1.0.1.jpg"
						alt="<%=LanguegeBUS.getValue("all", hlang)%>" />
				</a>
				</li>
			</ul>
			<div id="content_menu_expand" style="display: none">

				<ul class="object_menu">

					<li class="first"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("general", hlang)%></a>
					</li>

					
					<li><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/notice.html"><%=LanguegeBUS.getValue("infosection", hlang)%></a>
					</li>
					<li><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/sellerinfo.html"><%=LanguegeBUS.getValue("sellinfo", hlang)%></a>
					</li>
					<!--li><a rel="permalink" href="#"><!--%=LanguegeBUS.getValue("certifyseller", hlang)%></a></li-->
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/changeaccount.html"><%=LanguegeBUS.getValue("changeaccount", hlang)%></a>
					</li>
					<!--li><a rel="permalink" href="#"><--%=LanguegeBUS.getValue("buyguide", hlang)%></a></li-->
					<li><a rel="permalink" href="#"><%=LanguegeBUS.getValue("sellguide", hlang)%></a>
					</li>

				</ul>

				<ul class="object_menu">
					<li class="first"><a rel="permalink" href="product.html"><%=LanguegeBUS.getValue("product", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/upload.html"><%=LanguegeBUS.getValue("upload", hlang)%>/<%=LanguegeBUS.getValue("manage", hlang)%>
					</a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/manageoption.html"><%=LanguegeBUS.getValue("productoptions", hlang)%>
					</a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/amountprice.html"><%=LanguegeBUS.getValue("price", hlang)%>/<%=LanguegeBUS.getValue("amount", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/inventory.html"><%=LanguegeBUS.getValue("inventory", hlang)%></a>
					</li>
				</ul>

				<%-- ul class="object_menu">
					 <li class="first"><a rel="permalink" href="product.html"><%=LanguegeBUS.getValue("promotion", hlang)%></a></li>
		                     <li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("saleoff", hlang)%> </a></li>
		                    <li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("event", hlang)%></a></li>    		    
					 </ul--%>

				<ul class="object_menu">
					<li class="first"><a rel="permalink" href="product.html"><%=LanguegeBUS.getValue("delivery", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/deliverstatus.html"><%=LanguegeBUS.getValue("delistatus", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/delivercost.html"><%=LanguegeBUS.getValue("de_cost_deliver_cost", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/shippingcompany.html"><%=LanguegeBUS.getValue("shipping_com", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/deliverinfo.html"><%=LanguegeBUS.getValue("deliservice", hlang)%></a>
					</li>
				</ul>

				<ul class="object_menu">
					<li class="first"><a rel="permalink" href="product.html"><%=LanguegeBUS.getValue("cancel", hlang)%>/<%=LanguegeBUS.getValue("return", hlang)%>/<%=LanguegeBUS.getValue("exchange", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("productcancel", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("productreturn", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/exchangeorder.html"><%=LanguegeBUS.getValue("productexchange", hlang)%></a>
					</li>
				</ul>
				<ul class="object_menu">
					<li class="first"><a rel="permalink" href="#"><%=LanguegeBUS.getValue("tab_sell_price", hlang)%></a>
					</li>
					<li class="subcat"><a rel="permalink"
						href="<%=ServletUtils.getBaseUrl(request)%>/sale/homedeliver.html"><%=LanguegeBUS.getValue("link_home_deliver", hlang)%></a>
					</li>

				</ul>

				<a id="close_menu" href="#"><img width="52" height="16"
					src="http://static.123mua.vn/c/images/close_menu.1.0.1.jpg"
					alt="Close" />
				</a>
			</div>

			<div class="end_menu">

				<div class="fl">
					<% if(null==hlang || hlang.length() == 0 || hlang.equals("MALL_EN")){ %>
					<span class="cat" style="color: white;"><%=LanguegeBUS.getValue("en", hlang)%></span>
					<%}else{ 	
			         		if(hlang.equals("MALL_VN")){
			         %>
					<span class="cat" style="color: white;"><%=LanguegeBUS.getValue("vi", hlang)%></span>
					<%
		                	}else{
		               %>
					<span class="cat" style="color: white;"><%=LanguegeBUS.getValue("ko", hlang)%></span>
					<% 	
		                	}
			         } %>
				</div>
				<div style="display: block;" class="jewel hidden">
					<div class="jewelToggler">
						<% if(null==hlang || hlang.length() == 0){ %>
						<img alt="" width="24" height="15"
							src="<%=ServletUtils.getBaseUrl(request)%>/css/images/flag_en.gif">
						<%}else{ %>
						<img alt="" width="24" height="15"
							src="<%=ServletUtils.getBaseUrl(request)%>/css/images/<%=session.getAttribute("FLAG")%>">
						<%} %>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!--end header-->
	<br />
	<br />

</body>
</html>
