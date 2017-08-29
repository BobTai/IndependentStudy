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
String account = request.getParameter("account2");

String h1 = request.getParameter("h1");
int h1_1 = Integer.parseInt(h1);
int h1_num1=0;
int h1_year3=0;
if(h1_1==0){h1_num1=0;h1_year3=0;}
if(h1_1==1){
	String h1_num = request.getParameter("h1_num");
	h1_num1 = Integer.parseInt(h1_num);
	String h1_year1 = request.getParameter("h1_year1");
	h1_year3 = Integer.parseInt(h1_year1);
}
if(h1_1==2){
	h1_num1=0;
	String h1_year2 = request.getParameter("h1_year2");
	h1_year3 = Integer.parseInt(h1_year2);
}
String h2 = request.getParameter("h2");
int h2_1 = Integer.parseInt(h2);
int h2_num1=0;
int h2_year3=0;
if(h2_1==0){h2_num1=0;h2_year3=0;}
if(h2_1==1){
	String h2_num = request.getParameter("h2_num");
	h2_num1 = Integer.parseInt(h2_num);
	String h2_year1 = request.getParameter("h2_year1");
	h2_year3 = Integer.parseInt(h2_year1);
}
if(h2_1==2){
	h2_num1=0;
	String h2_year2 = request.getParameter("h2_year2");
	h2_year3 = Integer.parseInt(h2_year2);
}
String h3 = request.getParameter("h3");
int h3_1 = Integer.parseInt(h3);
int h3_num1=0;
int h3_year3=0;
if(h3_1==0){h3_num1=0;h3_year3=0;}
if(h3_1==1){
	String h3_num = request.getParameter("h3_num");
	h3_num1 = Integer.parseInt(h3_num);
	String h3_year1 = request.getParameter("h3_year1");
	h3_year3 = Integer.parseInt(h3_year1);
}
if(h3_1==2){
	h3_num1=0;
	String h3_year2 = request.getParameter("h3_year2");
	h3_year3 = Integer.parseInt(h3_year2);
}

String sql = "UPDATE hobby SET smoke ='"+h1_1+"', smoke_number ='"+h1_num1+"', smoke_year ='"+h1_year3+"', drink ='"+h2_1+"', drink_number ='"+h2_num1+"', drink_year ='"+h2_year3+"', betel ='"+h3_1+"', betel_number ='"+h3_num1+"', betel_year ='"+h3_year3+"' WHERE account = '"+account+"'";
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