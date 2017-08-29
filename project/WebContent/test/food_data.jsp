<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>吃了什麼</title>
</head>
<%@ include file="JDBCConstants.jsp"%>
<body>
<%
String date = request.getParameter("date");
out.print(date);
%>
</body>
</html>