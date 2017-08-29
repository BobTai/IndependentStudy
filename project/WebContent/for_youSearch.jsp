<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.regex.Matcher,java.util.regex.Pattern,health.JsonParsing,java.io.InputStreamReader,java.io.BufferedReader,java.sql.*,java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>快速搜尋任你行</title>
<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAYfnyN6Qgq8s2FTCF1sxFUBSSa7TaHkg1GKregRMXwQIJ7pIq8hQ6Qrn45u-3xpYXLrbS8A8rWTIcFg" type="text/javascript"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<link rel="stylesheet" href="css/main.css" type="text/css"/>
</head>
<%

String latitude_and_longitude="";
String latitude ="";
String longitude="";
String localname="";
String localnameList = "";
String latitudeList = "";
String longitudeList = "";
String psList="";
String ps="";

String type=new String(request.getParameter("test").getBytes("ISO-8859-1"),"utf-8");
String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
if(address==null || address.equals("")){
	address="輔仁大學";
}
//out.print("type"+type);
String   tempStr   =address;//准备转换的字符
String   result   =java.net.URLEncoder.encode(tempStr, "utf-8");
//out.println("result====>"+result);



String tempUrl = "http://maps.google.com/maps/geo?q="+result+"&output=csv&key=ABQIAAAAXDq__hWKi9eMCwnn7LrMCxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSnSVp_Xlsd4Ph5iyMua7PE5E0x_A";
String url = "http://maps.google.com/maps/geo?q="+result+"&output=csv&key=ABQIAAAAXDq__hWKi9eMCwnn7LrMCxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSnSVp_Xlsd4Ph5iyMua7PE5E0x_A";

URL yahoo = new URL(tempUrl);
URLConnection yc = yahoo.openConnection();
BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
String inputLine = "";
String inputTemp = "";
boolean flag = false;
int frontNum[] = new int[100];
int backNum[] = new int[100];
int frontRecord = 0;
int backRecord = 0;
while ((inputLine = in.readLine()) != null) {
	inputTemp = inputTemp + inputLine + "\r\n";
}
//out.println(inputTemp);
//out.println("經度====>"+inputTemp.split(",")[2]);
//out.println("緯度====>"+inputTemp.split(",")[3]);

double latitudeNum = Double.parseDouble(inputTemp.split(",")[2]);
double longitudeNum = Double.parseDouble(inputTemp.split(",")[3]);
JsonParsing jp =new JsonParsing();//eric
//out.println(jp.gethello(latitudeNum+"",longitudeNum+""));//eric
//out.println("SELECT * FROM examination WHERE latitude < "+(latitudeNum+0.01)+" AND latitude > "+(latitudeNum-0.01)+" AND longitude < "+(longitudeNum+0.01)+" AND longitude > "+(longitudeNum-0.01)+"");

%>

<%
//以下這段一定要用
try {      

 // 建立 MySQL 驅動程式
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 //out.print("<BR>驅動 MySql 資料庫成功!");
      
}catch(Exception E) {
 //out.print("<BR>無法載入 com.mysql.jdbc.Driver ");  
 E.printStackTrace();  
} 
//以下這段一定要用
try { 
 
 // 設定連線,連到資料庫名稱"caidiy5",使用者帳號"mark",密碼"cool",使用UTF-8編碼"true",字元集用"UTF-8"

 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthy2?user=root&password=123&useUnicode=true&characterEncoding=UTF-8"); 
 
 // 判斷資料庫是否載入成功

 if(!con.isClosed())    
           //out.print("<BR>載入 MySql 資料庫成功!");  
 
 
 %>
   <%  
 // 查詢資料庫測試

 
 String s_Sql = "SELECT * FROM examination WHERE latitude < "+(latitudeNum+0.05)+" AND latitude > "+(latitudeNum-0.05)+" AND longitude < "+(longitudeNum+0.05)+" AND longitude > "+(longitudeNum-0.05)+" and type='"+type+"'";//，把材料準備好
 //out.println("fuckyou====>"+s_Sql);
 PreparedStatement pstmt = con.prepareStatement(s_Sql);//要與String s_Sql = "select * FROM student";呼應，準備做
 ResultSet rs = pstmt.executeQuery(); //真的做
 
 // 取出 login 資料表中的內容

 while (rs.next()){   
	 localname=rs.getString("examination_office_name");
	 latitude_and_longitude = rs.getString("latitude_and_longitude");
	 ps = rs.getString("ps");
           //out.println("<br>" + latitude_and_longitude);

           latitude = latitude_and_longitude.split(",")[0];
           longitude = latitude_and_longitude.split(",")[1];
           
           localnameList = localnameList+localname+",";
           latitudeList = latitudeList + latitude+",";
           longitudeList = longitudeList +longitude+",";
           psList = psList+ps+",";

           
           
 }      
 //out.println(localnameList);
 //out.println(latitudeList);
 //out.println(longitudeList);
 //out.println(latitude);
 //out.print(longitude);
 //out.println("TYPE===>"+localnameList);
 // 關閉連線，要有順序rs, pstmt,stmt,con

 rs.close();
 rs = null;
 pstmt.close();
 pstmt = null;
 

 con.close();  
           
}catch(SQLException ex){  
      
 out.println("<BR>無法載入資料庫");  
 out.println("<BR>handle the error");
 out.println("<BR>SQLException: " + ex.getMessage());
 out.println("<BR>SQLState: " + ex.getSQLState());
 out.println("<BR>VendorError: " + ex.getErrorCode());    
}                 
%>
<body >
<%@ include file="menu.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:900px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:800px; background:url(images/index/inside_bg.gif) repeat-y;">
		
<div style="position:relative; position:absolute; top:10px; left:35px; width:485px; height:165px; background:url(images/map/map_search.png) no-repeat;">
      <form action="for_youSearch.jsp" method="post">
          <input style="position:absolute; top:60px; left:250px; width:120px" type="text" name="address">
          <select style="position:absolute; top:102px; left:250px; width:120px" name="test">
	           	
	           	<option label="醫院" value="醫院">醫院</option>
	         	<option label="藥局" value="藥局">藥局</option>	
	         	
	          <optgroup label="診所">
	            <option label="一般診所" value="一般診所">一般診所</option>
	          	<option label="耳鼻喉科" value="耳鼻喉科">耳鼻喉科</option>
	          	<option label="小兒科" value="小兒科">小兒科</option>
	          	<option label="婦產科" value="婦產科">婦產科</option>
	          	<option label="皮膚科" value="皮膚科">皮膚科</option>
				<option label="復健科" value="復健科">復健科</option>
				<option label="內科" value="內科">內科</option>
				<option label="外科" value="外科">外科</option>
				<option label="牙醫" value="牙醫">牙醫</option>
				<option label="眼科" value="眼科">眼科</option>
				<option label="骨科" value="骨科">骨科</option>
	          	<option label="中醫" value="中醫">中醫</option>
				<option label="健檢中心" value="健檢中心">健檢中心</option>
	          </optgroup>
	            
          </select>
          <input style="position:absolute; top:57px; right:27px;" type=image value=search SRC="images/map/search_button.png" onmouseover="this.src='images/map/search_button1.png'" onmousedown="this.src='images/map/search_button.png'" onmouseout="this.src='images/map/search_button.png'"/>
      </form>
</div>
		                                <!--Google Map 顯示的位置，可自由決定大小-->
             <script>
             function goshow(){
                    	 document.getElementById('show').innerHTML = '正在即時運算中.....';
             }
             </script>
<div style="position:relative; position:absolute; top:200px; left:40px; background:url(images/map/map_bg.png) no-repeat; width:907px; height:573px;">                             
	<div id="mymap" style="position:absolute; top:60px; left:80px; width: 747px; height: 453px;"></div>
</div>
		
		</div>
		<div style="width:988px; height:43px; background:url(images/index/inside_bottom.gif) no-repeat;">
		</div>
		<div align=left style="margin-left:12px; margin-top:10px;">
		<a href="#">首頁</a>&nbsp;|
		<a href="#">關於我們</a>&nbsp;|
		<a href="#">聯絡我們</a>
		</div>
	</div>
</div>

<!--開始   -->     
<!--以下為控制Google Maps的JavaScript-->
<script type="text/javascript">

//<![CDATA[
var map = new GMap(document.getElementById("mymap"));

//設定要顯示的控制項
map.addControl(new GScaleControl());
map.addControl(new GLargeMapControl());
//map.addControl(new GOverviewMapControl());
map.addControl(new GMapTypeControl());

//決定你 Google 地圖的中心點位置和縮放大小
//latitude_and_longitude
map.setCenter(new GLatLng(<%out.print(latitudeNum);%>,<%out.print(longitudeNum);%>),11);
//25.020152,121.427179
//標記在 Google 地圖上的經緯度

<%
	String arylocalnameList[] =localnameList.split(","); 
	String arylatitudeList[] =latitudeList.split(","); 
	String arylongitudeList[] =longitudeList.split(","); 
	String arypsList[] =psList.split(",");
	String strWantToURL = "";
	String strComment="<br>";
	if(!localnameList.equals("") && arylocalnameList.length>=1){
	for(int i=0;i<arylocalnameList.length;i++){
		
		String efactAddress = jp.gethello2(arylatitudeList[i],arylongitudeList[i]);//eric 
		String inputTemp2 = "";
		URL yahoo2 = null;
		URLConnection yc2 = null;
		BufferedReader in2 = null;
		String inputLine2 = "";
		
		
%>

var point<%out.print(i);%> = new GLatLng(<%out.print(arylatitudeList[i]);%>,<%out.print(arylongitudeList[i]);%>);
var marker<%out.print(i);%> = new GMarker(point<%out.print(i);%>);

GEvent.addListener(marker<%out.print(i);%>, "click", function() {
	//window.open ('p.jsp?lat=<%out.print(arylatitudeList[i]);%>&lng=<%out.print(arylongitudeList[i]);%>');
	
	this.openInfoWindowHtml("<div align=left style='font-size:12px; color:blue'><a target='_blank' href='viewDeatil.jsp?name=<%out.print(arypsList[i]);%>'><%out.print(arypsList[i]);%></a><br><%out.print(efactAddress);%><br><a target='_blank' href='viewDeatil.jsp?name=<%out.print(arypsList[i]);%>'>觀看評價</a><br><a target='_blank' href='p.jsp?lat=<%out.print(arylatitudeList[i]);%>&lng=<%out.print(arylongitudeList[i]);%>'>街景圖</a></div>");
	//window.open('p.jsp?name=<%out.print(arypsList[i]);%>');
});

map.addOverlay(marker<%out.print(i);%>);

<%
	}
	}
%>



//在地圖上放置標點說明
var html = "<%out.print(address);%>";
map.openInfoWindowHtml (map.getCenter(), html);

var point = new GLatLng(<%out.print(latitudeNum);%>,<%out.print(longitudeNum);%>);
var marker = new GMarker(point);

GEvent.addListener(marker, "click", function() {
    this.openInfoWindowHtml("<%out.print(address);%>");
});
map.addOverlay(marker);



//var marker<%out.print(address);%> = new GMarker(point<%out.print(address);%>);
//var html = "<%out.print(address);%>";
//GEvent.addListener(marker<%out.print(address);%>, "click", function() {
//map.openInfoWindowHtml (map.getCenter(), html);});

//]]>
document.getElementById('show').innerHTML = '';
</script>


</body>

</html>

<%!
	public String retrunComment(String o1,String o2,String h1){
		String r1="";
		if(o1.indexOf(o2)==-1){
			r1 = r1+"<a href='"+h1+"' target='_blank' >"+o2+"</a>"+",";
		}
		return r1;
	}
%>