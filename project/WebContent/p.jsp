<%@ page contentType="text/html;charset=UTF-8" import="java.io.InputStreamReader,java.io.BufferedReader,java.sql.*,java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>醫療街景圖</title>
<script type="text/javascript">
function changesize(){
window.resizeTo(650,530);
}
window.onload=changesize;
window.onresize=changesize;
</script> 
</head>
<%
String lat=new String(request.getParameter("lat").getBytes("ISO-8859-1"),"utf-8");
String lng=new String(request.getParameter("lng").getBytes("ISO-8859-1"),"utf-8");
%>
<body>
<div id="pano" style="position:absolute;width: 600px; height: 400px;"></div> 
<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAYfnyN6Qgq8s2FTCF1sxFUBSSa7TaHkg1GKregRMXwQIJ7pIq8hQ6Qrn45u-3xpYXLrbS8A8rWTIcFg" type="text/javascript"></script>

<script type="text/javascript">  
var loc = new GLatLng(<%out.println(lat);%>,<%out.println(lng);%>);   
new GStreetviewPanorama(document.getElementById("pano"), {latlng: loc});  
</script> 
</body>
</html>