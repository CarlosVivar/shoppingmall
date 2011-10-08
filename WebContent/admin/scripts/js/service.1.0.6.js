var Service = {};
Service.Uporder = function()
{	
	$(function(){		
		
		$('#loading ul li').each(function(){			
    		$(this).click(function(){
    			$('.active').removeClass('active');
    			$(this).attr('class','active');
    		});
    	});
	
		$("#order .b_accept").click(function(){
			var tmp_up_id = 0;
			$('#loading ul li').each(function(){
				if ($(this).attr('class')=='active')
				{
					tmp_up_id = $(this).attr('ref');
				}
			});
			$('#loading').html('<img src="'+imgurl+'/zoomloader.gif" alt="Đang thực hiện" style="margin-bottom:5px;margin-left:10px;" />');    
		    $.post(baseurl+'/service/uporder',{up_id:tmp_up_id},
			function(data){
		    	var boxy = Boxy.get($("#order"));
	            boxy.hide();
				var status = data.status;
				var type = (status == 1)?'message':'alert';
				$(this).myBoxy (Boxy,{
					type: type,
					title: data.title,
					message: data.message,
					refresh: true
				});
			}, 'json');
		});
	});	
};

Service.Showcaseorder = function()
{
	$(function(){
		var showcase_height = $('.content').height();
		
	    $(document).click(function(event) {	    	
	        if ((event.target.className != 'dropdown-checklist-select-value') && (event.target.className != 'name_prd') && (event.target.className != 'price_prd') && (event.target.className != 'dropdown-checklist-select-control')) {
	            var list1 = $('#ShowResultsList');
	            var list2 = $('#ShowResultsList-two');
	            list1.hide();
	            list2.hide();
	        }	        
	    });
	    
	    $('#DropdownChecklist').click(function() {
			var list = $('#ShowResultsList');

			if ($("#ShowResultsList ul li").length <= 0)
			{
				return;
			}

	        if (list.is(':visible')) {
	        	$('.content').height(showcase_height);
	            list.hide();
	        } else {
	        	$('.content').height(showcase_height+100);
	            list.show();
	        }
	    });
	    
	    $('#DropdownChecklist-two').click(function() {	    	
			var list = $('#ShowResultsList-two');

	        if (list.is(':visible')) {
	            list.hide();
	        } else {
				$('#ShowResultsList').hide();
	            list.show();
	        }
	    });
	    
		$('#ShowResultsList-two ul li').each(function(){
			$(this).css('cursor','pointer').mouseover(function() {
				$(this).css('background-color','#eef3fc');
			}).mouseout(function(){
				$(this).css('background-color','');
			}).click(function(){
				$("#ShowResultsLabel-two .dropdown-checklist-select-control").html($(this).html());
			});
		});
	    /*
		$('#ShowResultsList ul li').each(function(){
			$(this).css('cursor','pointer').mouseover(function() {
				$(this).css('background-color','#eef3fc');
			}).mouseout(function(){
				$(this).css('background-color','');
			}).click(function(){
				$("#ShowResultsLabel .dropdown-checklist-select-control").html($(this).html());
			});
		});
		*/
		$('#ShowResultsList ul li').live('mouseover', function() {
			$(this).css('background-color','#eef3fc');
		});
		$('#ShowResultsList ul li').live('mouseout', function(){
			$(this).css('background-color','');
		});
		$('#ShowResultsList ul li').live('click', function(){
			$("#ShowResultsLabel .dropdown-checklist-select-control").html($(this).html());
		});

		$('#ShowResultsList ul li').hover(function() {
			$('.image_demo').show();
		});
		
		$("#order .b_accept").click(function(){
			var topic_id = $('#topic_id').val();
			var action = $('#action_id').val();

			$('#loading ul li').each(function(){
				if ($(this).attr('class')=='active')
				{
					tmp_up_id = $(this).attr('ref');
				}
			});
			
			if(selectedShowcaseId == 0)
			{				
				$('#error_alert').html('<strong class="spec">Hãy chọn vùng hiển thị muốn đăng ký.</strong>');
				$('#error_alert').show();
				return;
			}
			$('#loading').html('<img src="'+imgurl+'/zoomloader.gif" alt="Đang thực hiện" style="margin-bottom:5px;margin-left:10px;" />');    
			 $.get(baseurl+'/service/showcaseorderconfirm/topic_id/' + topic_id +'/showcase_id/'+ selectedShowcaseId,{},
				function(data){
			    	var boxy = Boxy.get($("#order"));
		            boxy.hide();
					new Boxy(data, {modal: true});

				});			
		});
	});		
};