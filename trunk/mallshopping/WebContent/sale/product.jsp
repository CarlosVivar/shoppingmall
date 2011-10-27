<%@page contentType="text/html" pageEncoding="UTF-8" import="POJO.*,BUS.*,UTIL.*,DAO.*, java.util.List"%>
<%@include file="../library.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
			String Id = (String)request.getParameter("productId");
  
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
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/datetimepicker_css.js"></script>
		  <script type="text/javascript">
				$(function() {   
				    $("#tabs1").show();
				});
		
				function openPage(path)
	             {
	             		window.location.href = path;
	             }
				
				function onViewSubmit(thisform) { 
					
					// place any other field validations that you require here
        			// validate myradiobuttons
        			myOption = -1;
        			for (i=thisform.productId.length-1; i > -1; i--) {
	        			if (thisform.productId[i].checked) {
	        				myOption = i; i = -1;
	        			}
        			}
        			if (myOption == -1) {
	        			alert("<%=LanguegeBUS.getValue("selectitems", lang) %>");
	        			return false;
        			}
					// place any other field validations that you require here
        			thisform.submit(); // this line submits the form after validation
					
					
        		} 
        		
        		
         </script>
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/tiny_mce/tiny_mce.js"></script>
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
	
                
	
		var i_add=1;
		
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

            //setTimeout("applyChanges()",200);
            
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
          $("#selectCategory").show();
          $("#selectCategoryChild").hide();
          $("#selectCategorySub").hide();
          $("#selectCate").show();
          $("#selectChild").hide();
          $("#selectSub").hide();
          document.getElementById("product_name").focus();
        
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
  		function setCatechild()
  		{
  			flagnew=0;
  		
  			var t = document.getElementById("selectCategory").value;
  			var d = document.getElementById("selectCategoryChild");
  			removeAllOptions(d);
  			addSelectOption(d,"-<%=LanguegeBUS.getValue("categorychild", lang)%>-",0,0);
  			$("#selectCategoryChild").hide();
  			var th=0;
  			<%
  			 List<CategoryChild> listChild = CategoryChildBUS.lstCategoryChild(lang);
              if (listChild != null) {
                  for (int i = 0; i < listChild.size(); i++) {
                  //	for (int i = 0; i < 5; i++) {
                      CategoryChild Cato2 = listChild.get(i);
                      String id_CatoChild2= Cato2.getCategoryId();
                      %>
                      var ids="<%=id_CatoChild2 %>";
  					 
  					 if(t==ids){
  							$("#selectCategoryChild").show();
  						 	var nm="<%= Cato2.getCategoryChildName()%>";
  		                    var vl="<%=Cato2.getCategoryChildId() %>";
  		                    addSelectOption(d,nm,vl, th);
  		                    th++;
  		                    flagnew++;
  					 }
  				 		
  			<% 
                  }
  			 }
              %>
              
  		}
  		 var flagnew1=0;      
  		function setCatesub()
  		{
  			flagnew1=0;
  		
  			var t = document.getElementById("selectCategoryChild").value;
  			var d = document.getElementById("selectCategorySub");
  			removeAllOptions(d);
  			addSelectOption(d,"-<%=LanguegeBUS.getValue("categorysub", lang)%>-",0,0);
  			$("#selectCategorySub").hide();
  			var th=0;
  			<%
  			 List<CategorySub> listSub = CategorySubBUS.lstCategorySub(lang);
              if (listSub != null) {
                  for (int i = 0; i < listSub.size(); i++) {
                  //	for (int i = 0; i < 5; i++) {
                      CategorySub Cato2 = listSub.get(i);
                      String id_CatoChild2= Cato2.getCategoryChildId();
                      %>
                      var ids="<%=id_CatoChild2 %>";
  					 
  					 if(t==ids){
  							$("#selectCategorySub").show();
  						 	var nm="<%= Cato2.getCategorySubName()%>";
  		                    var vl="<%=Cato2.getCategorySubId() %>";
  		                    addSelectOption(d,nm,vl, th);
  		                    th++;
  		                    flagnew1++;
  					
  					 }
  				 		
  			<% 
                  }
  			 }
              %>
              
  		}
              
  		function add_Child()
  		{
  			flagnew=0;
  		
  			var t = document.getElementById("selectCate").value;
  			var d = document.getElementById("selectChild");
  			removeAllOptions(d);
  			addSelectOption(d,"-<%=LanguegeBUS.getValue("categorychild", lang)%>-",0,0);
  			$("#selectChild").hide();
  			var th=0;
  			<%
  			 List<CategoryChild> listChild1 = CategoryChildBUS.lstCategoryChild(lang);
              if (listChild1 != null) {
                  for (int i = 0; i < listChild1.size(); i++) {
                  //	for (int i = 0; i < 5; i++) {
                      CategoryChild Cato2 = (CategoryChild)listChild1.get(i);
                      String id_CatoChild2= Cato2.getCategoryId();
                      %>
                      var ids="<%=id_CatoChild2 %>";
  					 
  					 if(t==ids){
  							$("#selectChild").show();
  						 	var nm="<%= Cato2.getCategoryChildName()%>";
  		                    var vl="<%=Cato2.getCategoryChildId() %>";
  		                    addSelectOption(d,nm,vl, th);
  		                    th++;
  		                    flagnew++;
  					 }
  				 		
  			<% 
                  }
  			 }
              %>
              
  		}
  		 var flagnew1=0;      
  		function add_Sub()
  		{
  			flagnew1=0;
  		
  			var t = document.getElementById("selectChild").value;
  			var d = document.getElementById("selectSub");
  			removeAllOptions(d);
  			addSelectOption(d,"-<%=LanguegeBUS.getValue("categorysub", lang)%>-",0,0);
  			$("#selectSub").hide();
  			var th=0;
  			<%
  			 List<CategorySub> listSub1 = CategorySubBUS.lstCategorySub(lang);
              if (listSub1 != null) {
                  for (int i = 0; i < listSub1.size(); i++) {
                  //	for (int i = 0; i < 5; i++) {
                      CategorySub Cato2 = (CategorySub)listSub1.get(i);
                      String id_CatoChild2= Cato2.getCategoryChildId();
                      %>
                      var ids="<%=id_CatoChild2 %>";
  					 
  					 if(t==ids){
  							$("#selectSub").show();
  						 	var nm="<%= Cato2.getCategorySubName()%>";
  		                    var vl="<%=Cato2.getCategorySubId() %>";
  		                    addSelectOption(d,nm,vl, th);
  		                    th++;
  		                    flagnew1++;
  					
  					 }
  				 		
  			<% 
                  }
  			 }
              %>
              
  		}      
  		function formatPrice(price){
  			var temp="";
	        	var i;
	        	for(i=price.length;i>=3;i-=3){					
	        		temp=price.substring(i-3,i)+"."+temp;
				
	        	}
			if(i!=0){
				temp=price.substring(0,i)+"."+temp;
	        
			}
  			return temp.substring(0,temp.length-1);
  		}
  		function isNumeric(evt)
  	    {
  			var priceHidden=$("#product_price_hidden").val();
  			
  			if(priceHidden.length<9){
  	        var key = (evt.which) ? evt.which : window.event.keyCode;
  	        var alphaExp;
  	        <%if("MALL_EN".equals(lang)){%>
  	     	 	alphaExp= /^[0-9\.]+$/;
  	        <%}else{%>
  	      		alphaExp= /^[0-9]+$/;
  	        <%}%>
  	        var keyChar = String.fromCharCode(key);
  	        if (keyChar.valueOf().match(alphaExp)){
  	        	//alert("match");
  	        	var price=$("#product_price").val();
  	        	var price = price.replace(/\./g, "");	
  	  			price=price+keyChar;
  	  			if(price.length>3){
  	  				price=formatPrice(price);
  	  				$("#product_price").val(price);
  	  			}else if(price.length<=3){
  	  				$("#product_price").val(price);
  	  			}
  	            
  	        }else{
  	     	var backs=/[\b]/g;  
  	     	var price=$("#product_price").val();
  	     	
  	     	if(keyChar.valueOf().match(backs) && price.length>0){
  	     		  		
  	      		var price = price.replace(/\./g, "");	
	  			price=price.substring(0,price.length-1);
  	      		if(price.length>3){
					price=formatPrice(price);
					$("#product_price").val(price);
				}
  	      		else{
  	      			$("#product_price").val(price);
  	      		}
  	      	}
  	     	}
  	        var price=$("#product_price").val();
  	        price=price.replace(/\./g,"");
  	    	$("#product_price_hidden").val(price);
  			}
  	      	return false;
  	     
  	    }
  		function validUpload(thisform){
            $("#validProName").text("");
            $("#validCategory").text("");
            $("#validCategorySub").text(""); //new
            $("#validManufacturer").text("");
            $("#validUpFile").text("");
            $("#validOrigin").text("");
            $("#validProducttype").text("");
            $("#validPeriod").text("");
            var pro_name = $("#product_name").val();
            var category = $("#selectCategory").val();
            var categorysub = $("#selectCategorySub").val();//new
            var categorychild = $("#selectCategoryChild").val();//new
            var manufac = $("#selectManufactural").val();
            var upfile0 = $("#upfile0").val();
            var origin = $("#origin").val();
            var pType = $("#productType").val();
            var vPeriod = $("#validityPeriod").val();
            var price=$("#product_price_hidden").val();
            
            if(category==0){
                $("#validCategory").text("<%=LanguegeBUS.getValue("valid_cate", lang) %>");
                document.getElementById("selectCategory").focus();
                return false;
            }
            //new
            if(flagnew!=0){
          	  if(categorychild==0){
              	  $("#validCategoryChild").text("<%=LanguegeBUS.getValue("valid_child", lang) %>");
              	  document.getElementById("selectCategoryChild").focus();
                    return false;
                }
            } 
            if(flagnew1!=0){
          	  if(categorysub==0){
              	  $("#validCategorySub").text("<%=LanguegeBUS.getValue("valid_sub", lang) %>");
              	  document.getElementById("selectCategorySub").focus();
                    return false;
                }
            }
            if(pro_name.length==0){
                $("#validProName").text("<%=LanguegeBUS.getValue("valid_productname", lang) %>");
                document.getElementById("product_name").focus();
                return false;
            }
            
            <%if("MALL_EN".equals(lang)){%>
         	 if(price.length==0||isNaN(price)){
         		$("#validProduct_price").text("<%=LanguegeBUS.getValue("", lang) %>price:1.93");
         		document.getElementById("product_price").focus();
        	 	return false;
         	 }
          <%}else{%>
         	 if(price.length==0||isNaN(price)){
         		$("#validProduct_price").text("( 1000000)");
        		 document.getElementById("product_price").focus();
      	 		return false;
       		 }
          <%}%>
            //new
            if(manufac==0){
                $("#validManufacturer").text("<%=LanguegeBUS.getValue("valid_manufac", lang) %>");
                document.getElementById("selectManufactural").focus();
                return false;
            }
            if(origin==0){
  	              $("#validOrigin").text("<%=LanguegeBUS.getValue("valid_orgin", lang) %>");
  	              document.getElementById("origin").focus();
  	              return false;
  	       }
            
             	     
  	       if(pType==0){
  	              $("#validProducttype").text("<%=LanguegeBUS.getValue("valid_producttype", lang) %>");
  	              document.getElementById("productType").focus();
  	              return false;
  	       }
                       
  	  		// place any other field validations that you require here
			// validate myradiobuttons
			myOption = -1;
			for (i=thisform.de_CostID.length-1; i > -1; i--) {
    			if (thisform.de_CostID[i].checked) {
    				myOption = i; i = -1;
    			}
			}
			if (myOption == -1) {
				$("#validDelivery").text("Select a delivery!!!");
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
<body id="travel">
	 <div id="wrapper"> 
	
	<div id="header">
			<%@include file="layout/header.jsp" %>
	 </div> <!--end header-->
	
	<div id="content">
		<div style="display: block;" class="ctnAlert">	
	 <div style="height: 208px;" class="spyWrapper">
	 <ul class="ctnAlert_inside spy">
	 
	 <li style="height: 26px; opacity: 1; display: block;"><a rel="nofollow"  href="#" class="viewmore"><%=LanguegeBUS.getValue("manage", lang) %>/<%=LanguegeBUS.getValue("upload", lang) %></a>
	 </li>					
	</ul></div>
	<a class="closeAlert"><img src="<%=ServletUtils.getBaseUrl(request)%>/admin/css/images/icon_closeAlert.gif" alt="close" width="8" height="8"></a></div>
	
	  <br/>
	<div class="bottom_userCPanel">
		<p class="sumMoney"><label><%=LanguegeBUS.getValue("manage", lang) %>/<%=LanguegeBUS.getValue("upload", lang) %></label></p>
			<p>&nbsp;</p>
			<p><%=LanguegeBUS.getValue("pmanual", hlang)%></p>
			
		<div class="clear"></div>
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
                        <h2 class="title"><%=LanguegeBUS.getValue("manage", lang) %>/<%=LanguegeBUS.getValue("upload", lang) %></h2>
                        <form action="<%=ServletUtils.getBaseUrl(request)%>/sellerProductController"	method="post">
											<table class=table_deli border="0" cellpadding="0"	style="width: 705px;  cellspacing="0">
												<tbody>
													<tr>
														<td colspan="4" style="text-align:right;">
																<BUTTON class="button" type="submit" name="btnSearch" value="search">
																<%=LanguegeBUS.getValue("deli_view", lang)%>
															</BUTTON></td>
													</tr>
													<tr>
														<td class="bg_criteria_search" style="text-align:right;"><%=LanguegeBUS.getValue("category", lang)%></td>
														<td style="text-align: left;" colspan="3">
															<select style="width:130px" name="selectCate" id="selectCate" onchange="add_Child()" class="yyyy required">
			                                                    <option value="0">- <%=LanguegeBUS.getValue("category", lang)%> -</option>
			                                                    <%
			                                                        List<Category> listCate1 = CategoryBUS.lstCategory(lang);
			                                                        if (listCate1 != null) {
			                                                            for (int i = 0; i < listCate1.size(); i++) {
			                                                                Category cate1 = (Category)listCate1.get(i);
			
			                                                    %>                                           
			                                                    <option value="<%=cate1.getCategoryId() %>">
			                                                        <%=cate1.getCategoryName() %>
			                                                    </option>      
			                                                    <%
			                                                            }
			                                                        }
							                                    %> 
						                                   </select>
						                                  
															
															<select style="width: 150px" name="selectChild" id="selectChild" onchange="add_Sub()" class="yyyy required">
																<option value="0"> -<%=LanguegeBUS.getValue("categorychild", lang)%>-</option>
																												
															</select>
						                                   
															
															<select style="width: 150px" name="selectSub" id="selectSub" class="yyyy required">
																<option value="0"> -<%=LanguegeBUS.getValue("categorysub", lang)%>-</option>
																												
															</select>		
														</td>

													</tr>
													<tr>
														<td class="bg_criteria_search" style="text-align:right;">
															<select id="selectCode"	name="selectCode" style="width: 100px">
																<option value="1"><%=LanguegeBUS.getValue("productname", lang)%></option>
																<option value="2"><%=LanguegeBUS.getValue("productid", lang)%></option>
																																
															</select>
														</td>
														<td style="text-align: left;"><input type="text" style="width: 200px" name="txtSearch"></td>
														<td class="bg_criteria_search" style="text-align:right;"><%=LanguegeBUS.getValue("upload", lang)%> <%=LanguegeBUS.getValue("date", lang)%></td>
														<td style="text-align: left;">
															 <%=LanguegeBUS.getValue("from", lang)%>:<input
															type="text" name="fromDate" id="fromDate"
															style="width: 70px" /> <a
															href="javascript:NewCssCal('fromDate','yyyymmdd')"> <img
																src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																width="14" height="15" alt=""> </a> &nbsp;<%=LanguegeBUS.getValue("to", lang)%>:<input
															type="text" name="toDate" id="toDate"
															title="Input Exp Date" style="width: 70px" /> <a
															href="javascript:NewCssCal('toDate','yyyymmdd')"> <img
																src="<%=ServletUtils.getBaseUrl(request)%>/admin/scripts/datetimepicker/images/cal.gif"
																width="14" height="15" alt=""> </a>
														</td>
														
														
													</tr>
													
												</tbody>
											</table>
							</form>
                    <form id="viewForm" name="viewForm" action="<%=ServletUtils.getBaseUrl(request)%>/sale/product.jsp" method="post" >    						
                        <div id="usual2">
                            <ul class="tab">

                                <!--li><a rel="tabs1" class="selected" href="#tabs1"><span>All Items</span></a></li-->
                                <!--li><a rel="tabs2" href="#tabs1"><span>Sale items</span></a></li-->
                                <!--li><a rel="tabs3" href="#tabs1"><span>Delete items</span></a></li-->     
                                
                                <!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
                            </ul>
                            <div style="overflow: auto;height:250px;width:705px">
                            <table  id="tabs1" class="table_ucp" border="0" cellpadding="0" cellspacing="0" width="730">
                                <tbody><tr>
                                	<td class="lstitle" width="10">&nbsp;</td>	
                                	<td class="lstitle" width="50"><%=LanguegeBUS.getValue("no.", lang) %></td>	
                                	<td class="lstitle" width="100"><%=LanguegeBUS.getValue("category", lang) %></td>	
                                    <td class="lstitle" width="250"><%=LanguegeBUS.getValue("title", lang) %></td>
                                  	
                                    <td class="lstitle" width="80"> <%=LanguegeBUS.getValue("date", lang) %></td>
                                    <td class="lstitle" width="100"> <%=LanguegeBUS.getValue("producttype", lang) %></td>
                                    <td class="lstitle" width="100"> <%=LanguegeBUS.getValue("origin", lang) %></td>
                                    <td class="lstitle" width="80"><%=LanguegeBUS.getValue("price", lang) %> <br>(<%=LanguegeBUS.getValue("dolar", lang) %>)</td>
                                    
                                </tr>
                               
					                <%
					                	User user = (User)UserBUS.getUser((String)session.getAttribute("username"),lang);
					                    List<Products> ds = (List<Products>) ProductBUS.lstProduct(user, lang) ;
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
                               					Origin o = OriginBUS.getOrigin(p.getOriginId(),lang);
                               					Producttype pt = ProducttypeBUS.getProducttype(p.getProductTypeId(), lang); 
                               		%>
                               		<tr class="order_row" onmouseover="this.style.backgroundColor='#FFEBDA'" 
                               					onmouseout="this.style.backgroundColor='#FFFFFF'" onmousedown="this.style.backgroundColor='#FFEBDA'" >
                               			<td class="nonSearch"> <input name="productId" id="productId" type="radio" value="<%=p.getProductId()%>">   </td>
                               			<td class="nonSearch"> <%=p.getProductId()%>    </td>
                               			<td class="nonSearch" style="text-align:left"><%if(null!=cc){%><%=cc.getCategoryChildName() %><%}%></td>
                               			<td class="nonSearch" style="text-align:left"><%=p.getProductName()%></td>
       
                               			<td class="nonSearch"><%=p.getUploadDate()%></td>
                               			<td class="nonSearch" style="text-align:left"><%=pt.getProductTypeName()%></td>
                               			<td class="nonSearch" style="text-align:left"><%=o.getOriginName()%></td>
                               			<td class="nonSearch" style="text-align:right;"><%=p.getPrice()%></td>
                               			
                               		</tr>	
                               		<%			
                               				}
                               			
									%>
                                   
                                    <%} %>
                             </tbody></table>
                             </div><br>
                             
                            
                           
                        </div>    
                         <br>
                         <%
				                        String message = (String) request.getAttribute("Message");
				                        if (message != null) {
				                            out.println("<p align='center'><font size='2pt' color='red'>"+message+"</font></p><br>");
				                        }
				         %>         
                          <ul class="tab">

                                <li><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/upload.html" ><span><%=LanguegeBUS.getValue("newupload", lang)%></span></a></li>
                                <li><a href="<%=ServletUtils.getBaseUrl(request)%>/sale/upload.html" ><span><%=LanguegeBUS.getValue("copy_upload", lang)%></span></a></li>
                                <li><a href="" class="selected" onclick="onViewSubmit(viewForm);return false;"><span><%=LanguegeBUS.getValue("edit_upload", lang)%></span></a></li>     
                                
                                <!--li style="float: right ! important;"><a href="productform.html"><span></span></a></li-->
                            </ul>
                     </form>     
					<% Products p = ProductBUS.getProducts(Integer.parseInt(Id),lang); 
						CategoryChild cc = CategoryChildBUS.getCategoryChild(p.getCategoryChildId(), lang);
					%>
                       	 <br>
                          <ul class="tab">

                                <li style="margin-bottom:5px">
                                
									<table>
										<tr>
											<td>ID:</td>
											<td><input id="product_id" name="product_id" type="text" disabled="disabled" value="<%=p.getProductId() %>" style="width:80px" class="register_text_input show_tip required" /></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp; <%=LanguegeBUS.getValue("productname", lang)%>:</td>
											<td><input disabled="disabled" id="product_title" name="product_title" value="<%=p.getProductName() %>" type="text"  style="width:350px" class="register_text_input show_tip required" /></td>
										</tr>
									</table>
								
                                </li>
                              
                            </ul> 					
						<form id="uploadform" name="uploadform"  action="<%=ServletUtils.getBaseUrl(request)%>/uploadController" enctype="multipart/form-data"	
														method="post" onsubmit="return validUpload(uploadform);">
						<div class="creat_shop">
							
							
							<ul id="warning-box" class="warning" style="display:none">
                                <li class="first"> </li>

                            </ul>
                            <br/>
							<h3 class="n1"><%=LanguegeBUS.getValue("category", lang)%></h3>
							<div class="group_listing_input">
								<div class="listing_input hgauto">
									<div class="post_label_container" >
										<label  class="postLabel"><%=LanguegeBUS.getValue("category", lang)%>:</label>
									</div>
									<select style="width:130px" name="selectCategory" id="selectCategory" onchange="setCatechild()" class="yyyy required">
                                                    <option value="0">- <%=LanguegeBUS.getValue("category", lang)%> -</option>
                                                    <%
                                                        List<Category> listCate = CategoryBUS.lstCategory(lang);
                                                        if (listCate != null) {
                                                            for (int i = 0; i < listCate.size(); i++) {
                                                                Category cate = (Category)listCate.get(i);
                                                                

                                                    %>                                           
                                                    <option value="<%=cate.getCategoryId() %>" <%if(cc.getCategoryId().equals(cate.getCategoryId())){%>selected="selected"<%}%>>
                                                        <%=cate.getCategoryName() %>
                                                    </option>      
                                                    <%
                                                            }
                                                        }
                                                    %> 
                                   </select>
                                   <span class="error" id="validCategory" style="border:none;"></span>	
									
									<select style="width: 150px" name="selectCategoryChild" id="selectCategoryChild" onchange="setCatesub()" class="yyyy required">
										<option value="0"> -<%=LanguegeBUS.getValue("categorychild", lang)%>-</option>
										<% if(cc != null){ %>
													<%
														Category c = CategoryBUS.getCategory(cc.getCategoryId(),lang);
                                                        List<CategoryChild> lstChild = CategoryChildBUS.lstCategoryChild(c,lang);
                                                        if (lstChild != null) {
                                                            for (int i = 0; i < lstChild.size(); i++) {
                                                                CategoryChild cc1 = (CategoryChild)lstChild.get(i);
                                                                

                                                    %>                                           
                                                    <option value="<%=cc1.getCategoryChildId() %>" <%if(cc1.getCategoryChildId().equals(cc.getCategoryChildId())){%>selected="selected"<%}%>>
                                                        <%=cc1.getCategoryChildName() %>
                                                    </option>      
                                                    <%
                                                            }
                                                        }
                                                    %> 
											
										<%} %>												
									</select>
                                   <span class="error" id="validCategoryChild" style="border:none;"></span>	
									
									<select style="width: 150px" name="selectCategorySub" id="selectCategorySub" class="yyyy required">
										<option value="0"> -<%=LanguegeBUS.getValue("categorysub", lang)%>-</option>
										<%  String subId = (String)p.getCategorySubId();
											if(null!=subId && !subId.isEmpty()){ 
											CategorySub sub = (CategorySub)CategorySubBUS.getCategorySub(p.getCategorySubId(), lang);
										
										%>
											<script type="text/javascript">
												 $(function(){
											          $("#selectCategorySub").show();
											  	 });  
											</script>
											<%
														
                                                        List<CategorySub> lstSub = CategorySubBUS.lstCategorySub(cc,lang);
                                                        if (lstSub != null) {
                                                            for (int i = 0; i < lstSub.size(); i++) {
                                                                CategorySub sub1 = (CategorySub)lstSub.get(i);
                                                                

                                                    %>                                           
                                                    <option value="<%=sub1.getCategorySubId() %>" <%if(sub1.getCategorySubId().equals(sub.getCategorySubId())){%>selected="selected"<%}%>>
                                                        <%=sub1.getCategorySubName() %>
                                                    </option>      
                                                    <%
                                                            }
                                                        }
                                            %> 
											
										<%} %>													
									</select>		
									
									<span class="error" id="validCategorySub" style="border:none;"></span>							
								</div>			
								</div>
								<div class="line clear"></div>
								<h3 class="n2"><%=LanguegeBUS.getValue("productinfo", lang)%></h3>
							<div class="group_listing_input">
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("productname", lang)%>:</label>

									</div>
									<input id="product_name" name="product_name" type="text" value="<%=p.getProductName()%>" style="width:350px" class="register_text_input show_tip required" />
									<span class="error" id="validProName" style="border:none;"></span>
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("price", lang)%>:</label>
									</div>
									<input type="hidden" id="product_price_hidden" name="product_price" value="<%=p.getPrice() %>"/>
									<input  id="product_price"  onkeypress="return isNumeric(event)"  type="text" value="<%if("MALL_VN".equals(lang)){%><%=ResourcesDefault.priceVNFormat(p.getPrice())%><%}else{%><%=p.getPrice() %><%} %>" style="width:150px" class="medium_text_input show_tip required" />
									&nbsp;&nbsp;(<%=LanguegeBUS.getValue("dolar",lang) %>)
										<span class="error" id="validProduct_price" style="border:none;"></span>
										
									
								</div>
								<div class="listing_input">
									<div class="post_label_container">

										<label class="postLabel"><%=LanguegeBUS.getValue("amount", lang)%>:</label>
									</div>
									<input  id="product_amount" name="product_amount" type="text" value="<%=p.getAmount() %>"  style="width:70px" class="medium_text_input show_tip required" /> &nbsp;
									(<%=LanguegeBUS.getValue("dvt", lang)%>)
									
									
								</div>	
								
								<div class="listing_input hgauto">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("validity_period", lang)%>:</label>
									</div>
										<select style="width:80px" name="validityPeriod" id="validityPeriod">
													<option value="0">--<%=LanguegeBUS.getValue("select", lang)%>--</option>
                                                    <option value="7">1 <%=LanguegeBUS.getValue("week", lang)%></option>
                                                    <option value="15">2 <%=LanguegeBUS.getValue("week", lang)%></option>
                                                    <option value="7">1 <%=LanguegeBUS.getValue("month", lang)%></option>
                                                    <option value="7">2 <%=LanguegeBUS.getValue("month", lang)%></option>
                                                    <option value="7">3 <%=LanguegeBUS.getValue("month", lang)%></option>
                                                    <option value="7">6 <%=LanguegeBUS.getValue("month", lang)%></option>
                                                    <option value="7">1 <%=LanguegeBUS.getValue("year", lang)%></option>
                                                    <option value="7">2 <%=LanguegeBUS.getValue("year", lang)%></option>
                                       </select>
											
										<%
											List<Inventory> lstIn = InventoryDAO.lstInvenProductId(p, lang);
											if(null != lstIn && !lstIn.isEmpty()){
												Inventory it = (Inventory)lstIn.get(0);
											
										%>
											&nbsp; (<%=LanguegeBUS.getValue("expDate", lang)%>: <b><%=it.getLimitDate()%></b>) <input name="expDate"  type="hidden"  value="<%=it.getLimitDate()%>">			
										<%} %>
										<span class="error" id="validPeriod" style="border:none;"></span>						
								</div>		
																
								<br>
								<div class="listing_textarea">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("pDetail", lang)%>:</label>

									</div>
									<textarea name="shortDescription" id="shortDescription" ><%=p.getDetail() %></textarea>
									
									
								</div>
								<br>
								<br>
								<table>
									<tr>
										<td width="50%" style="text-align:left;border:none;">
										<div class="info_profile_inside">
											<div class="listing_input hgauto">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("manufac", lang)%>:</label>
												</div>
													<select style="width:130px" name="selectManufactural" id="selectManufactural">
			                                                    <option value="0">- <%=LanguegeBUS.getValue("manufac", lang)%> -</option>
			                                                    <%
			                                                        List<Manufacturer> listManu = ManufacturerBUS.lstManufacturer(lang);
			                                                        if (listManu != null) {
			                                                            for (int i = 0; i < listManu.size(); i++) {
			                                                                Manufacturer Manu = listManu.get(i);
			
			                                                    %>                                           
			                                                    <option value="<%=Manu.getManufacturerId()%>" <%if(p.getManufacturerId()==Manu.getManufacturerId()){%>selected="selected"<%}%> > 
			                                                        <%=Manu.getManufacturerName()%>
			                                                    </option>      
			                                                    <%
			                                                            }
			                                                        }
			                                                    %> 
			                                       </select>
													<span class="error" id="validManufacturer" style="border:none;"></span>									
											</div>		
										 </div>
										</td>
										<td style="text-align:left;border:none;">
										  <div class="info_profile_inside">
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("origin", lang)%>:</label>
			
												</div>
												<select style="width:130px "name="origin" id="origin">
			                                          <option value="0">- <%=LanguegeBUS.getValue("origin", lang)%> -</option>
			                                                    <%
			                                                        List<Origin> lstOrigin = (List<Origin>)OriginBUS.lstOrigin(lang);
			                                                        if (lstOrigin != null) {
			                                                            for (int i = 0; i < lstOrigin.size(); i++) {
			                                                            	Origin o = lstOrigin.get(i);
			
			                                                    %>                                           
			                                          <option value="<%=o.getOriginId() %>" <%if(p.getOriginId()==o.getOriginId()){%>selected="selected"<%}%> > <%=o.getOriginName() %>  </option>      
			                                                    <%
			                                                            }
			                                                        }
			                                                    %> 
			                                       </select>
			                                       <span class="error" id="validOrigin" style="border:none;"></span>
											</div>
											</div>
										</td>
									</tr>
									<tr>
										<td style="text-align:left;border:none;">
										<div class="info_profile_inside">
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("color", lang)%>:</label>
			
												</div>
												<input id="color" name="color" style="width:150px" type="text" value="<%=p.getColor() %>" class="register_text_input show_tip required" />
												
											</div>
										</div>	
										</td>
										<td style="text-align:left;border:none;">
										<div class="info_profile_inside">
											<div class="listing_input">
												<div class="post_label_container">
													<label class="postLabel"><%=LanguegeBUS.getValue("size", lang)%>:</label>
			
												</div>
												<input id="size" name="size" style="width:120px" type="text" value="<%=p.getSize() %>" class="register_text_input show_tip required" />
												
											</div>
										</div>	
										</td>
									</tr>
									<tr>
										<td style="text-align:left;border:none;">
										<div class="info_profile_inside">
											<div class="listing_input">
													<div class="post_label_container">
														<label class="postLabel"><%=LanguegeBUS.getValue("producttype", lang)%>:</label>
				
													</div>
													<select style="width:130px "name="productType" id="productType">
				                                          <option value="0">- <%=LanguegeBUS.getValue("producttype", lang)%> -</option>
				                                                    <%
				                                                        List<Producttype> lstPT = (List<Producttype>)ProducttypeBUS.lstProducttype(lang);
				                                                        if (lstPT != null) {
				                                                            for (int i = 0; i < lstPT.size(); i++) {
				                                                            	Producttype pt = lstPT.get(i);
				
				                                                    %>                                           
				                                          <option value="<%=pt.getProductTypeId() %>" <%if(p.getProductTypeId()==pt.getProductTypeId()){%>selected="selected"<%}%> > <%=pt.getProductTypeName() %>  </option>      
				                                                    <%
				                                                            }
				                                                        }
				                                                    %> 
				                                       </select>
				                                       <span class="error" id="validProducttype" style="border:none;"></span>
												</div>
											</div>	
										</td>
										<td style="text-align:left;border:none;"> &nbsp; </td>
									</tr>
								</table>	 	
							  
							</div>
							
							<div class="line clear"></div>
							<h3 class="n3"><%=LanguegeBUS.getValue("imageinfo", lang)%></h3>
							<table >
							<tr><td>
							<div class="group_listing_input">
								<%
								int currentPhotosSize=0;
								
								List<Productphotos> currentPhotos=ProductPhotoBUS.lstProductPhotoAll(p, lang);
								if(currentPhotos!=null){
									for(int i=1;i<=currentPhotos.size();i++){
										
										%>
										<br>
										<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("file", hlang)%> <%=i%>:</label>
									</div>
									<input class="register_text_input show_tip required" onChange="preview(this)" name="upfile0"  size="30" type="file" >
									
								</div>
									<%}
									currentPhotosSize=currentPhotos.size();
								}else{
								%>
								<div class="listing_input">
									<div class="post_label_container">
										<label class="postLabel"><%=LanguegeBUS.getValue("file", hlang)%> 1:</label>
									</div>
									<input class="register_text_input show_tip required" onChange="preview(this)" name="upfile0" id="upfile0" size="30" type="file" >
									
								</div>
								currentPhotosSize=1;			
							<%}
								int ipBegin=1;
								int ipLong=100;
									String mylabel="";
									String mynamefileup="";
									String btn="";
									String mytag1="";
									
																							
									for(int i=ipBegin;i<ipBegin+ipLong;i++){
											mylabel="lbfile"+i;
											mynamefileup ="newupfile"+i;
											btn="addpictures"+i;
																									
											mytag1="newtag1"+i;
																									
																									
							%>
								
								<div  id="<%=mytag1 %>" class="hide1">
									<br/>
									<div class="post_label_container" id="<%=mylabel %>">
										<label class="postLabel"><%=LanguegeBUS.getValue("file", hlang)%> <%=i+currentPhotosSize%>:</label>
									</div>
									<input class="register_text_input show_tip required" onChange="preview(this)" name="<%=mynamefileup %>" id="<%=mynamefileup %>" size="30" type="file">
									
								</div>
								
						
							<%} %>
							</div>
							<div class="button_listing_input">	
								<BUTTON class="button" id="addpictures" name="addpictures" type="button" value="Attach more" onclick="addbuttonPic()">
				                        <SPAN><SPAN><SPAN>&nbsp;&nbsp; <%=LanguegeBUS.getValue("attachmore", hlang)%> &nbsp;&nbsp;</SPAN></SPAN></SPAN>
				                    </BUTTON>								
								
								
							</div>
							</td>
							<!-- <td>
							 &nbsp;&nbsp;&nbsp;&nbsp; <img  id="testImg" name="testImg" alt="View Images"  />  
							</td> --></tr>
							</table>
							<div class="line clear"></div>
							<h3 class="n3"><%=LanguegeBUS.getValue("deliver", lang)%></h3>
							<div class="group_listing_input">
								<div class="listing_input hgauto">
									<div class="post_label_container" >
										<label  class="postLabel"><%=LanguegeBUS.getValue("de_cost_deliver_cost", lang)%>:</label>
									</div>
									<label class="error" id="validDelivery"></label>
									<table class="table_deli_cost" cellspacing="0"	cellpadding="0" border="0" width="555">
																							<tr>
																								<td class="listtitle" width="30"><%=LanguegeBUS.getValue("deli_select", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("code", lang)%>
																								</td>
																								<td class="listtitle" width="150"><%=LanguegeBUS.getValue("de_cost_fee_name", lang)%></td>
																								<td class="listtitle" width="100"><%=LanguegeBUS.getValue("de_cost_fee_type", lang)%></td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_fee", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_condition_free", lang)%>
																								</td>
																								<td class="listtitle" width="90"><%=LanguegeBUS.getValue("de_cost_fee_extra", lang)%>
																								</td>

																							</tr>
																							<%
																								
																						List<Delivercost> listDeliverCost = DeliverCostBUS.getListDeliverCostBySeller((String)session.getAttribute("username"), lang); 
																							    
																								for (Delivercost delivercost : listDeliverCost) {
																										if ("Y".equals(delivercost.getIsUser()) || ("Free".equals(delivercost.getTypeFee()))) {
																											String deliverCostID = delivercost.getDeliverCostId()
																													+ "";
																											String deliverCostName = delivercost
																													.getDeliverCostName();
																											String type = delivercost.getTypeFee();
																											String conditionFree = delivercost
																													.getConditionForFree() + "";
																											String feeExtra = delivercost.getFeeExtra() + "";
																											String fee = delivercost.getCost() + "";

																											conditionFree = ("null".equals(conditionFree) || (null == conditionFree)) ? "--"
																													: conditionFree;

																											feeExtra = ("null".equals(feeExtra)) ? "--" : feeExtra;
																											String useornot = delivercost.getIsUser();
																											/* String IsDefault = delivercost.getDeliverCostDefault(); */
																							%>
																							<tr class="order_row"
																								onmouseover="this.style.backgroundColor='#FFEBDA'"
																								onmouseout="this.style.backgroundColor='#FFFFFF'"
																								onmousedown="this.style.backgroundColor='#FFEBDA'"
																								onClick="loadFormEdit(this,'<%=deliverCostID%>','<%=deliverCostName%>','<%=type%>','<%=fee%>','<%=conditionFree%>','<%=feeExtra%>','<%=useornot%>'<%-- ,'<%=IsDefault%>' --%>)">
																								<td><input type="radio"  name="de_CostID" <%if(p.getDeliverCost()!=null && delivercost.getDeliverCostId()==p.getDeliverCost().getDeliverCostId()){ %> checked="checked" <%} %>
																									value="<%=deliverCostID%>">
																								</td>
																								<td><label><%=deliverCostID%></label></td>
																								<td><label><%=deliverCostName%></label></td>
																								<td><label><%=type%></label></td>
																								<td><label><%=fee%></label></td>
																								<td><label><%=conditionFree%></label></td>
																								<td><label><%=feeExtra%></label></td>

																							</tr>
																							<%
																									}
																								}
																						
																							%>
																						</table>						
								</div>			
							</div>
							<br><br>
							<div class="button_listing_input">	
								<input type="hidden" name="pId" value="<%=p.getProductId()%>">								
								<input id="upload_button" name="upload_button" class="btn_submit"  type="submit" value="<%=LanguegeBUS.getValue("submit", lang)%>" />
								<input id="reset_button" name="reset_button" class="btn_submit"  type="reset" value="<%=LanguegeBUS.getValue("reset", lang)%>" />
							</div>
							<div class="clear"></div>		
						</div>		
                        </form>        
                        
 					<br/><br/>
                
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