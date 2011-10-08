    <%-- 
    Document   : register
    Created on : May 24, 2011, 9:51:25 AM
    Author     : admin
--%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("help", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        </head>
    <body>
         <DIV class="site-container">
        <DIV class="page">
            
       <!-- ---------Begin Header--------------------- -->     
        <DIV class="header">	

            <%@include file="WEB-INF/header.jsp" %>
        </DIV>    
        <!-- -------------MIDDLE------------- -->
        <DIV class="col3-layout">
	        <div class="clear"></div>
		        <div style="display: block;" class="ctnAlert">	
					 <div style="height: 208px;" class="spyWrapper">
					 <ul class="ctnAlert_inside spy">
					 
					 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>
					   </a>&nbsp; <img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
					 <a rel="nofollow"  href="register.html" class="viewmore"><%=LanguegeBUS.getValue("register", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/leftmenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">
                <DIV class="main-block">
                        
                                                                            
 <div id="vuhong_div_table" style="width: 600px;"> 
      <div style="text-align: center;" ><img src="css/images/quytrinh.jpg" width="586" height="134" /></div>
      <div id="vuhong_div_table_row">
	  	<div id="vuhong_div_table_cell" style="width: 150px;text-align: center;font-size: 40px">1</div>
		<div id="vuhong_div_table_cell" style="width: 450px">
		There is no fee to become a member of Elisoft. <br/>
		Once you have registered, all services are free of charge for the buying customers.<br/>
		Not yet a member of Elisoft?
		</div>
	  </div>
	  <br/><br/>
	  <div id="vuhong_div_table_row">
	  	<div id="vuhong_div_table_cell" style="width: 150px;text-align: center;font-size: 40px">2</div>
		<div id="vuhong_div_table_cell" style="width: 450px">
		After you registered! Click login button and go shopping...
		</div>		
	  </div>
	   <br/><br/>
	  <div id="vuhong_div_table_row">
	  	<div id="vuhong_div_table_cell" style="width: 150px;text-align: center;font-size: 40px">3</div>
		<div id="vuhong_div_table_cell" style="width: 450px">
		Having selected your wish item(s), click on ‘Add to Cart’ (for multiple items) from the item description page.<br/>
		This will lead you to order page or shopping cart page. <br/>
		On these pages, please make sure that your selection, option details, quantity, delivery fee , discounted price and so on. after that please click on place order button.<br/>
		Please be reminded that you can save the cost of your worldwide shipping by using shopping cart for multiple items.<br/>
		We accept all major credit cards including ATM, PayPal Express Checkout and so on.
		</div>
	  </div>
	   <br/><br/>
	  <div id="vuhong_div_table_row">
	  	<div id="vuhong_div_table_cell" style="width: 150px;text-align: center;font-size: 40px">4</div>
		<div id="vuhong_div_table_cell" style="width: 450px">
		Also, if you paid more due to overestimated weight, in this case, we refund you differences through your Cash Balance.<br/>
		Your packages may be subject to the customs fees and import duties of the country to which you have your order shipped. These charges are always the recipient's responsibility.
		</div>
	  </div>
	   <br/><br/>
	  <div id="vuhong_div_table_row">
	  	<div id="vuhong_div_table_cell" style="width: 150px;text-align: center;font-size: 40px">5</div>
		<div id="vuhong_div_table_cell" style="width: 450px">
		You can track your ordered item(s) not only for worldwide shipping but also domestic delivery through at order details on Elisoft, on this page, you can also check the shipping information.
		</div>
	  </div>
</div>
  <DIV class="category-title"><div class="tube">
               </div></DIV></DIV></DIV></DIV></DIV></DIV>
 
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
      
    </body>
</html>
