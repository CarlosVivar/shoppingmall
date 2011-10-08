var meurl ='http://me.zing.vn';

function copyTextToClipboard(id)
{
    var doc = document.getElementById(id);
    doc.focus();
    doc.select();
    if(doc.createTextRange)
    {
        var CopiedTxt = doc.createTextRange();
        CopiedTxt.execCommand("Copy");
    }
}

function checkParentFrame(meurlshort, meurl)
{	
    if(window.parent.location.host != meurlshort) {
        window.location = meurl + window.location.pathname;
    }
}
function getTheHeight(opt_height,_document,_parent) 
{
    var newHeight = parseInt(opt_height, 10);
    if (isNaN(newHeight)) 
    {    
        var vh = _parent.height;
        var body = _document.body;
        var docEl = _document.documentElement;
        if (_document.compatMode === 'CSS1Compat' && docEl.scrollHeight)
        {
            newHeight = docEl.scrollHeight !== vh ? docEl.scrollHeight : docEl.offsetHeight;
        }
        else
        {
            var sh = docEl.scrollHeight;
            var oh = docEl.offsetHeight;
            if (docEl.clientHeight !== oh)
            {
                sh = body.scrollHeight;
                oh = body.offsetHeight;
            }
            if (sh > vh)
            {
                newHeight = sh > oh ? sh : oh;
            }
            else
            {
                newHeight = sh < oh ? sh : oh;
            }
        }
    }
    return newHeight;
}

function resizeFrame(name, sHeight, sHeightDefault) {
    if(sHeight == undefined || sHeight == "")
        sHeight = 600;
    if(sHeightDefault == undefined || sHeightDefault == "")
        sHeightDefault = 500;
    f = window.parent.document.getElementById(name);
		
    if(sHeightDefault > sHeight)
    {
        f.style.height =  sHeightDefault + 'px';
    }
	
    var _height = 0;
    _height = getTheHeight('',f.contentWindow.document,f);
		
    sHeightDefault = parseFloat(sHeightDefault);
    _height = parseFloat(_height);
    sHeight = parseFloat(sHeight);
    if(sHeightDefault < 0)
    {
        _height = _height + sHeightDefault ;
    }
	
    if(_height < sHeight) _height = sHeight;
    f.height = _height;
    document.getElementById('wrapper').style.height = _height + "px";
    f.style.height = _height + "px";
}

function resizeParent(sHeightDefault)
{	
    resizeFrame('123mua', 600, sHeightDefault);
}

function search()
{
    var text = $('#text').val();
	
    //Check empty
    if(text == '' || text == 'Bạn muốn mua gì cho ngày hôm nay?')
    {
        alert('Bạn cần nhập từ khóa cần tìm kiếm.');
        $('#text').focus();
        return false;
    }
	
    //Check length
    if(text.length < 3)
    {
        alert('Nhập ít nhất 3 ký tự để tìm kiếm.');
        $('#text').focus();
        return false;
    }
	
    //Get select
    var mod = $('#mod').val();
	
    //Check mod
    var action = $('#frmSearch').attr('action') ;
    if(mod == '1')
    {
        action += '/searchshop';
    }
    else
    {
        action += '/searchadvs';
    }
	
    //Submit form
    $('#frmSearch').attr('action', action) ;
    //$('#frmSearch').submit();
	
    return true;
}

function rollbackComment() 
{
    var str = $('#txtcomment').val() ;
    if(str == '')
    {
        $('#txtcomment').val(flgStr) ;
        flgBool = false ;
    }
}

function commentCallbackPost(jData)
{
    timeoutinteraction = setTimeout('Interaction_Comment.GoPage(1,\'zCommentID\')',300);
    flgBool = false ;
    clearText();
    //Send notify
    var sid = Math.random();
    var interaction_categoryid = $('#interaction_categoryid').val();
    var interaction_userid = $('#interaction_userid').val();
    var notifyurl = baseurl + "/product/notify?id="+interaction_categoryid+"&userid="+interaction_userid+"&sid="+sid+"&type=1";
    $.get(notifyurl, {}, function(data, textStatus){});
    return false;
}

function commentSubmit() 
{
    var str = $('#txtcomment').val() ;
    if(!str || !flgBool)
    {
        alert('Vui lòng nhập nội dung bình luận !!!');
        return false ;
    }
    Interaction_Comment.Post(0,'zCommentID');
    flgBool = false ;
    clearText();
    return false;
}

function emoticon_open()
{ 	
    document.getElementById('emoticon').style.display='block';
    document.getElementById('emoticon_lose').style.display='none';
}

function emoticon_close()
{ 	
    document.getElementById('emoticon').style.display='none';
    document.getElementById('emoticon_lose').style.display='block';
}				

function emoticon_msg(obj)
{
    clearText();
    document.getElementById('txtcomment').value +=	' '+obj+' ';
    document.getElementById('txtcomment').focus();
}

function clearText() 
{	
    emoticon_close();
    if(!flgBool)
    {
        flgStr = $('#txtcomment').val() ;
        $('#txtcomment').val('') ;
        flgBool = true ;
    }
}
var callbackNumber = 0;

function commentDel(CommentItemID, MessageID) 
{	
    var sid = Math.random();
    var categoryid = $('#interaction_categoryid').val();
    var interaction_totalcmd = $('#interaction_totalcmd').val();
    var getbaseurl = baseurl + '/product/delcomm?CommentItemID='+CommentItemID+'&MessageID='+MessageID+'&categoryid='+categoryid+"&totalcmd="+interaction_totalcmd+"&sid="+sid;
    $.get(getbaseurl, {}, function(data, textStatus){
        data = parseInt(data);
        if(data == 1)
        {
            callbackNumber = 0;
            alert('Xóa bình luận thành công!');
        }
        else
        {
            alert('Xóa bình luận không thành công!');
        }
        timeoutinteraction = setTimeout('Interaction_Comment.GoPage(1,\'zCommentID\')',100);
    });
    return false ;
}

function strReplaceAll( strTarget, strSubString, strText)
{	
    var intIndexOfMatch = strText.indexOf( strTarget );
    if(intIndexOfMatch == -1)
    {
        intIndexOfMatch = strText.indexOf( strTarget.toUpperCase() );
    }
	
    while(intIndexOfMatch != -1)
    {
        strText = strText.replace( strTarget, strSubString ) ;
        strText = strText.replace( strTarget.toUpperCase(), strSubString );
        intIndexOfMatch = strText.indexOf( strTarget );
    }
    return( strText );
}

function parseComment(str) 
{
    var str_replace = "";
    var i ;
    var img_smile_server = "http://static.me.zing.vn/images/smilley/default/";
		
    for(i in arr_emotion)
    {
        str_replace = '<img src="'+img_smile_server+arr_emotion[i]+'.jpg" style="cursor: pointer;" align="absmiddle"/>' ;
        str =  strReplaceAll(i, str_replace , str);
    }
    return str ;
}

function goCommentUrl(page)
{
    Interaction_Comment.GoPage(page,'zCommentID');
    return false ;
}

function getHeightView(url)
{
    var _height = document.getElementById(url).offsetTop;
    return _height ;
}

function commentCallback(jData)
{
    var strItem = "";
    var strPaging = "";
    var totalpage = 0 ;
    var curpage = 0 ;
    var prepage = 0 ;
    var nextpage = 0 ;
    var len = jData.CItem.length ;
    var comment = '' ;
    var frame_height = 1 ;
				
    if(timeoutinteraction)
    {
        clearTimeout(timeoutinteraction) ;
    }
	
    if(len > 0)
    {
        for(i =0; i < len; i++)
        {
            comment = parseComment(jData.CItem[i].Comment) ;
            strItem += '<div class="comment_post clearfix">';
			
            //Avatar
            if(delpermit)
            {
                strItem += '<div class="closeAll"><a href="#" onclick="return commentDel('+ jData.CItem[i].CommentItemID + ','+ jData.CItem[i].MessageID +');"><img height="14" border="0" width="14" src="'+imgurl+'/zme_closeAll2.png" onmouseover="this.src=\'http://img.me.zdn.vn/images/zme_closeAlls.png\'" onmouseout="this.src=\''+imgurl+'/zme_closeAll2.png\'" title="Xóa" alt="Xóa"></a></div>';
            }
            strItem += '<div class="avatar_min"><a target="_top" href="'+ meurl + '/'+ jData.CItem[i].DisplayName +'"><span href="'+ meurl + '/'+ jData.CItem[i].DisplayName + '" rel="ZMEA_' + jData.CItem[i].DisplayName + '?width=50&height=50"></span></a></div>' ;
			
            //Name
            strItem += '<div class="info_comment">' ;
            strItem += '<h1><a target="_top" href="'+ meurl + '/'+ jData.CItem[i].DisplayName +'"><span href="'+ baseurl + '/' + jData.CItem[i].DisplayName +'" rel="ZMED_' + jData.CItem[i].DisplayName + '"></span></a></h1>' ;
            strItem += '<span class="update_time">Vào lúc ' + jData.CItem[i].CommentDate + ' ' + jData.CItem[i].CommentTime + '</span>' ;
            strItem += '<p>'+comment+'</p>' ;
            strItem += '</div>' ;
            strItem += '</div>' ;
            frame_height++;
        }

        strPaging = '' ;
        totalpage = jData.CPaging.TotalPage;
        curpage = jData.CPaging.CurrentPage ;
        prepage = parseInt(curpage) - 1 ;
        nextpage = parseInt(curpage) + 1 ;
        $('#spTotal').html(jData.CPaging.TotalRecord);
        $('#interaction_totalcmd').val(jData.CPaging.TotalRecord);
        if(totalpage > 10)
        {
            totalpage = 10 ;
        }

        strPaging +='<div class="paging">';
        strPaging +='<div class="total">Có ' + jData.CPaging.TotalRecord + ' kết quả thích hợp </div>';
		
        if(totalpage>1)
        {
		    
			
            strPaging += '<div class="pageOn">' ;
            if( curpage > 1 )
            {
                strPaging += '<span class="sum"><a href="#CommentView" onclick="return goCommentUrl(' + prepage + ');">Trở vỿ</a></span>';
            }
						
            for(var i =1; i<= totalpage; i++)
            {
                if(i == jData.CPaging.CurrentPage)
                {
                    strPaging += '<span class="active">' + i + '</span>';
                }
                else
                {
                    strPaging += '<span><a href="#CommentView" onclick="return goCommentUrl(' + i + ');">' + i + '</a></span>';
                }
            }
			
            if( jData.CPaging.CurrentPage < totalpage )
            {
                strPaging += '<span class="sum"><a href="#CommentView" onclick="return goCommentUrl(' + nextpage + ');">Tiếp theo</a></span>';
            }
			
            strPaging += '</div>';
        }
		
        strPaging += '</div>';
    }
	
    strItem += strPaging ;
    $('#zCommentID').html(strItem);
	
    if(len > 0)
    {
        ZME_widget_mix();
    }
	
    //Send notify
    if(callbackNumber > 0)
    {
        var sid = Math.random();
        var interaction_categoryid = $('#interaction_categoryid').val();
        var interaction_userid = $('#interaction_userid').val();
        var interaction_totalcmd = $('#interaction_totalcmd').val();
        var commenturl = baseurl + "/product/comm?categoryid="+interaction_categoryid+"&userid="+interaction_userid+"&totalcmd="+interaction_totalcmd+"&sid="+sid;
        $.get(commenturl, {}, function(data, textStatus){});
    }
    callbackNumber++;
	
    return false ;
}

function number_format(number, decimals, dec_point, thousands_sep)
{   
    var n = !isFinite(+number) ? 0 : +number, 
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
    };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

function loadStar(position)
{
    //alert (position);
    var i=0;
    for(i=1; i<=position; i++)
    {
        $("#add_start"+i).removeClass("starOut");
        $("#add_start"+i).addClass("starIn");
    }
    return false;
}

function unloadStar()
{	
    var i =1;
    for(i=1; i<=5; i++)
    {
        $("#add_start"+i).removeClass("starIn");
        $("#add_start"+i).addClass("starOut");
    }
    return false;
}

function findPosX(obj) {
    var curleft = 0;

    if(obj.offsetParent) {
        while(1) {
            curleft += obj.offsetLeft;
            if(!obj.offsetParent)
                break;
            obj = obj.offsetParent;
        }
    } else if(obj.x) {
        curleft += obj.x;
    }
    return curleft;
}

function findPosY(obj) {
    var curtop = 0;

    if(obj.offsetParent) {
        while(1) {
            curtop += obj.offsetTop;
            if(!obj.offsetParent)
                break;
            obj = obj.offsetParent;
        }
    } else if(obj.y) {
        curtop += obj.y;
    }
    return curtop;
}

function findPos(obj) {
    var left = findPosX(obj);
    var top = findPosY(obj);

    return [left , top];
}

function findPosition( oElement ) {
    if( typeof( oElement.offsetParent ) != 'undefined' ) {
        for( var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent ) {
            posX += oElement.offsetLeft;
            posY += oElement.offsetTop;
        }
        return [ posX, posY ];
    } else {
        return [ oElement.x, oElement.y ];
    }
}

function number_format(number, decimals, dec_point, thousands_sep) {
    var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
    };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

function OpenWin(url, width, height)
{
    window.open(url,'pop_win','width=' + width + ',height=' + height + ',toolbar=no,status=no,resizable=no,scrollbars=no');
}

var bubbleTemplate = function(shopType)
{
    var title, rank, description;
    if (shopType == 'bestchoice')
    {
        rank = '01';
        title = 'Danh hiệu BEST CHOICE';
        description = 'Best Choice là danh hiệu uy tín nhất trên 123Mua (hiện nay) được BQT 123Mua trao tặng cho các shop bán hàng chất lượng và nghiêm túc. Khách mua hàng tại các shop có danh hiệu Best Choice có thể yên tâm về giao dịch, dịch vụ chăm sóc khách hàng của shop. Xem chi tiết <a href="javascript:OpenWin(\''+ baseurl +'/content/faqs/index_bestchoice.htm\',605,590);">tại đây.</a>';
    }
    else if (shopType == 'verified')
    {
        rank = '02';
        title = 'Shop đã xác thực';
        description = 'Thông tin của shop trên 123Mua.vn đã được xác thực là đúng và có thật. 123Mua.vn sẽ hỗ trợ bạn xác minh trong trường hợp có tranh chấp cần sự can thiệp của pháp luật.';
    }
    else if (shopType == 'unverified')
    {
        rank = '03';
        title = 'Shop chưa xác thực';
        description = '123Mua.vn chưa nhận được giấy tờ xác minh thông tin người bán theo qui định và sẽ không đảm bảo thông tin các shop này.<br /><strong>Bạn là chủ shop này?</strong> Mau chóng gửi giấy tờ theo hướng dẫn để được chứng thực.';
    }
    else if (shopType == 'vip')
    {
        rank = '04';
        title = 'Sản phẩm Thương Hiệu';
        description = 'Sản phẩm thương hiệu của các tên tuổi hàng đầu ở Việt Nam và Thế Giới. Bạn có thể hoàn toàn yên tâm về chất lượng sản phẩm khi mua hàng.';
    }
    else if (shopType == 'vip1')
    {
        rank = '05';
        title = 'Danh hiệu VIP';
        description = 'Dịch vụ Shop VIP giúp cho các shop buôn bán nghiêm túc có thể tạo ra sự khác biệt với người mua.<br /><strong>Shop muốn đăng ký?</strong> Xem chi tiết <a href="/vip/register" target="_blank">tại đây.</a>';
    }
    else if (shopType == 'vip2')
    {
        rank = '06';
        title = 'Danh hiệu VIP';
        description = 'Dịch vụ Shop VIP giúp cho các shop buôn bán nghiêm túc có thể tạo ra sự khác biệt với người mua.<br /><strong>Shop muốn đăng ký?</strong> Xem chi tiết <a href="/vip/register" target="_blank">tại đây.</a>';
    }
    

    return '<div class="popup_outside">'+
    '<img src="'+ imgurl  +'/bubble-tail.gif" alt="" />'+
    '<div class="popup">'+
    '<p class="title_ranking'+ rank +'">'+ title +'</p>'+
    '<p>'+ description +'</p>'+
    '</div>'+
    '</div>';
}

function cmd_keyword()
{
    var keyword = $('#keyword').val();
    if(keyword == '' || keyword == 'Bạn tìm gì cho ngày hôm nay?')
    {
        $(this).myBoxy (Boxy,{
            type: 'alert',
            message: 'Bạn cần nhập từ khóa cần tìm kiếm.'
        });
        $('#keyword').focus();
        return false;
    }
    var search_url = baseurl + '/product/search/keyword/' +keyword;
    $('#frmSearch').attr('action', search_url);
};

function submitLogin()
{
	$('#loginHead').submit();
}

$(function(){
    $('.bubbleInfo').each(function () {
        var distance = 10;
        var time = 250;
        var showDelay = 500;
		var hideDelay = 300;

        var showDelayTimer = null;
		var hideDelayTimer = null;

        var beingShown = false;
        var shown = false;
        var trigger = $('.trigger', this);
        //var info = $('.popup_outside', this).css('opacity', 0);

        var shopType;
        if ($(this).hasClass('shop_vip'))
        {
            shopType = 'vip';
        }
        else if ($(this).hasClass('shop_vip1'))
        {
            shopType = 'vip1';
        }
        else if ($(this).hasClass('shop_vip2'))
        {
            shopType = 'vip2';
        }
        else if ($(this).hasClass('shop_bestchoice'))
        {
            shopType = 'bestchoice';
        }
        else if ($(this).hasClass('shop_verified'))
        {
            shopType = 'verified';
        }
        else if ($(this).hasClass('shop_unverified'))
        {
            shopType = 'unverified';
        }
	
		var info;
		
        $(trigger.get(0)).mouseover(function () {
			var badget = this;
            info = $(badget).next();

            if (!info.length)
            {
                $(badget).after(bubbleTemplate(shopType));
                info = $(badget).next();
				
				info.mouseover(function(){
					if (hideDelayTimer) clearTimeout(hideDelayTimer);
				}).mouseout(function(){
					$(trigger).mouseout();
				});
				
            }

            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            if (beingShown || shown) {
                // don't trigger the animation again
                return;
            } else {
				if (showDelayTimer)
				{
					clearTimeout(showDelayTimer);
				}
				
				showDelayTimer = setTimeout(function() {
					// reset position of info box
					beingShown = true;

					info.css({
						top: 26,
						left: -115 + ($(badget).width() / 2),
						width: 230,
						display: 'block'
					}).animate({
						top: '-=' + distance + 'px',
						opacity: 1
					}, time, 'swing', function() {
						beingShown = false;
						shown = true;
					});
				}, showDelay);                
            }

            return false;
        }).mouseout(function () {
			if (showDelayTimer)
			{
				clearTimeout(showDelayTimer);
			}

            if (hideDelayTimer)
			{
				clearTimeout(hideDelayTimer);
			}
            hideDelayTimer = setTimeout(function () {
                hideDelayTimer = null;
                info.animate({
                    top: '-=' + distance + 'px',
                    opacity: 0
                }, time, 'swing', function () {
                    shown = false;
                    info.css('display', 'none');
                });

            }, hideDelay);

            return false;
        });
    });
});

var resizeAds = function (zone, width, height)
{
	$('#' + zone + ' iframe').attr('width', width).attr('height', height);
}

var removeAds = function (zone)
{
	$('#' + zone).remove();
}