<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="java.util.ArrayList"%>
<%@include file="../library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Fancy Sliding Form with jQuery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Fancy Sliding Form with jQuery" />
        <meta name="keywords" content="jquery, form, sliding, usability, css3, validation, javascript"/>
        <link rel="stylesheet" href="../css/vuhong_style.css" type="text/css" media="screen"/>
		<script type="text/javascript">	  	
		function refresh(){
			parent.location="../index.html";
		}
		
		</script>		
		<style>
		</style>
    </head>
    <body>
      <div>
      	<div id="title">
      		<label class="vuhong_title">Đăng kí thành công</label>
      		<hr>
      		<label class="vuhong_intro">
      		<br>Cám ơn bạn đã đăng kí trở thành Shop bán hàng trên <strong>khongmac.com</strong>
      		<br><br>Chúng tôi sẽ kiểm tra tài khoản và các thông tin mà bạn đã đăng kí. Trong vòng từ 5-7 ngày, chúng tôi sẽ thông báo kết quả cho bạn.
      		<br>Khi bạn được xác nhận trở thành Shop bán hàng trên <strong>khongmac.com</strong>, bạn được hưởng mọi quyền lợi của người bán hàng trên website của chúng tôi.
      		<br>Bạn có thể click vào <a href="#" onclick="refresh()">đây</a> để tiếp tục mua sắm hoặc tham quan.
      		<br><br>Kính chào!
      		<br><strong>khongmac.com</strong>
      		
      		</label>
      	</div>
      </div>
    </body>
</html>