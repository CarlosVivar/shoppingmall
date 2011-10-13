<%-- 
    Document   : rightmenu
    Created on : May 19, 2011, 2:53:06 PM
    Author     : admin
--%>

<%@page import="BUS.ProductBUS"%>
<%@page  import="java.util.*, UTIL.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*, java.util.List" %>
<!DOCTYPE html>
 <%  
 ServletContext rapp=getServletContext();;
 String rlang = (String)rapp.getAttribute("MALL_LA"); %>      
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
                $(document).ready(function(){

                //Larger thumbnail preview

                $("td.thumb ").hover(function() {
                        $(this).css({'z-index' : '10','position':'relative'});
                        $(this).find('img').addClass("hover").stop()
                                .animate({
                                        marginTop: '-110px',
                                        marginLeft: '-110px',
                                        top: '20%',
                                        left: '60%',
                                        width: '150',
                                        height: '200',
                                        padding: '25px'
                                }, 200);

                        } , function() {
                        $(this).css({'z-index' : '0'});
                        $(this).find('img').removeClass("hover").stop()
                                .animate({
                                        marginTop: '0',
                                        marginLeft: '0',
                                        top: '0',
                                        left: '0',
                                        width: '25px',
                                        height: '25px',
                                        padding: '0px'
                                       	
                                }, 400);
                });

                //Swap Image on Click
                        $("td.thumb a").click(function() {

                                var mainImage = $(this).attr("href"); //Find Image Name
                                $("#main_view img").attr({ src: mainImage });
                                return false;
                        });

                });
        </script>

    </head>
    <body>
        <DIV class="main-block">
         
          <!--   <a href="promotion.html"><img alt="women fashion" width="180" src="images/adv/km-hangtuan.gif"/></a>
         <br>  -->  
         <DIV class="border-bot"><DIV class="border-left"><DIV class="border-right"><DIV class="corner-left-top"><DIV class="corner-right-top">
          <DIV class="corner-left-bot"><DIV class="corner-right-bot">
           <DIV class="title-block">
           <DIV class="top"><DIV><DIV>&nbsp;</DIV></DIV></DIV>
                 <DIV class="middle"><H2><%=LanguegeBUS.getValue("news", rlang) %></H2></DIV>
           <DIV class="bot"><DIV><DIV>&nbsp;</DIV></DIV></DIV></DIV>
         <div class="menu">
        <h3><%=LanguegeBUS.getValue("newproduct", rlang) %></h3>
        <ul>
        <%
            List<Products> lstPro2 = (List<Products>)ProductBUS.lstProductNew(rlang);
        	if(lstPro2!=null){
        		
        		lstPro2=ResourcesDefault.sortListProductByCategory(lstPro2,rlang);
        	}
            for(int p1=0;p1<lstPro2.size();p1++){
                    Products pro2 = (Products)lstPro2.get(p1);
                    Productphotos pic2 = ProductPhotoBUS.lstProductPhoto(pro2,rlang);
            
        %>    
                        <table>
                            <tr>
                                 <td class="thumb" style="border-style:none">
                                         <a href='productdetail.html?Id=<%=pro2.getProductId() %>'>
                                             <% if(pic2 == null){ %>
                                                <img src="images/fashion/DefaultImage.gif" alt="<%=pro2.getProductName()%>" height="25" width="25" />
                                             <% }else { %>
                                                <img src="images/fashion/<%=pic2.getProductPhotoName() %>" alt="<%=pro2.getProductName()%>" height="25" width="25" />
                                             <% } %>
                                         </a>
                                  </td>
                                  <td style="border-style:none">
                                          <li>&nbsp;<a href='productdetail.html?Id=<%=pro2.getProductId() %>'><%=pro2.getProductName()%></a>
                                            <br/>&nbsp;&nbsp;&nbsp;<img alt="" src="images/hot.gif">
                                           </li> 
                                  </td>
                                 
                             </tr>
                        </table>

            
        <%  } %>
       
        </ul>

        <!-- <h3><%//LanguegeBUS.getValue("saleoff", rlang) %></h3>
        <ul>
         <%
           // List<Products> lstPro3 = (List<Products>)ProductBUS.lstProduct_PromotionNews(rlang);
           // for(int p2=0;p2<lstPro3.size();p2++){
              //      Products pro3 = (Products)lstPro3.get(p2);
               //     Productphotos pic3 = ProductPhotoBUS.lstProductPhoto(pro3,rlang);
        %>    
         <table>
                            <tr>
                                 <td class="thumb" style="border-style:none">
                                         <a href='productdetail.html?Id=<%//pro3.getProductId() %>'>
                                              <% //if(pic3 == null){ %>
                                                <img src="images/fashion/DefaultImage.gif" alt="<%//pro3.getProductName()%>" height="25" width="25" />
                                             <% //}else { %>
                                                <img src="images/fashion/<%//pic3.getProductPhotoName()%>" alt="<%//pro3.getProductName()%>" height="25" width="25" />
                                             <%// } %>
                                             
                                  </td>
                                  <td style="border-style:none">
                                          <li>&nbsp;<a href='productdetail.html?Id=<%//pro3.getProductId() %>'><%//pro3.getProductName()%></a>   </li>                            
                                  </td>
                                 
                             </tr>
           </table>
        <%  //} %> 
        </ul> -->

               
        </div></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
               
        <a href="#"><img alt="women fashion" width="180" src="images/adv/banner_aothun.gif"/></a>
        
        </DIV>
    </body>
</html>
