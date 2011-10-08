<%-- 
    Document   : informationaccount
    Created on : Jun 13, 2011, 1:34:43 PM
    Author     : wwe
--%>

<%@page import="java.util.ArrayList"%>
<%@include file="library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=LanguegeBUS.getValue("accInfor", lang) %></title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/datetimepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/js/ttabc.js"></script>
        <script type="text/javascript">

             function openPage(path)
             {
             window.location.href = path;
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
					 <a rel="nofollow"  href="accountdetail.html" class="viewmore"><%=LanguegeBUS.getValue("accInfor", lang) %></a></li>					
										
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
                                                                            
       <%
                     String message = (String) request.getAttribute("Message");
                     if (message != null) {
                           out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                     }
               
                    String myacc = (String)session.getAttribute("username") ;

                    User myUser = new User();
            
                    myUser = UserBUS.getUser(myacc,lang);
                    Role r = RoleBUS.getRole(myUser.getRole().getRoleId(),lang);
            
                   
      %>
      			 <Br>
                <h2><%=LanguegeBUS.getValue("accInfor", lang) %></h2><Br><Br>
                <div class="tooltip"></div>
                
                <table class="sign" width="620" style="font-size:9pt">
                <tr>

                <td class="label"><%=LanguegeBUS.getValue("username", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" style="width:150px" value="<%= myUser.getAccount() %>"  />
                    
                </td>
                         
                </tr>
                
                <tr>
   
              
                <td class="label"><%=LanguegeBUS.getValue("password", lang) %>:</td>
                <td> 
                	<BUTTON class="button" type="button"  onclick="openPage('changepass.html').call(this)">
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("changepass", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>    
                    
                </td>
                </tr>
                 <tr>
                <td class="label"><%=LanguegeBUS.getValue("role", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" style="width:150px" value="<%=r.getRoleName() %>"  />    
                </td>
                </tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("email", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" value="<%= myUser.getEmail() %>"  />
                    
                </td>
                </tr>

                
                </table>

               <br/>	
                <Br>
                <h2><%=LanguegeBUS.getValue("userInfor", lang) %></h2><Br><Br>
                <div class="tooltip"></div>
                
                <table class="sign" width="620" style="font-size:9pt">
                <tr>

                <td class="label"><%=LanguegeBUS.getValue("fullname", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" style="width:150px" value="<%= myUser.getFullName() %>"  />
                    
                </td>
                         
                </tr>
                
                <tr>
   
              
                <td class="label"><%=LanguegeBUS.getValue("sex", lang) %>:</td>
                <td> 
                	<input  type="text" readonly="readonly" style="width:70px"  value="<%= myUser.getSex() %>"  />        
                    
                </td>
                </tr>
                 <tr>
                <td class="label"><%=LanguegeBUS.getValue("birth", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" style="width:150px" value="<%= myUser.getBirthday() %>"  />    
                </td>
                </tr>
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("email", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" value="<%= myUser.getEmail() %>"  />
                    
                </td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("phone", lang) %>:</td>
                <td>
                	<input  type="text" readonly="readonly" style="width:150px" value="<%= myUser.getPhone() %>"  />
                 
                </td>
                </tr>

                </table>

               <br/><Br><Br>
                <Table style="float:right" class="sign">
               

                <tr>
                <td>
                    
                    &nbsp;&nbsp;
                    <BUTTON class="button" type="button" onclick="openPage('accountform.html').call(this)">
                        
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("update", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                </tr>
                </Table>
				<br/><br/><Br>
              

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
