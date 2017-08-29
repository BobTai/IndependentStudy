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
<%
String menu_name=request.getParameter("menu_name");
String account=request.getParameter("account");
java.util.Date today = new java.util.Date();
int year = today.getYear()+1900;
int month = today.getMonth()+1;
int day = today.getDate();
String date =year+"-"+month+"-"+day;

String sql3 = "INSERT INTO save_menu(menu_name, date, account) VALUES ('"+menu_name+"', '"+date+"', '"+account+"');";
smt.execute(sql3);

String sql4 = "SELECT menu_id from save_menu where account = '"+account+"' and menu_name = '"+menu_name+"'";
ResultSet rs4 = smt.executeQuery(sql4);
rs4.first();
int menu_id = rs4.getInt("menu_id");

String[] food=request.getParameterValues("food");
String[] num=request.getParameterValues("num");

for (int i = 0; i < food.length; i++){
	String sql = "INSERT INTO save_food(food_name, amount, menu_id) VALUES ('"+food[i]+"','"+num[i]+"','"+menu_id+"');";
	smt.execute(sql);
}

String cal=request.getParameter("cal");
String cal1=request.getParameter("cal1");
String n1=request.getParameter("n1");
String n11=request.getParameter("n11");
String n2=request.getParameter("n2");
String n22=request.getParameter("n22");
String n3=request.getParameter("n3");
String n33=request.getParameter("n33");
String Ca=request.getParameter("Ca");
String Ca1=request.getParameter("Ca1");
String P=request.getParameter("P");
String P1=request.getParameter("P1");
String Fe=request.getParameter("Fe");
String Fe1=request.getParameter("Fe1");
String Zn=request.getParameter("Zn");
String Zn1=request.getParameter("Zn1");
String vitaminsA=request.getParameter("vitaminsA");
String vitaminsA1=request.getParameter("vitaminsA1");
String vitaminsB1=request.getParameter("vitaminsB1");
String vitaminsB11=request.getParameter("vitaminsB11");
String vitaminsB2=request.getParameter("vitaminsB2");
String vitaminsB21=request.getParameter("vitaminsB21");
String vitaminsB6=request.getParameter("vitaminsB6");
String vitaminsB61=request.getParameter("vitaminsB61");
String vitaminsB12=request.getParameter("vitaminsB12");
String vitaminsB121=request.getParameter("vitaminsB121");
String vitaminsC=request.getParameter("vitaminsC");
String vitaminsC1=request.getParameter("vitaminsC1");
String vitaminsE=request.getParameter("vitaminsE");
String vitaminsE1=request.getParameter("vitaminsE1");
String nicotine_element=request.getParameter("nicotine_element");
String nicotine_element1=request.getParameter("nicotine_element1");

String sql1 = "INSERT INTO nutrition_result(type, cal, carbohydrate, protein, fat, Ca, P, Fe, Zn, vitaminsA, vitaminsB1, vitaminsB2, vitaminsB6, vitaminsB12, vitaminsC, vitaminsE, nicotine_element, menu_id) VALUES ('1','"+cal+"','"+n1+"','"+n2+"','"+n3+"','"+Ca+"','"+P+"','"+Fe+"','"+Zn+"','"+vitaminsA+"','"+vitaminsB1+"','"+vitaminsB2+"','"+vitaminsB6+"','"+vitaminsB12+"','"+vitaminsC+"','"+vitaminsE+"','"+nicotine_element+"','"+menu_id+"');";
smt.execute(sql1);
String sql2 = "INSERT INTO nutrition_result(type, cal, carbohydrate, protein, fat, Ca, P, Fe, Zn, vitaminsA, vitaminsB1, vitaminsB2, vitaminsB6, vitaminsB12, vitaminsC, vitaminsE, nicotine_element, menu_id) VALUES ('2','"+cal1+"','"+n11+"','"+n22+"','"+n33+"','"+Ca1+"','"+P1+"','"+Fe1+"','"+Zn1+"','"+vitaminsA1+"','"+vitaminsB11+"','"+vitaminsB21+"','"+vitaminsB61+"','"+vitaminsB121+"','"+vitaminsC1+"','"+vitaminsE1+"','"+nicotine_element1+"','"+menu_id+"');";
smt.execute(sql2);
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:415px; background:url(images/index/index_bg.gif) repeat-y;">
		
			<div style="margin-top:30px; position:relative; width:593px; height:368px; background:url(images/resume/save_succ.png) no-repeat;">
				<a href="resume8.jsp">
				<img style=" position:absolute; bottom:75px; left:230px" src="images/resume/my_resume.png" onmouseover="this.src='images/resume/my_resume1.png'" onmouseout="this.src='images/resume/my_resume.png'">
				</a>
			</div>
			
			<meta http-equiv="refresh" content="3;url=resume8.jsp">
			
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