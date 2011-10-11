<%@include file="../library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            Object obj = request.getAttribute("lstCategorys");
            if (obj == null) {
                String url = "/manageCategoryController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }
            String act = (String)request.getParameter("act");
			String cateId = (String)request.getParameter("Id");
			String childId = (String)request.getParameter("childId");
			String subId = (String)request.getParameter("subId");
           	//System.out.println("act:"+act);
			
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("categorymanage", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript">
                function confirmDeletion() {
                        return confirm("Are you sure you want to delete this category child?");
                }
                function confirmDeletion1() {
                    return confirm("Are you sure you want to delete this category?");
            	}
        </script>        
</head>
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="template/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %>  </a> &nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="category.html" class="viewmore"><%=LanguegeBUS.getValue("uCATEGORY", lang) %></a></li>
								
						
	</ul></div>
	<a class="closeAlert"><img src="css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div id="col1">
	 	<div class="left_content_ucp">
            <div class="box_msg">
				<p><a class="msg clear" href="inbox.html"><%=LanguegeBUS.getValue("message", lang) %> (<strong>0</strong>)</a></p>
			</div>

        
        	<div class="module_ucp boxRadius">
			<h4 class="title"><%=LanguegeBUS.getValue("manage", lang) %></h4>
			<ul>
		      <li><a href="index.html"><%=LanguegeBUS.getValue("home", lang) %></a></li>
		
		      <li ><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
		      <li ><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html"><%=LanguegeBUS.getValue("sale", lang) %></a></li>
		      <li ><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
		      <li ><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>     
		      <li class="active"><a href="category.html"><%=LanguegeBUS.getValue("category", lang) %></a></li>      
			  	</ul>
		 </div>
		</div>
	 	 <%@include file="template/leftmenu.jsp" %>
	 </div>
	 <!--col1-->
	 <div id="col2">
	 
	 	<div class="right_content_ucp">
            <div class="box_ucp">
                <div class="top_box_ucp">
                    <div class="ltop_box_ucp"></div>
                    <div class="rtop_box_ucp"></div>

                </div>
                <div class="center_box_ucp">
                    <div class="box_ucp_inside">
                        <h2 class="title"><%=LanguegeBUS.getValue("categorymanage", lang) %></h2>
                        						
                         <br>                      
                        <div id="usual2">
                            
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody><tr>
                                	<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang) %></td>	
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("categorychild", lang) %></td>
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("categorysub", lang) %></td>
                                    <td class="lstitle" width="20"><%=LanguegeBUS.getValue("priorities", lang) %></td>
                                    <td class="lstitle" width="20"><%=LanguegeBUS.getValue("add", lang) %></td>
                                    <td class="lstitle" width="20"><%=LanguegeBUS.getValue("update", lang) %></td>
                                    <td class="lstitle" width="20"><%=LanguegeBUS.getValue("delete", lang) %></td>
                                </tr>
                               
                               		<%
                               			List<Category> lstCate = (List<Category>)request.getAttribute("lstCategorys");
                               			if(lstCate==null){
                               		%>
                               		<tr>
                                    	<td class="nontable" colspan="7">&nbsp;</td>
                                    </tr>	
									<%
                               			}else{
                               				for(int i=0;i<lstCate.size();i++){
                               					Category cate = (Category)lstCate.get(i);
                               					List<CategoryChild> lstCC = (List<CategoryChild>)CategoryChildBUS.lstCategoryChild(cate,lang);
                               					String caPriorities=cate.getPriorities(),caChilPriorities="",caSubPriorities="";
                               					
                               		%>
                               		<tr class="order_row">
                               			
                               			<td style="text-align:left " colspan="4" class="nonSearch">
                               			<form action="<%=ServletUtils.getBaseUrl(request)%>/manageCategoryActionController" method="post">
                               				<%  
                               					if(null!=cateId && null!=act && act.equals("update") && cate.getCategoryId().compareTo(cateId)==0){ %>
                               						<input type="hidden" value="update" name="act">
                               						<input type="hidden" value="<%=cate.getCategoryId()%>" name="Id">
                               						<input id="catename" name="catename" type="text" value="<%=cate.getCategoryName() %>"  style="text-align:left"/>
                               						<input class="button" type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
                               						<input name="caPriorities" style="margin-right: 0; width:20px; text-align:center; float:right" type="text" value="<%=caPriorities %>"/>
                               				<%}else{ %>
                               					
										        	<b><%=cate.getCategoryName() %></b>
										        	<span style="margin-right: 0; width:20px; text-align:center; float:right"><%=caPriorities %></span>
                               				<%} %>
                               			</form>	
                               			</td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="categoryadd.html" title="add">
				                                <img alt="save" height="16" src="css/images/add.JPG" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center">
				                            <a href="category.html?act=update&Id=<%=cate.getCategoryId() %>" title="Update">
				                                <img alt="update" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/categorydelete.html?Id=<%=cate.getCategoryId() %>&act=delete" title="Delete" onclick="return confirmDeletion1();">
				                                <img alt="delete" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%
                               			for(int j=0;j<lstCC.size();j++){
                               				CategoryChild cc = (CategoryChild)lstCC.get(j);
                               				List<CategorySub> lstSub = (List<CategorySub>)CategorySubBUS.lstCategorySub(cc,lang);
                               				caChilPriorities=cc.getPriorities();
                               		%>
                               		<tr class="order_row">
                               			
                               			<td class="nonSearch"></td>
                               			<td style="text-align:left " colspan="3" class="nonSearch">
                               			<form action="<%=ServletUtils.getBaseUrl(request)%>/manageCategoryActionController" method="post">
                               				<%  
                               					if(null!=childId && null!=act && act.equals("update") && cc.getCategoryChildId().equals(childId)){ %>
                               						<input type="hidden" value="update" name="act">
                               						<input type="hidden" value="<%=cc.getCategoryChildId()%>" name="childId">
                               						<input id="childname" name="childname" type="text" value="<%=cc.getCategoryChildName()%>"  style="text-align:left"/>
                               						<input class="button" type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
                               						<input name="caChilPriorities" style="margin-right: 0; width:20px; text-align:center; float:right" type="text" value="<%=caChilPriorities %>"/>
                               				<%}else{ %>
                               					
										        	<%=cc.getCategoryChildName()%>
										        <span style="margin-right: 0; width:20px; text-align:center; float:right"><%=caChilPriorities %></span>
                               				<%} %>
                               			</form>
                               			</td>
                               			
                               			<td></td>
                               			
                               			<td class="nonSearch" align="center">
				                            <a href="category.html?act=update&childId=<%=cc.getCategoryChildId() %>" title="Update">
				                                <img alt="update" height="16" src="css/images/edit-icon.gif" width="16" />
				                            </a>
			                        	</td>
                               			<td class="nonSearch" align="center" >
				                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/categorydelete.html?childId=<%=cc.getCategoryChildId()%>&act=delete" title="Delete" onclick="return confirmDeletion();">
				                                <img alt="delete" height="16" src="css/images/delete.png" width="16" />
				                            </a>
				                        </td>
                               		</tr>	
                               		<%
                               			if(null!=lstSub){
	                               			for(int k=0;k<lstSub.size();k++){
	                               				CategorySub cb = (CategorySub)lstSub.get(k);
	                               				caSubPriorities=cb.getPriorities();
                               				
                               		%>
	                               		<tr class="order_row">
	                               			
	                               			<td class="nonSearch" colspan="2"></td>
	                               			<td style="text-align:left "  class="nonSearch" colspan="2">
	                               			<form action="<%=ServletUtils.getBaseUrl(request)%>/manageCategoryActionController" method="post">
	                               				<%  
	                               					if(null!=subId && null!=act && act.equals("update") && cb.getCategorySubId().equals(subId)){ %>
	                               						<input type="hidden" value="update" name="act">
	                               						<input type="hidden" value="<%=cb.getCategorySubId() %>" name="subId">
	                               						<input id="subname" name="subname" type="text" value="<%=cb.getCategorySubName() %>"  style="text-align:left"/>
	                               						<input class="button" type="submit" value="<%=LanguegeBUS.getValue("submit", lang) %>" />
	                               						<input name="caSubPriorities" style="margin-right: 0; width:20px; text-align:center; float:right" type="text" value="<%=caSubPriorities %>"/>
	                               				<%}else{ %>
	                               					
											        	<%=cb.getCategorySubName() %>
											        <span style="margin-right: 0; width:20px; text-align:center; float:right"><%=caSubPriorities %></span>
	                               				<%} %>
	                               				
	                               			</form>
	                               			</td>
	                               			<td></td>
	                               			
	                               			
	                               			<td class="nonSearch" align="center">
					                            <a href="category.html?act=update&subId=<%=cb.getCategorySubId() %>" title="Update">
					                                <img alt="update" height="16" src="css/images/edit-icon.gif" width="16" />
					                            </a>
				                        	</td>
	                               			<td class="nonSearch" align="center" >
					                            <a href="<%=ServletUtils.getBaseUrl(request)%>/admin/categorydelete.html?subId=<%=cb.getCategorySubId() %>&act=delete" title="Delete" onclick="return confirmDeletion();">
					                                <img alt="delete" height="16" src="css/images/delete.png" width="16" />
					                            </a>
					                        </td>
	                               		</tr>	
                               		<%				}
                               			  		}
                               				}
                               			}
									%>
                                    
                                    <%} %>
                             </tbody></table>
                             
                             
                          
                        </div>
                    </div>

                </div>
                <div class="bottom_box_ucp">
                    <div class="lbottom_box_ucp"></div>
                    <div class="rbottom_box_ucp"></div>
                </div>
            </div>
        </div>

	 </div>

	 </div>
	
	<!--End content-->
	 <div class="clear"></div>
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	 <div id="footer">
			<%@include file="template/footer.jsp" %>
	</div><!--end footer-->
	<!--End footer-->
	 </div>
	 
	
	
	 </body>
</html>

