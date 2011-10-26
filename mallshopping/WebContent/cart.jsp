<%-- 
    Document   : cart
    Created on : May 27, 2011, 2:23:14 PM
    Author     : admin
--%>
<%@page import="java.util.ArrayList"%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("yourcart", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script>
               
    </head>
    <script type="text/javascript">
    function goBack() {
		history.go(-2);
	}
    </script>
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
					 <a rel="nofollow"  href="cart.html" class="viewmore"><%=LanguegeBUS.getValue("cart", lang) %></a></li>					
										
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
                
                <!--begin contain-->
                
                    <%
                    if(session.getAttribute("cart")==null){
                    %>
                    <table>
                        <tr>
                            <td style="font-size:12pt;color:Red">
                                <span style="text-align:center"><%=LanguegeBUS.getValue("mCart", lang) %></span>
                            </td>
                        </tr>
                        
                    </table>
                    <%
                    }else{
                    %>
                    
                    <h2><%=LanguegeBUS.getValue("yourcart", lang) %>:</h2><br>
                    <div class="box_ucp_inside" >
                    <table  id="tabs1"  class="table_ucp" >
                        <tr >                          
                                <td colspan="2" class="lstitle" width="40%" ><%=LanguegeBUS.getValue("productinfo", lang) %></td>
                                <td class="lstitle" width="20%" ><%=LanguegeBUS.getValue("productnumber", lang) %></td>
                                <td class="lstitle" width ="15%" ><%=LanguegeBUS.getValue("total", lang) %> <br> (<%=LanguegeBUS.getValue("dolar",lang) %>)</td>
                           
                        </tr>
                    <%
                        
                    	ArrayList<Productorderdetail> ctdh = (ArrayList<Productorderdetail>)session.getAttribute("cart");
                        float tongtien=0;
                        for(Productorderdetail ct: ctdh){
                            
                            Products p = (Products)ProductBUS.getProducts(ct.getProducts().getProductId(),lang);
                            Productphotos pic = ProductPhotoBUS.lstProductPhoto(ct.getProducts(),lang);
                            Manufacturer ma = ManufacturerBUS.getManufacturer(p.getManufacturerId(),lang);
                            String optionDescription="";
                            String optionPrice="";
                            float tempTotal=0;
                            if(ct.getOption() !=null){
                            	Options option= OptionBUS.getOptionByID(ct.getOption().getOptionId(),lang);
                            	if(option!=null){
                            		optionDescription=option.getDescription();
                            		tempTotal=(ct.getProducts().getPrice()*ct.getProductNumber())+option.getOptionPrice();                         		
                            	}
                            }else{                            	
                            	tempTotal=ct.getProducts().getPrice()*ct.getProductNumber();
                           
                            }
                            tongtien+=tempTotal;
                          
                    %>         
                        <tr class="order_row" >
                            <td class="order_row" style="text-align:center ; vertical-align: middle;" valign="middle">
                                <A title="<%=p.getProductName() %>" href="productdetail.html?Id=<%=p.getProductId() %>" style="display: block">
                                <img title="<%=p.getProductName() %>" width="70px" style="max-height: 80px"  alt="product images" src="images/fashion/<%=pic.getProductPhotoName() %>" /></a>
                            </td>
                            <td class="order_row" style="text-align:left;">
                                <ul>
                                    <li><%=LanguegeBUS.getValue("deli_product_name", lang) %>:<b> <%=p.getProductName()%></b></li>
                                    <li>(<%=LanguegeBUS.getValue("color", lang) %>:<%=p.getColor()%> &nbsp; - &nbsp; Size: <%=p.getSize() %>)</li>
                                    <li>(<%=LanguegeBUS.getValue("productoptions", lang) %>:&nbsp;<%=optionDescription %>)</li>
                                    
                                    <li><%=LanguegeBUS.getValue("manufac", lang) %>:<b> <%=ma.getManufacturerName() %></b></li>
                                </ul>    
                             </td>
                             <td class="order_row" style="text-align:left;">
                              <form method="post" action="cartController">
                                 <ul>
                                    <li>
                                        &nbsp;&nbsp;<%=LanguegeBUS.getValue("price", lang) %>: <b style="color: red" ><%=ResourcesDefault.priceVNFormat(p.getPrice())%></b> (<%=LanguegeBUS.getValue("dolar",lang) %>)
                                       
                                        <br>&nbsp;&nbsp;<input type="text" value="<%=ct.getProductNumber() %>" name="number" size="4" />
                                     </li>
                                     
                                     <%if(optionPrice!=""){ %>
                                     <li>&nbsp;&nbsp;<%=LanguegeBUS.getValue("productoptions", lang) %>: <b style="color: red" ><%=optionPrice%> </b>(<%=LanguegeBUS.getValue("dolar",lang) %>)</li>
                               
                                     <%} %>
                            		 
                                     <li><br>
                                        <input type="hidden" name="Id" value="<%=p.getProductId() %>" />
                                        <input type="submit" name="update" value="<%=LanguegeBUS.getValue("update", lang) %>" />
                                        
                                        <input type="hidden" name="action" value="remove" />
                                        <input type="hidden" name="pId" value="<%=p.getProductId() %>" />
                                        <input type="submit" name="remove" value="<%=LanguegeBUS.getValue("remove", lang) %>" />
                                        
                                    </li>
                                </ul>
                                </form>
                            </td>
                            <td style="text-align:right;"  class="order_row">
                                 <ul>
                                    <li><br>
                                        <b style="font-size:10pt;font-weight:bold" ><%if("MALL_VN".equals(lang)){ %><%=ResourcesDefault.priceVNFormat(tempTotal) %><%}else{ %><%=ResourcesDefault.Round(tempTotal,2)%><%} %>  &nbsp;&nbsp;</b>
                                        
                                     </li>
                                 </ul>    
                            </td>    
                        </tr>
                    <%  }//end for
                     %>    
                    </table>
                    </div>
                    

                 
                    <br/>
                    <hr/><br>
                    <b><%=LanguegeBUS.getValue("total", lang) %>:</b> <strong style="color: red"> <%if("MALL_VN".equals(lang)){ %><%=ResourcesDefault.priceVNFormat(tongtien) %><%}else{ %><%=tongtien%><%} %></strong> &nbsp; (<%=LanguegeBUS.getValue("dolar", lang) %>)
                    <br/>
                    <hr>
                    <br/>
                    <br/>
                    <table>
                    	<tr>
	                    	<td style="border:none;">
			                   	<form method="post" action="cartController">
			                   		<input type="hidden" name="action" value="removeall" />
			                    	<BUTTON type="submit" class="button">
			                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("removeall", lang) %></SPAN></SPAN></SPAN>
				                    </BUTTON>&nbsp;&nbsp;
				                </form>  
				             </td>
				             <td style="border:none;">     
				                
				                    <BUTTON onclick="goBack()"  class="button" >
				                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("cont", lang) %></SPAN></SPAN></SPAN> 
				                    </BUTTON>&nbsp;&nbsp;
				              
				             </td>
				             <td style="border:none;">     
				                <form method="post" action="checkout.html">
				                     <BUTTON type="submit" class="button" >
				                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("payment", lang) %></SPAN></SPAN></SPAN> 
				                    </BUTTON>&nbsp;&nbsp;
							     </form> 
							 </td>
						 </tr>                  
	                  </table>    
              
                    <%
                        }//end else if
                    %>
				
                <br/><br/><br/><br/>
            <!--end contain-->
                
                <div class="footer blog">
               		 <%@include file="WEB-INF/footer.jsp" %>
                </div>
                </div></DIV>

                </DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>  
                     
            </DIV>  
        
          <!-- -------------Menu right--------------->
         <DIV class="col-right">
            <%@include file="WEB-INF/rightmenu.jsp" %>
         </DIV>
         
        </DIV>
         
  
        </DIV></DIV> 
    </body>
</html>
