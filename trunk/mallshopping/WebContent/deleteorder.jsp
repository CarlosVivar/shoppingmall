<%-- 
    Document   : manageorders
    Created on : Jun 18, 2011, 9:42:58 AM
    Author     : wwe
--%>
<%@page import="java.util.Date"%>
<%@include file="library.jsp" %>
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
            var timeout=500;var closetimer=0;var ddmenuitem=0;function jsddm_open(){jsddm_canceltimer();jsddm_close();ddmenuitem=$(this).find('ul').css('visibility','visible')}function jsddm_close(){if(ddmenuitem)ddmenuitem.css('visibility','hidden')}function jsddm_timer(){closetimer=window.setTimeout(jsddm_close,timeout)}function jsddm_canceltimer(){if(closetimer){window.clearTimeout(closetimer);closetimer=null}}document.onclick=jsddm_close;
            $(document).ready(function() {
            if ('12'.length!=0){$(".category-items li").each(function(){	if ('12'==$(this).attr('k')){$(this).find("a").css('font-weight','bold').css('color','#555555');$(this).parent().show();return false;}})}
            $('.jsddm > li').bind('mouseover', jsddm_open);$('.jsddm > li').bind('mouseout',  jsddm_timer);
            });
            
            
            function show(object)
            {
                 var id = document.getElementById(object);
                var productorder = (Productorder)object.value;
                document.orderform.name_sender.value = productorder.getReciever();
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
                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                        }
                 %>                   
                
 <form id="deleteorderform" name="deleteorderform" action="deleteorderController" method="post">
   <table width="100%" class="carttable"   border="0" >
     <tbody>
     
     <tr style="border: #fff 1px solid;">
       <td class="title" width ="20%" ><%=LanguegeBUS.getValue("orderNo.", lang) %></td>
       <td  class="title" width="30%" ><%=LanguegeBUS.getValue("serialorder", lang) %></td>
       <td class="title" width="30%" ><%=LanguegeBUS.getValue("oDate", lang) %> </td>
       <td class="title" width ="20%" ><%=LanguegeBUS.getValue("total", lang) %></td>
       
     </tr>
     <%
                                                         //  int id_state = Integer.parseInt(request.getParameter("Id"));
                                                            int id_productorder = Integer.parseInt(request.getParameter("Id"));
                                                            Productorder prod  =  ProductorderBUS.getProductorder(id_productorder,lang);

                                                                
                                                                 int id_ProductOrder = prod.getProductOrderId();
                                                                
                                                                 double totalmoney = prod.getTotalMoney();
                                                                 Date orderdate = prod.getOrderDate();
                                                                


                                                    %>
     <tr style="border: #fff 1px solid;">
       <td align="center" ><%= 1 %> </td>
       <td align="center" > HDO_<%= id_ProductOrder %>/<%= orderdate %> </td>
       <td align="center" ><%= orderdate %> </td>
       <td align="center"><%= totalmoney %> </td>
       
    
     </tr>
     <br/>
     
     <tr>
     <font color="blue" size="5"> Do you really want to delete this order ? </font>
     </tr>
  
   </tbody>
   </table>
       <br>
       <hr>
       <br>
       <table>
           <tbody >
             <p align='center'>
                 <button type="submit" name="btnDelete" value="<%=id_ProductOrder %>" > <%=LanguegeBUS.getValue("delete", lang) %> </button>
                 <button type="reset" name="btnCancel" onclick="openPage('order.html?defaultId=1').call(this)" > <%=LanguegeBUS.getValue("cancel", lang) %></button>

       </p>
           </tbody>
       </table>
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
         
        
  
    </body>
</html>
