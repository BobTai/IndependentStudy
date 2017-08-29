<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>量身訂做護一生</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<%@ include file="menu.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:900px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:800px; background:url(images/index/inside_bg.gif) repeat-y;">
		
<div style="position:relative; position:absolute; top:10px; left:35px; width:485px; height:165px; background:url(images/map/map_search.png) no-repeat;">
      <form action="for_youSearchIpad.jsp" method="post">
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
		<img style="position:absolute; top:200px; left:40px;" src="images/map/map_bg1.png">
		
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
</body>
</html>
