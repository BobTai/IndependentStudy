<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>會員中心</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>
<body>
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
	String pass = session.getAttribute("password").toString();
	String sql = "SELECT * from member where account = '"+name+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:1000px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:880px; background:url(images/index/inside_bg.gif) repeat-y;">
				<div style="position:absolute; top:12px; left:48px; width:162px; height:242px; background:url(images/member/member_bar.png) no-repeat;">
					<a href="member_data.jsp"><IMG style="margin-top:72px" border=0 style="" SRC="images/member/b1.png" onmouseover="this.src='images/member/b11.png'" onmouseout="this.src='images/member/b1.png'"></a>
					<a href="#"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b2.png" onmouseover="this.src='images/member/b22.png'" onmouseout="this.src='images/member/b2.png'"></a>
					<a href="modify_member_data.jsp"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b3.png" onmouseover="this.src='images/member/b33.png'" onmouseout="this.src='images/member/b3.png'"></a>
					<a href="modify_member_pass.jsp"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b4.png" onmouseover="this.src='images/member/b44.png'" onmouseout="this.src='images/member/b4.png'"></a>
				</div>
				<div style="position:absolute; top:12px; right:46px;">
					<div style="width:692px; height:55px; background:url(images/member/mdt1.png) no-repeat;">
					</div>
					<div align=left style="width:692px; height:200px; background:url(images/member/mdm.png) repeat-y;">
					<table><tr>
					<td><IMG style="margin:60px 0 0 50px" SRC="images/member/man1.png"></IMG></td>
					<td>
						<div style="margin:0px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							帳號：<font style="margin:0 0 0 95px;"><%=rs.getString("account")%></font>
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							姓名：<font style="margin:0 0 0 95px;"><%=rs.getString("member_name") %></font>
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							稱呼：<font style="margin:0 0 0 95px;"><%=rs.getString("online_name") %></font>
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							性別：<font style="margin:0 0 0 95px;"><%=rs.getString("member_gender") %></font>
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							生日：<font style="margin:0 0 0 95px;"><%=rs.getString("member_birthday") %></font>
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							信箱：<font style="margin:0 0 0 95px;"><%=rs.getString("member_email") %></font>
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							地址：<font style="margin:0 0 0 95px;"><%=rs.getString("member_address") %></font>
						</div>
					</td>	
					</tr></table>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt2.png) no-repeat;">
					</div>
					<div align=left style="width:692px; height:120px; background:url(images/member/mdm.png) repeat-y;">
					<table><tr>
					<td><IMG style="margin:20px 0 0 40px" SRC="images/member/man2.png"></IMG></td>
					<td>	
						<div style="margin:0px 0 0 70px; border-bottom:1px solid gray; width:300px;">
							身高：<font style="margin:0 0 0 95px;"><%=rs.getString("height") %>公分</font>
						</div>			
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:300px;">
							體重：<font style="margin:0 0 0 95px;"><%=rs.getString("weight") %>公斤</font>
						</div>			
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:300px;">
							腰圍：<font style="margin:0 0 0 95px;"><%=rs.getString("waist") %>吋</font>
						</div>			
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:300px;">
							臀圍：<font style="margin:0 0 0 95px;"><%=rs.getString("hip") %>吋</font>
						</div>
					</td>	
					</tr></table>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
<%
	String sql1 = "SELECT * from hobby where account = '"+name+"'";
	ResultSet rs1 = smt.executeQuery(sql1);
	rs1.last();
	int count1=rs1.getRow();
	rs1.first();
%>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt3.png) no-repeat;">
					</div>
					<div align=left style="position:relative; width:692px; height:100px; background:url(images/member/mdm.png) repeat-y;">
					<div style="position:absolute; top:2px; left:55px">
						<IMG SRC="images/member/man3.png"></IMG>
					</div>
					<div style="position:absolute; top:10px; left:195px;">
						<div style="border-bottom:1px solid gray; width:300px;">
							抽菸：
							<font style="margin:0 0 0 75px;">
							<%
								if(rs1.getInt("smoke")==0){
								out.print("無");
								}
								if(rs1.getInt("smoke")==1){
									out.print("有,一天"+rs1.getInt("smoke_number")+"包,已抽"+rs1.getInt("smoke_year")+"年");
								}
								if(rs1.getInt("smoke")==2){
									out.print("曾經有,已戒"+rs1.getInt("smoke_year")+"年");
								}
							%>
							</font>
						</div>	
					</div>
					<div style="position:absolute; top:40px; left:195px">		
						<div style="border-bottom:1px solid gray; width:300px;">
							喝酒：
							<font style="margin:0 0 0 75px;">
							<%
								if(rs1.getInt("drink")==0){
									out.print("無");
								}
								if(rs1.getInt("drink")==1){
									out.print("有,一天"+rs1.getInt("drink_number")+"瓶,已喝"+rs1.getInt("drink_year")+"年");
								}
								if(rs1.getInt("drink")==2){
									out.print("曾經有,已戒"+rs1.getInt("drink_year")+"年");
								}
							%>
							</font>
						</div>
					</div>
					<div style="position:absolute; top:70px; left:195px">	
						<div style="border-bottom:1px solid gray; width:300px;">
							嚼檳榔：
							<font style="margin:0 0 0 58px;">
							<%
								if(rs1.getInt("betel")==0){
									out.print("無");
								}
								if(rs1.getInt("betel")==1){
									out.print("有,一天"+rs1.getInt("betel_number")+"包,已嚼"+rs1.getInt("betel_year")+"年");
								}
								if(rs1.getInt("betel")==2){
									out.print("曾經有,已戒"+rs1.getInt("betel_year")+"年");
								}
							%>
							</font>
						</div>
					</div>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
<%
	String sql2 = "SELECT * from my_medical_history where account = '"+name+"'";
	ResultSet rs2 = smt.executeQuery(sql2);
	rs2.last();
	int count2=rs2.getRow();
	rs2.first();
%>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt4.png) no-repeat;">
					</div>
					<div align=left style="position:relative; width:692px; height:100px; background:url(images/member/mdm.png) repeat-y;">
					<div style="position:absolute; top:0px; left:30px">	
					<IMG SRC="images/member/man4.png"></IMG>
					</div>
					<div style="position:absolute; top:20px; left:195px">
						<div style="border-bottom:1px solid gray; width:400px;">
							個人病史：
							<font style="margin:0 0 0 45px;">
							<%
							if(count2==0){
								out.print("無");
							}
							else{
								for(int i =0;i<count2;i++){
									out.print(rs2.getString("d_name")+"/");
									rs2.next();
								}
							}
							%>
							</font>
						</div>
					</div>
<%
	String sql3 = "SELECT * from family_medical_history where account = '"+name+"'";
	ResultSet rs3 = smt.executeQuery(sql3);
	rs3.last();
	int count3=rs3.getRow();
	rs3.first();
%>
					<div style="position:absolute; top:50px; left:195px">	
						<div style="border-bottom:1px solid gray; width:400px;">
							家族病史：
							<font style="margin:0 0 0 45px;">
							<%
							if(count3==0){
								out.print("無");
							}
							else{
								for(int i =0;i<count3;i++){
									out.print(rs3.getString("d_name")+"/");
									rs3.next();
								}
							}
							%>
							</font>
						</div>
					</div>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
				</div>
				
		</div>
		<div style="width:988px; height:43px; background:url(images/index/inside_bottom.gif) no-repeat;">
		</div>
		<div align=left style="margin-left:12px; margin-top:10px;">
		<a href="index.jsp">首頁</a>&nbsp;|
		<a href="about_us.jsp">關於我們</a>&nbsp;|
		<a href="call_us.jsp">聯絡我們</a>
		</div>
	</div>
</div>
<%
}
else
{
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="padding-top:40px; width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
			<fieldset style="position:relative; background:url(images/member/not_member.png) no-repeat; border:0px; width:603px; height:375px;">
				<a href="index.jsp"><IMG border=0 style="position:absolute; bottom:70px; left:330px;" SRC="images/member/home.png" onmouseover="this.src='images/member/home1.png'" onmouseout="this.src='images/member/home.png'"></a>
				<a href="login.jsp"><IMG border=0 style="position:absolute; bottom:70px; left:170px;" SRC="images/member/login_icon.png" onmouseover="this.src='images/member/login_icon1.png'" onmouseout="this.src='images/member/login_icon.png'"></a>
				<meta http-equiv="refresh" content="3;url=login.jsp">
			</fieldset>
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
<%
}
%>
</body>
</html>