<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>會員註冊</title>

<script type="text/javascript">
		function check(s)
		{
			if(s.length<6)
			{ 
				document.apLogin.aaa.value="最少6字符，最多12字符。";
				document.getElementById("test").disabled = true;
			}
			for( var loc=0; loc<s.length; loc++ )
				   if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
				   if( (s.charAt(loc) < 'a') || (s.charAt(loc) > 'z') )
				    {
					document.apLogin.aaa.value="只允許輸入小寫英文或數字!";
					document.getElementById("test").disabled = true;
					return false;
				    }
			if(s.length>=6)
			{
				document.apLogin.aaa.value="用戶名OK!";
				document.getElementById("test").disabled = false;
			}
		}
</script>

</head>
<body>
<%@ include file="menu1.jsp"%>

<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:300px; background:url(images/index/index_bg.gif) repeat-y; padding-top:10px">
			<IMG SRC="images/member/step11.png">
			<IMG SRC="images/member/step2.png">
			<IMG SRC="images/member/step3.png">
			<IMG SRC="images/member/step4.png">
			<IMG SRC="images/member/step5.png">
			<IMG SRC="images/member/step6.png">
			<form action="member_step2.jsp" method="post" name="apLogin">
				<div align=left style="margin:40px 0 0 250px; font-size:20px; color:#646464">
					<table>
      					<tr>
      						<td align=right style="padding-top:2px;">我的帳號：</td>
      						<td>
      							<input type="text" name="account" id="account" size="23" maxlength=12 onkeyup="check(this.value)" onfocus="check(this.value)" onblur="check(this.value)">
      							<input style="border:0" type="text" name="aaa" id="aaa" size="20" value="" disabled>
							</td>
						</tr>
						<tr>
      						<td align=right style="padding-top:2px;">驗證碼：</td>
      						<td>
      							<input type="text" size="23" name="insrand"/>
      							<img src="image.jsp" alt="點擊可以刷新!" onclick="this.src=this.src+'?'"/>
      						</td>	
      					</tr>
      				</table>
      				<input style="margin:10px 0 0 160px;" name="test" id="test" type="submit" value="確認" disabled/>
				</div>
			</form>
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