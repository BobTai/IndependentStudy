<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
String menu_id = request.getParameter("menu_id");
String sql="delete from save_menu where menu_id='"+menu_id+"'";
smt.executeUpdate(sql);
String sql1="delete from save_food where menu_id='"+menu_id+"'";
smt.executeUpdate(sql1);
String sql2="delete from nutrition_result where menu_id='"+menu_id+"'";
smt.executeUpdate(sql2);
smt.close();
con.close();
response.sendRedirect("resume8.jsp");
%>
</body>
</html>