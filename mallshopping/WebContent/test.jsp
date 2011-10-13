<%@page import="UTIL.ServletUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="<%=ServletUtils.getBaseUrl(request)%>/scripts/jquery.js"></script> 

</script>

<script language="javascript">
function  PreviewImage(ImgUrl)
{
    document.getElementById("Preview").innerHTML = '<img style="height:50; width:50" src="' + ImgUrl +
'" border="0" />';
    document.getElementById("Preview").style.visibility ='visible';
}

</script>
</head>

<body>
<form enctype="multipart/form-data">
<input type="file" onchange="PreviewImage(this.value);" />
</form>
<div id="Preview">Preview image here</div>
</body>
</html> 