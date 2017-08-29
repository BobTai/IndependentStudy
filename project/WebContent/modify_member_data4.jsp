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
String account = request.getParameter("account3");

String sql="delete from my_medical_history where account='"+account+"';";
smt.executeUpdate(sql);

String sql1="delete from family_medical_history where account='"+account+"';";
smt.executeUpdate(sql1);

String n1 = request.getParameter("n1");
int n11 = Integer.parseInt(n1);
if(n11==2){
	String[] d=request.getParameterValues("d");
	for (int i = 0; i < d.length; i++){
    	String sql2 = "INSERT INTO my_medical_history(d_name, account) VALUES ('"+d[i]+"','"+account+"');";
    	smt.execute(sql2);
    }
}
String n2 = request.getParameter("n2");
int n21 = Integer.parseInt(n2);
if(n21==2){
	String[] d1=request.getParameterValues("d1");
	for (int i = 0; i < d1.length; i++){
    	String sql3 = "INSERT INTO family_medical_history(d_name, account) VALUES ('"+d1[i]+"','"+account+"');";
    	smt.execute(sql3);
    }
}
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