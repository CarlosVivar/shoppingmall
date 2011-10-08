<%-- 
    Document   : payment
    Created on : 30-05-2011, 20:07:21
    Author     : Mr Long
--%>
<%@page import="java.util.Date"%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("payment", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="scripts/PaymentValidator.js"></script>
       
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
                 
                <Br>
                <h2>Payment Information</h2>
                <div class="tooltip"></div>
                <form id="paymentform" name="paymentform" action="paypalController" method="post">
                <table class="sign">
                <tr>
                <td class="label">Card Type:</td>
                <td>
                    <select id="ccType" name="ccType"  style="width: 150px;" title="Choose Card Type">
                            <option value=""> --Card Type-- </option>
                             <option value="Visa">Visa</option>
                              <option value="MasterCard">Master Card</option>
                              <option value="Discover">Discover</option>               
                             <option value="American Express">American Express</option>                        
                    </select>
                     &nbsp;&nbsp;<img src="css/images/logo_ccVisa.gif" /><img src="css/images/logo_ccMC.gif" /><img src="css/images/logo_ccAmex.gif" /><img src="css/images/logo_ccDiscover.gif" />
                </td>
                </tr>  
                <tr>
                <td class="label">Card Number:</td>
                <td><input type="text" name="ccNumber" id="ccNumber" title="Input Card Number"/></td>
                </tr>  
                <tr>
                <td class="label">Expiration date:</td>
                <td>
                    <select name="expMonth" id="expMonth" onchange="validEXP();" style="width: 70px;">
                            <option value="">-Tháng-</option>
                            <% for(int i=0;i<=11;i++){%>
                            <option value="<% if(i+1<=9){%><%=0%><%}%><%=(i+1)%>" selected><% if(i+1<=9){%><%=0%><%}%><%=(i+1)%> </option>
                             <% }%>
                    </select>
                    &nbsp;-&nbsp;
                    <select id="expYear" name="expYear" onchange="validEXP();" style="width: 90px;">
                           <option value="" >--Năm--</option>
                           <%
                                Date d = new Date();
                                for(int j=0;j <= (d.getYear()+20) ; j++){
                                   int y = d.getYear() + 20 - j;
                            %>
                                <option value="<%=(y + 1900)%>" selected><%=(y + 1900)%> </option>
                          <%  
                                }
                           %>
                   </select>
                   <span class="error" id="validEXP"/>
                </td>
                </tr> 
                <tr>
                <td class="label">Card Verification Number:</td>
                <td><input type="password" name="cvvNumber" id="cvvNumber" title="Input CVV Number" style="width: 120px"/></td>
                </tr> 
                <tr>
                <td class="label">First name:</td>
                <td><input type="text" name="firstName" id="firstName" title="Input first name"/></td>
                </tr>
                
                <td class="label">Last name:</td>
                <td><input type="text" name="lastName" id="lastName" title="Input last name"/></td>
                </tr>

              
                <tr>
                <td class="label">Address:</td>
                <td><textarea name="address" id="address" title="input address"></textarea></td>
                </tr>

                <tr>
                <td class="label">City:</td>
                <td><input type="text" name="city" maxlength="60" id="city" title="e.g. Mehico, San Jose,..." style="width: 120px"/></td>
                </tr>

                <tr>
                <td class="label">State:</td>
                <td>
                	<select id="state" name="state"  style="width: 60px;" title="Choose State">
                            <option value="">-State-</option>
                            <option value="AA">AA</option>
                            <option value="AE">AE</option>
                            <option value="AK">AK</option>                                      
                            <option value="AL">AL</option>    
                            <option value="AP">AP</option>
                            <option value="AR">AR</option>
                            <option value="AS">AS</option>                                      
                            <option value="AZ">AZ</option>
                            <option value="CA">CA</option>
                            <option value="CO">CO</option>
                            <option value="CT">CT</option>                                      
                            <option value="DC">DC</option>  
                            <option value="DE">DE</option>            
                            <option value="FL">FL</option>
                            <option value="FM">FM</option>
                            <option value="GA">GA</option>  
                            <option value="GU">GU</option>    
                            <option value="HI">HI</option>     
                            <option value="IA">IA</option>   
                            <option value="ID">ID</option>
                            <option value="IL">IL</option>
                            <option value="IN">IN</option>      
                            <option value="KS">KS</option>
                            <option value="KY">KY</option>     
                            <option value="LA">LA</option>                            
                    </select>
                </td>
                </tr>
                
                <tr>
                <td class="label">Zip code:</td>
                <td><input type="text" name="zip" maxlength="15" id="zip" title="e.g. 12345, 94159, 95131" style="width: 100px"/></td>
                </tr>
				<tr>
                <td class="label">Country code:</td>
                <td><input type="text" name="countryCode" maxlength="15" id="zip" title="e.g. US" style="width: 100px"/></td>
                </tr>
                </table>

                 <Table class="sign">
                    <tr>
		                <td><BUTTON type="submit" class="button marginleft110"><SPAN><SPAN><SPAN>Submit</SPAN></SPAN></SPAN></BUTTON>&nbsp;&nbsp;
		                <BUTTON type="reset" class="button"><SPAN><SPAN><SPAN>Reset</SPAN></SPAN></SPAN></BUTTON></td>
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

