<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>
<body>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
<%
if(request.getParameter("name")!=null){
String name1 = request.getParameter("name");
String evaluation_name = request.getParameter("evaluation_name");
int score = Integer.parseInt(request.getParameter("score"));
java.util.Date today = new java.util.Date();
int year = today.getYear()+1900;
int month = today.getMonth()+1;
int day = today.getDate();
String date =year+"-"+month+"-"+day;

String sql1 = "SELECT * from evaluation_result where account = '"+name1+"' and evaluation_name = '"+evaluation_name+"' and date = '"+date+"' ";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.last();
int count=rs1.getRow();
if(count>0)
{
%>
<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/dialog.png) no-repeat;">
	<form action="eva_to_resume.jsp" method="post" name="add_resume">
		<input type="hidden" id=date name="date" value="<%=date %>">
		<input type="hidden" id=name name="name5" value="<%=name1 %>">
		<input type="hidden" name="evaluation_name5" value="<%=evaluation_name%>">
		<input type="hidden" name="score5" value="<%=score%>">
		<input style="position:absolute; bottom:80px; left:150px" name="subm" type="image" src="images/resume/yes.png" onmouseover="this.src='images/resume/yes1.png'" onmouseout="this.src='images/resume/yes.png'"/>
	</form>
	<a href="resume4.jsp">
	<img style="position:absolute; bottom:80px; right:150px" src="images/resume/no.png" onmouseover="this.src='images/resume/no1.png'" onmouseout="this.src='images/resume/no.png'">
	</a>
</div>	
<%	
}
else{
String sql = "INSERT INTO evaluation_result(evaluation_name, score, date, account) VALUES('"+evaluation_name+"','"+score+"','"+date+"','"+name1+"')";
smt.execute(sql);
%>
<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/save_succ.png) no-repeat;">
	<a href="resume4.jsp">
		<img style="position:absolute; bottom:75px; right:250px" src="images/resume/my_resume.png" onmouseover="this.src='images/resume/my_resume1.png'" onmouseout="this.src='images/resume/my_resume.png'">
	</a>
	<meta http-equiv="refresh" content="3;url=resume4.jsp">
</div>
<%
}
}
if(request.getParameter("name5")!=null){
	String date = request.getParameter("date");
	String name5 = request.getParameter("name5");
	String evaluation_name5 = request.getParameter("evaluation_name5");
	int score5 = Integer.parseInt(request.getParameter("score5"));
	String sql = "UPDATE evaluation_result SET score = '"+score5+"' WHERE account = '"+name5+"' and evaluation_name = '"+evaluation_name5+"' and date = '"+date+"'";
	smt.executeUpdate(sql);
	%>
	<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/modify_succ.png) no-repeat;">
		<a href="resume4.jsp">
			<img style="position:absolute; bottom:75px; right:250px" src="images/resume/my_resume.png" onmouseover="this.src='images/resume/my_resume1.png'" onmouseout="this.src='images/resume/my_resume.png'">
		</a>
		<meta http-equiv="refresh" content="3;url=resume4.jsp">
	</div>
	<%
}
%>
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