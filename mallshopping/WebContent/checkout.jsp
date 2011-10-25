<%-- 
    Document   : checkout
    Created on : Jun 1, 2011, 1:41:21 PM
    Author     : admin
--%>
<%@page import="DAO.DeliverCostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List"%>
<%@include file="library.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("checkout", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
		 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>

        <script type="text/javascript"  language="javascript">
        
        $(function(){
        	$("#feeInCity").hide();
        	$("#feeOutTown").hide();
        });
	        function testdata ()
	        {
	        	$("#validReciever").text("");
	            $("#validAddress").text("");
	            $("#validPhone").text("");
	            var reciever = $("#reciever").val();
	            var address = $("#address").val();
	            var phone = $("#phone").val();
	            if(reciever.length==0){
	                $("#validReciever").text("Please enter reciever name !!");
	                return false;
	            }
	            if(address.length==0){
	                $("#validAddress").text("Please enter address!!");
	                return false;
	            }
	            if(phone.length==0){
	                $("#validPhone").text("Please enter phone!!");
	                return false;
	            }
	            
	        }
	        
	        function loadOnSelect(){
	        	var val=document.checkoutform.select.value;
	        	
	        	if(val=='1'){
	        		//alert("1");
	        		$("#feeInCity").show();
	        		$("#feeOutTown").hide();
	        	}else if(val=='2'){
	        		//alert("2");
	        		$("#feeInCity").hide();
	        		$("#feeOutTown").show();
	        	}
	        }
        </script>
        
        
        
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
					 <a rel="nofollow"  href="checkout.html" class="viewmore"><%=LanguegeBUS.getValue("checkout", lang) %></a></li>					
										
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
                    
                <DIV class="border-bot">
                        <DIV class="border-left">

                                <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                                <DIV class="corner-right-top">
                                                        <DIV class="corner-left-bot">
                                                                <DIV class="corner-right-bot"><DIV class="category-title"><div class="tube">
                                                                            
                 <%
                        String message = (String) request.getAttribute("Message");
                        if (message != null) {
                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                        }
                  %>
                  <%
                        String accout = (String)session.getAttribute("username");
                        User u = (User)UserBUS.getUser(accout,lang);
                 %>
                 
                <Br>
                <h2><%=LanguegeBUS.getValue("orderInfo", lang) %></h2>
                <br><br>
                <div class="tooltip"></div>
                <form id="checkoutform"  name="checkoutform" action="checkoutController" method="post" onsubmit="return testdata();">
                <table class="sign" style="width: 620px">
                
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("recievername", lang) %>:</td>
                <td><input type="text" name="reciever" id="reciever" title="Input reciever name"  value="<%=u.getFullName()%>"/></td>
                <td class="error" id="validReciever"></td>
                </tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("address", lang) %>:</td>
                <td><textarea name="address" id="address" title="input address" ><%=u.getAddress()%></textarea></td>
                <td class="error" id="validAddress"></td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("phone", lang) %>:</td>
                <td><input type="text" name="phone"  id="phone" style="width: 100px" value="<%=u.getPhone()%>"/></td>
                <td class="error" id="validPhone"></td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr>
                <td width="20%" class="label"><%=LanguegeBUS.getValue("transport", lang) %>:</td>
                <td width="80%">    
                <select style="width:100px" name="select"  onChange="loadOnSelect()">
                <option value="0"><%=LanguegeBUS.getValue("select",lang) %></option>
                <% 
                	List<Transport> lstTranpost=TransportBUS.lstTransport(lang);
                	if(lstTranpost!=null){
                		for(int i=0;i<lstTranpost.size();i++){
                			Transport tran=lstTranpost.get(i);
                %>
                <option value="<%=tran.getTransportId()%>"><%=tran.getTransportName() %></option>
                <%}
                		}%>
                
                 </select>
                <!--  noi thành -->
                 <table  class="carttable"  id="feeInCity" style="width: 100%">
                        <tr style="border: #fff 1px solid;">                      
                               
                                <td class="title" width="25%"><%=LanguegeBUS.getValue("deli_product_name", lang) %></td>
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("productprice", lang) %></td>
                                  <td  class="title" width="15%"><%=LanguegeBUS.getValue("deli_quantity", lang) %></td>
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("option", lang) %></td>
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("pricedeliverM", lang) %></td>
                                <td class="title" width ="15%"><%=LanguegeBUS.getValue("total", lang) %></td>
                           
                        </tr>
                    <%
                    	ArrayList<Productorderdetail> ctdh = (ArrayList<Productorderdetail>)session.getAttribute("cart");
                   
                    float tongtien=0;
                    if(ctdh!=null){                        
                        for(Productorderdetail ct: ctdh){
                            tongtien =ct.getProducts().getPrice()*ct.getProductNumber();
                            Products p = (Products)ProductBUS.getProducts(ct.getProducts().getProductId(),lang);
                            Manufacturer ma = ManufacturerBUS.getManufacturer(p.getManufacturerId(),lang);
                            Delivercost deliCost=DeliverCostDAO.getDeliverProductId(p.getProductId(),lang);
                            float shippingCost=0;
                            if(null!=p.getDeliverCost()){
                   				Delivercost dc = DeliverCostBUS.getDeliverCostById(p.getDeliverCost().getDeliverCostId(),lang);	
                   				//Stateorder st = StateorderBUS.getStateorder(order.getStateorder().getStateOrderId(), lang); 
                   				shippingCost = DeliverCostBUS.getDeliverCostByProduct(p,p.getPrice()*ct.getProductNumber(),1,lang);
                            }
                            float optionPrice=0;
                            if(ct.getOption() !=null){
                            	Options option= OptionBUS.getOptionByID(ct.getOption().getOptionId(),lang);
                            	if(option!=null){
                            		optionPrice=option.getOptionPrice();
                            	}
                            }
                    %>         
                        <tr style="border: #fff 1px solid;">                       
                            
                               <td ><%=p.getProductName() %></td>           
                               <td ><%=p.getPrice() %></td>
                                <td ><%=ct.getProductNumber() %></td>
                               <td ><%=optionPrice %></td>
                                <td><%=shippingCost %></td> 
                               <td><%=tongtien+shippingCost+optionPrice%></td>
                        </tr>
                    <%  }}//end for
                     %>    
                  </table>
                    
                     <table  class="carttable" id="feeOutTown" style="width: 100%">
                        <tr style="border: #fff 1px solid;">                          
                                <td class="title" width="25%"><%=LanguegeBUS.getValue("deli_product_name", lang) %></td>                             
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("productprice", lang) %></td>
                                    <td  class="title" width="15%"><%=LanguegeBUS.getValue("deli_quantity", lang) %></td>
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("option", lang) %></td>
                                 <td class="title" width="15%"><%=LanguegeBUS.getValue("pricedeliverM", lang) %></td>
                                <td class="title" width ="15%"><%=LanguegeBUS.getValue("total", lang) %></td>
                           
                        </tr>
                    <%
                    	ArrayList<Productorderdetail> ctdh1 = (ArrayList<Productorderdetail>)session.getAttribute("cart");
                        float tongtien1=0;
                           if(ctdh1!=null){  
                        for(Productorderdetail ct: ctdh1){
                        	tongtien1 =ct.getProducts().getPrice()*ct.getProductNumber();
                            Products p = (Products)ProductBUS.getProducts(ct.getProducts().getProductId(),lang);
                            Manufacturer ma = ManufacturerBUS.getManufacturer(p.getManufacturerId(),lang);
                            //Delivercost deliCost=DeliverCostDAO.getDeliverProductId(p.getProductId(),lang);
                            float shippingCost=0;
                            if(null!=p.getDeliverCost()){
                   				Delivercost dc = DeliverCostBUS.getDeliverCostById(p.getDeliverCost().getDeliverCostId(),lang);	
                   				//Stateorder st = StateorderBUS.getStateorder(order.getStateorder().getStateOrderId(), lang); 
                   				shippingCost = DeliverCostBUS.getDeliverCostByProduct(p,p.getPrice()*ct.getProductNumber(),2,lang);
                            }
                            float optionPrice1=0;
                            if(ct.getOption() !=null){
                            	Options option= OptionBUS.getOptionByID(ct.getOption().getOptionId(),lang);
                            	if(option!=null){
                            		optionPrice1=option.getOptionPrice();
                            	}
                            }
                    %>         
                        <tr style="border: #fff 1px solid;">                       
                               <td ><%=p.getProductName() %></td>  
                               <td ><%=p.getPrice() %></td>
                               <td ><%=ct.getProductNumber() %></td>
                               <td ><%=optionPrice1 %></td>
                                <td ><%=shippingCost %></td> 
                               <td ><%=tongtien1+shippingCost+optionPrice1 %></td>
                        </tr>
                    <%  }}//end for
                     %>    
                    </table>
                </td>        
                </tr>  
                <tr><td colspan="3">&nbsp;</td></tr>
                
                </table>

                 <Table class="sign">
                
                <tr>
                <td><BUTTON type="submit" class="button marginleft110"><SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("submit", lang) %></SPAN></SPAN></SPAN></BUTTON>&nbsp;&nbsp;
                <BUTTON type="reset" class="button"><SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("reset", lang) %></SPAN></SPAN></SPAN></BUTTON></td>
                </tr>
                </Table>           

                </form>

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
