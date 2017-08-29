<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.regex.Matcher,java.util.regex.Pattern,health.JsonParsing,java.io.InputStreamReader,java.io.BufferedReader,java.sql.*,java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>快速搜尋任你行</title>

<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<link rel="stylesheet" href="css/main.css" type="text/css"/>
<script type="text/javascript">
function changesize(){
window.resizeTo(650,430);
}
window.onload=changesize;
window.onresize=changesize;
</script> 
</head>

<body >

<%
		String doctor=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		System.out.println(doctor);
		String inputTemp2 = "";
		URL yahoo2 = null;
		URLConnection yc2 = null;
		BufferedReader in2 = null;
		String inputLine2 = "";
		String strWantToURL = "";
		String strComment = "";
		try{
		

		String tempUrl2 = "http://www.bing.com/search?q="+java.net.URLEncoder.encode(doctor+"評論","utf-8")+"&go=&qs=n&sk=&form=QBRE&filt=all";
		//String url = "http://www.99comic.com/";
		yahoo2 = new URL(tempUrl2);
		yc2 = yahoo2.openConnection();
		in2 = new BufferedReader(new InputStreamReader(yc2
				.getInputStream()));
		
		
		while ((inputLine2 = in2.readLine()) != null) {
			inputTemp2 = inputTemp2 + inputLine2 + "\r\n";
		}
		
		String wanttosearch = "";
		Pattern pat;
		Matcher mat;
		
		}catch(Exception ex){
			
		}

		
		double intgood=0.3;
		double intbad=0;
		String arr[] = new String[3];
		try{
		Pattern pattern = Pattern.compile("<div class=\"sb_tlst\"><h3><a href=\"[\\s\\S]+?\""); // 建立要比對的pattern
		Matcher matcher = pattern.matcher(inputTemp2);
		int iii=0;
		while (matcher.find()&& iii<4) {// 看pattern是否含在字串中
			strWantToURL = matcher.group().replace("<div class=\"sb_tlst\"><h3><a href=\"","").replace("\"","");
			arr[iii] = strWantToURL;	
			iii = iii+1;
		}
		}catch(Exception ex){
			
		}
		try{
		System.out.println(strWantToURL);
		strComment ="<br>";
		for(int iiiii=0;iiiii<arr.length;iiiii++){
			strWantToURL = arr[iiiii];
			System.out.println("strWantToURL=====>"+strWantToURL);
			if(strWantToURL!=null && !strWantToURL.equals("")){
				yahoo2 = new URL(strWantToURL);
				yc2 = (HttpURLConnection)yahoo2.openConnection();
				yc2.setRequestProperty("User-agent","IE/6.0");
				in2 = new BufferedReader(new InputStreamReader(yc2.getInputStream()));
				inputLine2 = "";
				inputTemp2 = "";
				while ((inputLine2 = in2.readLine()) != null) {
					inputTemp2 = inputTemp2 + inputLine2 + "\r\n";
				}
				
				if(inputTemp2.indexOf("不錯")!=-1){
					strComment = strComment+retrunComment(strComment,"不錯",strWantToURL);
					intgood = intgood +1;
				}
				if(inputTemp2.indexOf("很好")!=-1){
					strComment = strComment+retrunComment(strComment,"很好",strWantToURL);
					intgood = intgood +1;
				}
				if(inputTemp2.indexOf("不好")!=-1){
					strComment = strComment+retrunComment(strComment,"不好",strWantToURL);
					intbad = intbad +1;
				}
				if(inputTemp2.indexOf("很差")!=-1){
					strComment = strComment+retrunComment(strComment,"很差",strWantToURL);
					intbad = intbad +1;
				}
				if(inputTemp2.indexOf("技術好")!=-1 || inputTemp2.indexOf("好的治療")!=-1&& inputTemp2.indexOf("技術不好")==-1)
				{
					strComment = strComment+retrunComment(strComment,"技術好",strWantToURL);
					intgood = intgood +1;;
				}
				if(inputTemp2.indexOf("技術不好")!=-1){
					strComment = strComment+retrunComment(strComment,"技術不好",strWantToURL);
					intbad = intbad +1;
				}
	
					if(inputTemp2.indexOf("有效")!=-1 && inputTemp2.indexOf("沒效")==-1|| inputTemp2.indexOf("沒有效")==-1){
						strComment = strComment+retrunComment(strComment,"有效",strWantToURL);
						intgood = intgood +1;}
					
	
					if(inputTemp2.indexOf("沒效")!=-1|| inputTemp2.indexOf("沒有效")!=-1 && inputTemp2.indexOf("有效")==-1){
						strComment = strComment+retrunComment(strComment,"沒效",strWantToURL);
						intbad = intbad +1;}
	
					if(inputTemp2.indexOf("認真")!=-1 && inputTemp2.indexOf("不認真")==-1){
						strComment = strComment+retrunComment(strComment,"認真",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不認真")!=-1 && inputTemp2.indexOf("認真")==-1){
						strComment = strComment+retrunComment(strComment,"不認真",strWantToURL);
						intbad = intbad +1;}
	
					if(inputTemp2.indexOf("滿意")!=-1 && inputTemp2.indexOf("不滿意")==-1){
						strComment = strComment+retrunComment(strComment,"滿意",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不滿意")!=-1 && inputTemp2.indexOf("滿意")==-1){
						strComment = strComment+retrunComment(strComment,"不滿意",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("好")!=-1 && inputTemp2.indexOf("不好")==-1){
						strComment = strComment+retrunComment(strComment,"好",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不好")!=-1 && inputTemp2.indexOf("好")==-1){
						strComment = strComment+retrunComment(strComment,"不好",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("冷淡")!=-1){
						strComment = strComment+retrunComment(strComment,"冷淡",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("細心")!=-1){
						strComment = strComment+retrunComment(strComment,"細心",strWantToURL);
					intgood = intgood +1;}
					if(inputTemp2.indexOf("熱心")!=-1){
						strComment = strComment+retrunComment(strComment,"熱心",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("敷衍")!=-1 ||inputTemp2.indexOf("粗心")!=-1){
						strComment = strComment+retrunComment(strComment,"敷衍",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("溫柔")!=-1) {
						strComment = strComment+retrunComment(strComment,"溫柔",strWantToURL);
					intgood = intgood +1;}
	
					if(inputTemp2.indexOf("兇狠")!=-1) {
						strComment = strComment+retrunComment(strComment,"兇狠",strWantToURL);
					intbad = intbad +1;}
					if(inputTemp2.indexOf("方便")!=-1 && inputTemp2.indexOf("不便")==-1 || inputTemp2.indexOf("不方便")==-1){
						strComment = strComment+retrunComment(strComment,"方便",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不便")!=-1 || inputTemp2.indexOf("不方便")!=-1&& inputTemp2.indexOf("方便")==-1){
						strComment = strComment+retrunComment(strComment,"不便",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("舒服")!=-1 && inputTemp2.indexOf("不舒服")==-1){
						strComment = strComment+retrunComment(strComment,"舒服",strWantToURL);
						intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不舒服")!=-1&& inputTemp2.indexOf("舒服")==-1){
						strComment = strComment+retrunComment(strComment,"不舒服",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("準時")!=-1 && inputTemp2.indexOf("不準時")==-1){
						strComment = strComment+retrunComment(strComment,"準時",strWantToURL);
					intgood = intgood +1;}
	
					if(inputTemp2.indexOf("不準時")!=-1 && inputTemp2.indexOf("準時")==-1){
						strComment = strComment+retrunComment(strComment,"不準時",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("黑店")!=-1){
						strComment = strComment+retrunComment(strComment,"黑店",strWantToURL);
					intbad = intbad +1;}
					if(inputTemp2.indexOf("差")!=-1){
						strComment = strComment+retrunComment(strComment,"差",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("不重視病人的感受")!=-1){
						strComment = strComment+retrunComment(strComment,"不重視病人的感受",strWantToURL);
						intbad = intbad +1;}
					if(inputTemp2.indexOf("一直推銷")!=-1){
						strComment = strComment+retrunComment(strComment,"一直推銷",strWantToURL);
						intbad = intbad +1;}
	
			}
		}
		}catch(Exception ex){
			System.out.println(ex);
			
		}
		//顯示的部分
%>
<div style="position:relative; margin:10px 0 0 10px; width:601px; height:301px; background:url(images/map/health.png) no-repeat;">
<div style="position:absolute; font-size:16px; top:23px; left:113px"><%=doctor %></div>
<div style="position:absolute; font-size:16px; top:23px; left:383px"><%=intgood %>分</div>
<div style="position:absolute; font-size:16px; top:23px; left:492px"><%=intbad %>分</div>
<div style="position:absolute; font-size:16px; top:70px; left:47px"><%=strComment %></div>
</div>	

</body>

</html>

<%!
	public String retrunComment(String o1,String o2,String h1){
		String r1="";
			System.out.println("xxxx====>"+h1);
			r1 = r1+"<a href='"+h1+"' target='_blank' >"+h1+"</a>"+"    評價:"+o2+"<br>";
		
		return r1;
	}
%>