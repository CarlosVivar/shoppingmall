<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../library.jsp" %>
<%@page import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj = request.getAttribute("userPOJO");
            if (obj == null) {
                String url = "/manageOrderDetailController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("orderInfo", lang) %></title>
		<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
		 <script type="text/javascript">
             function openPage(path) {   window.location.href = path;   }
         </script>
</head>
<body>
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
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="inbox.jsp">Messages (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.jsp"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		      <li class="active"><a href="user.jsp"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/statisticsAdmin.jsp""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="product.jsp"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.jsp"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
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
			
   <%           
           String id_order_test = request.getParameter("Id");
               int id_order = Integer.parseInt(id_order_test);
        
                Productorder info_order = (Productorder) ProductorderBUS.getProductorder(id_order,lang);
           //    String myacc = (String)session.getAttribute("username") ;

                    User newUser = (User)request.getAttribute("userPOJO"); 
            
                 //   newUser = UserBUS.getUser(myacc);
               
                  int transport_id = info_order.getTransportId();
                  Transport mytransport = TransportBUS.getTransport(transport_id,lang);
                  Date d = new Date();
                                                                                             
             %>
              <div class="top_box_ucp">
                    <div class="ltop_box_ucp"></div>
                    <div class="rtop_box_ucp"></div>
                </div>
                
              
				<div class="center_box_ucp">
					<div class="box_ucp_inside">
					<h2 class="title"><%=LanguegeBUS.getValue("orderNo.", lang) %>: &nbsp; HD00<%=info_order.getProductOrderId()%>/<%=d.getYear()+1900%></h2>
             	<div style="float: right ! important;">
             		 <a  href="#"  title="Send mail">
                            <img alt="" height="18" src="css/images/messaging.png"></a>&nbsp;
                        <a  href="#" onclick="javascript:window.print(); return false;" title="Print">
                            <img alt="" height="18" src="css/images/print_version.gif"></a>&nbsp;
                            <a href="" target="_blank"  title="Export PDF">
                            <img alt="" height="23" width="21" src="css/images/pdf_button.png"></a>&nbsp;
                            <a href="" target="_blank"  title="Export Excel">
                            <img alt="" height="16" width="15" src="css/images/Excel-icon.png"></a>
             	</div><br/>
				<div class="clear"></div>
             	<center>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="95%" style="border:none;text-align:left">

                                <tbody>
                                <tr >
                                    <th class="nonSearch" width="90"><%=LanguegeBUS.getValue("fullname", lang) %></th>
                                    <td style="border:none;text-align:left" width="130">:&nbsp; <a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.jsp?Id=<%=info_order.getAccount() %>" ><%=newUser.getAccount() %></a></td>
                                     <th class="nonSearch" width="80"><%=LanguegeBUS.getValue("recievername", lang) %></th>
                                    <td style="border:none;text-align:left" width="150">:&nbsp;<%=info_order.getReciever() %></td>                               
                                   
                                </tr>
                                <tr>
                                    <th class="nonSearch" ><%=LanguegeBUS.getValue("oDate", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<%= info_order.getOrderDate() %></td>
                                     <th class="nonSearch" ><%=LanguegeBUS.getValue("address", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<%=info_order.getAddress() %></td>                            
                                   
                                </tr>
                                 <tr>
                                    <th class="nonSearch" ><%=LanguegeBUS.getValue("total", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<%= info_order.getTotalMoney() %>&nbsp;$</td>
                                    <th class="nonSearch" ><%=LanguegeBUS.getValue("phone", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<%=info_order.getPhone() %></td>                            
                                   
                                </tr>
                                 <tr>
                                    <th class="nonSearch" ><%=LanguegeBUS.getValue("fTransport", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<%=mytransport.getTransportName() %></td>
                                    <th class="nonSearch" >&nbsp;</th>
                                    <td style="border:none;text-align:left" class="nonSearch" >&nbsp; </td>                            
                                   
                                </tr>
                              
                            </tbody></table>	
                            </center>
                            
							<div class="clear"></div>	
							<br/><br/>
							<div class="clear"></div>
							<center>
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="80%">

                                <tbody><tr>
                                    <td class="lstitle" width="30">&nbsp; </td>
                                    <td class="lstitle" width="180"><%=LanguegeBUS.getValue("product", lang) %></td>
                                    <td class="lstitle" width="70"><%=LanguegeBUS.getValue("amount", lang) %></td>
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("total", lang) %></td>                                 
                                   
                                </tr>
                               <%
			                                         
					                    List<Productorderdetail> nList = ProductorderdetailBUS.getListProductorderdetail(id_order,lang) ;
					                    float tongtien=0;    
					                    for(int i=0;i<nList.size();i++){
					                         
					                       Productorderdetail prodet  = nList.get(i);
					                       int id_product = prodet.getProductId();
					                                 Products pro = ProductBUS.getProducts(id_product,lang);
					                        tongtien += prodet.getTotalMoney();
			                        %>
                               		<tr class="order_row">
                               			
                               			<td class="nonSearch"><%= i+1 %></td>
                               			<td class="nonSearch"><a title="View product information" href="productdetail.jsp?Id=<%=pro.getProductId()%>" ><%= pro.getProductName() %></a></td>
                               			<td class="nonSearch" > <%= prodet.getProductNumber() %></td>
                               			<td class="nonSearch" > <%= prodet.getTotalMoney() %></td>
                               			
                               		</tr>	
                               		<%			
                               				
                               			}
									%>
									<tr>
									<td><%=LanguegeBUS.getValue("total", lang) %>:</td>
									<td colspan="2"></td>
									<td class="lstitle"> <%=tongtien%> </td>
									</tr>
                            </tbody></table>	
                            </center>
                           <% if(info_order.getStateorder().getStateOrderId()!=1) {%>
							<br/>
							<br/>
							 <table>
								 <tr>	
								 	
									<td><form action="<%=ServletUtils.getBaseUrl(request)%>/manageDeliveryController" method="post" >																									
										<input type="hidden" name="Id" value="<%=info_order.getProductOrderId() %>"/>								
										<input class="btn_submit" type="submit" value=" <%=LanguegeBUS.getValue("deliver", lang) %> " />
									</form></td>
									<td>
										<input class="btn_submit" type="button" value=" <%=LanguegeBUS.getValue("cancel", lang) %> " onclick="openPage('order.html').call(this)" />
									</td>
						 			
								</tr>	
							</table>
						<%}else{
							Stateorder st = StateorderBUS.getStateorder(1,lang);
						%>
							<br/>
							<br/>
							 <div class="listing_input">
							 	<span style="font-weight:bold;font-size:11pt;color:red;"><%=st.getStateOrderName()%></span>
							 </div>
						<%} %>		
						<br/>
							<br/>		
			 				
		</div></div>
		<div class="bottom_box_ucp">
                    <div class="lbottom_box_ucp"></div>
                    <div class="rbottom_box_ucp"></div>
                </div>	
		<div class="clear"></div>
	

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
</html>