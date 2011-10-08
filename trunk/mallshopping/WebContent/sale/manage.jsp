<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*, java.util.List"%>
<%@include file="../library.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
            Object obj = request.getAttribute("ProductPOJOs");
            if (obj == null) {
                String url = "/sellerController";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=LanguegeBUS.getValue("salemanage", lang) %></title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
         <link href="<%=ServletUtils.getBaseUrl(request)%>/admin/css/style.css" media="screen" rel="stylesheet" type="text/css" />
		 <script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery-1.3.min.js"></script>
		 
		  <script type="text/javascript">
				$(function() { 
				    $('.tab a:first-child').click(function(){
				        switch_tabs($(this));
				        return false;
				    }); 
				    switch_tabs($('.selected'));
				    $("#tabs1").show();
                    $("#tabs2").hide();
                    $("#tabs3").hide();
                    $("#tabs4").hide();
                    $("#tabs5").show();
				});
		
				function switch_tabs(obj)
				{
				    $('.table_ucp').hide();
				    $('.tab a:first-child').removeClass("selected");
				    var id = obj.attr("rel");
				    $('#'+id).show();
				    obj.addClass("selected");
				}
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				// add new content
			  	function addContent(id) {
			  		
					<%
						List<Products> lst = (List<Products>)ProductBUS.lstProduct(lang);
						for(int i=0;i<lst.size();i++){
							
							Products p1 = (Products)lst.get(i);
							int p1id = p1.getProductId();
							String title = p1.getProductName();
							String cont = String.valueOf( p1.getDetail());
							
					%>
						var pid = "<%=p1id%>";
						var title="<%=title%>";
						var cont="<%=cont%>";
						if(id==pid){
							document.getElementById("title").innerHTML=title;
							document.getElementById("noidung").innerHTML=cont;
						}
					<% } %>
					  			
			  	}
         </script>
        
         <style type="text/css">
	         
				.even-row {
				    background-color: #FCFFFE;
				}
				 
				.odd-row {
				    background-color: #ECF3FE;
				}
				 
				.active-row {
				    background-color: #FFEBDA !important;
				    cursor: pointer;
				}
			
		</style>
</head>
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="layout/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("sale", lang) %></a>
	 </li>					
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="Đóng" width="8" height="8"></a></div>
	
	 <div class="breadcrumb"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_link.gif" width="12" height="12" alt="Icon Link" />
                                                <span><b>Bulletin:</b> guidance information to help sales of items</span>
                                                                    
                        </div>
	
			
        <div class="clear"></div>
		 <div class="content_inside">
			 <div class="content_shop">
			
    	<div class="left_content_shop">
    				  				
           <div class="box_sale">
                <div class="top_box_ucp">
                    <div class="ltop_box_ucp"></div>
                    <div class="rtop_box_ucp"></div>

                </div>
                <div class="center_box_ucp">
                    <div class="box_ucp_inside">
                        <h2 class="title">Bulletin</h2>
                        						
                                                <p class="numUp"><b>Bulletin:</b> guidance information to help sales of items<strong></strong>
                                                <a id="cmd_uporder1" style="cursor: pointer;">
                                                </a></p>
                                    
                        <div id="usual2">
                            <ul class="tab">

                                <li><a rel="tabs1" class="selected" href="#tabs1"><span>All Bulletin</span></a></li>
                                <li><a rel="tabs1" href="#tabs2"><span>General Bulletin</span></a></li>
                                <li><a rel="tabs2" href="#tabs2"><span>Safe Trading Bulletin</span></a></li>
                                <li><a rel="tabs3" href="#tabs2"><span>Advertising Bulletin</span></a></li>
                                <li><a rel="tabs4" href="#tabs2"><span>System Bulletin</span></a></li>
                                
                                <!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
                            </ul>
                           
					        
                            <div style="overflow: auto;height:250px;width:705px">
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
                                <tbody><tr>
                                	<td class="lstitle" width="10"><%=LanguegeBUS.getValue("no.", lang) %></td>	
                                	<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang) %></td>	
                                    <td class="lstitle" width="350"><%=LanguegeBUS.getValue("title", lang) %></td>
                                  
                                    <td class="lstitle" width="70"> <%=LanguegeBUS.getValue("date", lang) %></td>
                                    
                                </tr>
                               
					                <%
					                	List<Products> ds = (List<Products>) request.getAttribute("ProductPOJOs");
					                    if (ds == null) {
					                        
					                 %>
                               		<tr>
                                    	<td class="nontable" colspan="4"><%=LanguegeBUS.getValue("mProduct", lang) %></td>
                                    </tr>
                                    
									<%
                               			}else{
                               				for (int i = 0; i < ds.size(); i++) {
					                            Products p = (Products)ds.get(i);
					                            Productphotos pic = ProductPhotoBUS.lstProductPhoto(p,lang);
                               					CategoryChild cc = CategoryChildBUS.getCategoryChild(p.getCategoryChildId(),lang);
                               		%>
                               		<tr class="order_row"  onmouseover="this.style.backgroundColor='#ECF3FE'" 
                               		onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" onclick="addContent('<%=p.getProductId()%>');">
                               			
                               			<td class="nonSearch"> <%=p.getProductId()%>    </td>
                               			<td class="nonSearch" style="text-align:left"><%if(null!=cc){%><%=cc.getCategoryChildName() %><%}%></td>
                               			<td class="nonSearch" style="text-align:left"><%=p.getProductName()%></td>
                               			<td class="nonSearch"><%=p.getUploadDate()%></td>
                               			
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
                                   
                                    <%} %>
                             </tbody></table>
                             </div>
                             
                             		
                                                              
                                                               

                                    <div class="summary_info">
                                                                    <div class="summary_info_box clearfix" style="overflow: auto;height:500px;width:705px">
                                                                        <h3>
                                                                            <a href="#" title="shop_kabi">Title:&nbsp;&nbsp; <span id="title"></span></a>
                                                                        </h3>

                                                                        <div class="summary_info_inside clear" style="height:600px;width:720px">                                	
                                                                            <p><span class="info" style="display:inline;margin-left:0"><strong id="noidung"></strong></span></p>

                                                                        </div>
                                                                        
                                                                    </div>

                                   </div>

                                                  
                             		
                             
                             <br/><br/>
                           
                        </div>
                    </div>

                </div>
                <div class="bottom_box_ucp">
                    <div class="lbottom_box_ucp"></div>
                    <div class="rbottom_box_ucp"></div>
                </div>
            </div>  
       
        </div>
        
			<div class="right_content_shop">            

			 		<%@include file="layout/menuright.jsp" %>               
			</div>	
			</div>
			</div>
	</div>  	<!--End content-->

  	
	
	<!--End content-->
	 <div class="clear"></div>
	 <div id="ad_zone_footer_b1" style="width:960px"></div>
	 <div id="footer">
			
	</div><!--end footer-->
	<!--End footer-->
	 </div>
	 
	
	
	 </body>
</html>