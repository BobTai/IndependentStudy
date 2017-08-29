<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>飲食營養計算</title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>

<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:600px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:898px; height:420px; background:url(images/index/index_bg.gif) repeat-y;">
			<img style="position:absolute; top:20px; left:120px;" src="images/food/set_menu.png">
			<div style="position:relative; position:absolute; top:60px; left:120px; margin-top:40px; width:658px; height:301px; background:url(images/food/nut_data.png) no-repeat;">
				<form action="foodnutrition2.jsp" method="post" name="sub">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
	String sql = "SELECT * from member where account = '"+name+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.first();
	int height = rs.getInt("height");
	int weight = rs.getInt("weight");
	String gender = rs.getString("member_gender");
	String date = rs.getString("member_birthday");
	String year = date.substring(0,4);
	int year2 = Integer.parseInt(year);
	java.util.Date today = new java.util.Date();
	int year1 = today.getYear()+1900;
	int age = year1-year2;
%>					
					<input style="position:absolute; top:32px; left:305px; width:50px" type="text" name="age" id="age" value="<%=age%>">
	<%
	if(gender.equals("男性")){
	%>					
					<input style="position:absolute; top:62px; left:302px;" type="radio" name="gender" id=gender1 value="0" checked>
					<input style="position:absolute; top:62px; left:359px;" type="radio" name="gender" id=gender2 value="1">
	<%
	}
	else{
	%>				
					<input style="position:absolute; top:62px; left:302px;" type="radio" name="gender" id=gender1 value="0">
					<input style="position:absolute; top:62px; left:359px;" type="radio" name="gender" id=gender2 value="1" checked>
	<%} %>				
					<input style="position:absolute; top:92px; left:305px; width:50px" type="text" name="height" id="height" value="<%=height%>">
					<input style="position:absolute; top:122px; left:305px; width:50px" type="text" name="weight" id="weight" value="<%=weight%>">
					<input style="position:absolute; top:161px; left:292px;" type="image" src="images/food/nut_data_sub.png">
<%}else{ %>	
					<input style="position:absolute; top:32px; left:305px; width:50px" type="text" name="age" id="age">
					<input style="position:absolute; top:62px; left:302px;" type="radio" name="gender" id=gender1 value="0">
					<input style="position:absolute; top:62px; left:359px;" type="radio" name="gender" id=gender2 value="1">
					<input style="position:absolute; top:92px; left:305px; width:50px" type="text" name="height" id="height">
					<input style="position:absolute; top:122px; left:305px; width:50px" type="text" name="weight" id="weight">
					<input style="position:absolute; top:161px; left:292px;" type="image" src="images/food/nut_data_sub.png">
<%} %>				
				</form>
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