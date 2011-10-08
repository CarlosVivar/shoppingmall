/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

			 function validPayment(){
				 
	            var ccType = $("#ccType").val() ;
	            var ccNumber = $("#ccNumber").val();
	            var expMonth = $("#expMonth").val() ;
	            var expYear = $("#expYear").val();
	            var cvvNumber = $("#cvvNumber").val() ;
	            var firstName = $("#firstName").val();
	            var lastName = $("#lastName").val() ;
	            var address = $("#address").val();
	            var city = $("#city").val() ;
	            var state = $("#state").val() ;
	            var zip = $("#zip").val();
	            var countryCode = $("#countryCode").val();
	            
	            $("#validType").text("");
	            if(ccType.length==0){
	                $("#validType").text("Please Choose Card Type!!");
	                return false;
	            }
	            $("#validCC").text("");
	            if(ccNumber.length==0){
	                $("#validCC").text("Please enter Card Number!!");
	                return false;
	            }
	            $("#validEXP").text("");
	            if(expMonth.length==0){
	                $("#validEXP").text("Please Choose month!!");
	                return false;
	            }
	            if(expYear.length==0){
	                $("#validEXP").text("Please choose year!!");
	                return false;
	            }
	            $("#validCVV").text("");
	            if(cvvNumber.length==0){
	                $("#validCVV").text("Please enter Card Verification Number!!");
	                return false;
	            }
	            $("#validFN").text("");
	            if(firstName.length==0){
	                $("#validFN").text("Please enter firstname!!");
	                return false;
	            }
	            $("#validLN").text("");
	            if(lastName.length==0){
	                $("#validLN").text("Please enter lastname!!");
	                return false;
	            }
	            $("#validAddress").text("");
	            if(address.length==0){
	                $("#validAddress").text("Please enter address!!");
	                return false;
	            }
	            $("#validCity").text("");
	            if(city.length==0){
	                $("#validCity").text("Please enter city!!");
	                return false;
	            }
	            $("#validState").text("");
	            if(state.length==0){
	                $("#validState").text("Please choose state!!");
	                return false;
	            }
	            $("#validZip").text("");
	            if(zip.length==0){
	                $("#validZip").text("Please enter zip code!!");
	                return false;
	            }
	            $("#validCountry").text("");
	            if(countryCode.length==0){
	                $("#validCountry").text("Please enter Country!!");
	                return false;
	            }
	
	        }
			 
            function validCVV(){
                $("#validCVV").text("");
                var cctype = $("#ccType").val();
                var cvv = $("#cvvNumber").val();
                if(cvv.length==0){
                    $("#validCVV").text("Please input Card Verification Number!");
                    return false;
                }
                switch(cctype){
                    case '3'://Amex
                        if(cvv.length!=4){
                            $("#validCVV").text("Card Verification Number of American Express have 4 number");
                            return false;
                        }
                        break;
                    default:
                        if(cvv.length!=3){
                            $("#validCVV").text("Card Verification Number have 3 number");
                            return false;
                        }
                        break;
                }

            }
            function validEXP(){
                $("#validEXP").text("");
                var d = new Date();
                var currentMonth = d.getMonth();
                var currentYear = d.getFullYear();
                var year = $("#expYear").val();
                var month = $("#expMonth").val();
                if(month.length==0){
                    $("#validEXP").text("Please choose month!!");
                    return false;
                }
                if(year.length==0){
                    $("#validEXP").text("Please choose year!!");
                    return false;
                }
                if(currentYear==parseInt(year)&&parseInt(month)<currentMonth){
                    $("#validEXP").removeClass("success2");
                    $("#validEXP").addClass("warning2").html("<p class='error'>Hết hạn sử dụng</p>");
                    return false;
                }else{
                    $("#validEXP").html("&nbsp;").addClass("success2");
                }
                return true;
            }
            function validCC(){
                $("#validCC").text("");
                var loai = $("#ccType").val();
                var ccnumber = $("#ccNumber").val();
                if(ccnumber.length==0){
                    $("#validCC").text("Please input Card Number");
                    return false;
                }
                switch(loai){
                    case 'Visa'://Visa
                        if(ccnumber[0]!='4'){
                            $("#validCC").text("Start with No. 4");
                            return false;
                        }
                        if(ccnumber.length>16){
                            $("#validCC").text("Not more than 16 number");
                            return false;
                        }
                        break;
                    case 'MasterCard'://Master

                        if(ccnumber[0]!='5'){
                            $("#validCC").text("Start with No. 5");
                            return false;
                        }
                        if(ccnumber.length>16){
                            $("#validCC").text("Not more than 16 number");
                            return false;
                        }
                        break;
                    case 'American Express'://AMex

                        if(ccnumber[0]!='3'){
                            $("#validCC").text("Start with No. 3");
                            return false;
                        }
                        if(ccnumber.length>16){
                            $("#validCC").text("Not more than 16 number");
                            return false;
                        }
                        break;
                    case 'Discover'://Discover

                        if(ccnumber[0]!='6'){
                            $("#validCC").text("Start with No. 6");
                            return false;
                        }
                        if(ccnumber.length>15){
                            $("#validCC").text("Not more than 15 number");
                            return false;
                        }
                        break;
                }
                return true;
            }