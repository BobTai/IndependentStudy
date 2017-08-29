<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康診斷結果</title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
String diagnos_id = request.getParameter("diagnos_id");
String sql = "SELECT * from diagnos_save where diagnos_id = '"+diagnos_id+"'";
ResultSet rs = smt.executeQuery(sql);
rs.first();
%>
<div style="width:676px; height:48px; background:url(images/resume/diag_title.png) no-repeat;"></div>
<div style="position:relative; width:676px; height:40px; background:url(images/resume/diag_mid.png) no-repeat;">
	<div style="position:absolute; top:12px; left:145px"><%=rs.getString("type")%></div>
	<div style="position:absolute; top:10px; left:405px"><%=rs.getString("date")%></div>
</div>
<div style="width:676px; height:20px; background:url(images/resume/diag1.png) no-repeat;">
	<div style="margin:3px 0 0 117px; font-size:15px"><%=rs.getString("one_pain") %></div>
</div>
<div style="width:676px; height:20px; background:url(images/resume/diag2.png) no-repeat;">
	<div style="margin:3px 0 0 117px; font-size:15px"><%=rs.getString("two_pain") %></div>
</div>
<div style="width:676px; height:20px; background:url(images/resume/diag3.png) no-repeat;">
	<div style="margin:3px 0 0 117px; font-size:15px"><%=rs.getString("third_pain") %></div>
</div>
<div style="width:676px; height:60px; background:url(images/resume/diag4.png) no-repeat;">
	<div style="margin:3px 0 0 100px; font-size:15px; width:550px"><%=rs.getString("pain_answer") %></div>
</div>
<div style="width:676px; height:20px; background:url(images/resume/diag_bottom.png) no-repeat;"></div>
</body>
</html>