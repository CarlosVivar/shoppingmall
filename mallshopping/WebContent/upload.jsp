<%@include file="library.jsp" %>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	import="POJO.*,BUS.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=LanguegeBUS.getValue("product", lang) %> &nbsp; <%=LanguegeBUS.getValue("newupload", lang) %></title>
<meta name="Description"
	content="Online Clothing Retailer Wholesale Outlet Korean fashion Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="Keywords"
	content="ELI Shopping Mall | Korea Fashion Famous Fashion Clothing Children party Dam Da Cold Austria Austrian Association of Flight Leather Industry Department">
<meta name="robots" content="INDEX,FOLLOW">
<meta name="Googlebot" content="index,follow,archive">
<meta name="verify-v1"
	content="FFBgLdpbVMyXsynOVfy9zQzLpkphTZbllfq76+TnsAk=" />
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="scripts/js/ttabc.js"></script>

<script type="text/javascript" src="scripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
            tinyMCE.init({
                // General options
                mode : "textareas",
                theme : "advanced",
                plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
                theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,fontsizeselect",
                theme_advanced_buttons2 : "cut,copy,paste,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink|,forecolor,backcolor,",
                theme_advanced_buttons3 :"hr,,removeformat,visualaid,|,sub,sup,|,insertdate,inserttime,charmap,cleanup,image,",
                theme_advanced_toolbar_location : "top",
                theme_advanced_toolbar_align : "left",
                theme_advanced_statusbar_location : "bottom",
                theme_advanced_resizing : true,
                // Example content CSS (should be your site CSS)
				content_css : "scripts/tiny_mce/css/content.css",
		        // Drop lists for link/image/media/template dialogs
		        template_external_list_url : "scripts/tiny_mce/js/template_list.js",
				external_link_list_url : "scripts/tiny_mce/js/link_list.js",
				external_image_list_url : "scripts/tiny_mce/js/image_list.js"

            });
        </script>
<script type="text/javascript">
                function checkproductname(){
                	if(document.uploadform.product_name.value==""){
                		alert('Product Name is not null');
                		return false;
                	}
                	if(document.uploadform.selectCatogory.value=='0'){
                		alert('Please!Choose a catogory');
                		return false;
                	}
                	if(document.uploadform.selectManufactural.value==0){
                		alert('Please!Choose a manufactural');
                		return false;
                	}
                }
                </script>
<script type="text/javascript">
        
        $("#uploadform").validate({
            rules:{
                upfile:{
                    accept:"doc|bmp|png|jpg|jpeg"
                }
                
            }
        });
           </script>
<script type="text/javascript">
            var timeout=500;var closetimer=0;var ddmenuitem=0;function jsddm_open(){jsddm_canceltimer();jsddm_close();ddmenuitem=$(this).find('ul').css('visibility','visible')}function jsddm_close(){if(ddmenuitem)ddmenuitem.css('visibility','hidden')}function jsddm_timer(){closetimer=window.setTimeout(jsddm_close,timeout)}function jsddm_canceltimer(){if(closetimer){window.clearTimeout(closetimer);closetimer=null}}document.onclick=jsddm_close;
            $(document).ready(function() {
            if ('12'.length!=0){$(".category-items li").each(function(){	if ('12'==$(this).attr('k')){$(this).find("a").css('font-weight','bold').css('color','#555555');$(this).parent().show();return false;}})}
            $('.jsddm > li').bind('mouseover', jsddm_open);$('.jsddm > li').bind('mouseout',  jsddm_timer);
            });
        </script>
<SCRIPT language=JavaScript>

			
		function disptime()
		{
		    var now = new Date();
		
			Today =  new Date(now.getFullYear(), now.getMonth(), now.getDate());
				PreDay = now.getDate();
			Day = (PreDay<10 ? "0" : "") + PreDay;
			PreMonth = now.getMonth();
			Month = ((PreMonth+1)<10 ? "0" : "")+ (PreMonth+1);
			Year = now.getFullYear();
			
			document.uploadform.digits.value = Year+"-"+Month+"-"+Day; 
			id=setTimeout("disptime()",1000)
		        
		}
	
                
	
		var i_add=0;
		
		var flag=true;
        var maxWidth=220;
 		
      // height to resize large images to

         var maxHeight=150;
 
      // valid file types
 
         var fileTypes=["bmp","gif","png","jpg","jpeg"];

      // the id of the preview image tag

        var outImage="testImg";
 
      // what to display when the image is not valid
 
        var defaultPic="images/adv/britney-spears-blackout-com.jpg";
     
		var addbutton ="addpictures";
		
      function preview(what)
      {
		
             var source=what.value;
 
             var ext=source.substring(source.lastIndexOf(".")+1,source.length).toLowerCase();
 
      
            for (var i=0; i<fileTypes.length; i++)
            {
            
                if (fileTypes[i]==ext)
                {
                    break;

                }

            }

            globalPic=new Image();

            if (i<fileTypes.length)
            {
                try{
                        globalPic.src=what.files[0].getAsDataURL();
                    }
                    catch(err)
                    {
                        globalPic.src=source;
                    }

            }else 
            {

                globalPic.src=defaultPic;

                alert("THAT IS NOT A VALID IMAGE.Please load an image with an extention of one of the following:"
                +fileTypes.join(", "));
            }

            setTimeout("applyChanges()",200);
            
          //  var upfile0 = $("#upfile0").val();
           // var upfile1 = $("#upfile1").val();
           // var upfile2 = $("#upfile2").val();
            //var upfile3 = $("#upfile3").val();
          //  var upfile4 = $("#upfile4").val();
           // if((upfile0.length!=0)&&(upfile1.length!=0)&&(upfile2.length!=0)&&(upfile3.length!=0)&&(upfile4.length!=0)){
          //	 if(upfile0.length!=0){
        	//   if(flag==true){
        	//    	document.getElementById("addpictures").style.display = 'block';
          	//	flag=false;
          	 // }
            	
            //}
            
		}

 	
    
		function addbuttonPic(){
			
			
           // document.getElementById("addpictures").style.display = 'none';
         
          //  document.getElementById("addpictures"+i_add).style.display = 'block';
            //document.getElementById("newtag"+i_add).style.display = 'block';
            document.getElementById("newtag1"+i_add).style.display = 'block';
         //   document.getElementById("lbfile"+i_add).style.display = 'block';
            //document.getElementById("newtag2"+i_add).style.display = 'block';
           // document.getElementById("newtag3"+i_add).style.display = 'block';
            
            
		//	document.getElementById("newupfile"+i_add).style.display = 'block';
           // if(i_add>0){
           // 	var t=i_add-1;
            //	document.getElementById("addpictures"+t).style.display = 'none';
           // }
            
            i_add++;
           
		}


      var globalPic;

      function applyChanges()
      {
            var field=document.getElementById(outImage);
        
            var x=parseInt(globalPic.width);
 
            var y=parseInt(globalPic.height);

            if (x>maxWidth) 
            {
                y*=maxWidth/x;

                x=maxWidth;

            }

            if (y>maxHeight) 
            {
                x*=maxHeight/y;
 
                y=maxHeight;
            }
 
            field.style.display=(x<1 || y<1)?"none":"";

            field.src=globalPic.src;
 
            field.width=x;
 
            field.height=y;

      }
      $(function(){
          $("#selectCatogory").show();
          $("#selectCatogory1").hide();
        
  	 });  
      var flagnew=0;
    //remove all options from selected box
  	function removeAllOptions(selectedObj) {
  		selectedObj.options.length = 0;
  	}
  	// add new option into existing selected box
  	function addSelectOption(selectObj, text, value, isSelected) {
  	//    if (selectObj != null ) {
  	    	var objOption = document.createElement("option");
  	    	objOption.text = text;
  	    	objOption.value = value;
  	    	objOption.selected = isSelected;
  	        selectObj.options[selectObj.options.length] = objOption;
  	 //  }
  	}
  		function setvalueforcatesub()
  		{
  			flagnew=0;
  		
  			var t = document.getElementById("selectCatogory").value;
  			var d = document.getElementById("selectCatogory1");
  			removeAllOptions(d);
  			addSelectOption(d,"-Catogory Sub-",0,0);
  			$("#selectCatogory1").hide();
  			var th=0;
  			<%
  			 List<CategorySub> listCatogory11 = CategorySubBUS.lstCategorySub((String)session.getAttribute("lang"));// .lstCategoryChild((String)session.getAttribute("lang"));
              if (listCatogory11 != null) {
                  for (int i = 0; i < listCatogory11.size(); i++) {
                  //	for (int i = 0; i < 5; i++) {
                      CategorySub Cato2 = listCatogory11.get(i);
                      String id_CatoChild2= Cato2.getCategoryChildId();
                      %>
                      var ids="<%=id_CatoChild2 %>";
  					 
  					 if(t==ids){
  							$("#selectCatogory1").show();
  						 	var nm="<%= Cato2.getCategorySubName()%>";
  		                    var vl="<%=Cato2.getCategorySubId() %>";
  		                    addSelectOption(d,nm,vl, th);
  		                    th++;
  		                    flagnew++;
  					
  					 }
  				 		
  			 						<% 
                  }
  			 }
              %>
              
  		}
  		  
      function validUpload(){
          $("#validProName").text("");
          $("#validCategory").text("");
          $("#validCategorySub").text(""); //new
          $("#validManufacturer").text("");
          $("#validUpFile").text("");
          var pro_name = $("#product_name").val();
          var category = $("#selectCatogory").val();
          var categorysub = $("#selectCatogory1").val();//new
          var manufactural = $("#selectManufactural").val();
          var upfile0 = $("#upfile0").val();
          //var upfile1 = $("#upfile1").val();
          //var upfile2 = $("#upfile2").val();
         // var upfile3 = $("#upfile3").val();
         // var upfile4 = $("#upfile4").val();
          if(pro_name.length==0){
              $("#validProName").text("Please enter Product Name!!");
              return false;
          }
          if(category==0){
              $("#validCategory").text("Please choose category!!");
              return false;
          }
          //new
          if(flagnew!=0){
        	  if(categorysub==0){
            	  $("#validCategorySub").text("Please choose category sub!!");
                  return false;
              }
          }
          
          //new
          if(manufactural==0){
              $("#validManufacturer").text("Please choose manufactural!!");
              return false;
          }
         // if((upfile0.length==0)&&(upfile1.length==0)&&(upfile2.length==0)&&(upfile3.length==0)&&(upfile4.length==0)){
        	 if(upfile0.length==0){
        	 $("#validUpFile").text("Please choose be least 1 image file!!");
              return false;
          }
         

      }
</SCRIPT>
<style type="text/css">
input1 {
	display: block;
}

.hide1 {
	display: none;
}

.show {
	display: block;
}
</style>
</head>
<body>
	<DIV class="site-container">
		<DIV class="page">

			<!-- ---------Begin Header--------------------- -->
			<DIV class="header">

				<%@include file="WEB-INF/header.jsp"%>
			</DIV>
			<!-- -------------MIDDLE------------- -->
			<DIV class="col3-layout">
				<div class="clear"></div>
				<div style="display: block;" class="ctnAlert">
					<div style="height: 208px;" class="spyWrapper">
						<ul class="ctnAlert_inside spy">

							<li style="height: 26px; opacity: 1; display: block;"><a
								rel="nofollow" href="index.html" class="viewmore"><%=LanguegeBUS.getValue("home", lang) %>
							</a>&nbsp; <img
								src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon-arrow1.gif">&nbsp;
								<a rel="nofollow" href="upload.html" class="viewmore"><%=LanguegeBUS.getValue("upload", lang) %>
									<%=LanguegeBUS.getValue("newproduct", lang) %></a>
							</li>

						</ul>
					</div>
					<a class="closeAlert"><img
						src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif"
						alt="close" width="8" height="8">
					</a>
				</div>
				<div class="clear"></div>
				<!-- -------------Menu left--------------->
				<DIV class="col-left">
					<%@include file="WEB-INF/sellermenu.jsp"%>
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
												<DIV class="corner-right-bot">
													<DIV class="category-title">
														<div class="tube">




															<form id="uploadform" class="cssform" name="uploadform"
																action="uploadController" enctype="multipart/form-data"
																method="post" onsubmit="return validUpload();">

																<%
                        String message = (String) request.getAttribute("Message");
                        if (message != null) {
                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
                        }
                 %>

																<div id="upload_form_values_container">
																	<h2><%=LanguegeBUS.getValue("upload", lang)%>:
																		<%=LanguegeBUS.getValue("newproduct", lang)%></h2>
																	<br />

																	<h3>
																		<font color='red'>- <%=LanguegeBUS.getValue("step", lang)%>
																			1:</font>
																	</h3>
																	<h2><%=LanguegeBUS.getValue("productinfo", lang)%></h2>

																	<table class="sign" border="0" width="620">
																		<tbody>

																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("productname", lang)%>
																				</td>
																				<td><input name="product_name"
																					id="product_name" class="txt" maxlength="147"
																					type="text"></td>
																				<td class="error" id="validProName"></td>
																			</tr>

																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("price", lang)%>
																				</td>
																				<td><input name="product_price" class="txt3"
																					maxlength="15" style="text-align: left;"
																					value="1.00" type="text"> 
																					<select	name="product_currency" class="txt3" disabled="disabled">
																					
																						<option value="USD" <% if(null==lang || lang.length() == 0 || lang.equals("MALL_EN")){ %>selected="selected"  <%} %>>USD</option>
																						<option value="VND"<% if(null!=lang && lang.equals("MALL_VN")){%>selected="selected"  <%}%> >VND</option>
																						<option value="WON"<% if(null!=lang && lang.equals("MALL_KR")){%>selected="selected"  <%}%> >WON</option>
																						
																				</select></td>
																			</tr>
																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("category", lang)%>
																				</td>
																				<td width="108"><label class="carttable">
																						<select style="width: 130px" name="selectCatogory"
																						id="selectCatogory" onchange="setvalueforcatesub()" >
																							<option value="0">
																								-
																								<%=LanguegeBUS.getValue("category", lang)%>
																								-
																							</option>
																							<%
										                                                        List<CategoryChild> listCatogory = CategoryChildBUS.lstCategoryChild((String)session.getAttribute("lang"));
										                                                        if (listCatogory != null) {
										                                                            for (int i = 0; i < listCatogory.size(); i++) {
										                                                                CategoryChild Cato = listCatogory.get(i);
										
										                                                    %>
																							<option value="<%=Cato.getCategoryChildId() %>">
																								<%=Cato.getCategoryChildName() %>
																							</option>
																							<%
                                                            										}
                                                        										}
                                                    										%>
																					</select> </label>
																					&nbsp;&nbsp;
																					<label class="carttable">
																						<select style="width: 150px" name="selectCatogory1"
																						id="selectCatogory1">
																							<option value="0">
																								-
																								<%=LanguegeBUS.getValue("categorysub", lang)%>
																								-
																							</option>
																						
																					</select> </label>
																				</td>
																				<td class="error" ><label id="validCategory"></label><label id="validCategorySub"></label></td>
																			</tr>
																			
																			

																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("manufac", lang)%>
																				</td>
																				<td width="108"><label class="carttable">
																						<select style="width: 130px"
																						name="selectManufactural" id="selectManufactural">
																							<option value="0">
																								-
																								<%=LanguegeBUS.getValue("manufac", lang)%>
																								-
																							</option>
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
																					</select> </label></td>
																				<td class="error" id="validManufacturer"></td>
																			</tr>
																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("pDetail", lang)%>
																				</td>
																				<td><textarea name="shortDescription"
																						id="shortDescription" rows="20" cols="50"
																						onKeyUp="javascript:check_teet();"></textarea>
																				</td>
																			</tr>

																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("color", lang)%>
																				</td>
																				<td><input name="color" class="txt"
																					maxlength=57 " type="text" style="width:150px"></td>
																			</tr>

																			<tr>
																				<td class="label"><%=LanguegeBUS.getValue("size", lang)%>
																				</td>
																				<td><input name="size" class="txt"
																					maxlength="57" type="text" style="width:150px"></td>
																			</tr>


																		</tbody>
																	</table>
																	<h3>
																		<font color='red'>- <%=LanguegeBUS.getValue("step", lang)%>
																			2:</font>
																	</h3>
																	<h2><%=LanguegeBUS.getValue("imageinfo", lang)%></h2>


																	<table class="sign" cellpadding="4" cellspacing="0"		width="620">
																		<tbody>
																			<tr>
																			
																				<td rowspan="2" valign="top" width="58%">
																					<table align="left" class="sign" cellpadding="2"
																						cellspacing="0">
																						<tbody>
																						<tr><td>
																						
																			<table>
																				<tbody>
																							<tr>
																							
																								<td  width="180" align="left" class="label"><%=LanguegeBUS.getValue("file", lang)%>
																									1:</td>

																								<td align="left"><input
																									class="upfile upfile_ultimo"
																									onChange="preview(this)" name="upfile0"
																									id="upfile0" size="30" type="file">
																								</td>
																							
																								
																							</tr>
																				</tbody>
																			</table>
																			</td></tr>
																			<tr><td>
																					<table>
																					<tbody>
																							<%
																							String mylabel="";
																							String mynamefileup="";
																							String btn="";
																							
																							String mytag1="";
																							
																							int ipBegin=0;
																							int ipLong=100;
																							
																								for(int i=ipBegin;i<ipBegin+ipLong;i++){
																									mylabel="lbfile"+i;
																									mynamefileup ="newupfile"+i;
																									btn="addpictures"+i;
																									
																									mytag1="newtag1"+i;
																									
																									
																							%>

																						
																							<tr id="<%=mytag1 %>"
																							 class="hide1"	>
																									<td class="label" align="left"  id="<%=mylabel %>"
																										><%=LanguegeBUS.getValue("file", lang)%>
																										<%=i+2 %>:
																									</td>
	
																									<td align="left">
																									<input 
																										onChange="preview(this)"
																										name="<%=mynamefileup %>"
																										id="<%=mynamefileup %>" size="30" type="file">
	
																									</td>
																							</tr>
																							
																								
																						

																							<%} %>
																							<tr><td align="left" colspan="2">
																									<BUTTON id="addpictures" 
																										name="addpictures" type="button" onclick="addbuttonPic()">
																										<SPAN><SPAN><SPAN>Attach more</SPAN>
																										</SPAN>
																										</SPAN>
																									</BUTTON>
																							</td></tr>
</tbody>
</table>
</td></tr>
																						</tbody>
																					</table>
																				</td>
																																								
																				<td style="height:auto;" valign="top" width="40%">

																					<img  id="testImg" name="testImg"
																					alt="View Images" />
																				</td>
																				
																		</tr>
																			
																		<tr>
																			<td class="error" id="validUpFile"></td>
																			
					
																		</tr>
		

																		</tbody>
																	</table>



																	<!-- h3><font color='red'>- Step 3:</font></h3>
                                <h2>Agreement</h2>
				<table class="formtable" border="0" width="500">
					<tbody><tr>
						<td align="center" valign="top" width="50"><br/><input name="yesgood" value="yesgood" type="checkbox"></td>
						<td valign="top"><strong>I am a good person.</strong> I am not violating any copyright laws. I only upload files to ELIShopping.com that I have full rights to sell and distribute.<br><br></td>
					</tr>
					<tr>
						<td align="center" valign="top" width="50"><input name="yestos" value="yestos" type="checkbox"></td>
						<td valign="top">I agree to the Terms of Service of ELIShopping.com.</td>
					</tr>
				</tbody></table-->
																</div>
																<br /><br />
																<div id="upload_buttons_container">
																
											 						<!--  <button  class="hide1" id="addpictures" name="addpictures"  onclick="addbuttonPic()">Add Picture</button> --> 
																	
																	
					
																	<BUTTON id="upload_button" class="button marginleft110"
																		name="upload_button" type="submit">
																		<SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("upload", lang)%></SPAN>
																		</SPAN>
																		</SPAN>
																	</BUTTON>
																	<BUTTON id="reset_button" class="button marginleft110"
																		name="reset_button" type="reset">
																		<SPAN><SPAN><SPAN><%=LanguegeBUS.getValue("reset", lang) %></SPAN>
																		</SPAN>
																		</SPAN>
																	</BUTTON>
																	<!-- input id="upload_button" name="upload_button" class="uploadbutton" value="Upload" type="submit">
					<input id="reset_button" name="reset_button" class="resetbutton" value="Reset" type="button"-->
																</div>
															</form>
															<div class="footer blog">
																<p>ELI Shopping Mall customer service with fast
																	shipping manner, and can reduce the price to 4% for
																	large orders. Our high quality fashion products from
																	China, Japan, Hong Kong, and Korea. With us, you go
																	shopping confidence because we only offer products of
																	famous brands. For example, the Doreme, Hanee, Moom,
																	Yoko, LY Fashion, Eastsun, Marloca, Miss Milan,
																	Xianwei, Ugo, Vivicam ...</p>
																<p>
																	Sponsorship: One stop complete of <a
																		href="http://fashion4us.com">online fashion</a> for
																	all choices
																</p>
																<p>Copyright 2007-Present One-Dream Fashion Corp.</p>

															</div>
														</DIV>
													</DIV>
												</DIV>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>

				</DIV>

				<!-- -------------Menu right--------------->
				<DIV class="col-right">
					<%@include file="WEB-INF/rightmenu.jsp"%>
				</DIV>

			</DIV>



		</DIV>
	</DIV>

</body>
</html>