<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, POJO.*, BUS.*" %>
<%
ServletContext app=getServletContext();;
String language=(String) app.getAttribute("MALL_LA"); %>
<link href="<%=ServletUtils.getBaseUrl(request)%>/FloatingToolbar/css/floating.css" rel="stylesheet" type="text/css">  
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/FloatingToolbar/jquery.easing.1.3.js"></script>
<script type='text/javascript'>
$(document).ready(function(){
	$("#cart").click(function(){
		var user = <%=(String)session.getAttribute("username")%>;
		if(user ==null){
			alert("Bạn chưa đăng nhập!");
			return;
		}
	});
	$('#toTop').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 1000);
		return false;
	});
	
});

</script>

<script>
$(document).ready(function() {

	//Transition you want :)
	var easing_type = 'easeOutBounce';
	
	//The default height for the dock (on mouse out)
	var default_dock_height = '40';
	
	//Expanded height, the height of the dock on mouse over, you have to set it in CSS
	var expanded_dock_height = $('#toolbar').height();
	
	//Fake body height
	var body_height = $(window).height();
	
	//Set the size of #fake_body
	$('#fake-body').height(body_height);
	
	//Set the CSS attribute for #dock
	$('#toolbar').css({'height': default_dock_height, 'position':'absolute', 'top': body_height});
	
	//In case the user resize the browser, we will need to recalculate the height and top for #fake_body and #dock
	$(window).resize(function () {
		
		//Grab the updated height/top
		updated_height = $(window).height() - default_dock_height;
		
		//Set the updated height for #fake_body and top for #dock
		$('#fake-body').height(updated_height);		
		$('#toolbar').css({'top': updated_height});
	});
		
	//The main event for the dock bottom menu
	$('#toolbar').mouseover(function () {
		
		//Recalculate expanded height (always get the latest height), in case user has resized the window
		expanded_height = $(window).height() - expanded_dock_height;
		
		//Animate the height change, set the height to expanded_dock_height and set the top value as well
		$(this).animate({'height':expanded_dock_height,'top': expanded_height},{queue:false, duration:800, easing: easing_type});
		
	}).mouseout(function () {
		
		//Recalculate default body height (always get the latest height), in case user has resized the window
		body_height = $(window).height() - default_dock_height;
		
		//Animate the height change, set the height to default_dock-height and set the top value as well
		$(this).animate({'height':default_dock_height,'top': body_height},{queue:false, duration:800, easing: easing_type});
		
	});
	
});

</script>

<%
String username=null;
String role =null;
username =(String) session.getAttribute("username");
role = (String) session.getAttribute("Role");
%>
<div style="width: 100%;text-align: right">
<div id="toolbar" align="center" class="floating">	

	<ul>
		<li>
			<a id="cart" href="#"><img src="<%=ServletUtils.getBaseUrl(request)%>/FloatingToolbar/images/cart.png" /><label><%=LanguegeBUS.getValue("yourcart",language) %>(0)</label></a>
		</li>		
		<li>
			<a href="#"><img src="<%=ServletUtils.getBaseUrl(request)%>/FloatingToolbar/images/message.png" /><label>Message</label></a>
		</li>
		<li>
			<a href="#" id="toTop"><img src="<%=ServletUtils.getBaseUrl(request)%>/FloatingToolbar/images/up.png" /><label>Up</label></a>
		</li>
	</ul>
</div>
</div>