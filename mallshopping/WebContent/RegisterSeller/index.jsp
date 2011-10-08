<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../library.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Fancy Sliding Form with jQuery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Fancy Sliding Form with jQuery" />
        <meta name="keywords" content="jquery, form, sliding, usability, css3, validation, javascript"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
		<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script> 
		<script type="text/javascript" src="sliding.form.js"></script>
		<script type="text/javascript" src="../scripts/dateValidator.js"></script>
		<script type="text/javascript">	  	
			$(document).ready(function(){
				$("#companyName").blur(function(){
					companyName();
				});
				$("#representative").blur(function(){
					representative();
				});
				$("#identityCard").blur(function(){
					identityCard();
				});
				$("#businessNumber").blur(function(){
					businessNumber();
				});
				$("#companyAddress").blur(function(){
					companyAddress();
				});
				$("#phone").blur(function(){
					phone();
				});
				$("#businessType").blur(function(){
					businessType();
				});				
				$("#employees").blur(function(){
					employees();
				});
				$("#mainProduct").blur(function(){
					mainProduct();
				});
				$("#accountNumber").blur(function(){
					accountNumber();
				});
				$("#banking").blur(function(){
					banking();
				});
				$("#accountHolder").blur(function(){
					accountHolder();
				});
				$("#nganLuongAccount").blur(function(){
					nganLuongAccount();
				});
				
				
				$("#isNganLuong").click(function(){
					isNganLuong();
				});
			});
			
			var regexPhone = new RegExp ( "^(\\d{5,15})$");
			var regexNumber = new RegExp ( "^(\\d{5,20})$");
			var regexEmployees = new RegExp ( "^(\\d{1,5})$");
			var blank = "<%=LanguegeBUS.getValue("error_blank",lang)%>";
			function companyName(){
				if ( $("#companyName").val().length==0){
					$("#validCompanyName").text(blank);					
				}else{
					$("#validCompanyName").text("");
				}
			}
			function representative(){
				if ($("#representative").val().length==0){
					$("#validRepresentative").text(blank);					
				}else{
					$("#validRepresentative").text("");
				}
			}
			function identityCard(){
				if ($("#identityCard").val().length==0){
					$("#validIdentityCard").text(blank);					
				}else if(regexNumber.test($("#identityCard").val())==false){
					$("#validIdentityCard").text("<%=LanguegeBUS.getValue("error_identity_card_invalid",lang)%>");	
				}else{
					$("#validIdentityCard").text("");
				}
			}
			function businessNumber(){
				if ($("#businessNumber").val().length==0){
					$("#validBusinessNumber").text(blank);		
				}else if(regexNumber.test($("#businessNumber").val())==false){
					$("#validBusinessNumber").text("<%=LanguegeBUS.getValue("error_business_number_invalid",lang)%>");	
				}else{
					$("#validBusinessNumber").text("");
				}
			}
			function companyAddress(){
				if ($("#companyAddress").val().length==0){
					$("#validCompanyAddress").text(blank);					
				}else{
					$("#validCompanyAddress").text("");
				}
			}
			function phone(){
				if ($("#phone").val().length==0){
					$("#validPhone").text(blank);					
				}else{
					$("#validPhone").text("");
				}
			}
			function businessType(){
				if ($("#businessType").val().length==0){
					$("#validBusinessType").text(blank);					
				}else{
					$("#validBusinessType").text("");
				}
			}
			
			
			function employees(){
				if ($("#employees").val().length==0){
					$("#validEmployees").text(blank);	
				}else if(regexEmployees.test($("#employees").val())==false){
					$("#validEmployees").text("<%=LanguegeBUS.getValue("error_employees_invalid",lang)%>");	
				}else{
					$("#validEmployees").text("");
				}
			}
			function mainProduct(){
				if ($("#mainProduct").val().length==0){
					$("#validMainProduct").text(blank);					
				}else{
					$("#validMainProduct").text("");
				}
			}
			function accountNumber(){
				if ($("#accountNumber").val().length==0){
					$("#validAccountNumber").text(blank);	
				}else if(regexNumber.test($("#accountNumber").val())==false){
					$("#validAccountNumber").text("<%=LanguegeBUS.getValue("error_account_number_invalid",lang)%>");	
				}else{
					$("#validAccountNumber").text("");
				}
			}
			function banking(){
				if ($("#banking").val().length==0){
					$("#validBanking").text(blank);					
				}else{
					$("#validBanking").text("");
				}
			}
			function accountHolder(){
				if ($("#accountHolder").val().length==0){
					$("#validAccountHolder").text(blank);					
				}else{
					$("#validAccountHolder").text("");
				}
			}
			function nganLuongAccount(){
				if ($("#nganLuongAccount").val().length==0 && $("#isNganLuong").is(":checked")){
					$("#validNganLuongAccount").text(blank);					
				}else{
					$("#validNganLuongAccount").text("");
				}
			}
			
			
			function isNganLuong(){
				if (!$("#isNganLuong").is(":checked")){
					$("#validNganLuongAccount").text("");
					
					
					$("#nganLuongAccount").val("");
					
					
				}
				
			}
		</script>		
		<style>
			.vuhong_error{
				font-size: 10px;
			}
		</style>
    </head>
    <body>
        <div id="content">
            <div id="wrapper">
                <div id="steps">
                    <form id="registerForm" action="../registerSellerController" method="post" >
                    	<fieldset class="step">
                            <legend><%=LanguegeBUS.getValue("register_seller",lang)%></legend>
							<p style="text-align: justify;" align="center">
							<%=LanguegeBUS.getValue("register_seller_lisence",lang)%>
							</p>
                            <button  style="width:100px;margin: auto; " id="next1" type="button" onfocus="this.blur()">Next</button>
                            
                        </fieldset>
                        <fieldset class="step" id="step1">
                        
                            <legend>(2/5) - <%=LanguegeBUS.getValue("vuhong_information_general",lang) %></legend>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_company_name",lang) %> (*)</label>
                                <input id="companyName" name="companyName" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validCompanyName"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_representative",lang) %> (*)</label>
                                <input id="representative" name="representative" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validRepresentative"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_identity_card",lang) %> (*)</label>
                                <input id="identityCard" name="identityCard" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validIdentityCard"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_business_number",lang) %> (*)</label>
                                <input id="businessNumber" name="businessNumber" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validBusinessNumber"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_company_address",lang) %> (*)</label>
                                <input id="companyAddress" name="companyAddress" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validCompanyAddress"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_phone",lang) %> (*)</label>
                                <input id="phone" name="phone" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validPhone"></label>
                            </p>
                            <p>
                                <label>FAX</label>
                                <input id="fax" name="fax"/>
								<br/><label class="vuhong_error" id="validFax"></label>
                            </p>
							<br/>
							<table style="width:600px"><tr align="center"><td width="50%" align="right"><button id="back2" type="button" style="margin-right: 5px">Back</button></td>
							<td width="50%" align="left"><button style="margin-left: 5px" id="next2" onfocus="this.blur()">Next</button></td></tr></table>
                        </fieldset>
                        <fieldset class="step" id="step2">
                            <legend>(3/5) - <%=LanguegeBUS.getValue("vuhong_information_details",lang) %></legend>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_business_type",lang) %> (*)</label>
                                <input id="businessType" name="businessType" type="text"  onchange="valid3()"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validBusinessType"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_nationality",lang) %></label>
                                <select name="nationality">
                                	<%	List<Origin> lstOrigin = OriginBUS.lstOrigin(lang);
                                		for (Origin origin:lstOrigin){
                                	%>
                                	<option value="<%=origin.getOriginId()%>"><%=origin.getOriginName()%></option>
                                	<%} %>
                                </select>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_estalished",lang) %> (*)</label>
                                <select id="dd" name="day" style="width: 50px;" >
                                <%for (int i = 1; i < 32;i++) {%>
									<option><%=i%></option>
									<%} %>
								</select>
								<select id="mm" name="month" style="width: 50px;" onchange="adaptDay()">
                                <%for (int i = 1; i < 13;i++) {%>
									<option value="<%=i%>"><%=i%></option>
									<%} %>
								</select>
								<select id="yyyy" name="year" style="width: 100px;" onchange="adaptDay()">
                                <% Calendar cal=Calendar.getInstance();
                                int y = cal.get(Calendar.YEAR);
                                for (int i = 1; i < 60;i++) {%>
									<option value="<%=y%>"><%=y--%></option>
									<%} %>
								</select>                               
								<br/><label class="vuhong_error" style="color:#BB0000" id="validEstablished"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_employees",lang) %> (*)</label>
                                <input id="employees" name="employees" type="text"  />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validEmployees"></label>
                            </p>                            
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_main_product",lang) %> (*)</label>
                                <input id="mainProduct" name="mainProduct" type="text" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validMainProduct"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_capital",lang) %></label>
                                <input id="capital" name="capital" type="text"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validCapital"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_settlement",lang) %></label>
                                <input id="settlement" name="settlement" type="text"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validSettlement"></label>
                            </p>
                            <p>
                                <label>Website</label>
                                <input id="website" name="website" type="text"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validWebsite"></label>
                            </p>
							<table style="width:600px;"><tr  align="center"><td  width="50%" align="right"><button id="back3" style="margin-right: 5px" type="button">Back</button></td>
							<td  width="50%" align="left"><button id="next3" style="margin-left: 5px" onfocus="this.blur()">Next</button></td></tr></table>
                        </fieldset>     
                         <fieldset class="step" id="step1">
                        
                            <legend>(4/5) - <%=LanguegeBUS.getValue("vuhong_account_banking",lang) %></legend>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_account",lang) %> (*)</label>
                                <input id="accountNumber" name="accountNumber"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validAccountNumber"></label>
                            </p>
                            <p>
                                <label><%=LanguegeBUS.getValue("vuhong_banking",lang) %> (*)</label>
                                <input id="banking" name="banking" />
								<br/><label class="vuhong_error" style="color:#BB0000" id="validBanking"></label>
                            </p>
                            <p>                           
                                <label><%=LanguegeBUS.getValue("vuhong_account_holder",lang) %> (*)</label>
                                <input id="accountHolder" name="accountHolder"/>
								<br/><label class="vuhong_error" style="color:#BB0000" id="validAccountHolder"></label>
                            </p>
                            <p>
                            	<input type="checkbox" id="isNganLuong" name="isNganLuong"/> <a href="http://www.nganluong.vn" target="_blank">NganLuong.vn</a> Account.
                            </p>
                            <p>	
                                <label>Ngân lượng Account</label>
                                <input id="nganLuongAccount" name="nganLuongAccount"/>
                                <br/><label class="vuhong_error" style="color:#BB0000" id="validNganLuongAccount"></label>
                            </p>
							<br/>
							<table  style="width:600px;"><tr align="center"><td width="50%" align="right"><button style="margin-right: 5px" id="back4" type="button">Back</button></td>
							<td width="50%" align="left"><button style="margin-left: 5px" id="next4" onfocus="this.blur()">Next</button></td></tr></table>
                        </fieldset>   
                        <fieldset class="step" id="step1">                        
                            <legend>(5/5) - <%=LanguegeBUS.getValue("vuhong_confirm",lang) %></legend>
                            <p>
                                <%=LanguegeBUS.getValue("vuhong_register_info",lang) %>
                            </p>
                            <table  style="width:600px;"><tr align="center"><td width="50%" align="right"><button style="margin-right: 5px" id="back5">Back</button></td>
							<td width="50%" align="left"><button style="margin-left: 5px" id="registerSeller" type="submit" ><%=LanguegeBUS.getValue("vuhong_register",lang) %></button></td></tr></table>
                        </fieldset>  
                    </form>
                </div>
                <div id="navigation" style="display:none;">
                    <ul>
                        <li class="selected">
                            <a href="#">Lisence</a>
                        </li>
                        <li>
                            <a href="#">General Information</a>
                        </li>
						<li>
                            <a href="#">Detail Information</a>
                        </li>
                        <li>
                            <a href="#">Banking Information</a>
                        </li>
                        <li>
                            <a href="#">Accept</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>