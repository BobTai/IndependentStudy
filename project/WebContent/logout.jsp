<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="1;url=index.jsp">
<title>Insert title here</title>
</head>
<body>
<%@ include file="menu.jsp"%>
<%
	session.invalidate();
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:450px; background:url(images/index/index_bg.gif) repeat-y;">
			<img style="margin-top:30px" src="images/member/logout_succ.png">
		</div>
		<div style="width:898px; height:47px; background:url(images/index/index_bottom.gif) no-repeat;">
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