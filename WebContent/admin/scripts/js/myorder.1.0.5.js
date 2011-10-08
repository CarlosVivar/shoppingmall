var orderRow = function(data)
{	
	var act = '';
    var rs  = '<tr class="order_row">'+
    		  '<td class="product"><span class="name">'+ data.buyer_name +'</span><span class="homephone">'+ data.buyer_phone +'</span></td>';
    if(data.topic_name==null)
    {
    	rs += '<td class="product delProduct"><p class="delCtn"><u>Sản phẩm đã bị xóa</u><br />Sản phẩm này có thể bị xóa bởi chủ shop hoặc BQT của 123Mua.</p><span class="title">'+ data.topic_name +'</span><br /><strong>('+ data.product_name +' - '+ number_format(data.unit_price, 0, ',', '.') +' VNĐ)</strong></td>';
    	if(data.order_status==1)
    	{
    		act = '<td><a onclick="orderConfirm('+data.me_order_id+',3);" style="cursor:pointer"><img src="'+ imgurl +'/icon_cancel.jpg" alt="Hủy" /></a></td>';
    	}	
    	else
    	{
    		act = '<td>&nbsp;</td>';
    	}	
    }	
    else
    {
    	rs += '<td class="product"><span class="title">'+ data.topic_name +'</span><br /><strong>('+ data.product_name +' - '+ number_format(data.unit_price, 0, ',', '.') +' VNĐ)</strong></td>';
    	act = '<td><a href="/myorder/detail/id/'+ data.me_order_id +'"><img src="'+ imgurl +'/icon_view.jpg" alt="Xem" /></a></td>';
    } 	
    
    rs     += '<td><span class="date">'+ data.ordered_date +'</span></td>'+act+
    		  '</tr>';
    return rs;
};

var trackingRow = function(data)
{		
	var act = '';
	var rs  = '<tr class="order_row">';
	if(data.topic_name==null)
	{
		rs += '<td class="product delProduct"><p class="delCtn"><u>Sản phẩm đã bị xóa</u><br />Sản phẩm này có thể bị xóa bởi chủ shop hoặc BQT của 123Mua.</p><span class="title">'+ data.topic_name +'</span><br /><strong>('+ data.product_name +' - '+ number_format(data.unit_price, 0, ',', '.') +' VNĐ)</strong></td>';
		act = '<td>&nbsp;</td>';					
	}	
	else
	{
		rs += '<td class="product"><span class="title">'+ data.topic_name +'</span><br /><strong>('+ data.product_name +' - '+ number_format(data.unit_price, 0, ',', '.') +' VNĐ)</strong></td>';
		act = '<td><a href="/myorder/detail/id/'+ data.me_order_id +'/type/1"><img src="'+ imgurl +'/icon_view.jpg" alt="Xem" /></a></td>';
	}
    rs     += '<td><span class="name"><a href="/'+ data.username +'">'+ data.shop_name +'</a></span></td>'+
    		  '<td><span class="date">'+ data.ordered_date +'</span></td>'+act+
    		  '</tr>';
	return rs;
};

var getLoader = function()
{
    return '<tr class="loader"><td colspan="5" align="center"><img src="'+ imgurl  +'/zoomloader.gif" alt="Đang tải" /><br />Đang tải</td></tr>';
};


var pagerRow = function(html)
{
    return '<tr class="pager"><td colspan="5" align="right">'+ html +'</td></tr>';
};

var onTabChanged = function(id)
{
    var tabIndex = parseInt(id.replace('#tabs', ''));

    loadTab(listType, tabIndex, 1);
};

var loadTab = function(listType, tabIndex, page)
{
	var sid = Math.random();	
    $('tr.order_row, tr.pager', $('#tabs'+tabIndex)).remove();

    $("#tabs" + tabIndex).append(getLoader());

    var status = tabIndex;

    page = Math.max(1, parseInt(page));

    var rowFn;
    var url;
    if (listType == 'order')
    {
        url = '/myorder/orderlistajax/sid/'+sid;
        rowFn = orderRow;
    }
    else
    {
        url = '/myorder/trackinglistajax/sid/'+sid;
        rowFn = trackingRow;
    }

    $.getJSON(url, {
        page:page,
        status:status
    }, function(data)
    {
    	$("#tabs" + tabIndex + ' tr.loader').remove();
    	if (data.data.length>0)
    	{
            for (index in data.data)
            {
                var order = data.data[index];

                $("#tabs" + tabIndex).append(rowFn(order));
            }
            $("#tabs" + tabIndex).append(pagerRow(data.pager));	
    		
    	}
    	else
    	{    		
    		$("#tabs" + tabIndex).append('<tr class="order_row"><td class="nonSearch" colspan="4" align="center">Hiện tại, bạn không có giao dịch nào.</td></tr>');
    	}	
        
    });
};

$(function(){
    $("#usual2 ul").idTabs(function(id){
        onTabChanged(id);
        return true;
    });

    $("div.paging .pageOn span a").live('click', function(){
    	var table = $(this).parents('table:first');
    	
    	if (!table.length() || !table.attr('id'))
		{
		return;
		}
    	
        var tabIndex = parseInt(table.attr('id').replace('tabs', ''));
        var href = $(this).attr('href');
        var matches = /page\/([0-9]+)/.exec(href);
        var page;
        if (!matches)
        {
            page = 1;
        }
        else
        {
            page = matches[1];
        }

        loadTab(listType, tabIndex, page);
        return false;
    });

});