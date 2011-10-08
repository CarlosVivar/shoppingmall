<%-- 
    Document   : footer
    Created on : May 19, 2011, 4:03:50 PM
    Author     : admin
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, BUS.*" %>
  <%   
  ServletContext fapp=getServletContext();;
  String flang = (String)fapp.getAttribute("MALL_LA"); %>      
        <script type="text/javascript">$(function() {
        $(window).scroll(function() {
        		if($(this).scrollTop() != 0) {
        			$('#bttop').fadeIn();	
        		} else {
        			$('#bttop').fadeOut();
        		}
        	});
         
        	$('#bttop').click(function() {
        		$('body,html').animate({scrollTop:0},800);
        	});	
        });
		</script>
		<div style="
        position:fixed;
        bottom:10px; 
        right:10px;
        cursor:pointer;
        display:none;" id="bttop">
		<img src="images/up.png" alt="" />
		</div>
    
    
 
        <%=LanguegeBUS.getValue("mFooter", flang) %>
