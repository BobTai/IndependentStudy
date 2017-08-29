<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>會員登入</title>
</head>
<body>
<%@ include file="menu1.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:320px; background:url(images/index/index_bg.gif) repeat-y; padding-top:65px">
			<table>
				<tr>
					<td align=center width=440 style="border-right:1px solid gray">
						<div align=left style="margin-left:60px; color:gray; font-size:23px; font-weight:bold">#請輸入您的帳號和密碼</div>
						<fieldset style="position:relative; background:url(images/member/login.png) no-repeat; border:0px; width:341px; height:229px;">
							<form action="test_member.jsp" method="post" name="apLogin">
								<input style="width:145px; position:absolute; top:87px; right:85px;" type="text" name="username">
								<input style="width:145px; position:absolute; top:120px; right:85px;" type="password" name="password">
								<input style="position:absolute; bottom:48px; right:100px;" type="image" SRC="images/member/log.png" onmouseover="this.src='images/member/log1.png'" onmouseout="this.src='images/member/log.png'">
							</form>
							<a href="forget_pass.jsp"><IMG border=0 style="position:absolute; bottom:48px; left:70px;" SRC="images/member/forget.png" onmouseover="this.src='images/member/forget1.png'" onmouseout="this.src='images/member/forget.png'"></a>
						</fieldset>
					</td>
					<td align=center width=440>
						<div align=left style="margin-left:60px; color:gray; font-size:23px; font-weight:bold">#如果沒有帳號，請註冊一個帳號</div>
						<fieldset style="position:relative; background:url(images/member/regist.png) no-repeat; border:0px; width:341px; height:229px;">
							<a href="member_step1.jsp"><IMG border=0 style="position:absolute; bottom:65px; right:118px;" SRC="images/member/reg.png" onmouseover="this.src='images/member/reg1.png'" onmouseout="this.src='images/member/reg.png'"></a>
						</fieldset>
					</td>	
				</tr>
			</table>
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