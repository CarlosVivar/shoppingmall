<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.util.List"%>
<%@page import="BUS.*, POJO.*"%>
<%@include file="../library.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add product</title>
<meta name="description" content="ELI Mall Shopping Admin" />
        <meta name="keywords" content="Security" />
        <meta name="robots" content="index, follow" />
        <meta name="google-site-verification" content="3Bga2tEjat0imt15v39N2Wjte0Ufa99a-tU8E-Awq0E" />
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" /> 
        
		 <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="scripts/jquery.validate.pack.js"></script>
        <script type="text/javascript" src="scripts/dateValidator.js"></script>
        <script type="text/javascript" src="../scripts/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../scripts/tiny_mce/tiny_mce.js"></script>
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
				content_css : "../scripts/tiny_mce/css/content.css",
		        // Drop lists for link/image/media/template dialogs
		        template_external_list_url : "../scripts/tiny_mce/js/template_list.js",
				external_link_list_url : "../scripts/tiny_mce/js/link_list.js",
				external_image_list_url : "../scripts/tiny_mce/js/image_list.js"

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
			
			document.uploadform.digits.value = Year+"-"+Month+"-"+Day; //Day +"/"+ Month +"/"+ Year ;
			id=setTimeout("disptime()",1000)
		        
		}
	
                
        var maxWidth=200;
 
      // height to resize large images to

         var maxHeight=170;
 
      // valid file types
 
         var fileTypes=["bmp","gif","png","jpg","jpeg"];

      // the id of the preview image tag

        var outImage="testImg";
 
      // what to display when the image is not valid
 
         var defaultPic="images/adv/britney-spears-blackout-com.jpg";
     

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
</SCRIPT>
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
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="index.html" class="viewmore"><%=LanguegeBUS.getValue("uMANAGE", lang) %> </a>&nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;
	 <a rel="nofollow"  href="product.jsp" class="viewmore"><%=LanguegeBUS.getValue("uPRODUCT", lang) %>T</a>	&nbsp; <img src="css/images/icon-arrow1.gif">&nbsp;		
	 <a rel="nofollow"  href="productform.jsp" class="viewmore">ADD PRODUCT</a></li>							
						
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
						      <li><a href="user.html"><%=LanguegeBUS.getValue("user", lang) %></a></li>
						      <li><a href="<%=ServletUtils.getBaseUrl(request)%>/admin/salemonth.html""><%=LanguegeBUS.getValue("sale", lang) %></a></li>
						      <li class="active"><a href="product.html"><%=LanguegeBUS.getValue("product", lang) %></a></li>
						      <li><a href="order.html"><%=LanguegeBUS.getValue("order", lang) %></a></li>      
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
					<form id="frm" name="frm" method="post">
					
					<div class="box_ucp_inside">

						<h2 class="title"><%=LanguegeBUS.getValue("add", lang) %> &nbsp; <%=LanguegeBUS.getValue("product", lang) %></h2>						
						<div class="creat_shop">
							
							
							<ul id="warning-box" class="warning" style="display:none">
                                <li class="first"> <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font color='red'>"+message+"</font></p>");
				                        }
				                 %>         </li>

                            </ul>
							<h3 class="n1">Product information</h3>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">Product name:</label>

									</div>
									<input id="product_name" name="product_name" type="text" value="" class="register_text_input show_tip required" />
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel">Price:</label>
									</div>
									<input  id="product_price" name="product_price" type="text" value="" class="medium_text_input show_tip required" />
									&nbsp;&nbsp;<select name="product_currency" class="dd required">
										<option value="USD" selected="selected">USD</option>
										<option value="AUD">AUD</option>
										<option value="BRL">BRL</option>
										<option value="GBP">GBP</option>
										<option value="CAD">CAD</option>
										<option value="CZK">CZK</option>
										<option value="DKK">DKK</option>
										<option value="EUR">EUR</option>
										
										<option value="HKD">HKD</option>
				
										<option value="HUF">HUF</option>
										<option value="ILS">ILS</option>
										<option value="JPY">JPY</option>
										<option value="MYR">MYR</option>
										<option value="MXN">MXN</option>
										<option value="NZD">NZD</option>
										<option value="NOK">NOK</option>
										<option value="PHP">PHP</option>
										
										<option value="PLN">PLN</option>
										<option value="SGD">SGD</option>
										<option value="SEK">SEK</option>
										<option value="CHF">CHF</option>
										<option value="TWD">TWD</option>
										<option value="THB">THB</option>
									</select>
								</div>

								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel">Category:</label>
									</div>
									<select style="width:130px "name="selectCatogory" class="yyyy required">
                                                    <option value="0">- Category -</option>
                                                    <%
                                                        List<CategoryChild> listCatogory = CategoryChildBUS.lstCategoryChild(lang);
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
                                   </select>
																		
								</div>			
								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel">Manufacturer:</label>
									</div>
										<select style="width:130px "name="selectManufactural" >
                                                    <option value="0">- Manufacturer -</option>
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
                                       </select>
																		
								</div>			
								<div class="listing_textarea">
									<div class="post_label_container">
										<label class="postLabel">Detail:</label>

									</div>
									<textarea name="shortDescription" id="shortDescription" onKeyUp="javascript:check_teet();" ></textarea>
									
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">Color:</label>

									</div>
									<input id="color" name="color" type="text" value="" class="register_text_input show_tip required" />
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">Size:</label>

									</div>
									<input id="size" name="size" type="text" value="" class="register_text_input show_tip required" />
									
								</div>
							  
							</div>
							
							<div class="line clear"></div>
							<h3 class="n2">Product images</h3>
							<table >
							<tr><td>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">File 01:</label>
									</div>
									<input class="upfile upfile_ultimo" name="upfile0" id="upfile0" onChange="preview(this)" size="30" type="file" class="register_text_input show_tip required">
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">File 02:</label>
									</div>
									<input class="upfile upfile_ultimo" name="upfile0" id="upfile0" onChange="preview(this)" size="30" type="file" class="register_text_input show_tip required">
								</div>
								
								
								
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel">File 03:</label>
									</div>
									<input class="upfile upfile_ultimo" name="upfile1" id="upfile1" onChange="preview(this)" size="30"  type="file" class="register_text_input required show_tip required" >
									
									
								</div>			
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">File 04:</label>
									</div>
									<input class="upfile upfile_ultimo" name="upfile2" id="upfile2" onChange="preview(this)" size="30"  type="file" class="medium_text_input show_tip required number">
									
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel">File 05:</label>
									</div>
									
									<input class="upfile upfile_ultimo" onChange="preview(this)" name="upfile4" id="upfile4" size="30"  type="file" class="medium_text_input show_tip required number">
									
								</div>					
													
							</div>
							</td>
							<td>
							 &nbsp;&nbsp;&nbsp;&nbsp; <img  align="center" id="testImg" name="testImg" alt="View Images"  />  
							</td></tr>
							</table>
							
							<div class="button_listing_input">									
								<input id="cmd_submit" name="cmd_submit" class="btn_submit"  type="submit" value="Submit" />
								<input id="cmd_reset" name="cmd_reset" class="btn_submit"  type="reset" value="Reset" />
							</div>
							<div class="clear"></div>		
						</div>
					</div>
					</form>
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