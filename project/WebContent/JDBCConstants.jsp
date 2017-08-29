<%@ page language="java" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String DB_driver = "com.mysql.jdbc.Driver";
String DB_address = "jdbc:mysql://localhost:3306/healthy2";
String DB_account = "root";
String DB_password = "123";
Class.forName(DB_driver);
Connection con = DriverManager.getConnection(DB_address, DB_account, DB_password); 
Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
%>