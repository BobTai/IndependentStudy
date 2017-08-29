<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>會員修改密碼</title>

<script type="text/javascript">
    function check(s)
	{
		if(s.length<8)
		{
			document.apLogin.a1.value="最少8字符，最多15字符。";
			document.getElementById("subm").disabled = true;
		}
		for( var loc=0; loc<s.length; loc++ )
			if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
			if( (s.charAt(loc) < 'a') || (s.charAt(loc) > 'z') )
			{
				document.apLogin.a1.value="只允許小寫英文或數字!";
				document.getElementById("subm").disabled = true;
				return false;
			}
			if(s.length>=8)
			{
				document.apLogin.a1.value="OK!";
				if(document.apLogin.a1.value=="OK!" && 
			  			   document.apLogin.a2.value=="OK!"){document.getElementById("subm").disabled = false;}
			}
	}
    function check1(s)
    {
		if(s=="")
        {
    	    document.apLogin.a2.value="請再輸入一次密碼!";
    	    document.getElementById("subm").disabled = true;
        }
		if(document.apLogin.password.value!=s && s!="") 
		{
			document.apLogin.a2.value="兩次密碼輸入不同!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(document.apLogin.password.value==s && s!="")
    	{
    	    document.apLogin.a2.value="OK!";
    	    if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!"){document.getElementById("subm").disabled = false;}
    	}
	}
</script>
<%@ include file="JDBCConstants.jsp"%>
</head>
<body>
<%@ include file="menu.jsp"%>
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
	String sql = "SELECT * from member where account = '"+name+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:700px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:330px; background:url(images/index/inside_bg.gif) repeat-y;">
			<div style="position:absolute; top:12px; left:48px; width:162px; height:242px; background:url(images/member/member_bar.png) no-repeat;">
				<a href="member_data.jsp"><IMG style="margin-top:72px" border=0 style="" SRC="images/member/b1.png" onmouseover="this.src='images/member/b11.png'" onmouseout="this.src='images/member/b1.png'"></a>
				<a href="#"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b2.png" onmouseover="this.src='images/member/b22.png'" onmouseout="this.src='images/member/b2.png'"></a>
				<a href="modify_member_data.jsp"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b3.png" onmouseover="this.src='images/member/b33.png'" onmouseout="this.src='images/member/b3.png'"></a>
				<a href="modify_member_pass.jsp"><IMG style="margin-top:7px" border=0 style="" SRC="images/member/b4.png" onmouseover="this.src='images/member/b44.png'" onmouseout="this.src='images/member/b4.png'"></a>
			</div>
			<div style="position:absolute; top:12px; right:46px;">
				<div style="width:692px; height:55px; background:url(images/member/mmp.png) no-repeat;">
				</div>
				<div align=left style="width:692px; height:220px; background:url(images/member/mdm.png) repeat-y;">
					<div align=left style="margin:10px 0 0 180px; font-size:20px; color:#646464">
					<form action="modify_pass.jsp" method="post" name="apLogin">
					<input type="hidden" name="account" value="<%=name%>">
					<table>
						<tr>
      						<td width=150 align=right style="padding-top:2px;">帳號：</td>
      						<td width=600><%=name%></td>
      					</tr>
      					<tr>
      						<td align=right style="padding-top:2px;">舊密碼：</td>
      						<td width=600>
								<input type="password" name="old_password" id="old_password" size="23">
	    						<input style="border:0;background:#fff" type="text" name="aaa" id="a3" size="20" value="" disabled>
      						</td>
      					</tr>
      					<tr>
      						<td align=right style="padding-top:2px;">新密碼：</td>
      						<td>
      							<input type="password" name="password" id="password" size="23" maxlength=15 onkeyup="check(this.value)" onfocus="check(this.value)">
	    						<input style="border:0;background:#fff" type="text" name="aaa" id="a1" size="20" value="" disabled>
      						</td>
      					</tr>
      					<tr>
      						<td align=right style="padding-top:2px;">密碼確認：</td>
      						<td>
      							<input type="password" name="confirm_password" id="confirm_password" size="23" maxlength=15 onkeyup="check1(this.value)" onfocus="check1(this.value)"/>
	   							<input style="border:0;background:#fff" type="text" name="aaa" id="a2" size="15" value="" disabled>
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
					</div>
					<div style="text-align:center; padding-top:15px;">
      						<input name="subm" id="subm" type="submit" value="修改" disabled="disabled"/>
      					</div>
					</form>
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