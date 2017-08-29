<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>帳號密碼驗證</title>
<%@ include file="JDBCConstants.jsp" %>
</head>
<body>
<%@ include file="menu.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:440px; background:url(images/index/index_bg.gif) repeat-y;">
<%
request.setCharacterEncoding("utf-8");

String account = request.getParameter("username");
String password = request.getParameter("password");

if(account.length()==0 || password.length()==0)
{
%>
<img style="margin-top:30px" src="images/member/login_no_empty.png">
<meta http-equiv="refresh" content="1;url=login.jsp">
<%
}
else{
String sql = "SELECT account, password from member where account = '"+account+"'";
ResultSet rs = smt.executeQuery(sql);
rs.last();
int count=rs.getRow();
rs.first();

if(count==1 && account.length()!=0){
	if(password.equals(rs.getString("password"))){
		session.setAttribute("username",account);
		session.setAttribute("password",password);
		%>
		<img style="margin-top:30px" src="images/member/login_succ.png">
		<meta http-equiv="refresh" content="1;url=index.jsp">
		<%
	}
	else{
		%>
		<img style="margin-top:30px" src="images/member/login_wrongpass.png">
		<meta http-equiv="refresh" content="1;url=login.jsp">
		<%
	}
}
else{
	%>
	<img style="margin-top:30px" src="images/member/login_wrongall.png">
	<meta http-equiv="refresh" content="1;url=login.jsp">
	<%
}
}
%>
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