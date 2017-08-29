<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
String menu_id = request.getParameter("menu_id");

String sql = "SELECT menu_name from save_menu where menu_id = '"+menu_id+"'";
ResultSet rs = smt.executeQuery(sql);
rs.first();
%>
<div style="position:relative; margin-top:-5px; width:336px; height:44px; background:url(images/food/menu_name.png) no-repeat;">
	<div style="position:absolute; top:14px; left:154px; font-size:16px"><%=rs.getString("menu_name")%></div>
</div>	
<div style="position:relative; margin-top:10px; width:829px; height:235px; background:url(images/resume/nutrition_table.png) no-repeat;">
<%
String sql4 = "SELECT * from nutrition_result where menu_id = '"+menu_id+"' and type = 1";
ResultSet rs4 = smt.executeQuery(sql4);
rs4.first();
double cal = rs4.getInt("cal")*0.1;
double car = rs4.getFloat("carbohydrate")*0.1;
double prot = rs4.getFloat("protein")*0.1;
double fat = rs4.getFloat("fat")*0.1;
double Ca = rs4.getFloat("Ca")*0.1;
double P = rs4.getFloat("P")*0.1;
double Fe = rs4.getFloat("Fe")*0.1;
double Zn = rs4.getFloat("Zn")*0.1;
double vitaminsA = rs4.getFloat("vitaminsA")*0.1;
double vitaminsB1 = rs4.getFloat("vitaminsB1")*0.1;
double vitaminsB2 = rs4.getFloat("vitaminsB2")*0.1;
double vitaminsB6 = rs4.getFloat("vitaminsB6")*0.1;
double vitaminsB12 = rs4.getFloat("vitaminsB12")*0.1;
double vitaminsC = rs4.getFloat("vitaminsC")*0.1;
double vitaminsE = rs4.getFloat("vitaminsE")*0.1;
double nicotine_element = rs4.getFloat("nicotine_element")*0.1;
%>
<div style="position:absolute; top:72px; left:71px; font-size:16px"><%=rs4.getInt("cal")%></div>
<div style="position:absolute; top:72px; left:117px; font-size:16px"><%=rs4.getFloat("carbohydrate")%></div>
<div style="position:absolute; top:72px; left:163px; font-size:16px"><%=rs4.getFloat("protein")%></div>
<div style="position:absolute; top:72px; left:213px; font-size:16px"><%=rs4.getFloat("fat")%></div>
<div style="position:absolute; top:72px; left:256px; font-size:16px"><%=rs4.getFloat("Ca")%></div>
<div style="position:absolute; top:72px; left:303px; font-size:16px"><%=rs4.getFloat("P")%></div>
<div style="position:absolute; top:72px; left:353px; font-size:16px"><%=rs4.getFloat("Fe")%></div>
<div style="position:absolute; top:72px; left:399px; font-size:16px"><%=rs4.getFloat("Zn")%></div>
<div style="position:absolute; top:72px; left:443px; font-size:16px"><%=rs4.getFloat("vitaminsA")%></div>
<div style="position:absolute; top:72px; left:497px; font-size:16px"><%=rs4.getFloat("vitaminsB1")%></div>
<div style="position:absolute; top:72px; left:545px; font-size:16px"><%=rs4.getFloat("vitaminsB2")%></div>
<div style="position:absolute; top:72px; left:597px; font-size:16px"><%=rs4.getFloat("vitaminsB6")%></div>
<div style="position:absolute; top:72px; left:649px; font-size:16px"><%=rs4.getFloat("vitaminsB12")%></div>
<div style="position:absolute; top:72px; left:696px; font-size:16px"><%=rs4.getFloat("vitaminsC")%></div>
<div style="position:absolute; top:72px; left:743px; font-size:16px"><%=rs4.getFloat("vitaminsE")%></div>
<div style="position:absolute; top:72px; left:790px; font-size:16px"><%=rs4.getFloat("nicotine_element")%></div>
<%
String sql5 = "SELECT * from nutrition_result where menu_id = '"+menu_id+"' and type = 2";
ResultSet rs5 = smt.executeQuery(sql5);
rs5.first();
if(rs5.getInt("cal")<-cal){
%>
<div style="position:absolute; top:94px; left:68px; font-size:16px; color:blue"><%=rs5.getInt("cal")%></div>
<%}if(rs5.getInt("cal")>-cal && rs5.getInt("cal")<cal){ %>
<div style="position:absolute; top:94px; left:68px; font-size:16px; color:green"><%=rs5.getInt("cal")%></div>
<%}if(rs5.getInt("cal")>cal){ %>
<div style="position:absolute; top:94px; left:68px; font-size:16px; color:red"><%=rs5.getInt("cal")%></div>
<%}if(rs5.getFloat("carbohydrate")<-car){ %>
<div style="position:absolute; top:94px; left:113px; font-size:16px; color:blue"><%=rs5.getFloat("carbohydrate")%></div>
<%}if(rs5.getFloat("carbohydrate")>-car && rs5.getFloat("carbohydrate")<car){ %>
<div style="position:absolute; top:94px; left:113px; font-size:16px; color:green"><%=rs5.getFloat("carbohydrate")%></div>
<%}if(rs5.getFloat("carbohydrate")>car){ %>
<div style="position:absolute; top:94px; left:113px; font-size:16px; color:red"><%=rs5.getFloat("carbohydrate")%></div>
<%}if(rs5.getFloat("protein")<-prot){ %>
<div style="position:absolute; top:94px; left:164px; font-size:16px; color:blue"><%=rs5.getFloat("protein")%></div>
<%}if(rs5.getFloat("protein")>-prot && rs5.getFloat("protein")<prot){ %>
<div style="position:absolute; top:94px; left:164px; font-size:16px; color:green"><%=rs5.getFloat("protein")%></div>
<%}if(rs5.getFloat("protein")>prot){ %>
<div style="position:absolute; top:94px; left:164px; font-size:16px; color:red"><%=rs5.getFloat("protein")%></div>
<%}if(rs5.getFloat("fat")<-fat){ %>
<div style="position:absolute; top:94px; left:210px; font-size:16px; color:blue"><%=rs5.getFloat("fat")%></div>
<%}if(rs5.getFloat("fat")>-fat && rs5.getFloat("fat")<fat){ %>
<div style="position:absolute; top:94px; left:210px; font-size:16px; color:green"><%=rs5.getFloat("fat")%></div>
<%}if(rs5.getFloat("fat")>fat){ %>
<div style="position:absolute; top:94px; left:210px; font-size:16px; color:red"><%=rs5.getFloat("fat")%></div>
<%}if(rs5.getFloat("Ca")<-Ca){ %>
<div style="position:absolute; top:94px; left:253px; font-size:16px; color:blue"><%=rs5.getFloat("Ca")%></div>
<%}if(rs5.getFloat("Ca")>-Ca && rs5.getFloat("Ca")<Ca){ %>
<div style="position:absolute; top:94px; left:253px; font-size:16px; color:green"><%=rs5.getFloat("Ca")%></div>
<%}if(rs5.getFloat("Ca")>Ca){ %>
<div style="position:absolute; top:94px; left:253px; font-size:16px; color:red"><%=rs5.getFloat("Ca")%></div>
<%}if(rs5.getFloat("P")<-P){ %>
<div style="position:absolute; top:94px; left:299px; font-size:16px; color:blue"><%=rs5.getFloat("P")%></div>
<%}if(rs5.getFloat("P")>-P && rs5.getFloat("P")<P){ %>
<div style="position:absolute; top:94px; left:299px; font-size:16px; color:green"><%=rs5.getFloat("P")%></div>
<%}if(rs5.getFloat("P")>P){ %>
<div style="position:absolute; top:94px; left:299px; font-size:16px; color:red"><%=rs5.getFloat("P")%></div>
<%}if(rs5.getFloat("Fe")<-Fe){ %>
<div style="position:absolute; top:94px; left:352px; font-size:16px; color:blue"><%=rs5.getFloat("Fe")%></div>
<%}if(rs5.getFloat("Fe")>-Fe && rs5.getFloat("Fe")<Fe){ %>
<div style="position:absolute; top:94px; left:352px; font-size:16px; color:green"><%=rs5.getFloat("Fe")%></div>
<%}if(rs5.getFloat("Fe")>Fe){ %>
<div style="position:absolute; top:94px; left:352px; font-size:16px; color:red"><%=rs5.getFloat("Fe")%></div>
<%}if(rs5.getFloat("Zn")<-Zn){ %>
<div style="position:absolute; top:94px; left:396px; font-size:16px; color:blue"><%=rs5.getFloat("Zn")%></div>
<%}if(rs5.getFloat("Zn")>-Zn && rs5.getFloat("Zn")<Zn){ %>
<div style="position:absolute; top:94px; left:396px; font-size:16px; color:green"><%=rs5.getFloat("Zn")%></div>
<%}if(rs5.getFloat("Zn")>Zn){ %>
<div style="position:absolute; top:94px; left:396px; font-size:16px; color:red"><%=rs5.getFloat("Zn")%></div>
<%}if(rs5.getFloat("vitaminsA")<-vitaminsA){ %>
<div style="position:absolute; top:94px; left:440px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsA")%></div>
<%}if(rs5.getFloat("vitaminsA")>-vitaminsA && rs5.getFloat("vitaminsA")<vitaminsA){ %>
<div style="position:absolute; top:94px; left:440px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsA")%></div>
<%}if(rs5.getFloat("vitaminsA")>vitaminsA){ %>
<div style="position:absolute; top:94px; left:440px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsA")%></div>
<%}if(rs5.getFloat("vitaminsB1")<-vitaminsB1){ %>
<div style="position:absolute; top:94px; left:495px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsB1")%></div>
<%}if(rs5.getFloat("vitaminsB1")>-vitaminsB1 && rs5.getFloat("vitaminsB1")<vitaminsB1){ %>
<div style="position:absolute; top:94px; left:495px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsB1")%></div>
<%}if(rs5.getFloat("vitaminsB1")>vitaminsB1){ %>
<div style="position:absolute; top:94px; left:495px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsB1")%></div>
<%}if(rs5.getFloat("vitaminsB2")<-vitaminsB2){ %>
<div style="position:absolute; top:94px; left:541px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsB2")%></div>
<%}if(rs5.getFloat("vitaminsB2")>-vitaminsB2 && rs5.getFloat("vitaminsB2")<vitaminsB2){ %>
<div style="position:absolute; top:94px; left:541px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsB2")%></div>
<%}if(rs5.getFloat("vitaminsB2")>vitaminsB2){ %>
<div style="position:absolute; top:94px; left:541px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsB2")%></div>
<%}if(rs5.getFloat("vitaminsB6")<-vitaminsB6){ %>
<div style="position:absolute; top:94px; left:593px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsB6")%></div>
<%}if(rs5.getFloat("vitaminsB6")>-vitaminsB6 && rs5.getFloat("vitaminsB6")<vitaminsB6){ %>
<div style="position:absolute; top:94px; left:593px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsB6")%></div>
<%}if(rs5.getFloat("vitaminsB6")>vitaminsB6){ %>
<div style="position:absolute; top:94px; left:593px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsB6")%></div>
<%}if(rs5.getFloat("vitaminsB12")<-vitaminsB12){ %>
<div style="position:absolute; top:94px; left:647px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsB12")%></div>
<%}if(rs5.getFloat("vitaminsB12")>-vitaminsB12 && rs5.getFloat("vitaminsB12")<vitaminsB12){ %>
<div style="position:absolute; top:94px; left:647px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsB12")%></div>
<%}if(rs5.getFloat("vitaminsB12")>vitaminsB12){ %>
<div style="position:absolute; top:94px; left:647px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsB12")%></div>
<%}if(rs5.getFloat("vitaminsC")<-vitaminsC){ %>
<div style="position:absolute; top:94px; left:694px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsC")%></div>
<%}if(rs5.getFloat("vitaminsC")>-vitaminsC && rs5.getFloat("vitaminsC")<vitaminsC){ %>
<div style="position:absolute; top:94px; left:694px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsC")%></div>
<%}if(rs5.getFloat("vitaminsC")>vitaminsC){ %>
<div style="position:absolute; top:94px; left:694px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsC")%></div>
<%}if(rs5.getFloat("vitaminsE")<-vitaminsE){ %>
<div style="position:absolute; top:94px; left:737px; font-size:16px; color:blue"><%=rs5.getFloat("vitaminsE")%></div>
<%}if(rs5.getFloat("vitaminsE")>-vitaminsE && rs5.getFloat("vitaminsE")<vitaminsE){ %>
<div style="position:absolute; top:94px; left:737px; font-size:16px; color:green"><%=rs5.getFloat("vitaminsE")%></div>
<%}if(rs5.getFloat("vitaminsE")>vitaminsE){ %>
<div style="position:absolute; top:94px; left:737px; font-size:16px; color:red"><%=rs5.getFloat("vitaminsE")%></div>
<%}if(rs5.getFloat("nicotine_element")<-nicotine_element){ %>
<div style="position:absolute; top:94px; left:785px; font-size:16px; color:blue"><%=rs5.getFloat("nicotine_element")%></div>
<%}if(rs5.getFloat("nicotine_element")>-nicotine_element && rs5.getFloat("nicotine_element")<nicotine_element){ %>
<div style="position:absolute; top:94px; left:785px; font-size:16px; color:green"><%=rs5.getFloat("nicotine_element")%></div>
<%}if(rs5.getFloat("nicotine_element")>nicotine_element){ %>
<div style="position:absolute; top:94px; left:785px; font-size:16px; color:red"><%=rs5.getFloat("nicotine_element")%></div>
<%
}
String sql1 = "SELECT * from save_food where food_name like '%(早)' and menu_id = '"+menu_id+"'";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.last();
int count1=rs1.getRow();
rs1.first();
%>	
	<DIV style="position:absolute; bottom:1px; left:38px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:238px; HEIGHT:117px; font-size:15px">
		<table>
		<%
		if(count1==0){
			out.print("無餐點 !");
		}
		else{
			for(int i=0; i<count1; i++){
				out.print("<tr><td width=168>"+rs1.getString("food_name")+"</td>");
				out.print("<td width=70>"+rs1.getFloat("amount")+"份</td></tr>");
				rs1.next();
			}
		}
		%>
		</table>
	</DIV>
<%
String sql2 = "SELECT * from save_food where food_name like '%(中)' and menu_id = '"+menu_id+"'";
ResultSet rs2 = smt.executeQuery(sql2);
rs2.last();
int count2=rs2.getRow();
rs2.first();
%>		
	<DIV style="position:absolute; bottom:1px; left:314px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:239px; HEIGHT:117px; font-size:15px">
		<table>
		<%
		if(count2==0){
			out.print("無餐點 !");
		}
		else{
			for(int i=0; i<count2; i++){
				out.print("<tr><td width=168>"+rs2.getString("food_name")+"</td>");
				out.print("<td width=70>"+rs2.getFloat("amount")+"份</td></tr>");
				rs2.next();
			}
		}
		%>
		</table>
	</DIV>
<%
String sql3 = "SELECT * from save_food where food_name like '%(晚)' and menu_id = '"+menu_id+"'";
ResultSet rs3 = smt.executeQuery(sql3);
rs3.last();
int count3=rs3.getRow();
rs3.first();
%>		
	<DIV style="position:absolute; bottom:1px; left:590px; OVERFLOW:scroll; overflow-x:hidden; WIDTH:237px; HEIGHT:117px; font-size:15px">
		<table>
		<%
		if(count3==0){
			out.print("無餐點 !");
		}
		else{
			for(int i=0; i<count3; i++){
				out.print("<tr><td width=168>"+rs3.getString("food_name")+"</td>");
				out.print("<td width=70>"+rs3.getFloat("amount")+"份</td></tr>");
				rs3.next();
			}
		}
		%>
		</table>
	</DIV>
</div>
<div style="margin-top:12px; width:829px; height:108px; background:url(images/resume/menu_prompt.png) no-repeat;">
			
</div>
</body>
</html>