<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
String diagnos_id = request.getParameter("diagnos_id");
String sql="delete from diagnos_save where diagnos_id='"+diagnos_id+"'";
smt.executeUpdate(sql);
response.sendRedirect("resume5.jsp");
%>
</body>
</html>