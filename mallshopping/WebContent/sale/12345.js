function displayVaueExchage()
{
	var value = $('#currency_id').val();
	if(value == 3)
	{
		var exchage = $('#exchange_usd').val();
		var buynow = $('#price_buynow').val();
		if(buynow && exchage)
		{
			exchage = replatePrice(exchage);
			buynow = replatePrice(buynow);
			buynow = buynow*exchage;
			buynow = FormatCurrency(String(buynow));
		}
		else
			buynow = 0;
		buynow = '=' + buynow + ' VNÄ';
		$('#value_exchange').html(buynow);
	}
}

function replatePrice(price)
{
	if(price)
	{
		var price = price.replace(/\./g, "");		
		return price;
	}
}

function FormatCurrency(data){
    var tmp1='';
    var num=''; 
    var i = 0;
    tmp1 = insComma(data);
    var total = tmp1.length;
   for (i = total-1; i >= 0; i--) 
   {
      num += tmp1.charAt(i);
   }         
    return num;
}

function insComma(data){
    var count = 0;
    var i = 0;
    var tmpStr = "";
    var comma = ".";
 
   for (i = (data.length)-1; i >= 0; i--) {
       if (count == 3){
          tmpStr += comma;
          count = 1;
       }else 
          count ++;
       if(data.charAt(i)==',')
       {
          count = 0;
          tmpStr = tmpStr.replace(/[.]/g,'');
       }      
       tmpStr += data.charAt(i); 
    }
    return tmpStr;
 }

