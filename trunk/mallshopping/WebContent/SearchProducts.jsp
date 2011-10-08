<%-- 
    Document   : index
    Created on : May 26, 2011, 12:18:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="library.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Korea Fashion</title>
        <meta name="Description" content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="Keywords" content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
        <meta name="robots" content="INDEX,FOLLOW">
        <meta name="Googlebot" content="index,follow,archive">
        <meta name="verify-v1" content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
        <link href="css/style.css" rel="stylesheet" type="text/css">

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {   
                $('#s1').cycle('fade');
            });
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
                        <%@include file="WEB-INF/leftmenu.jsp" %>
                    </DIV>
                    <!-- -------------Content------------- -->
                    <DIV class="col-main">    

                        <%
                            String message = (String) request.getAttribute("Message");
                            if (message != null) {
                                out.println("<p align='center'><font color='red'>" + message + "</font></p>");
                            }
                        %>

                        <UL class="prodlist">

                            <form  action="SearchProductsTextController" method="post">
                                <table width="600" >
                                    <tr>    

                                        <td  colspan="2" width="155"> <b> Option:&nbsp </b><input type="text" name="txtWord" width="50" /> 
                                        </td>
                                        <td width="108">
                                            <label class="carttable">
                                                <select style="width:130px "name="selectWord" >
                                                    <option value="0">- Manufactural -</option>
                                                    <%
                                                        List<Manufacturer> listManu = ManufacturerBUS.lstManufacturer(lang);
                                                        if (listManu != null) {
                                                            for (int i = 0; i < listManu.size(); i++) {
                                                                Manufacturer Manu = listManu.get(i);

                                                    %>                                           
                                                    <option value="<%=Manu.getManufacturerId()%>">
                                                        <%=Manu.getManufacturerName()%>
                                                    </option>      
                                                    <%
                                                            }
                                                        }
                                                    %> 
                                                </select>

                                            </label>   
                                        </td>

                                        <td width="130">
                                            <select  style="width:130px" name="selectPrice"  >
                                                <option value="0">-Price-</option>
                                                <%
                                                    double maxPrice = (double) ProductBUS.maxPrice(lang);
                                                    double minPrice = (double) ProductBUS.minPrice(lang);
                                                    if (minPrice < 100) {
                                                        minPrice = 100;
                                                    }
                                                    for (int i = 0; i < maxPrice / 200; i++) {
                                                %>
                                                <option  value="<%=minPrice * i%> <%=minPrice * i + 100 * i%> ">
                                                    <%=minPrice * i%>&nbsp;~&nbsp;<%=minPrice * i + 100 * i%>       
                                                </option>
                                                <%}%>
                                            </select>
                                        </td>


                                        <td width="128"  align="right" >
                                            <input  type="submit" name="Submit" value="Submit" style="width:60px"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>

                            <%
                                List<Products> list = (List) request.getAttribute("searchProducts");
                                if (list != null) {
                                    for (int i = 0; i < list.size(); i++) {
                                        Products p = list.get(i);
                                        Productphotos photo = ProductPhotoBUS.lstProductPhoto(p,lang);
                            %>

                            <li><div class="outterimgframe"><div class="innerimgframe"><A title="" href="/thoi-trang-dep-abc.action?id=317889"><IMG alt="" src="images/fashion/<%=photo.getProductPhotoName()%>"></A></div></div>
                                <p><A title="" href="/thoi-trang-dep-abc.action?id=317889"><span class="title"><%=p.getProductName()%></span></A></p>
                                <p class="price"><%=p.getPrice()%>VNĐ</p>
                            </li>
                            <% }
                                }%>

                        </ul>
                        <br class="clr"><br>
                        <!-- PAGI -->
                        <div class="pagination"><ul>
                                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=1">First</a></li> 
                                <li><a class="prevnext disablelink">&#171;Pr</a></li>
                                <li class="pagir"><a href="#" class="currentpage">1</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=2">2</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=3">3</a></li> <li class="pagir"><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=4">4</a></li> 

                                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=2">Nt&#187;</a></li> 
                                <li><a href="http://thoitrangabc.com/thoitrangabc-catalog.action?t=9&amp;p=86">Last</a></li></ul></div>
                        <br class="clr">
                    </DIV>  

                    <!-- -------------Menu right--------------->
                    <DIV class="col-right">
                        <%@include file="WEB-INF/rightmenu.jsp" %>
                    </DIV>

                </DIV>



                <script type="text/javascript">
                    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
                    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
                </script>
                <script type="text/javascript">
                    try {
                        var pageTracker = _gat._getTracker("UA-5793468-6");
                        pageTracker._trackPageview();
                    } catch(err) {}
                </script>
            </DIV></DIV>
    </body>
</html>
