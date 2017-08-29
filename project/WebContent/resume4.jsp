<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康履歷</title>

</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:700px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:570px; background:url(images/index/inside_bg.gif) repeat-y;">
			<div style="position:absolute; top:12px; left:40px; width:210px; height:242px;">
				<img src="images/resume/bio_head.png" >
				<a href="resume1.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle1.png" onmouseover="this.src='images/resume/bio_middle11.png'" onmouseout="this.src='images/resume/bio_middle1.png'"></a>
				<a href="resume2.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle2.png" onmouseover="this.src='images/resume/bio_middle22.png'" onmouseout="this.src='images/resume/bio_middle2.png'"></a>
				<a href="resume3.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle3.png" onmouseover="this.src='images/resume/bio_middle33.png'" onmouseout="this.src='images/resume/bio_middle3.png'"></a>
				<img style="margin-top:-3px" src="images/resume/bio_head2.png" >
				<a href="resume4.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle4.png" onmouseover="this.src='images/resume/bio_middle44.png'" onmouseout="this.src='images/resume/bio_middle4.png'"></a>
				<a href="resume5.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle5.png" onmouseover="this.src='images/resume/bio_middle55.png'" onmouseout="this.src='images/resume/bio_middle5.png'"></a>
				<a href="resume6.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle6.png" onmouseover="this.src='images/resume/bio_middle66.png'" onmouseout="this.src='images/resume/bio_middle6.png'"></a>
				<a href="resume7.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle7.png" onmouseover="this.src='images/resume/bio_middle77.png'" onmouseout="this.src='images/resume/bio_middle7.png'"></a>
				<a href="resume8.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle8.png" onmouseover="this.src='images/resume/bio_middle88.png'" onmouseout="this.src='images/resume/bio_middle8.png'"></a>
				<img style="margin-top:-5px" src="images/resume/bio_bottom.png" >
			</div>
			<div style="position:absolute; top:10px; right:38px;">
				<div style="width:676px; height:48px; background:url(images/resume/eva_title.png) no-repeat;"></div>
<%
String sql = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '肺功能自我評量'";
ResultSet rs = smt.executeQuery(sql);
rs.last();
int count=rs.getRow();
rs.first();
if(count>0){
%>				
				<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/eva1_yes.png) no-repeat;">
					<div style="position:absolute; top:8px; left:437px;"><%=rs.getString("date")%></div>
					<img style="position:absolute; top:10px; right:32px" src="images/resume/record.png" onmouseover="this.src='images/resume/record1.png'" onmouseout="this.src='images/resume/record.png'"
					onclick="window.open('search_eva.jsp?eva_name=肺功能自我評量', 'newwindow', 'height=460, width=720, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				</div>
<%
if(rs.getInt("score")<=10){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")>=50){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s4.png) no-repeat;"></div>				
<%
}
}else{
%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/eva1_no.png) no-repeat;">
					<div style="margin:11px 0 0 535px">	
						<form action="evaluation.jsp" method="post">
							<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev002">
							<INPUT TYPE="hidden" NAME="score" VALUE="0">
							<input title="肺功能評量" TYPE="image" SRC="images/resume/go_test.png" onmouseover="this.src='images/resume/go_test1.png'" onmouseout="this.src='images/resume/go_test.png'">
						</form>
					</div>
				</div>
<%
}
%>
<%
String sql1 = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '心功能自我評量'";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.last();
int count1=rs1.getRow();
rs1.first();
if(count1>0){
%>				
				<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/eva2_yes.png) no-repeat;">
					<div style="position:absolute; top:8px; left:437px;"><%=rs1.getString("date")%></div>
					<img style="position:absolute; top:10px; right:32px" src="images/resume/record.png" onmouseover="this.src='images/resume/record1.png'" onmouseout="this.src='images/resume/record.png'"
					onclick="window.open('search_eva.jsp?eva_name=心功能自我評量', 'newwindow', 'height=460, width=720, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				</div>
<%
if(rs1.getInt("score")<=10){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs1.getInt("score")<=29 && rs1.getInt("score")>=11){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva2_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs1.getInt("score")<=49 && rs1.getInt("score")>=30){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva2_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs1.getInt("score")>=50){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva2_yes_s4.png) no-repeat;"></div>				
<%
}				
}else{
%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/eva2_no.png) no-repeat;">
					<div style="margin:11px 0 0 535px">	
						<form action="evaluation.jsp" method="post">
							<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev003">
							<INPUT TYPE="hidden" NAME="score" VALUE="0">
							<input title="心功能評量" TYPE="image" SRC="images/resume/go_test.png" onmouseover="this.src='images/resume/go_test1.png'" onmouseout="this.src='images/resume/go_test.png'">
						</form>
					</div>
				</div>
<%
}
%>
<%
String sql2 = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '肝功能自我評量'";
ResultSet rs2 = smt.executeQuery(sql2);
rs2.last();
int count2=rs2.getRow();
rs2.first();
if(count2>0){
%>				
				<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/eva3_yes.png) no-repeat;">
					<div style="position:absolute; top:8px; left:437px;"><%=rs2.getString("date")%></div>
					<img style="position:absolute; top:10px; right:32px" src="images/resume/record.png" onmouseover="this.src='images/resume/record1.png'" onmouseout="this.src='images/resume/record.png'"
					onclick="window.open('search_eva.jsp?eva_name=肝功能自我評量', 'newwindow', 'height=460, width=720, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				</div>
<%
if(rs2.getInt("score")<=10){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs2.getInt("score")<=29 && rs2.getInt("score")>=11){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs2.getInt("score")<=49 && rs2.getInt("score")>=30){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs2.getInt("score")>=50){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva3_yes_s4.png) no-repeat;"></div>				
<%
}					
}else{
%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/eva3_no.png) no-repeat;">
					<div style="margin:11px 0 0 535px">	
						<form action="evaluation.jsp" method="post">
							<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev004">
							<INPUT TYPE="hidden" NAME="score" VALUE="0">
							<input title="肝功能評量" TYPE="image" SRC="images/resume/go_test.png" onmouseover="this.src='images/resume/go_test1.png'" onmouseout="this.src='images/resume/go_test.png'">
						</form>
					</div>
				</div>
<%
}
%>				
<%
String sql3 = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '胃功能自我評量' Order By date desc";
ResultSet rs3 = smt.executeQuery(sql3);
rs3.last();
int count3=rs3.getRow();
rs3.first();
if(count3>0){
%>				
				<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/eva4_yes.png) no-repeat;">
					<div style="position:absolute; top:8px; left:437px;"><%=rs3.getString("date")%></div>
					<img style="position:absolute; top:10px; right:32px" src="images/resume/record.png" onmouseover="this.src='images/resume/record1.png'" onmouseout="this.src='images/resume/record.png'"
					onclick="window.open('search_eva.jsp?eva_name=胃功能自我評量', 'newwindow', 'height=460, width=720, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				</div>
<%
if(rs3.getInt("score")<=10){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs3.getInt("score")<=29 && rs3.getInt("score")>=11){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs3.getInt("score")<=49 && rs3.getInt("score")>=30){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva4_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs3.getInt("score")>=50){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva4_yes_s4.png) no-repeat;"></div>				
<%
}
}else{
%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/eva4_no.png) no-repeat;">	
					<div style="margin:11px 0 0 535px">	
						<form action="evaluation.jsp" method="post">	
							<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev001">
							<INPUT TYPE="hidden" NAME="score" VALUE="0">
							<input title="胃功能評量" TYPE="image" SRC="images/resume/go_test.png" onmouseover="this.src='images/resume/go_test1.png'" onmouseout="this.src='images/resume/go_test.png'">
						</form>
					</div>
				</div>
<%
}
%>
<%
String sql4 = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '腎功能自我評量'";
ResultSet rs4 = smt.executeQuery(sql4);
rs4.last();
int count4=rs4.getRow();
rs4.first();
if(count4>0){
%>				
				<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/eva5_yes.png) no-repeat;">
					<div style="position:absolute; top:8px; left:437px;"><%=rs4.getString("date")%></div>
					<img style="position:absolute; top:10px; right:32px" src="images/resume/record.png" onmouseover="this.src='images/resume/record1.png'" onmouseout="this.src='images/resume/record.png'"
					onclick="window.open('search_eva.jsp?eva_name=腎功能自我評量', 'newwindow', 'height=460, width=720, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				</div>
<%
if(rs4.getInt("score")<=10){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs4.getInt("score")<=29 && rs4.getInt("score")>=11){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs4.getInt("score")<=49 && rs4.getInt("score")>=30){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva5_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs4.getInt("score")>=50){
%>				
				<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
				<div align=left style="width:676px; height:39px; background:url(images/resume/eva5_yes_s4.png) no-repeat;"></div>				
<%
}					
}else{
%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/eva5_no.png) no-repeat;">
					<div style="margin:11px 0 0 535px">	
						<form action="evaluation.jsp" method="post">
							<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev005">
							<INPUT TYPE="hidden" NAME="score" VALUE="0">
							<input title="腎功能評量" TYPE="image" SRC="images/resume/go_test.png" onmouseover="this.src='images/resume/go_test1.png'" onmouseout="this.src='images/resume/go_test.png'">
						</form>
					</div>
				</div>
<%
}
%>
				<div style="width:676px; height:23px; background:url(images/resume/eva_bottom.png) no-repeat;"></div>	
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
}else{
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
}%>
</body>
</html>