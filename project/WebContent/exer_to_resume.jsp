<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%@ include file="menu.jsp"%>
<%@ include file="JDBCConstants.jsp"%>
<body>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
<%
if(request.getParameter("name")!=null){
	String name1 = request.getParameter("name");
	String totca = request.getParameter("totca");
	String[] exer=request.getParameterValues("exer");
	String[] amount=request.getParameterValues("amount");
	
	int thisYear = myDate.getYear() + 1900;
	String date = thisYear+"-"+thisMonth+"-"+thisDate;

	String sql1 = "SELECT * from exer_cal where account = '"+name1+"' and date = '"+date+"'";
	ResultSet rs1 = smt.executeQuery(sql1);
	rs1.last();
	int count1=rs1.getRow();
	rs1.first();
	if(count1>0)
	{
%>
<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/dialog.png) no-repeat;">
	<form action="exer_to_resume.jsp" method="post" name="add_resume">
		<input type="hidden" name="name5" value="<%=name1 %>">
		<input type="hidden" name="totca5" value="<%=totca %>">
		<input type="hidden" name="date5" value="<%=date %>">
		<input type="hidden" name="exer_cal_id" value="<%=rs1.getInt("exer_cal_id")%>">
<%
for (int i = 0; i < exer.length; i++){
%>		
		<input type="hidden" name="exer" value="<%=exer[i]%>">
		<input type="hidden" name="amount" value="<%=amount[i]%>">
<%
}
%>		
		<input style="position:absolute; bottom:80px; left:150px" name="subm" type="image" src="images/resume/yes.png" onmouseover="this.src='images/resume/yes1.png'" onmouseout="this.src='images/resume/yes.png'"/>
	</form>
	<a href="resume6.jsp">
	<img style="position:absolute; bottom:80px; right:150px" src="images/resume/no.png" onmouseover="this.src='images/resume/no1.png'" onmouseout="this.src='images/resume/no.png'">
	</a>
</div>	
<%	
}
else{
String sql = "INSERT INTO exer_cal(cal, date, account) VALUES('"+totca+"','"+date+"','"+name1+"')";
smt.execute(sql);
String sql2 = "SELECT exer_cal_id from exer_cal where account = '"+name1+"' and date = '"+date+"'";
ResultSet rs2 = smt.executeQuery(sql2);
rs2.first();
int exer_cal_id = rs2.getInt("exer_cal_id");
for (int i = 0; i < exer.length; i++){
String sql3 = "INSERT INTO exer_record(exer_name, amount, exer_cal_id) VALUES('"+exer[i]+"','"+amount[i]+"','"+exer_cal_id+"')";
smt.execute(sql3);
}
%>
<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/save_succ.png) no-repeat;">
	<a href="resume6.jsp">
		<img style="position:absolute; bottom:75px; right:250px" src="images/resume/my_resume.png" onmouseover="this.src='images/resume/my_resume1.png'" onmouseout="this.src='images/resume/my_resume.png'">
	</a>
	<meta http-equiv="refresh" content="3;url=resume6.jsp">
</div>
<%
}
}
if(request.getParameter("name5")!=null){
	String name5 = request.getParameter("name5");
	String totca5 = request.getParameter("totca5");
	String date5 = request.getParameter("date5");
	String exer_cal_id = request.getParameter("exer_cal_id");
	String[] exer=request.getParameterValues("exer");
	String[] amount=request.getParameterValues("amount");
	String sql = "UPDATE exer_cal SET cal = '"+totca5+"' WHERE date = '"+date5+"' and account = '"+name5+"'";
	smt.executeUpdate(sql);
	String sql1="delete from exer_record where exer_cal_id='"+exer_cal_id+"'";
	smt.executeUpdate(sql1);
	for (int i = 0; i < exer.length; i++){
		String sql3 = "INSERT INTO exer_record(exer_name, amount, exer_cal_id) VALUES('"+exer[i]+"','"+amount[i]+"','"+exer_cal_id+"')";
		smt.execute(sql3);
	}
	%>
	<div style="position:relative; margin-top:20px; width:593px; height:368px; background:url(images/resume/modify_succ.png) no-repeat;">
		<a href="resume6.jsp">
			<img style="position:absolute; bottom:75px; right:250px" src="images/resume/my_resume.png" onmouseover="this.src='images/resume/my_resume1.png'" onmouseout="this.src='images/resume/my_resume.png'">
		</a>
		<meta http-equiv="refresh" content="3;url=resume6.jsp">
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