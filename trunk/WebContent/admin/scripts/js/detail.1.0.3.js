var addWishList = function(){
	var id = $(this).attr('rel');
	
	$.post(baseurl + '/product/addwishlist', {
		id:id
	},
	function(data){
		var mess;
		if(data == -1){
			mess = 'S?n ph?m này dã có trong danh sách yêu thích c?a b?n!';
		}
		else if(data ==-2){
			mess = "Vui lòng <a href='"+LOGIN_URL+"'><strong>dang nh?p</strong></a> d? s? d?ng ch?c nang này!";
		}
		else{
			mess = 'B?n dã thêm vào danh sách yêu thích thành công!';
		}
	  
		$(this).myBoxy (Boxy,{
			message: mess
		});
	});
}


var addBlacklist= function(me_id, topic_id)
{
    var  blacklist_type = $("#blacklist_type").val();
    
    $.post(baseurl + '/product/addblacklist', {
        topic_id:topic_id,
        me_id: me_id,
        blacklist_type: blacklist_type
    },
    function(data){
        var mess;
        if(data == -1){
            mess = 'B?n dã dua vào báo x?u s?n ph?m này r?i!';
        }
        else if(data ==-2){
            mess = 'Vui lòng dang nh?p d? s? d?ng ch?c nang này!';
        }
        else if(data ==-3){
            mess = 'Tham s? truy?n vào không dúng!';
        }
        else{
            mess = 'B?n dã thêm vào danh sách báo x?u thành công!';
        }
	  
        $(this).myBoxy (Boxy,{
            message: mess
        });
    });
};

$(function(){
	/*Scroll to Top*/
	$("#toTop").scrollToTop({speed:1000,ease:"easeInBack",start:700});
	/*Scroll to Top*/
	
	/*Sharing*/
	$('a.share_expand').click(function() {
		if ($('.box_share').is(":hidden")) {
			$('.box_share').show();
		}
		else {
			$('.box_share').hide();
		}
		return false;
	});
	$(".btn_close").click(function() {
		$(".box_share").hide();
		return false;
	});
	$('#zm').popupWindow({
		width:600,
		height:410,
		centerScreen:1
	});
	/*Sharing*/
	
	$(document).click(function(event) {
		if ((event.target.className != 'ajax-checklist-select-value') && (event.target.className != 'name_prd') && (event.target.className != 'price_prd') && (event.target.className != 'ajax-checklist-select-control')) {
			var list1 = $('#ShowResultsList');
			list1.hide();
		}
	});
	$('#ShowResultsChecklist').click(function() {

		var list = $('#ShowResultsList');
		if (list.is(':visible')) {
			list.hide();
		} else {
			list.show();
		}
	});
	
	var hoverTimer;
	$('#ShowResultsList ul li').each(function(){
		$(this).mouseover(function() {
			var dom = this;
			if (hoverTimer)
			{
				clearTimeout(hoverTimer);
				hoverTimer = null;
			}
			
			if ($(this).attr('class')!='inactive')
			{
				$(this).css('cursor','pointer');
				$(this).css('background-color','#eef3fc');
			}
			
			hoverTimer = setTimeout(function() {
				var index = $('#ShowResultsList ul li').index(dom);
				$('#box_thumbnail img:eq('+ index +')').click();
			}, 500);
		}).mouseout(function(){
			$(this).css('background-color','');
		}).click(function(){
			if ($(this).attr('class')!='inactive')
			{
				$("#ShowResultsLabel .ajax-checklist-select-control").html($(this).html());
				$("#ShowResultsLabel .ajax-checklist-select-control").attr('rel',$(this).attr('rel'));
			}
		});
	});

	$(".other_pic").simpleSlider({
		item:8
	});
	
	if ($(".other_pic #next").length)
	{
		$(".other_pic").addClass("hg132");
	}
	
	$('.go-next').click();

	$(".full_description_inside img").lazyload({
		placeholder : imgurl+"/grey.gif"
	});

	$("#main_img").resizeImg({maxHeight: 300, maxWidth: 300});
	
	
	$('#box_thumbnail img').click(function(){
		var path = $(this).attr('src');
		path = path.replace('_130_130','_574_0');
		path = path.replace('t.f','d.f');
		$('#main_img').fadeOut(function(){
			$('#main_img').attr('src', path);
			$('#main_img').fadeIn(function(){
				$("#main_img").resizeImg({maxHeight: 300, maxWidth: 300 });
			});
		});
		return false;
	});
	
	$("#btn_wishlist").click(addWishList);
});