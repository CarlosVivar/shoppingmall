$(function() {
	/*
	number of fieldsets
	*/
	var fieldsetCount = $('#registerForm').children().length;
	
	/*
	current position of fieldset / navigation link
	*/
	var current 	= 1;
    
	/*
	sum and save the widths of each one of the fieldsets
	set the final sum as the total width of the steps element
	*/
	var stepsWidth	= 0;
    var widths 		= new Array();
	$('#steps .step').each(function(i){
        var $step 		= $(this);
		widths[i]  		= stepsWidth;
        stepsWidth	 	+= $step.width();
    });
	$('#steps').width(stepsWidth);
	
	/*
	to avoid problems in IE, focus the first input of the form
	*/
	$('#registerForm').children(':first').find(':input:first').focus();	
	
	/*
	show the navigation bar
	*/
	
	/*
	when clicking on a navigation link 
	the form slides to the corresponding fieldset
	*/
		
	$('#next1').bind('click',function(e){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[1] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+ 1 +')').find(':input:first').focus();		
        });
		e.preventDefault();        
	});
	$('#next2').bind('click',function(e){
		companyName();
		representative();
		identityCard();
		businessNumber();
		companyAddress();
		phone();
		var test = false;
		if($("#validCompanyName").text()=="" && $("#validRepresentative").text()=="" && $("#validIdentityCard").text()=="" && $("#validBusinessNumber").text()==""
			 && $("#validCompanyAddress").text()=="" && $("#validPhone").text()==""){
			test = true;
		}
		if(test){		
			$('#steps').stop().animate({
		        marginLeft: '-' + widths[2] + 'px'
		    },500,function(){        	
		    	$('#registerForm').children(':nth-child('+ 2 +')').find(':input:first').focus();		
		    });
		}
		e.preventDefault();        
	});
	$('#next3').bind('click',function(e){
		businessType();
		employees();
		mainProduct();
		var test = false;
		if($("#validBusinessType").text()=="" && $("#validEmployees").text()=="" && $("#validMainProduct").text()==""){
			test = true;
		}
		if(test){	
		$('#steps').stop().animate({
            marginLeft: '-' + widths[3] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+ 3 +')').find(':input:first').focus();		
        });
		}
		e.preventDefault();        
	});
	
	$('#next4').bind('click',function(e){
		accountNumber();
		banking();
		accountHolder();
		nganLuongAccount();
		nganLuongSecureCode();
		nganLuongMerchantSiteCode();
		var test = false;
		if($("#validAccountNumber").text()=="" && $("#validBanking").text()=="" && $("#validAccountHolder").text()==""){
			test = true;
			if ($("#validNganLuongAccount").text()!="" ||$("#validNganLuongSecureCode").text()!="" ||$("#validNganLuongMerchantSiteCode").text()!=""){
				test = false;
			}
		}
		if(test){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[4] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+ 4 +')').find(':input:first').focus();		
        });
		}
		e.preventDefault();        
	});
	
	$('#back2').bind('click',function(e){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[0] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+0 +')').find(':input:first').focus();		
        });
        e.preventDefault();        
	});
	$('#back3').bind('click',function(e){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[1] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+2 +')').find(':input:first').focus();		
        });
        e.preventDefault();        
	});
	$('#back4').bind('click',function(e){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[2] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+3 +')').find(':input:first').focus();		
        });
        e.preventDefault();        
	});
	$('#back5').bind('click',function(e){
		$('#steps').stop().animate({
            marginLeft: '-' + widths[3] + 'px'
        },500,function(){        	
        	$('#registerForm').children(':nth-child('+4 +')').find(':input:first').focus();		
        });
        e.preventDefault();        
	});

	/*valid username*/
	
	/*
	clicking on the tab (on the last input of each fieldset), makes the form
	slide to the next step
	*/
	$('#registerForm > fieldset').each(function(){
		var $fieldset = $(this);
		$fieldset.children(':last').find(':input').keydown(function(e){
			if (e.which == 9){
				$('#navigation li:nth-child(' + (parseInt(current)+1) + ') a').click();
				/* force the blur for validation */
				$(this).blur();
				e.preventDefault();
			}
		});
	});

	/*
	validates errors on all the fieldsets
	records if the Form has errors in $('#registerForm').data()
	*/
	function validateSteps(){
		var FormErrors = false;
		for(var i = 1; i < fieldsetCount; ++i){
			var error = validateStep(i);
			if(error == -1)
				FormErrors = true;
		}
		$('#registerForm').data('errors',FormErrors);	
	}
	
	/*
	validates one fieldset
	and returns -1 if errors found, or 1 if not
	*/
	function validateStep(step){
		if(step == fieldsetCount) return;
		
		var error = 1;
		var hasError = false;
		$('#registerForm').children(':nth-child('+ parseInt(step) +')').find(':input:not(button)').each(function(){
			var $this 		= $(this);
			var valueLength = jQuery.trim($this.val()).length;
			
			if(valueLength == ''){
				hasError = true;
				$this.css('background-color','#FFEDEF');
			}
			else
				$this.css('background-color','#FFFFFF');	
		});
		var $link = $('#navigation li:nth-child(' + parseInt(step) + ') a');
		$link.parent().find('.error,.checked').remove();
		
		var valclass = 'checked';
		if(hasError){
			error = -1;
			valclass = 'error';
		}
		$('<span class=""></span>').insertAfter($link);
		
		
		return error;
	}
	
	/*
	if there are errors don't allow the user to submit
	*/
	$('#registerButton').bind('click',function(){
		if($('#registerForm').data('errors')){
			alert('Please correct the errors in the Form');
			return false;
		}	
	});
});