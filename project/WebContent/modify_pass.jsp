<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<%@ include file="JDBCConstants.jsp"%>
<body>
<%
String account = request.getParameter("account");
String old_password = request.getParameter("old_password");
String password = request.getParameter("password");
String rand = (String)session.getAttribute("rand");  
String input = request.getParameter("insrand");

String sql = "SELECT password from member where account = '"+account+"'";
ResultSet rs = smt.executeQuery(sql);
rs.first();

if(rs.getString("password").equals(old_password) && rand.equals(input))
{
	String sql1 = "UPDATE member SET password = '"+password+"' WHERE account = '"+account+"';";
	smt.executeUpdate(sql1);
	out.print("修改密碼成功!");
}
else
{
	out.print("舊密碼或驗證碼輸入錯誤!");
}
%>
</body>
</html>