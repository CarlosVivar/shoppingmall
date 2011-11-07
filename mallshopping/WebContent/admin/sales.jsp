<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,UTIL.*,java.util.List"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales manage</title>
<meta name="description" content="ELI Mall Shopping Admin" />
<meta name="keywords" content="Security" />
<meta name="robots" content="index, follow" />
<meta name="google-site-verification"
	content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
<link rel="shortcut icon" type="image/x-icon"
	href="css/images/favicon.ico" />

<link href="css/style.css" media="screen" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/jquery.popupWindow.js"></script>
<script type="text/javascript"
	src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/js/service.1.0.6.js"></script>

<script type="text/javascript">
	$(function() {
		$('.tab a:first-child').click(function() {
			switch_tabs($(this));
			return false;
		});
		switch_tabs($('.selected'));
	});

	function switch_tabs(obj) {
		$('.table_ucp').hide();
		$('.tab a:first-child').removeClass("selected");
		var id = obj.attr("rel");
		$('#' + id).show();
		obj.addClass("selected");
	}
	function openPage(path) {
		window.location.href = path;
	}
</script>

</head>
<body id="travel">
	<div id="wrapper">

		<div id="header">
			<%@include file="template/header.jsp"%>
		</div>
		<!--end header-->

		<div id="content">
			<div style="display: block;" class="ctnAlert">
				<div style="height: 208px;" class="spyWrapper">
					<ul class="ctnAlert_inside spy">

						<li style="height: 26px; opacity: 1; display: block;"><a
							rel="nofollow" href="index.html" class="viewmore">ADMIN </a>
							&nbsp; <img src="css/images/icon-arrow1.gif">&nbsp; <a
							rel="nofollow" href="product.html" class="viewmore">MANAGE
								SALES</a>
						</li>

					</ul>
				</div>
				<a class="closeAlert"><img src="css/images/icon_closeAlert.gif"
					alt="close" width="8" height="8">
				</a>
			</div>

			<div id="col1">
				<div class="left_content_ucp">
					<div class="box_msg">
						<p>
							<a class="msg clear" href="inbox.html">Messages (<strong>0</strong>)</a>
						</p>
					</div>


					<div class="module_ucp boxRadius">
						<h4 class="title">Manage</h4>
						<ul>
							<li><a href="index.html">Home</a>
							</li>

							<li><a href="user.html">User</a>
							</li>
							<li class="active"><a href="sales.html">Sales</a>
							</li>
							<li><a href="product.html">Products</a>
							</li>
							<li><a href="order.html">Order</a>
							</li>
						</ul>
					</div>
				</div>
				<%@include file="template/leftmenu.jsp"%>
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
								<h2 class="title">Sales manage</h2>
								<div id="usual2">

									<ul class="tab">
										<li><a rel="tabs1" href="#tabs1" class="selected"><span>Admin</span>
										</a>
										</li>
										<li><a rel="tabs2" href="#tabs2"><span>Seller</span>
										</a>
										</li>
										<li><a rel="tabs3" href="#tabs3"><span>user</span>
										</a>
										</li>
									</ul>
									<div class="clear"></div>
									<table id="tabs1" class="table_ucp" border="0" cellpadding="0"
										cellspacing="0" width="100%">

										<tbody>
											<tr>
												<td class="lstitle" width="110">Username</td>
												<td class="lstitle" width="340"></td>
												<td class="lstitle" width="80">Date</td>
												<td class="lstitle" width="50">Role&nbsp;</td>
											</tr>



											<tr class="order_row">
												<td class="nonSearch" colspan="4" align="center">Currently,
													there aren`t accounts.</td>
											</tr>



										</tbody>
									</table>

									<table id="tabs2" class="table_ucp" border="0" cellpadding="0"
										cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td class="lstitle" width="110">Người đặt hàng</td>
												<td class="lstitle" width="340">Tên sản phẩm</td>
												<td class="lstitle" width="80">Ngày đặt hàng</td>
												<td class="lstitle" width="50">&nbsp;</td>
											</tr>
										</tbody>
									</table>

									<table id="tabs3" class="table_ucp" border="0" cellpadding="0"
										cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td class="lstitle" width="110">Người đặt hàng</td>
												<td class="lstitle" width="340">Tên sản phẩm</td>
												<td class="lstitle" width="80">Ngày đặt hàng</td>
												<td class="lstitle" width="50">&nbsp;</td>
											</tr>
										</tbody>
									</table>

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
		<div id="ad_zone_footer_b1" style="width: 960px"></div>
		<div id="footer">
			<%@include file="template/footer.jsp"%>
		</div>
		<!--end footer-->
		<!--End footer-->
	</div>


</body>
</html>