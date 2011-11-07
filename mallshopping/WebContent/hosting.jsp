<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("home", lang)%></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

</head>
<%
	if (session.getAttribute("loadIntroduce") != null) {
%>
<script type="text/javascript">
	
	$(document).ready(function() {
		setTimeout("loadPopup()", 1000);
	})
;
	 function loadPopup(){
		createTag();
		$("#showIntroduces").fancybox({
			'width' : 1000,
			'height' : 620,
			'padding' : 0,
			'autoScale' : false,
			'transitionIn' : 'none',
			'transitionOut' : 'none',
			'type' : 'iframe',
			'hideOnOverlayClick' : true,
			'hideOnContentClick' : false,
			
		}).trigger('click');
	    //launch on load after 5 second delay
		//setTimeout('$("#showIntroduces").fancybox.close()', 42000);
		//setTimeout("removeTag()", 43000);
	} 
	function createTag(){
		myA=document.createElement("A");
		myA.setAttribute("id","showIntroduces");
		myA.setAttribute("href","welcome.html");
		document.body.appendChild(myA);
	}
	function removeTag(){
		myA=document.getElementById("showIntroduces");
		document.body.removechild(myA);
	}
</script>
<%
	session.removeAttribute("loadIntroduce");
	}
%>
<body>

	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">
				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><img
								src="admin/css/images/icon-arrow1.gif">&nbsp;<a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang)%>
							</a>
						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8">
					</a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/leftmenu.jsp"%>
				</DIV>

				<!-- -------------Content------------- -->
				<DIV class="col-main">
					<div id="page">
						<script src="scripts/slidemenu.js" type="text/javascript"></script>
						<ul class="sidemenu-tab">
							<li class="active"><a title="Hosting Cá Nhân"
								href="web-hosting-ca-nhan.php"><span>Hosting Cá Nhân</span>
							</a>
							</li>
							<li><a title="Hosting Doanh Nghiệp"
								href="web-hosting-doanh-nghiep.php"><span>Hosting
										Doanh Nghiệp</span>
							</a>
							</li>
							<li><a title="Hosting Không Giới Hạn"
								href="hosting-khong-gioi-han.php"><span>Hosting Không
										Giới Hạn</span>
							</a>
							</li>
							<li><a title="Windows Hosting" href="windows-hosting.php"><span>Windows
										Hosting</span>
							</a>
							</li>
							<li><a title="Free Web Hosting" href="free-web-hosting.php"><span>Free
										Web Hosting</span>
							</a>
							</li>
						</ul>
						<h1>Hosting cá nhân - Tốc độ cao cùng chi phí thấp nhất</h1>
						<p class="hearText">
							<img src="images/web-hosting.gif" class="floatleft" alt="">Với
							hệ thống Server Cisco, DELL và Supermicro với 2 x CPU Intel&reg;
							Xeon&reg; Westmere Quad Core công nghệ siêu phân luồng với 8
							Core(16 cpus) .Server được đặt tại Việt Nam cùng đường truyền tốc
							độ cao giúp cho website của bạn có tốc độ truy cập rất nhanh và
							luôn ổn định.Với chi phí hợp lý thích hợp sử dụng cho các website
							cá nhân , blog , giới thiệu , bán hàng vừa và nhỏ.
						</p>
						<div id="pricingPseudoTable" class="clear">
							<div class="column noShadow">
								<div id="column1">
									<div class="col1">
										<p class="plan">hostEcon1</p>
										<p>&nbsp;</p>
									</div>
									<div class="col2">
										<p class="price">
											25.500<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a
												href="http://www.digistar.vn/manage/cart.php?a=add&amp;pid=89">Đặt
												mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												30.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												27.000<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												25.500<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">500 MB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p>
											<span class="pricingBigger"><font class="dungluong">15GB</font>
											</span>
										</p>
										<p>
											<span class="pricingBigger">Băng thông</span>
										</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>

									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 1 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 5 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>

									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
							<div class="column noShadow">
								<div id="column2">
									<div class="col1">
										<p class="plan">hostEcon2</p>
									</div>
									<div class="col2">
										<p class="price">
											38.250<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a
												href="http://www.digistar.vn/manage/cart.php?a=add&amp;pid=90">Đặt
												mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												45.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												40.500<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												38.250<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">1GB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p>
											<span class="pricingBigger"><font class="dungluong">24GB</font>
											</span>
										</p>
										<p>
											<span class="pricingBigger">Băng thông</span>
										</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>
									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 2 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 10 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>
									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
							<div class="column noShadow">
								<div id="column3">
									<div class="col1">
										<p class="plan">hostEcon3</p>
									</div>
									<div class="col2">
										<p class="price">
											55.250<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a
												href="http://www.digistar.vn/manage/cart.php?a=add&amp;pid=91">Đặt
												mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												65.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												58.500<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												55.250<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">1.5GB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p>
											<span class="pricingBigger"><font class="dungluong">36GB</font>
											</span>
										</p>
										<p>
											<span class="pricingBigger">Băng thông</span>
										</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>
									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 3 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 15 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>
									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
							<div class="column noShadow">
								<div id="column4">
									<div class="col1">
										<p class="plan">hostEcon4</p>
									</div>
									<div class="col2">
										<p class="price">
											80.750<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a href="http://digistar.vn/manage/cart.php">Đặt mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												95.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												85.500<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												80.750<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">2GB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p class="pricingBigger">
											<font class="dungluong">60GB</font>
										</p>
										<p class="pricingBigger">Băng thông</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>
									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 4 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 20 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>
									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
							<div class="column noShadow">
								<div id="column5">
									<div class="col1">
										<p class="plan">hostEcon5</p>
									</div>
									<div class="col2">
										<p class="price">
											123.250<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a href="http://digistar.vn/manage/cart.php">Đặt mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												145.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												130.500<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												123.250<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">2.5GB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p class="pricingBigger">
											<font class="dungluong">86GB</font>
										</p>
										<p class="pricingBigger">Băng thông</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>
									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 5 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 25 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>
									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
							<div class="column noShadow">
								<div id="column6">
									<div class="col1">
										<p class="plan">hostEcon6</p>
									</div>
									<div class="col2">
										<p class="price">
											170.000<br>
											<span>/tháng</span>
										</p>
										<p class="contractInfo">(Đơn vị VNĐ, giá giảm theo thời
											gian thanh toán)</p>
										<p class="signUpPar">
											<a href="http://digistar.vn/manage/cart.php">Đặt mua</a>
										</p>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												200.000<span>/tháng</span>
											</p>
											(Thanh toán 1 năm)
											<p></p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												180.000<span>/tháng</span>
											</p>
											(Thanh toán 2 năm)
											<p class="badge10">-10%</p>
										</div>
									</div>
									<div class="col4">
										<div class="yearPrice">
											<p>
												170.000<span>/tháng</span>
											</p>
											(Thanh toán 3 năm)
											<p class="badge15">-15%</p>
										</div>
									</div>
									<div class="col4">
										<p class="pricingBigger">
											<font class="dungluong">3GB</font>
										</p>
										<p>Dung lượng lưu trữ</p>
										<p>Công nghệ Raid 6</p>
									</div>
									<div class="col5">
										<p class="pricingBigger">
											<font class="dungluong">124GB</font>
										</p>
										<p class="pricingBigger">Băng thông</p>
									</div>
									<div class="col6">
										<p class="pricingBigger">Hỗ trợ 1 tên miền</p>
									</div>
									<div class="col7">
										<p class="pricingBigger">Không giới hạn tên miền con</p>
									</div>
									<div class="col8">
										<p>Hỗ trợ 6 tài khoản FTP</p>
									</div>
									<div class="col9">Hỗ trợ 30 tài khoản Email</div>
									<div class="col10">
										<p>cPanel bản mới nhất</p>
										<p>
											(<a target="_blank"
												href="http://x3demob.cpx3demo.com:2082/login/?user=x3demob&amp;pass=x3demob">demo</a>)
										</p>
									</div>
									<div class="col10">
										<p>Miễn phí cài đặt</p>
									</div>
									<div class="col12">
										<p>Hỗ trợ 24/24 qua hệ thống hỗ trợ</p>
									</div>
								</div>
							</div>
						</div>

						<div class="clean"></div>
						<div class="cach"></div>

						<div class="bang">
							<div class="th">
								<strong>Chi phí các tùy chọn thêm</strong>
							</div>
							<div class="td">Thêm 1 tên miền hỗ trợ</div>
							<div class="td1">60,000 VNĐ / tháng</div>
							<div class="atl">
								<div class="td">Thêm 1000 MB dung lượng lưu trữ</div>
								<div class="td1">60,000 VNĐ / tháng</div>
							</div>

							<div class="td">Thêm 1 IP riêng</div>
							<div class="td1">160,000 VNĐ / tháng</div>
							<div class="atl">
								<div class="td">Thay đổi domain chính</div>
								<div class="td1">50,000 VNĐ / lần</div>
							</div>
						</div>



						<div class="overview-page-left-inner">
							<div class="overview-row">
								<div class="box1">
									<h4>Cấu hình máy chủ mạnh mẽ</h4>
									<p>Sử dụng hệ thống máy chủ Cisco, Dell và SuperMicro với
										bộ vi xử lý Intel Nahalem, ổ đĩa cứng SaS và công nghệ lưu trữ
										raid 6 đem lại tốc độ xữ lý và an toàn dữ liệu tốt nhất.</p>
								</div>
								<div class="box2">
									<h4>Bảng điều khiển thân thiện</h4>
									<p>Sử dụng cPanel phiên bản mới nhất với các tính năng nổi
										bật và giao diện thân thiện : Webalizer, Raw Log Manager,
										Password Protected Directories, Custom Error Pages,Hotlink
										Protection, IP Deny Manager ...</p>
								</div>
							</div>
							<div class="overview-row">
								<div class="box3">
									<h4>Phần mềm và cơ sở dữ liệu</h4>
									<p>Không giới hạn MySQL Databases (MySQL 5.x +) với
										phpMyAdmin. Hỗ trợ : PHP 4 &amp; PHP 5 (Zend Optimizer, GD,
										cURL), Safemod Off. Hỗ trợ SSL, Microsoft Frontpage...</p>
								</div>
								<div class="box4">
									<h4>Tính năng Email</h4>
									<p>POP3 Email Accounts với SMTP.Truy cập webmail: Horde,
										SquirrelMail, RoundCube, Hỗ trợ IMAP. Chống spam với
										SpamAssassin, Autoresponders, Mail Forwards, Email Aliases,
										Mailing Lists</p>
								</div>
							</div>
							<div class="overview-row">
								<div class="box5">
									<h4>Hỗ trợ kỹ thuật</h4>
									<p>Với đội ngũ kỹ thuật nhiều năm kinh nghiệm và nhiệt
										tình, tất cả các gói dịch vụ được hỗ trợ 24/7/365 thông qua hệ
										thống phiếu hỗ trợ. Dữ liệu được backup hàng tuần và máy chủ
										đươc theo dõi liên tục nhằm duy tri hệ thống luôn ổn định.
										Ngoài ra quý khách được hỗ trợ qua cộng đồng trên diễn đàn và
										kho tài liệu, kiến thức phong phú của DigiStar.</p>
								</div>
								<div class="box6">
									<h4>Tương thích hầu hết các mã nguồn</h4>
									<p>Thấu hiểu được nhu cầu của khách hàng, DigiStar luôn cố
										gắng xây dựng và cấu hình máy chủ một cách tối ưu và đầy đủ
										nhất để tương thích, cũng như hỗ trợ cài đặt sẵn cho tất cả
										các thông dụng hiện nay như Joomla, Wordpress, Drupal,
										OpenCart, vBulletin, phpBB, ZenCART, CubeCart, GuestBook...</p>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</DIV>

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>
				</DIV>

			</DIV>


		</DIV>
	</DIV>
</body>
</html>
