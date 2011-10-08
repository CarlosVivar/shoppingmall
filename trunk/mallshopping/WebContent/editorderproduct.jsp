<%-- 
    Document   : editorderproduct
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@page import="java.util.ArrayList"%>
<%@include file="library.jsp" %>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title><%=LanguegeBUS.getValue("ordermanage", lang) %></title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
                    
            function openPage(path)
            {
                window.location.href = path;
            }
        </script>
        <script type="text/javascript">
                       
            
            function addValueUp(Update){
                document.controlform.update.value= Update;
            }
            function addValueRe(Remove){
                document.controlform.remove.value=Remove;
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

                    <!-- -------------Menu left--------------->
                    <DIV class="col-left">
                        <%@include file="WEB-INF/sellermenu.jsp" %>
                    </DIV>

                    <!-- -------------Content------------- -->
                    <DIV class="col-main">



                        <br/>
                        <DIV class="main-block">         
                            <DIV class="border-bot">
                                <DIV class="border-left">
                                    <DIV class="border-right">
                                        <DIV class="corner-left-top">
                                            <DIV class="corner-right-top">

                                                <DIV class="corner-left-bot">
                                                    <DIV class="corner-right-bot"><DIV class="category-title">
                                                            <div class="tube">    
                                                                <%
                                                                    String message = (String) request.getAttribute("Message");
                                                                    if (message != null) {
                                                                        out.println("<p align='center'><font color='red'>" + message + "</font></p>");
                                                                    }
                                                                %>

                                                                <%
                                                                    float tongtien = 0;
                                                                    String id_order_test = request.getParameter("Id");
                                                                    int id_order = Integer.parseInt(id_order_test);
                                                                    List<Productorderdetail> nList = new ArrayList<Productorderdetail>();
                                                                    Productorder info_order = new Productorder();

                                                                    //  ArrayList<Productorderdetail> ctdh=new ArrayList<Productorderdetail>();

                                                                    info_order = (Productorder) ProductorderBUS.getProductorder(id_order,lang);


                                                                    //   id_order_test=request.getParameter("Id");
                                                                    // id_order = Integer.parseInt(id_order_test);
                                                                    nList = ProductorderdetailBUS.getListProductorderdetail(id_order,lang);
                                                                    // info_order = (Productorder) ProductorderBUS.getProductorder(id_order);


                                                                    String myacc = (String) session.getAttribute("username");

                                                                    User newUser = new User();

                                                                    newUser = UserBUS.getUser(myacc,lang);

                                                                    int transport_id = info_order.getTransportId();
                                                                    Transport mytransport = TransportBUS.getTransport(transport_id,lang);

                                                                %>
                                                                <form id="editordeform" name="editordeform" action="editorderController" method="post">
                                                                    <table class="carttable" width="533" >
                                                                        <tbody>
                                                                        <p align='center'>
                                                                            <font color="#000066">
                                                                                <h1>
                                                                                    <b>
                                                                                     <%=LanguegeBUS.getValue("oform", lang) %>
                                                                                        <br>
                                                                                        <%=LanguegeBUS.getValue("serialorder", lang) %> : HDO_<%=id_order%> /<%= info_order.getOrderDate()%>
                                                                                    </b>
                                                                                </h1>
                                                                            </font>
                                                                        </p>
                                                                        </tbody>
                                                                    </table>
                                                                    <table class="carttable" width="100%" >
                                                                        <tbody>
                                                                            <tr>
                                                                                <td width="50%" height="23" valign="top">
                                                                                    <table width="67%" >
                                                                                        <tr>
                                                                                        <p align='center'><font color='red'>
                                                                                                <h1> <b> <%=LanguegeBUS.getValue("sender", lang) %>:	</b></h1>														
                                                                                            </font>
                                                                                        </p>

                                                                            </tr>
                                                                            <tr>
                                                                                <td>
										<%=LanguegeBUS.getValue("fullname", lang) %>:  <a style="color: blue" href="accountdetail.html"><%=newUser.getAccount()%></a>                                
                                                                                </td>
                                                                            </tr>
                                                                        <br>
                                                                        <tr>
                                                                            <td >
										<%=LanguegeBUS.getValue("oDate", lang) %>: <b style="color: green" ><%= info_order.getOrderDate()%></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="540">
										<%=LanguegeBUS.getValue("total", lang) %>: <b style="color: green" >
                                                                                   <% 
                                                                                                                                                                    
                                                                                   if( session.getAttribute("Tmoney")==null)                                       
                                                                                   {
                                                                                       %>
                                                                                        <%= info_order.getTotalMoney()%>
                                                                                       
                                                                                       <%
                                                                                       
                                                                                   }else if(Float.parseFloat(session.getAttribute("Tmoney").toString())==0.0) 
                                                                                        {
                                                                        
                                                                                        %>
                                                                                            <%= info_order.getTotalMoney()%>
                                                                                        <% 
                                                                                            }else{
                                                                                         %>
                                                                                            <%= session.getAttribute("Tmoney") %>
                                                                                        <%
                                                                                            }
                                                                                          
                                                                                        %>
                                                                                    

                                                                                </b> <b style="color:black">USD</b>	
                                                                               
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                        <br>
                                                                        <%
                                                                            ArrayList<String> myTransport = new ArrayList<String>();
                                                                            ArrayList<Integer> myValueTransport = new ArrayList<Integer>();
                                                                            int trans = info_order.getTransportId();

                                                                            if (trans == 1) {
                                                                                myTransport.add("Home Delivery");
                                                                                myValueTransport.add(2);
                                                                                myTransport.add("Courier");
                                                                                myValueTransport.add(3);
                                                                            } else if (trans == 2) {
                                                                                myTransport.add("To receiver goods");
                                                                                myValueTransport.add(1);
                                                                                myTransport.add("Courier");
                                                                                myValueTransport.add(3);
                                                                            } else if (trans == 3) {
                                                                                myTransport.add("To receiver goods");
                                                                                myValueTransport.add(1);
                                                                                myTransport.add("Home Delivery");
                                                                                myValueTransport.add(2);
                                                                            }



                                                                        %>

                                                                        <td class="label"><%=LanguegeBUS.getValue("transport", lang) %>: 
                                                                            <select id="transport" name="transport" >
                                                                                <option value="<%= info_order.getTransportId()%>" > <%= mytransport.getTransportName().toString()%></option>
                                                                                <option value="<%= myValueTransport.get(0)%>" > <%= myTransport.get(0)%> </option>
                                                                                <option value="<%= myValueTransport.get(1)%>" > <%= myTransport.get(1)%> </option>

                                                                            </select>
                                                                        </td>
                                                                        </tr>
                                                                    </table> 
                                                                    </td>

                                                                    <td width="50%" height="23" valign="top">
                                                                        <table width="50%" >
                                                                            <tr>
                                                                            <p align='center'><font color='red'>
                                                                                    <h1> <b> <%=LanguegeBUS.getValue("receiver", lang) %>:	</b></h1>														
                                                                                </font>
                                                                            </p>

                                                                            </tr>
                                                                            <tr>
                                                                                <td width="280">
															<%=LanguegeBUS.getValue("fullname", lang) %>:<br>								
                                                                                    <input id="name_receiver" name="name_receiver" type="text" size="37" value="<%=info_order.getReciever()%>" />
                                                                                </td>
                                                                            </tr>
                                                                            <br>

                                                                            <tr>
                                                                                <td width="280">
											<%=LanguegeBUS.getValue("address", lang) %> :	<br>			
                                                                                    <textarea name="address_receiver" id="address_receiver" rows="2" style="width: 243px; height: 60px;"><%=info_order.getAddress()%></textarea>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="280">
												<%=LanguegeBUS.getValue("phone", lang) %>:		<br>			
                                                                                    <input id="phone_receiver" name="phone_receiver" type="text" size="37" value="<%=info_order.getPhone()%>" />
                                                                                </td>
                                                                            </tr>
                                                                            
                                                                        </table> 
                                                                    </td>
                                                                           
                                                                    </tr>
                                                                    
                                                                    </tbody>
                                                                    </table>
                                                                    <td align="center">
                                                                    <tr>
                                                                        
                                                                    <input align="center" type="submit" name="updateInfo" value="<%=LanguegeBUS.getValue("update", lang) %>"/>
                                                                        <input type="reset" name="cancel" value="<%=LanguegeBUS.getValue("reset", lang) %>"/>
                                                                        
                                                                    </tr></td>
                                                                    <br>
                                                                    <br>
                                                                    <h2><%=LanguegeBUS.getValue("odetail", lang) %>:</h2>	 
                                                                    <table width="100%"   class="carttable" border="0" >
                                                                        <tbody>
                                                                            <tr style="border: #fff 1px solid;">  
                                                                                <td class="title" width ="10%" ><%=LanguegeBUS.getValue("orderNo.", lang) %></td>
                                                                                <td colspan="2" class="title" width="40%" ><%=LanguegeBUS.getValue("productinfo", lang) %>/td>
                                                                                <td class="title" width="30%" ><%=LanguegeBUS.getValue("productnumber", lang) %></td>
                                                                                <td class="title" width ="20%" ><%=LanguegeBUS.getValue("total", lang) %></td>

                                                                            </tr>
                                                                            <%

                                                                                for (int i = 0; i < nList.size(); i++) {

                                                                                    Productorderdetail prodet = nList.get(i);
                                                                                    int id_product = prodet.getProductId();
                                                                                    Products pro = ProductBUS.getProducts(id_product,lang);
                                                                                    Productphotos pic = ProductPhotoBUS.lstProductPhoto(prodet.getProducts(),lang);
                                                                                    Manufacturer ma = ManufacturerBUS.getManufacturer(pro.getManufacturerId(),lang);
                                                                                    tongtien += prodet.getTotalMoney();
                                                                            %>
                                                                            <tr style="border: #fff 1px solid;">
                                                                                <td align="center" >
                                                                                    <%= i + 1%>
                                                                                </td>
                                                                                <td>
                                                                                    <A title="<%=pro.getProductName()%>" href="productdetail.html?Id=<%=pro.getProductId()%>">
                                                                                        <img title="<%=pro.getProductName()%>" width="60px" height="70px"  alt="product images" src="images/fashion/<%=pic.getProductPhotoName()%>" /></a>
                                                                                </td>
                                                                                <td >
                                                                                    <ul>
                                                                                        <li><%=LanguegeBUS.getValue("productname", lang) %>:<b> <%=pro.getProductName()%></b></li>
                                                                                        <li>(<%=LanguegeBUS.getValue("color", lang) %>:<%=pro.getColor()%> &nbsp; & &nbsp; <%=LanguegeBUS.getValue("size", lang) %>: <%=pro.getSize()%>)</li><br/>
                                                                                        <li><%=LanguegeBUS.getValue("manufac", lang) %>:<b> <%=ma.getManufacturerName()%></b></li>
                                                                                    </ul>    
                                                                                </td>

                                                                                <td align="center" >
                                                                                    <ul>
                                                                                        <li>
                                                                                            &nbsp;&nbsp;<%=LanguegeBUS.getValue("price", lang) %>: <b style="color: red" ><%=pro.getPrice()%> $</b>
                                                                                            <form name="controlform" id="controlform" method="post" action="editorderController">
                                                                                                &nbsp;&nbsp;<input type="text" value="<%= prodet.getProductNumber()%>" name="number" size="4px" />
                                                                                        </li>

                                                                                        <br/>
                                                                                        <li>
                                                                                            &nbsp;&nbsp;<input type="hidden" name="Id_Product" value="<%=pro.getProductId()%>" />
                                                                                              <input type="hidden" name="Money"  value="<%=tongtien%>"/>
                                                                                            <input type="hidden" name="Id_Page" value="<%= id_order%>" />
                                                                                            <input type="submit" name="update" value="<%=LanguegeBUS.getValue("update", lang) %>"/>
                                                                                            <input type="submit" name="remove" value="<%=LanguegeBUS.getValue("delete", lang) %>"/>


                                                                                            </form>
                                                                                        </li>
                                                                                    </ul>
                                                                                </td>
                                                                                <td align="right">
                                                                                    <ul>
                                                                                        <li><br>
                                                                                            <b style="font-size:10pt;font-weight:bold" >
                                                                                                <%=pro.getPrice() * prodet.getProductNumber()%> $ &nbsp;&nbsp;</b>

                                                                                        </li>
                                                                                    </ul>    
                                                                                </td>    
                                                                            </tr>

                                                                            <%
                                                                                }

                                                                            %>         

                                                                        </tbody>
                                                                    </table>
                                                                    <br/>
                                                                    <hr/>
                                                                  
                                                                    <p align="right">  <%=LanguegeBUS.getValue("total", lang) %>: <strong style="color: red"> <%=tongtien%></strong> $ </p>
                                                                   
                                                                    <hr/>

                                                                </form>                                                                           
                                                                <div class="footer blog">
                                                                   <%@include file="WEB-INF/footer.jsp" %>
                                                                </div>
                                                            </DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV>

                    </DIV>  

                    <!-- -------------Menu right--------------->
                    <DIV class="col-right">
                        <%@include file="WEB-INF/rightmenu.jsp" %>

                    </DIV>

                </DIV>


</DIV></DIV>

                </body>
                </html>
