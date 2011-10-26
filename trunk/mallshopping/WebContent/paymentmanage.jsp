<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("payment", lang) %></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
 <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
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
					 <a rel="nofollow"  href="login.html" class="viewmore"><%=LanguegeBUS.getValue("payment", lang) %></a></li>					
										
					</ul></div>
					<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
			<div class="clear"></div>
         <!-- -------------Menu left--------------->
         <DIV class="col-left">
            <%@include file="WEB-INF/sellermenu.jsp" %>
         </DIV>
             
        <!-- -------------Content------------- -->
            <DIV class="col-main">
                <DIV class="main-block">
                    
                <DIV class="border-bot">
                        <DIV class="border-left">

                                <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                                <DIV class="corner-right-top">
                                                        <DIV class="corner-left-bot">
                                                                <DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">
                         <h2><%=LanguegeBUS.getValue("payment_manage", lang) %></h2>   
                         <Br>           
                         <% 	
                         		String orderId = request.getParameter("id");
                         		Productorder order = ProductorderBUS.getProductorder(Integer.parseInt(orderId), lang);
                         		Transport t = TransportBUS.getTransport(order.getTransportId(),lang);
                         		Date d = new Date();
                         		User user = (User)UserBUS.getUser((String)session.getAttribute("username"),lang);
                         %>                        
            			<div class="box_ucp_inside" style="text-align:center;">
							
							<center>
							<table  id="tabs1"  class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="95%" style="border:none;text-align:left">
								
                                <tbody>
                                <tr>
                                    <td style="border:none;"></td>
                                    <td colspan="2" style="border:none;"><h2><b><%=LanguegeBUS.getValue("oform", lang)%></b></h2>
                                    		<h4><%=LanguegeBUS.getValue("serialorder", lang)%>: &nbsp; HD00<%=order.getProductOrderId() %>/<%=d.getYear() + 1900%></h4>
                                    </td>
                                    <td style="border:none;"></td>                               
                                </tr>
                                <tr>
                                    <td colspan="4" style="border:none;"><br></td>                         
                                </tr>
                                <tr>
                                    <th class="nonSearch" style="border:none;;text-align:left" width="80"><%=LanguegeBUS.getValue("fullname", lang) %></th>
                                    <td style="border:none;text-align:left" width="120">:&nbsp;<a title="View user information" href="<%=ServletUtils.getBaseUrl(request)%>/admin/userdetail.jsp?Id=<%=user.getAccount() %>" ><input type="text" disabled="disabled" value="<%=user.getFullName()%>" ></a></td>
                                     <th class="nonSearch" style="border:none;;text-align:left" width="90"><%=LanguegeBUS.getValue("recievername", lang) %></th>
                                    <td style="border:none;text-align:left" width="170">:&nbsp;<input type="text" disabled="disabled" value="<%=order.getReciever() %>" ></td>                               
                                   
                                </tr>
                                <tr>
                                    <th class="nonSearch" style="border:none;;text-align:left" ><%=LanguegeBUS.getValue("oDate", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<input type="text" style="width:100px" disabled="disabled" value="<%=order.getOrderDate() %>" ></td>
                                     <th class="nonSearch" style="border:none;;text-align:left;text-align:left" ><%=LanguegeBUS.getValue("address", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<input type="text" disabled="disabled" style="width:180px" value="<%=order.getAddress() %>" ></td>                            
                                   
                                </tr>
                                 <tr>
                                    <th class="nonSearch" style="border:none;;text-align:left" ><%=LanguegeBUS.getValue("transport", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<input type="text" disabled="disabled" style="width:100px" value="<%=t.getTransportName()%>" ></td>
                                    <th class="nonSearch" style="border:none;;text-align:left" ><%=LanguegeBUS.getValue("phone", lang) %></th>
                                    <td style="border:none;text-align:left" class="nonSearch">:&nbsp;<input type="text" disabled="disabled" style="width:100px" value="<%=order.getPhone() %>" ></td>                            
                                </tr>
                                 <tr>
                                    <td colspan="4" style="border:none;"></td>                          
                                   
                                </tr>
                              
                            </tbody></table>	
							<br>
							<table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="90%" style="border:none;">

                                <tbody><tr style="border:none;">
                                    <td class="lstitle" width="10"><%=LanguegeBUS.getValue("exc_id", lang) %></td>                                   
                                    <td class="lstitle" width="200"><%=LanguegeBUS.getValue("product", lang) %></td>    
                                     <td class="lstitle" width="50"><%=LanguegeBUS.getValue("price", lang) %></td>                                                       
                                    <td class="lstitle" width="50"><%=LanguegeBUS.getValue("amount", lang) %></td>
                                     <td class="lstitle" width="50"><%=LanguegeBUS.getValue("option", lang) %></td>
                                                                   
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("de_cost_deliver_cost", lang) %><br>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td> 
                                    <td class="lstitle" width="100"><%=LanguegeBUS.getValue("total", lang) %><br>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>    
                                    <td class="lstitle" width="100"> <%=LanguegeBUS.getValue("payment", lang) %> </td>   
                                </tr>
                                <% List<Productorderdetail> lstDetail = ProductorderdetailBUS.lstOrderdetailBy(order,lang);
                                   if(null==lstDetail || lstDetail.isEmpty()){
                                %>
	                                <tr class="order_row">
	                               			<td class="order_row" colspan="8"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
	                               	</tr>	
                               	<%}else{
                               		for(int i=0;i<lstDetail.size();i++){
                               			Productorderdetail detail = (Productorderdetail)lstDetail.get(i);
                               			Products p = ProductBUS.getProducts(detail.getProductId(),lang);
                               			//Delivercost dc = DeliverCostBUS.getDeliverCostById(p.getDeliverCost().getDeliverCostId(),lang);
                               			Deliver deliver = DeliverBUS.getDeliverByPODetail(detail.getProductOrderDetailId(),lang);
										Deliverstatus deliverStatus = DeliverStatusBUS.getDeliverStatus(deliver.getDeliverstatusID(), lang);
										float optionPrice=0,shippingCost=0;
										String price="",shippingCostStr="",optionPriceStr="",totalStr="";
			                            if(detail.getOption() !=null){
			                            	Options option= OptionBUS.getOptionByID(detail.getOption().getOptionId(),lang);
			                            	if(option!=null){
			                            		optionPrice=option.getOptionPrice();
			                            	}
			                            }
			                            
                           				if(null!=p.getDeliverCost()){
                               				Delivercost dc = DeliverCostBUS.getDeliverCostById(p.getDeliverCost().getDeliverCostId(),lang);	
                               				Stateorder st = StateorderBUS.getStateorder(order.getStateorder().getStateOrderId(), lang); 
                               				shippingCost = DeliverCostBUS.getDeliverCostByProduct(p,p.getPrice()*detail.getProductNumber(),order.getTransportId(),lang);
                               				//if(st.getStateOrderId()==1){ 
                               				//	shippingCost=dc.getCost() ;
                               				//}else{ 
                               				//	shippingCost=dc.getCost()+ dc.getFeeExtra();
                               				//}
                               			} 
                           				float tongtien=ResourcesDefault.getTotalMoney(p.getPrice(),detail.getProductNumber(),optionPrice,shippingCost);
                           			 if("MALL_VN".equals(lang)){
                                     	price=ResourcesDefault.priceVNFormat(p.getPrice());
                                     	shippingCostStr=ResourcesDefault.priceVNFormat(shippingCost);
                                     	optionPriceStr=ResourcesDefault.priceVNFormat(optionPrice);
                                     	totalStr=ResourcesDefault.priceVNFormat(tongtien+shippingCost+optionPrice);
                                     }else{
                                     	price=p.getPrice()+"";
                                     	shippingCostStr=shippingCost+"";
                                     	optionPriceStr=optionPrice+"";
                                     	totalStr=(tongtien+shippingCost+optionPrice)+"";
                                     }
                               	%>
		                               	<tr class="order_row">
		                               			<td class="order_row" ><%=detail.getProductOrderDetailId() %></td>
		                               			<td class="order_row" style="text-align:left" ><a href="productdetail.html?Id=<%=p.getProductId()%>"> <%=p.getProductName()%></a></td>
		                               			<td class="order_row" ><%=price %></td>
		                               			<td class="order_row" ><%=detail.getProductNumber() %></td>
		                               			<td class="order_row" ><%=optionPriceStr %></td>		                               			
		                               			<td class="order_row" style="text-align:right"><%=shippingCostStr %>
		                               			</td>
		                               			<td class="order_row" style="text-align:right"><%=totalStr %> </td>
		                               			<td class="order_row" >
		                               				<% 
		                               					if(detail.getOrderDetailStatusId()== 1 && deliverStatus.getDeliverStatusId()==1){ %>
		                               						<a href="payment.html?id=<%=detail.getProductOrderDetailId()%>"><img
																						alt="payment" height="16"
																						src="css/images/dolar.png" width="17" />
																				</a>
		                               				<%} %>
		                               			</td>
		                               	</tr>
                               	<%	}
                               	} %>
                               		
                            </tbody></table>	
                            </center>
						<div class="clear"></div>
						</div>
				<br><br>
            	<div class="footer blog">
                	<%@include file="WEB-INF/footer.jsp" %>
                </div>
                </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
            </DIV>
 
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
 
        </DIV></DIV>                                                       

</body>
</html>