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
	String name1 = session.getAttribute("username").toString();
	String sql = "SELECT * from save_menu where account = '"+name1+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:700px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:500px; background:url(images/index/inside_bg.gif) repeat-y;">
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
			<div style="position:absolute; top:12px; right:36px;">
				<div style="width:676px; height:48px; background:url(images/resume/menu_title.png) no-repeat;"></div>
				<%
					if(count==0){
				%>
				<div style="position:relative; width:676px; height:40px; background:url(images/resume/no_menu.png) no-repeat;">
				</div>
				<%	
				}
					else{
						for(int i=0; i<count; i++){
				%>	
				<div style="position:relative; width:676px; height:40px; background:url(images/resume/my_menu.png) no-repeat;">
					<div style="position:absolute; top:7px; left:145px"><%=i+1%></div>
					<div style="position:absolute; top:9px; left:170px"><%=rs.getString("menu_name")%></div>
					<div style="position:absolute; top:7px; left:418px"><%=rs.getString("date")%></div>
					<img style="position:absolute; top:11px; right:80px" src="images/resume/search_menu.png" onmouseover="this.src='images/resume/search_menu1.png'" onmouseout="this.src='images/resume/search_menu.png'"
					onclick="window.open ('search_menu.jsp?menu_id=<%=rs.getInt("menu_id")%>', 'newwindow', 'height=460, width=870, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
					<form action="delete_menu.jsp" method="post">
						<input type="hidden" name="menu_id" value="<%=rs.getInt("menu_id")%>">
						<input style="position:absolute; top:11px; right:30px" type="image" src="images/resume/delete_menu.png" onmouseover="this.src='images/resume/delete_menu1.png'" onmouseout="this.src='images/resume/delete_menu.png'" onclick="if(confirm('確定要刪除此菜單嗎?')) return true;else return false">
					</form>
				</div>
				<%
						rs.next();
						} 
					}
				%>	
				<div style="width:676px; height:20px; background:url(images/resume/habit_bottom.png) no-repeat;"></div>	
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
<%}else{
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
} %>
</body>
</html>