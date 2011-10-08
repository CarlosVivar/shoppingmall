<%-- 
    Document   : account
    Created on : Jun 10, 2011, 10:54:22 PM
    Author     : TRONGHAI
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
             
                 
               function CheckEmail()
            {
               var textbox_Email = document.getElementById("email");
               var reg = new RegExp ( "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
               if(reg.test(textbox_Email.value)==false){
                   alert ("Xin xem lại Email!")
                    return;
               }
           
                
            }
              
 function openPage()
 {
 window.location.href = 'changepass.html';
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
					 <a rel="nofollow"  href="#" class="viewmore"><%=LanguegeBUS.getValue("accInfor", lang) %></a></li>					
										
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
                    
                   
                        ArrayList<String> mySex=new ArrayList<String>();
                        String sexual = myUser.getSex();
                        if(sexual.equals("Female"))
                            {                         
                                    mySex.add("Male");
                                   
                            }
                        else if (sexual.equals("Male")){                         
                                    mySex.add("Female");
                                  
                            }
                                  
      %>
                <Br>
                <h2> <%=LanguegeBUS.getValue("yourinfo", lang) %></h2>
                <div class="tooltip"></div>
                <form id="accounManagertform" class="cssform" name="accountManagerform" action="accountController" method="post">
                <table class="sign" style="font-size:8.5pt">
                <tr>
                <td class="label"><%=LanguegeBUS.getValue("username", lang) %>:</td>
                <td>
                   <b>
                        <font color='green'>
                       <%= myUser.getAccount() %>
                        </font>
                    </b>
                </td>
                </tr>
                <tr>
                    
                <td class="label"><%=LanguegeBUS.getValue("fullname", lang) %>:</td>
             
                <td>
                     
                    <input type="text" name="fullname" id="fullname" title="Điền Tên Họ"
                           value="<%= myUser.getFullName() %>" /></td>
                         
                </tr>
                
                <tr>
   
              
                <td class="label"><%=LanguegeBUS.getValue("sex", lang) %>:</td>
                <td>
                    
                   <select id="sex" name="sex">

                       <option value=<%= myUser.getSex() %> > <%= myUser.getSex() %> </option>
                           <option value=<%= mySex.get(0) %> > <%= mySex.get(0) %> </option>
                      


                    </select>
                    
                   
                </td>
                </tr>
                
                <td class="label"><%=LanguegeBUS.getValue("birth", lang) %>:</td>
                <td>
                    <input type="text" name="birthday" 
                           value="<%= myUser.getBirthday() %>"
                           id="datepicker" title="Input Exp Date" style="width: 90px" />
                    
                      <a href="javascript:NewCssCal('datepicker','yyyymmdd')">
                     <img src="scripts/datetimepicker/images/cal.gif" width="16" height="17" alt=""></a>
                   
                </td>
                

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("email", lang) %>:</td>
                <td>
                  
                    <input type="text" name="email" maxlength="50" 
                           value="<%= myUser.getEmail() %>"
                           id="email" title="Dùng Cho Vấn Đề Gởi Hàng." onchange="CheckEmail()" />
                    
                </td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("address", lang) %>:   </td>
                <td>
                                    
                    <textarea name="address" cols="" rows="" id="address" title="Địa Chỉ Cần Số Nhà Và Tên Đường,Thành Phố"/><%= myUser.getAddress() %> </textarea>
                
                    </td>
                </tr>

                <tr>
                <td class="label"><%=LanguegeBUS.getValue("phone", lang) %>:</td>
                <td>
                   
                    <input type="text" name="phone" maxlength="15" value="<%= myUser.getPhone() %>" id="phone" title="VD: 090 989 8126, ..."/>
                
                </td>
                </tr>
                </table>
         
                <Table class="sign">
               
                <tr>
                <td>
                    <BUTTON type="submit" class="button">
                        
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("update", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>&nbsp;&nbsp;
                    
                    <BUTTON type="reset" class="button" >
                        <SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("reset", lang) %></SPAN></SPAN></SPAN>
                    </BUTTON>
                </td>
                </tr>
                </Table>
                </form>


              

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
