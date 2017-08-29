<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改會員</title>
</head>
<%@ include file="JDBCConstants.jsp" %>
<%@ include file="menu.jsp"%>
<body>
<%
String account = request.getParameter("account");
String member_name = request.getParameter("member_name");
String online_name = request.getParameter("online_name");
String gender = request.getParameter("gender");
String member_birthday = request.getParameter("member_birthday");
String member_email = request.getParameter("member_email");
String member_address = request.getParameter("member_address");

String sql = "UPDATE member SET member_name = '"+ member_name +"', online_name = '"+ online_name +"', member_gender = '"+ gender +"', member_birthday = '"+ member_birthday +"', member_email = '"+ member_email +"', member_address = '"+ member_address +"' WHERE account = '"+account+"';";
smt.executeUpdate(sql);
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
		
		<div style="position:relative; margin-top:20px; width:595px; height:369px; background:url(images/member/modify_succ.png) no-repeat;">
			<a href="member_data.jsp">
				<img style="position:absolute; bottom:75px; right:240px" src="images/member/my_data.png" onmouseover="this.src='images/member/my_data1.png'" onmouseout="this.src='images/member/my_data.png'">
			</a>
			<meta http-equiv="refresh" content="3;url=member_data.jsp">
		</div>
		
		</div>
		<div style="width:898px; height:47px; background:url(images/index/index_bottom.gif) no-repeat;">
		</div>
		<div align=left style="margin-left:12px; margin-top:10px;">
		<a href="index.jsp">首頁</a>&nbsp;|
		<a href="about_us.jsp">關於我們</a>&nbsp;|
		<a href="call_us.jsp">聯絡我們</a>
		</div>
	</div>
</div>
</body>
</html>