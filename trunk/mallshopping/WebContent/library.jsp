<%-- 
    Document   : library
    Created on : May 29, 2010, 8:23:33 PM
    Author     : MR LONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*, UTIL.*, POJO.*, BUS.*" %>

<%   
ServletContext app=getServletContext();
String lang = (String)app.getAttribute("MALL_LA"); 

System.out.print("lang: "+lang);%> 