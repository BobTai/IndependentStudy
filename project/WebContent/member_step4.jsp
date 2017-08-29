<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>生活習慣</title>

<script type="text/javascript">
function check(s)
{
	document.getElementById("h1_num").disabled = true;
	document.getElementById("h1_year1").disabled = true;
	document.getElementById("h1_year2").disabled = true;
	document.apLogin.a1.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
			   document.apLogin.a2.value=="OK!" &&
			   document.apLogin.a3.value=="OK!"){
					document.getElementById("subm").disabled = false;}
}
function check1(s)
{
	document.apLogin.a1.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h1_num").disabled = false;
	document.getElementById("h1_year1").disabled = false;
	document.getElementById("h1_year2").disabled = true;
	if(s==""){
		document.apLogin.a1.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h1_num").value!="" && document.getElementById("h1_year1").value!=""){
		document.apLogin.a1.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
				   document.apLogin.a2.value=="OK!" &&
				   document.apLogin.a3.value=="OK!"){
						document.getElementById("subm").disabled = false;}}
}
function check2(s)
{
	document.apLogin.a1.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h1_num").disabled = true;
	document.getElementById("h1_year1").disabled = true;
	document.getElementById("h1_year2").disabled = false;
	if(s==""){
		document.apLogin.a1.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h1_year2").value!=""){
		document.apLogin.a1.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
				   document.apLogin.a2.value=="OK!" &&
				   document.apLogin.a3.value=="OK!"){
						document.getElementById("subm").disabled = false;}}
}
function check3(s)
{
	document.getElementById("h2_num").disabled = true;
	document.getElementById("h2_year1").disabled = true;
	document.getElementById("h2_year2").disabled = true;
	document.apLogin.a2.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
			   document.apLogin.a2.value=="OK!" &&
			   document.apLogin.a3.value=="OK!"){
					document.getElementById("subm").disabled = false;}
}
function check4(s)
{
	document.apLogin.a2.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h2_num").disabled = false;
	document.getElementById("h2_year1").disabled = false;
	document.getElementById("h2_year2").disabled = true;
	if(s==""){
		document.apLogin.a2.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h2_num").value!="" && document.getElementById("h2_year1").value!=""){
		document.apLogin.a2.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
				   document.apLogin.a2.value=="OK!" &&
				   document.apLogin.a3.value=="OK!"){
						document.getElementById("subm").disabled = false;}}
}
function check5(s)
{
	document.apLogin.a2.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h2_num").disabled = true;
	document.getElementById("h2_year1").disabled = true;
	document.getElementById("h2_year2").disabled = false;
	if(s==""){
		document.apLogin.a2.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h2_year2").value!=""){
		document.apLogin.a2.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
				   document.apLogin.a2.value=="OK!" &&
				   document.apLogin.a3.value=="OK!"){
						document.getElementById("subm").disabled = false;}}
}
function check6(s)
{
	document.getElementById("h3_num").disabled = true;
	document.getElementById("h3_year1").disabled = true;
	document.getElementById("h3_year2").disabled = true;
	document.apLogin.a3.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
			   document.apLogin.a2.value=="OK!" &&
			   document.apLogin.a3.value=="OK!"){
					document.getElementById("subm").disabled = false;}
}
function check7(s)
{
	document.apLogin.a3.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h3_num").disabled = false;
	document.getElementById("h3_year1").disabled = false;
	document.getElementById("h3_year2").disabled = true;
	if(s==""){
		document.apLogin.a3.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h3_num").value!="" && document.getElementById("h3_year1").value!=""){
		document.apLogin.a3.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
				   document.apLogin.a2.value=="OK!" &&
				   document.apLogin.a3.value=="OK!"){
						document.getElementById("subm").disabled = false;}}
}
function check8(s)
{
	document.apLogin.a3.value="";
	document.getElementById("subm").disabled = true;
	document.getElementById("h3_num").disabled = true;
	document.getElementById("h3_year1").disabled = true;
	document.getElementById("h3_year2").disabled = false;
	if(s==""){
		document.apLogin.a3.value="";
		document.getElementById("subm").disabled = true;}
	for( var loc=0; loc<s.length; loc++ )
		if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
		{
			document.apLogin.a1.value="格式錯誤!";
			document.getElementById("subm").disabled = true;
			return false;
		}
	if(document.getElementById("h3_year2").value!=""){
		document.apLogin.a3.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
		   document.apLogin.a2.value=="OK!" &&
		   document.apLogin.a3.value=="OK!"){
				document.getElementById("subm").disabled = false;}}
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
	String date = request.getParameter("date");
	String e_mail = request.getParameter("e_mail");
	String address = request.getParameter("address");
	String height = request.getParameter("height");
	int height1 = Integer.parseInt(height);
	String weight = request.getParameter("weight");
	int weight1 = Integer.parseInt(weight);
	String waist = request.getParameter("waist");
	int waist1 = Integer.parseInt(waist);
	String hip = request.getParameter("hip");
	int hip1 = Integer.parseInt(hip);
	
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
			<IMG SRC="images/member/step3.png">
			<IMG SRC="images/member/step44.png">
			<IMG SRC="images/member/step5.png">
			<IMG SRC="images/member/step6.png">
			<form action="member_step5.jsp" method="post" name="apLogin">
				<input type="hidden" name="account" value="<%=account%>">
      			<input type="hidden" name="password" value="<%=password%>">
      			<input type="hidden" name="name" value="<%=name%>">
      			<input type="hidden" name="user_name" value="<%=user_name%>">
      			<input type="hidden" name="gender" value="<%=gender%>">
      			<input type="hidden" name="date" value="<%=date%>">
      			<input type="hidden" name="e_mail" value="<%=e_mail%>">
      			<input type="hidden" name="address" value="<%=address%>">
      			<input type="hidden" name="height" value="<%=height1%>">
      			<input type="hidden" name="weight" value="<%=weight1%>">
      			<input type="hidden" name="waist" value="<%=waist1%>">
      			<input type="hidden" name="hip" value="<%=hip1%>">
      			<input type="hidden" name="ques" value="<%=ques%>">
      			<input type="hidden" name="ans" value="<%=ans%>">
				<div align=left style="margin:35px 0 0 230px; font-size:20px; color:#646464">
					<table>
      		<tr>
      			<td align=right style="border-bottom:1px dashed gray;">抽菸：</td>
      			<td style="border-bottom:1px dashed gray;">
      				<INPUT TYPE="radio" NAME="h1" value="0" onclick="check()">無。<br/>
      				<INPUT TYPE="radio" NAME="h1" value="2" onclick="check2()">曾經有，
      		       	已戒&nbsp;<input type="text" name="h1_year2" id="h1_year2" size="1" disabled="disabled" onkeyup="check2(this.value)">&nbsp;年。
      		       	<input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a1" id="a1" size="1" value="" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h1" value="1" onclick="check1()">有，
      		                     一天&nbsp;<input type="text" name="h1_num" id="h1_num" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;包，
      		                     已抽&nbsp;<input type="text" name="h1_year1" id="h1_year1" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;年。
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="border-bottom:1px dashed gray;">喝酒：</td>
      			<td style="border-bottom:1px dashed gray;">
      				<INPUT TYPE="radio" NAME="h2" value="0" onclick="check3()">無。<br/>
      				<INPUT TYPE="radio" NAME="h2" value="2" onclick="check5()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h2_year2" id="h2_year2" size="1" disabled="disabled" onkeyup="check5(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a2" id="a2" size="1" value="" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h2" value="1" onclick="check4()">有，
      		                      一天&nbsp;<input type="text" name="h2_num" id="h2_num" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;瓶，
      		                      已喝&nbsp;<input type="text" name="h2_year1" id="h2_year1" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;年。
      			</td>
      		</tr>
      		<tr>
      			<td align=right>嚼檳榔：</td>
      			<td>
      				<INPUT TYPE="radio" NAME="h3" value="0" onclick="check6()">無。<br/>
      				<INPUT TYPE="radio" NAME="h3" value="2" onclick="check8()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h3_year2" id="h3_year2" size="1" disabled="disabled" onkeyup="check8(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a3" id="a3" size="1" value="" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h3" value="1" onclick="check7()">有，
      		                      一天&nbsp;<input type="text" name="h3_num" id="h3_num" size="1" disabled="disabled" onkeyup="check7(this.value)">&nbsp;包，
      		                      已嚼&nbsp;<input type="text" name="h3_year1" id="h3_year1" size="1" disabled="disabled" onkeyup="check7(this.value)">&nbsp;年。
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