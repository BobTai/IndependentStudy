<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康履歷</title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
	String sql = "SELECT * from member where account = '"+name+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
%>
<div style="position:relative; width:669px; height:535px; background:url(images/resume/disease3.png) no-repeat;">
123
</div>
<%} %>
</body>
</html>