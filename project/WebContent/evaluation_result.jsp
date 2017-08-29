<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>自我評量結果</title>
</head>
<%@ include file="JDBCConstants.jsp" %>

<body>
<%@ include file="menu.jsp" %>
<%
String eva_number = request.getParameter("eva_number");
String evaluation_name = request.getParameter("evaluation_name");
String q[]=new String[25];
int s[]=new int[25];
int total=0;
for(int i=1; i<=25; i++)
{
	q[i-1] = request.getParameter("q"+i);
	s[i-1] = Integer.parseInt(q[i-1]);
	total = total + s[i-1];
}
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:880px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:760px; background:url(images/index/index_bg.gif) repeat-y;">
		<fieldset style="position:relative; background:url(images/evaluation/result_head.png) no-repeat; border:0px; width:810px; height:89px;">	
		</fieldset>
			<table style="margin-top:8px;margin-bottom:15px"><tr><td width=314>	
				<div style="position:relative; width:304px; height:238px; background:url(images/evaluation/result.png) no-repeat;">
					<font style="position:absolute; top:3px; right:16px; font-size:30px;"><%=total%></font>
				</div>
			</td>
<%
String sql = "SELECT * from suggestion where evaluation_id = '"+eva_number+"'";
ResultSet rs = smt.executeQuery(sql);
rs.first();
%>
			<td width=515>
				<div align=left style="position:relative; width:505px; height:238px; background:url(images/evaluation/suggest.png) no-repeat;">
					<%
					if(total<=10){
					%>
					<font style="position:absolute; top:25px; left:220px; width:220px; font-size:18px"><%=rs.getString("suggestion_cont1")%></font>
					<%
					}
					if(total>10 && total<=29){
					%>
					<font style="position:absolute; top:25px; left:220px; width:220px; font-size:18px"><%=rs.getString("suggestion_cont2")%></font>
					<%
					}
					if(total>30 && total<=49){
					%>
					<font style="position:absolute; top:25px; left:220px; width:220px; font-size:18px"><%=rs.getString("suggestion_cont3")%></font>
					<%
					}
					if(total>=50){
					%>
					<font style="position:absolute; top:25px; left:220px; width:220px; font-size:18px"><%=rs.getString("suggestion_cont4")%></font>
					<%
					}
					%>
					
					<form action="eva_to_resume.jsp" method="post" name="add_resume" onSubmit="return check()">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name1 = session.getAttribute("username").toString();	
%>					
						<input type="hidden" id=name name="name" value="<%=name1 %>">
						<input type="hidden" name="evaluation_name" value="<%=evaluation_name%>">
						<input type="hidden" name="score" value="<%=total%>">
						<input style="position:absolute; bottom:10px; right:100px" name="subm" type="image" src="images/evaluation/add_resume.png" onmouseover="this.src='images/evaluation/add_resume1.png'" onmouseout="this.src='images/evaluation/add_resume.png'"/>
<%}else{ %>	
						<input title="您尚未登入會員!" style="position:absolute; bottom:10px; right:100px" name="subm" type="image" src="images/evaluation/add_resume.png" onmouseover="this.src='images/evaluation/add_resume1.png'" onmouseout="this.src='images/evaluation/add_resume.png'" disabled/>				
<%} %>					
					</form>
				</div>
			</td>
			</tr>	
			</table>
<%
String sql1 = "SELECT evaluation_type from evaluation where evaluation_id = '"+eva_number+"'";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.first();
%>			
			<div style="position:relative; background:url(images/evaluation/rule_head.png) no-repeat; border:0px; width:819px; height:80px;">	
				<font style="position:absolute; top:26px; left:345px; font-size:25px; font-weight:bold"><%=rs1.getString("evaluation_type")%></font>
			</div>
<%
String sql2 = "SELECT * from rule where evaluation_id = '"+eva_number+"'";
ResultSet rs2 = smt.executeQuery(sql2);
rs2.first();
%>			
			<div style="background:url(images/evaluation/rule_middle.png) repeat-y; border:0px; width:819px; height:300px;">	
				<table>
				<tr>
				<td width=148>
					<div align=left style="position:relative; margin:5px 0 0 0px; width:144px; height:134px; background-image:url(images/evaluation/p1.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule1")%></font>
					</div>
				</td>
				<td width=148>
					<div align=left style="position:relative; margin:5px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p2.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule2")%></font>
					</div>
				</td>
				<td width=148>
					<div align=left style="position:relative; margin:5px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p3.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule3")%></font>
					</div>
				</td>
				<td width=148>
					<div align=left style="position:relative; margin:5px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p4.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule4")%></font>
					</div>
				</td>
				<td width=148>
					<div align=left style="position:relative; margin:5px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p5.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule5")%></font>
					</div>
				</td>
				</tr>
				<tr>
				<td>
					<div align=left style="position:relative; margin:20px 0 0 0px; width:144px; height:134px; background-image:url(images/evaluation/p6.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule6")%></font>
					</div>
				</td>
				<td>
					<div align=left style="position:relative; margin:20px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p7.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule7")%></font>
					</div>
				</td>
				<td>
					<div align=left style="position:relative; margin:20px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p8.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule8")%></font>
					</div>
				</td>
				<td>
					<div align=left style="position:relative; margin:20px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p9.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule9")%></font>
					</div>
				</td>
				<td>
					<div align=left style="position:relative; margin:20px 0 0 0; width:144px; height:134px; background-image:url(images/evaluation/p10.png); background-repeat: no-repeat;">
						<font style="position:absolute; top:50px; left:13px;  font-size:15px;"><%=rs2.getString("rule10")%></font>
					</div>
				</td>
				</tr>
				</table>
			</div>
			<div style="position:relative; background:url(images/evaluation/rule_bottom.png) no-repeat; border:0px; width:819px; height:20px;">	
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