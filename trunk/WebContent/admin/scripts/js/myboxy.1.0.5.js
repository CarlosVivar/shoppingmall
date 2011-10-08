$.fn.myBoxy = function (popup, options) {
    myoptions = jQuery.extend ({
        title: "Thông báo",
        message: "",
        type: "alert", 
        refresh: false,
        modal: true,
        callback: function(){}
    }, options);
	
    var content =	'<div id="order" style="width:400px;margin:0 auto">'+
    '<div class="title">'+
    '<div class="l_title"></div>'+
    '<div class="r_title"></div>'+
    '<h2>'+myoptions.title+'</h2>';
    if(myoptions.refresh==true)
    {	
    	content		+= '<a class="b_close" onclick="Boxy.get(this).hide();location.reload();"><img src="'+imgurl+'/icon_close.jpg" alt="123mua" /></a>';
    }
    else
    {
    	content		+= '<a class="b_close" onclick="Boxy.get(this).hide();"><img src="'+imgurl+'/icon_close.jpg" alt="123mua" /></a>';
    }
    content		+='</div>'+
    '<div class="content">';
    
    if(myoptions.type=='alert')
    {
        content += '<p class="alert">'+myoptions.message+'</p>';
    }
    else if(myoptions.type=='success')
    {
        content += '<p class="approve">'+myoptions.message+'</p>';
    }
    else if(myoptions.type=='confirm')
    {
        content += '<p class="confirm">'+myoptions.message+'</p>';
    }
    else if(myoptions.type=='message' || myoptions.type=='loading')
    {
        content += '<p>'+myoptions.message+'</p>';
    }
					
    content += 	'</div>';
	

    if(myoptions.type=='alert' || myoptions.type=='success' || myoptions.type=='message')
    {
        content +=	'<div class="footer">'+
        '<div class="l_footer"></div>';
	    if(myoptions.refresh==true)
	    {	
	    	content		+= '<input id="accept" class="b_accept mag150" type="button" onclick="Boxy.get(this).hide();location.reload();" value="Đóng" />';
	    }
	    else
	    {
	    	content		+= '<input id="accept" class="b_accept mag150" type="button" onclick="Boxy.get(this).hide();" value="Đóng" />';
	    }
	    content += 
	    '<div class="r_footer"></div>'+
	    '</div>';
    }
    else if(myoptions.type=='confirm')
    {
        content +=  '<div class="footer">' +
    '<div class="l_footer"></div>'+
    '<input id="accept" class="b_accept" type="button" value="Đồng ý" />'+
    '<input id="reject" class="close b_cancel" onclick="Boxy.get(this).hide();" type="button" value="Bỏ qua" />'+
    '<div class="r_footer"></div>'+
    '</div>';
    }
    else if(myoptions.type=='loading')
    {
    	content +=  '<div class="footer">' +
    '<div class="l_footer"></div>'+    
    '<div class="r_footer"></div>'+
    '</div>';
    }
    
    content += '</div>';
    new popup(content, myoptions);

    if(myoptions.type=='confirm')
    {
        $("#accept").click(myoptions.callback);
        $("#accept").click(function(){
            $("#accept, #reject").hide();
            $('<div align="center"><img src='+imgurl+'"/zoomloader.gif" /></div>').insertAfter("#popup .footer .l_footer");
        });
    }
        
    return false;
};