<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>吃了什麼</title>
</head>
<%@ include file="JDBCConstants.jsp"%>
<body>
<%
String eat_cal_id = request.getParameter("eat_cal_id");
String sql = "SELECT * from eat_cal where eat_cal_id = '"+eat_cal_id+"'";
ResultSet rs = smt.executeQuery(sql);
rs.first();
%>
<div style="position:relative; position:absolute; top:10px; left:10px; width:269px; height:41px; background:url(images/resume/eat_date.png) no-repeat;">
	<div style="position:absolute; top:10px; left:128px; font-size:20px">
		<%=rs.getString("date")%>
	</div>
</div>
<div style="position:relative; position:absolute; top:8px; left:290px; width:336px; height:44px; background:url(images/resume/eat_cal.png) no-repeat;">
	<div style="position:relative; position:absolute; top:12px; left:195px; font-size:21px">
		<%=rs.getInt("cal")%>
	</div>
</div>
<div style="position:relative; position:absolute; top:60px; left:10px; width:855px; height:161px; background:url(images/resume/eat_table.png) no-repeat;">
	<DIV style="position:absolute; bottom:1px; left:1px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:212px; HEIGHT:121px; font-size:15px">
<%
String sql1 = "SELECT * from food_record where eat_cal_id = '"+eat_cal_id+"' and food_name like '%(早)'";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.last();
int count1=rs1.getRow();
rs1.first();
if(count1==0){
%>		
		<div style="margin:5px 0 0 5px">無食用任何餐點 !</div>
<%
}else{
%>
		<table>	
<%for(int i=0;i<count1;i++){ %>
		<tr><td width=150><%=rs1.getString("food_name")%></td><td width=60><%=rs1.getString("amount")%></td></tr>
<%
rs1.next();
} 
%>	
		</table>
<%}%>	
	</DIV>
	<DIV style="position:absolute; bottom:1px; left:215px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:212px; HEIGHT:121px; font-size:15px">
<%
String sql2 = "SELECT * from food_record where eat_cal_id = '"+eat_cal_id+"' and food_name like '%(中)'";
ResultSet rs2 = smt.executeQuery(sql2);
rs2.last();
int count2=rs2.getRow();
rs2.first();
if(count2==0){
%>		
		<div style="margin:5px 0 0 5px">無食用任何餐點 !</div>
<%
}else{
%>
		<table>	
<%for(int i=0;i<count2;i++){ %>
		<tr><td width=150><%=rs2.getString("food_name")%></td><td width=60><%=rs2.getString("amount")%></td></tr>
<%
rs2.next();
} 
%>	
		</table>
<%}%>	
	</DIV>
	<DIV style="position:absolute; bottom:1px; left:429px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:212px; HEIGHT:121px; font-size:15px">
<%
String sql3 = "SELECT * from food_record where eat_cal_id = '"+eat_cal_id+"' and food_name like '%(晚)'";
ResultSet rs3 = smt.executeQuery(sql3);
rs3.last();
int count3=rs3.getRow();
rs3.first();
if(count3==0){
%>		
		<div style="margin:5px 0 0 5px">無食用任何餐點 !</div>
<%
}else{
%>
		<table>	
<%for(int i=0;i<count3;i++){ %>
		<tr><td width=150><%=rs3.getString("food_name")%></td><td width=60><%=rs3.getString("amount")%></td></tr>
<%
rs3.next();
} 
%>	
		</table>
<%}%>	
	</DIV>
	<DIV style="position:absolute; bottom:1px; left:642px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:212px; HEIGHT:121px; font-size:15px">
<%
String sql4 = "SELECT * from food_record where eat_cal_id = '"+eat_cal_id+"' and food_name like '%(點心)'";
ResultSet rs4 = smt.executeQuery(sql4);
rs4.last();
int count4=rs4.getRow();
rs4.first();
if(count4==0){
%>		
		<div style="margin:5px 0 0 5px">無食用任何餐點 !</div>
<%
}else{
%>
		<table>	
<%for(int i=0;i<count4;i++){ %>
		<tr><td width=150><%=rs4.getString("food_name")%></td><td width=60><%=rs4.getString("amount")%></td></tr>
<%
rs4.next();
} 
%>	
		</table>
<%}%>	
	</DIV>
</div>
</body>
</html>