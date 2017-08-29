<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>身體密碼</title>

<script type="text/javascript">
function check1(s)
{
	if(s=="")
	{
		document.apLogin.a1.value="";
		document.getElementById("subm").disabled = true;
	}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(s!="")
		{
			document.apLogin.a1.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  	   document.apLogin.a2.value=="OK!" &&
		  	   document.apLogin.a3.value=="OK!" &&
		  	   document.apLogin.a4.value=="OK!"){
			  	   document.getElementById("subm").disabled = false;}
		}
}
function check2(s)
{
	if(s=="")
	{
		document.apLogin.a2.value="";
		document.getElementById("subm").disabled = true;
	}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a2.value="錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(s!="")
		{
			document.apLogin.a2.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  	   document.apLogin.a2.value=="OK!" &&
		  	   document.apLogin.a3.value=="OK!" &&
		  	   document.apLogin.a4.value=="OK!"){
			  	   document.getElementById("subm").disabled = false;}
		}
}
function check3(s)
{
	if(s=="")
	{
		document.apLogin.a3.value="";
		document.getElementById("subm").disabled = true;
	}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a3.value="錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(s!="")
		{
			document.apLogin.a3.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  	   document.apLogin.a2.value=="OK!" &&
		  	   document.apLogin.a3.value=="OK!" &&
		  	   document.apLogin.a4.value=="OK!"){
			  	   document.getElementById("subm").disabled = false;}
		}
}
function check4(s)
{
	if(s=="")
	{
		document.apLogin.a4.value="";
		document.getElementById("subm").disabled = true;
	}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a4.value="錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(s!="")
		{
			document.apLogin.a4.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  	   document.apLogin.a2.value=="OK!" &&
		  	   document.apLogin.a3.value=="OK!" &&
		  	   document.apLogin.a4.value=="OK!"){
			  	   document.getElementById("subm").disabled = false;}
		}
}
</script>

</head>
<body>
<%@ include file="menu1.jsp"%>
<%
	request.setCharacterEncoding("utf8");
	String account = request.getParameter("account");
	String password = request.getParameter("password"); 
	String name = request.getParameter("name");
	String user_name = request.getParameter("user_name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String date = year+"-"+month+"-"+day;
	String e_mail = request.getParameter("e_mail");
	String address = request.getParameter("address");
	
	String ques = request.getParameter("ques");
	String ans = request.getParameter("ans");
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:500px; background:url(images/index/index_bg.gif) repeat-y;">
			<IMG SRC="images/member/step1.png">
			<IMG SRC="images/member/step2.png">
			<IMG SRC="images/member/step33.png">
			<IMG SRC="images/member/step4.png">
			<IMG SRC="images/member/step5.png">
			<IMG SRC="images/member/step6.png">
			<form action="member_step4.jsp" method="post" name="apLogin">
				<input type="hidden" name="account" value="<%=account%>">
      			<input type="hidden" name="password" value="<%=password%>">
      			<input type="hidden" name="name" value="<%=name%>">
      			<input type="hidden" name="user_name" value="<%=user_name%>">
      			<input type="hidden" name="gender" value="<%=gender%>">
      			<input type="hidden" name="date" value="<%=date%>">
      			<input type="hidden" name="e_mail" value="<%=e_mail%>">
      			<input type="hidden" name="address" value="<%=address%>">
      			<input type="hidden" name="ques" value="<%=ques%>">
      			<input type="hidden" name="ans" value="<%=ans%>">
      			<div style="margin-top:35px; font-size:20px; color:#646464">
      			<table>
      				<tr>
      					<td width=220 style="border-right:1px dashed gray">
      						<div style="font-weight:bold;">身高</div>
							<IMG SRC="images/member/height.png">
							<div align=left style="font-size:15px; margin-left:69px">
							<input type="text" name="height" id="height" size="5" maxlength=3 onkeyup="check1(this.value)" onfocus="check1(this.value)" onblur="check1(this.value)"/>
							公分</div>
							<input style="border:0;background:#fff" type="text" name="a1" id="a1" size="2" value="" disabled>
						</td>
						<td width=220 style="border-right:1px dashed gray">
							<div style="font-weight:bold;">體重</div>
							<IMG SRC="images/member/weight.png">
							<div align=left style="font-size:15px; margin-left:75px">
							<input type="text" name="weight" id="weight" size="5" maxlength=3 onkeyup="check2(this.value)" onfocus="check2(this.value)" onblur="check2(this.value)"/>
							公斤</div>
							<input style="border:0;background:#fff" type="text" name="a2" id="a2" size="2" value="" disabled>
						</td>
						<td width=220 style="border-right:1px dashed gray">
							<div style="font-weight:bold;">腰圍</div>
							<IMG SRC="images/member/waist.png">
							<div align=left style="font-size:15px; margin-left:76px">
							<input type="text" name="waist" id="waist" size="5" maxlength=3 onkeyup="check3(this.value)" onfocus="check3(this.value)" onblur="check3(this.value)"/>
							公分</div>
							<input style="border:0;background:#fff" type="text" name="a3" id="a3" size="2" value="" disabled>
						</td>
						<td width=220>
							<div style="font-weight:bold;">臀圍</div>
							<IMG SRC="images/member/hip.png">
							<div align=left style="font-size:15px; margin-left:76px">
							<input type="text" name="hip" id="hip" size="5" maxlength=3 onkeyup="check4(this.value)" onfocus="check4(this.value)" onblur="check4(this.value)"/>
							公分</div>
							<input style="border:0;background:#fff" type="text" name="a4" id="a4" size="2" value="" disabled>
						</td>	
					</tr>	
				</table>
				</div>
				<div style="text-align:center; padding-top:20px;">
      				<input name="subm" id="subm" type="submit" value="送出" disabled="disabled"/>
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