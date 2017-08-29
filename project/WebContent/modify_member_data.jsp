<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>會員中心</title>
<link rel="stylesheet" href="css/main.css" type="text/css">

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
<script type="text/javascript">
function check11()
{
	document.getElementById("d1").disabled = true;document.getElementById("d2").disabled = true;
	document.getElementById("d3").disabled = true;document.getElementById("d4").disabled = true;
	document.getElementById("d5").disabled = true;document.getElementById("d6").disabled = true;
	document.getElementById("d7").disabled = true;document.getElementById("d8").disabled = true;
	document.getElementById("d9").disabled = true;document.getElementById("d10").disabled = true;
	document.getElementById("d11").disabled = true;document.getElementById("d12").disabled = true;
	document.getElementById("d13").disabled = true;document.getElementById("d14").disabled = true;
	document.getElementById("other1").disabled = true;
	document.apLogin1.a4.value="OK!";
	if(document.apLogin1.a4.value=="OK!" && 
	   document.apLogin1.a5.value=="OK!"){
		   document.getElementById("subm1").disabled = false;}
}
function check12()
{
	document.getElementById("d1").disabled = true;document.getElementById("d2").disabled = true;
	document.getElementById("d3").disabled = true;document.getElementById("d4").disabled = true;
	document.getElementById("d5").disabled = true;document.getElementById("d6").disabled = true;
	document.getElementById("d7").disabled = true;document.getElementById("d8").disabled = true;
	document.getElementById("d9").disabled = true;document.getElementById("d10").disabled = true;
	document.getElementById("d11").disabled = true;document.getElementById("d12").disabled = true;
	document.getElementById("d13").disabled = true;document.getElementById("d14").disabled = true;
	document.getElementById("other1").disabled = true;
	document.apLogin1.a4.value="OK!";
	if(document.apLogin1.a4.value=="OK!" && 
	   document.apLogin1.a4.value=="OK!"){
		   document.getElementById("subm1").disabled = false;}
}
function check13()
{
	document.getElementById("d1").disabled = false;document.getElementById("d2").disabled = false;
	document.getElementById("d3").disabled = false;document.getElementById("d4").disabled = false;
	document.getElementById("d5").disabled = false;document.getElementById("d6").disabled = false;
	document.getElementById("d7").disabled = false;document.getElementById("d8").disabled = false;
	document.getElementById("d9").disabled = false;document.getElementById("d10").disabled = false;
	document.getElementById("d11").disabled = false;document.getElementById("d12").disabled = false;
	document.getElementById("d13").disabled = false;document.getElementById("d14").disabled = false;
	document.getElementById("other1").disabled = false;
	document.apLogin1.a4.value="";
	document.getElementById("subm1").disabled = true;
}
function check14()
{
	if(document.getElementById("d1").checked == true || document.getElementById("d2").checked == true ||
	   document.getElementById("d3").checked == true ||	document.getElementById("d4").checked == true ||
	   document.getElementById("d5").checked == true || document.getElementById("d6").checked == true ||
	   document.getElementById("d7").checked == true || document.getElementById("d8").checked == true ||
	   document.getElementById("d9").checked == true || document.getElementById("d10").checked == true ||
	   document.getElementById("d11").checked == true || document.getElementById("d12").checked == true ||
	   document.getElementById("d13").checked == true || document.getElementById("d14").checked == true){
		document.apLogin1.a4.value="OK!";
		if(document.apLogin1.a4.value=="OK!" && 
		   document.apLogin1.a5.value=="OK!"){
			   document.getElementById("subm1").disabled = false;}}
	else{
		document.apLogin1.a4.value="";
		document.getElementById("subm1").disabled = true;}
}function check15()
{
	document.getElementById("d15").disabled = true;document.getElementById("d16").disabled = true;
	document.getElementById("d17").disabled = true;document.getElementById("d18").disabled = true;
	document.getElementById("d19").disabled = true;document.getElementById("d20").disabled = true;
	document.getElementById("d21").disabled = true;document.getElementById("d22").disabled = true;
	document.getElementById("d23").disabled = true;document.getElementById("d24").disabled = true;
	document.getElementById("d25").disabled = true;document.getElementById("d26").disabled = true;
	document.getElementById("d27").disabled = true;document.getElementById("d28").disabled = true;
	document.getElementById("other2").disabled = true;
	document.apLogin1.a5.value="OK!";
	if(document.apLogin1.a4.value=="OK!" && 
	   document.apLogin1.a5.value=="OK!"){
		   document.getElementById("subm1").disabled = false;}
}
function check16()
{
	document.getElementById("d15").disabled = true;document.getElementById("d16").disabled = true;
	document.getElementById("d17").disabled = true;document.getElementById("d18").disabled = true;
	document.getElementById("d19").disabled = true;document.getElementById("d20").disabled = true;
	document.getElementById("d21").disabled = true;document.getElementById("d22").disabled = true;
	document.getElementById("d23").disabled = true;document.getElementById("d24").disabled = true;
	document.getElementById("d25").disabled = true;document.getElementById("d26").disabled = true;
	document.getElementById("d27").disabled = true;document.getElementById("d28").disabled = true;
	document.getElementById("other2").disabled = true;
	document.apLogin1.a5.value="OK!";
	if(document.apLogin1.a4.value=="OK!" && 
	   document.apLogin1.a5.value=="OK!"){
		   document.getElementById("subm1").disabled = false;}
}
function check17()
{
	document.getElementById("d15").disabled = false;document.getElementById("d16").disabled = false;
	document.getElementById("d17").disabled = false;document.getElementById("d18").disabled = false;
	document.getElementById("d19").disabled = false;document.getElementById("d20").disabled = false;
	document.getElementById("d21").disabled = false;document.getElementById("d22").disabled = false;
	document.getElementById("d23").disabled = false;document.getElementById("d24").disabled = false;
	document.getElementById("d25").disabled = false;document.getElementById("d26").disabled = false;
	document.getElementById("d27").disabled = false;document.getElementById("d28").disabled = false;
	document.getElementById("other2").disabled = false;
	document.apLogin1.a5.value="";
	document.getElementById("subm1").disabled = true;
}
function check18()
{
	if(document.getElementById("d15").checked == true || document.getElementById("d16").checked == true ||
	   document.getElementById("d17").checked == true || document.getElementById("d18").checked == true ||
	   document.getElementById("d19").checked == true || document.getElementById("d20").checked == true ||
	   document.getElementById("d21").checked == true || document.getElementById("d22").checked == true ||
	   document.getElementById("d23").checked == true || document.getElementById("d24").checked == true ||
	   document.getElementById("d25").checked == true || document.getElementById("d26").checked == true ||
	   document.getElementById("d27").checked == true || document.getElementById("d28").checked == true){
		document.apLogin1.a5.value="OK!";
		if(document.apLogin1.a4.value=="OK!" && 
		   document.apLogin1.a5.value=="OK!"){
			   document.getElementById("subm1").disabled = false;}}
	else{
		document.apLogin1.a5.value="";
		document.getElementById("subm1").disabled = true;}
}
</script>

</head>
<%@ include file="JDBCConstants.jsp"%>
<body>
<%@ include file="menu.jsp"%>
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
	<div style="width:990px; height:1250px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:1130px; background:url(images/index/inside_bg.gif) repeat-y;">
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
					<form action="modify_member_data1.jsp" method="post" name="modify">
					<table><tr>
					<td><IMG style="margin:60px 0 0 50px" SRC="images/member/man1.png"></IMG></td>
					<td>
						<div style="margin:0px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							帳號：<font style="margin:0 0 0 45px;"><%=rs.getString("account")%></font>
							<input type="hidden" name="account" value="<%=name%>">
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							姓名：<input style="margin:0 0 0 45px;" type="text" name="member_name" size="20" value="<%=rs.getString("member_name")%>">
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							稱呼：<input style="margin:0 0 0 45px;" type="text" name="online_name" size="20" value="<%=rs.getString("online_name")%>">
						</div>
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							性別：
							<%
							if(rs.getString("member_gender").equals("男性")){
							%>
							<input style="margin:0 0 0 40px;"  type="radio" name="gender" value="男性" checked>男性
	    					<input type="radio" name="gender" value="女性">女性
	    					<%
							}
							else{
	    					%>
	    					<input style="margin:0 0 0 45px;"  type="radio" name="gender" value="男性">男性
	    					<input type="radio" name="gender" value="女性" checked>女性
	    					<%}%>
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							生日：<input style="margin:0 0 0 45px;" type="text" name="member_birthday" size="20" value="<%=rs.getString("member_birthday")%>">
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							信箱：<input style="margin:0 0 0 45px;" type="text" name="member_email" size="20" value="<%=rs.getString("member_email")%>">
						</div>		
						<div style="margin:5px 0 0 70px; border-bottom:1px solid gray; width:400px;">
							地址：<input style="margin:0 0 0 45px;" type="text" name="member_address" size="20" value="<%=rs.getString("member_address")%>">
						</div>
					</td>	
					</tr></table>
					<input style="position:absolute; top:230px; right:17px;" type="image" src="images/member/modify_icon.png" name="modify" onmouseover="this.src='images/member/modify_icon1.png'" onmouseout="this.src='images/member/modify_icon.png'" onclick="if(confirm('確定要修改基本資料嗎?')) return true;else return false">
					</form>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt2.png) no-repeat;">
					</div>
					<div align=left style="width:692px; height:120px; background:url(images/member/mdm.png) repeat-y;">
					<form action="modify_member_data2.jsp" method="post" name="modify1">
					<input type="hidden" name="account1" value="<%=name%>">
					<table><tr>
					<td><IMG style="margin:20px 0 0 40px" SRC="images/member/man2.png"></IMG></td>
					<td>	
						<div style="margin:0px 0 0 56px; border-bottom:1px solid gray; width:300px;">
							身高：<input style="margin:0 0 0 45px;" type="text" name="height" size="10" value="<%=rs.getString("height")%>">公分
						</div>			
						<div style="margin:5px 0 0 56px; border-bottom:1px solid gray; width:300px;">
							體重：<input style="margin:0 0 0 45px;" type="text" name="weight" size="10" value="<%=rs.getString("weight")%>">公斤
						</div>			
						<div style="margin:5px 0 0 56px; border-bottom:1px solid gray; width:300px;">
							腰圍：<input style="margin:0 0 0 45px;" type="text" name="waist" size="10" value="<%=rs.getString("waist")%>">吋
						</div>			
						<div style="margin:5px 0 0 56px; border-bottom:1px solid gray; width:300px;">
							臀圍：<input style="margin:0 0 0 45px;" type="text" name="hip" size="10" value="<%=rs.getString("hip")%>">吋
						</div>
					</td>	
					</tr></table>
					<input style="position:absolute; top:435px; right:17px;" type="image" src="images/member/modify_icon.png" name="modify" onmouseover="this.src='images/member/modify_icon1.png'" onmouseout="this.src='images/member/modify_icon.png'" onclick="if(confirm('確定要修改身體密碼嗎?')) return true;else return false">
					</form>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt3.png) no-repeat;">
					</div>
					<div align=left style="position:relative; width:692px; height:220px; background:url(images/member/mdm.png) repeat-y;">
					<div style="position:absolute; top:65px; left:55px">
						<IMG SRC="images/member/man3.png"></IMG>
					</div>
					<div style="position:absolute; top:0px; left:183px;">
<%
String sql1 = "SELECT * from hobby where account = '"+name+"'";
ResultSet rs1 = smt.executeQuery(sql1);
rs1.first();
%>
<form action="modify_member_data3.jsp" method="post" name="apLogin">
	<input type="hidden" name="account2" value="<%=name%>">		
		<table>
      		<tr>
      			<td align=right style="border-bottom:1px dashed gray;">抽菸：</td>
      			<td style="border-bottom:1px dashed gray;">
<%
if(rs1.getInt("smoke")==0){
%>
					<INPUT TYPE="radio" NAME="h1" value="0" onclick="check()" checked>無。<br/>
      				<INPUT TYPE="radio" NAME="h1" value="2" onclick="check2()">曾經有，
      		       	已戒&nbsp;<input type="text" name="h1_year2" id="h1_year2" size="1" disabled="disabled" onkeyup="check2(this.value)">&nbsp;年。
      		       	<input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a1" id="a1" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h1" value="1" onclick="check1()">有，
      		                     一天&nbsp;<input type="text" name="h1_num" id="h1_num" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;包，
      		                     已抽&nbsp;<input type="text" name="h1_year1" id="h1_year1" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("smoke")==1){
%>
   				<INPUT TYPE="radio" NAME="h1" value="0" onclick="check()">無。<br/>
      				<INPUT TYPE="radio" NAME="h1" value="2" onclick="check2()">曾經有，
      		       	已戒&nbsp;<input type="text" name="h1_year2" id="h1_year2" size="1" disabled="disabled" onkeyup="check2(this.value)">&nbsp;年。
      		       	<input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a1" id="a1" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h1" value="1" onclick="check1()" checked>有，
      		                     一天&nbsp;<input type="text" name="h1_num" id="h1_num" size="1" value="<%=rs1.getInt("smoke_number") %>" onkeyup="check1(this.value)">&nbsp;包，
      		                     已抽&nbsp;<input type="text" name="h1_year1" id="h1_year1" size="1" value="<%=rs1.getInt("smoke_year") %>" onkeyup="check1(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("smoke")==2){
%>
   				<INPUT TYPE="radio" NAME="h1" value="0" onclick="check()">無。<br/>
      				<INPUT TYPE="radio" NAME="h1" value="2" onclick="check2()" checked>曾經有，
      		       	已戒&nbsp;<input type="text" name="h1_year2" id="h1_year2" size="1" value="<%=rs1.getInt("smoke_year") %>" onkeyup="check2(this.value)">&nbsp;年。
      		       	<input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a1" id="a1" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h1" value="1" onclick="check1()">有，
      		                     一天&nbsp;<input type="text" name="h1_num" id="h1_num" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;包，
      		                     已抽&nbsp;<input type="text" name="h1_year1" id="h1_year1" size="1" disabled="disabled" onkeyup="check1(this.value)">&nbsp;年。
<%
}
%>    			
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="border-bottom:1px dashed gray;">喝酒：</td>
      			<td style="border-bottom:1px dashed gray;">
<%
if(rs1.getInt("drink")==0){
%>      			
   					<INPUT TYPE="radio" NAME="h2" value="0" onclick="check3()" checked>無。<br/>
      				<INPUT TYPE="radio" NAME="h2" value="2" onclick="check5()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h2_year2" id="h2_year2" size="1" disabled="disabled" onkeyup="check5(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a2" id="a2" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h2" value="1" onclick="check4()">有，
      		                      一天&nbsp;<input type="text" name="h2_num" id="h2_num" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;瓶，
      		                      已喝&nbsp;<input type="text" name="h2_year1" id="h2_year1" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("drink")==1){
%>
   					<INPUT TYPE="radio" NAME="h2" value="0" onclick="check3()">無。<br/>
      				<INPUT TYPE="radio" NAME="h2" value="2" onclick="check5()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h2_year2" id="h2_year2" size="1" disabled="disabled" onkeyup="check5(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a2" id="a2" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h2" value="1" onclick="check4()" checked>有，
      		                      一天&nbsp;<input type="text" name="h2_num" id="h2_num" size="1" value="<%=rs1.getInt("drink_number") %>" onkeyup="check4(this.value)">&nbsp;瓶，
      		                      已喝&nbsp;<input type="text" name="h2_year1" id="h2_year1" size="1" value="<%=rs1.getInt("drink_year") %>" onkeyup="check4(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("drink")==2){
%>
   				<INPUT TYPE="radio" NAME="h2" value="0" onclick="check3()">無。<br/>
      				<INPUT TYPE="radio" NAME="h2" value="2" onclick="check5()" checked>曾經有，
      		                      已戒&nbsp;<input type="text" name="h2_year2" id="h2_year2" size="1" value="<%=rs1.getInt("drink_year") %>" onkeyup="check5(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a2" id="a2" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h2" value="1" onclick="check4()">有，
      		                      一天&nbsp;<input type="text" name="h2_num" id="h2_num" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;瓶，
      		                      已喝&nbsp;<input type="text" name="h2_year1" id="h2_year1" size="1" disabled="disabled" onkeyup="check4(this.value)">&nbsp;年。
<%
}
%>      			
      			</td>
      		</tr>
      		<tr>
      			<td align=right>嚼檳榔：</td>
      			<td>
<%
if(rs1.getInt("betel")==0){
%>      			
      				<INPUT TYPE="radio" NAME="h3" value="0" onclick="check6()" checked>無。<br/>
      				<INPUT TYPE="radio" NAME="h3" value="2" onclick="check8()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h3_year2" id="h3_year2" size="1" disabled="disabled" onkeyup="check8(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a3" id="a3" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h3" value="1" onclick="check7()">有，
      		                      一天&nbsp;<input type="text" name="h3_num" id="h3_num" size="1" disabled="disabled" onkeyup="check7(this.value)">&nbsp;包，
      		                      已嚼&nbsp;<input type="text" name="h3_year1" id="h3_year1" size="1" disabled="disabled" onkeyup="check7(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("betel")==1){
%>
      				<INPUT TYPE="radio" NAME="h3" value="0" onclick="check6()">無。<br/>
      				<INPUT TYPE="radio" NAME="h3" value="2" onclick="check8()">曾經有，
      		                      已戒&nbsp;<input type="text" name="h3_year2" id="h3_year2" size="1" disabled="disabled" onkeyup="check8(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a3" id="a3" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h3" value="1" onclick="check7()" checked>有，
      		                      一天&nbsp;<input type="text" name="h3_num" id="h3_num" size="1" value="<%=rs1.getInt("betel_number")%>" onkeyup="check7(this.value)">&nbsp;包，
      		                      已嚼&nbsp;<input type="text" name="h3_year1" id="h3_year1" size="1" value="<%=rs1.getInt("betel_year")%>" onkeyup="check7(this.value)">&nbsp;年。
<%
}
if(rs1.getInt("betel")==2){
%>
      				<INPUT TYPE="radio" NAME="h3" value="0" onclick="check6()">無。<br/>
      				<INPUT TYPE="radio" NAME="h3" value="2" onclick="check8()" checked>曾經有，
      		                      已戒&nbsp;<input type="text" name="h3_year2" id="h3_year2" size="1" value="<%=rs1.getInt("betel_year")%>" onkeyup="check8(this.value)">&nbsp;年。
      		        <input style="border:0; margin:0px 0 0 73px; background:#fff" type="text" name="a3" id="a3" size="1" value="OK!" disabled><br/>
      		    	<INPUT TYPE="radio" NAME="h3" value="1" onclick="check7()">有，
      		                      一天&nbsp;<input type="text" name="h3_num" id="h3_num" size="1" onkeyup="check7(this.value)">&nbsp;包，
      		                      已嚼&nbsp;<input type="text" name="h3_year1" id="h3_year1" size="1" onkeyup="check7(this.value)">&nbsp;年。
<%
}
%>      			
      			</td>
      		</tr>
      	</table>
      				<input style="position:absolute; bottom:0; right:-80px" name="subm" id="subm" type="submit" value="修改" disabled="disabled"/ onclick="if(confirm('確定要修改生活習慣嗎?')) return true;else return false">
</form>
					</div>
					</div>
					<div style="width:692px; height:20px; background:url(images/member/mdb.png) no-repeat;">
					</div>
					
					<div style="margin-top:10px; width:692px; height:55px; background:url(images/member/mdt4.png) no-repeat;">
					</div>
					<div align=left style="position:relative; width:692px; height:240px; background:url(images/member/mdm.png) repeat-y;">
					<div style="position:absolute; top:70px; left:30px">	
					<IMG SRC="images/member/man4.png"></IMG>
					</div>
					<div style="position:absolute; top:0px; left:195px">
<form action="modify_member_data4.jsp" method="post" name="apLogin1">	
	<input type="hidden" name="account3" value="<%=name%>">	
		<table>
      		<tr>
      		<td width=70 style="padding-top:30px; border-bottom:1px gray dashed;">個人<br/>病史</td>
      		<td style="border-bottom:1px gray dashed;">
<%
	String sql2 = "SELECT d_name from my_medical_history where account = '"+name+"'";
	ResultSet rs2 = smt.executeQuery(sql2);
	rs2.last();
	int count2=rs2.getRow();
	rs2.first();
	
	if(count2 == 0){
%>      		
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="0" onclick="check11()" checked>無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a4" id="a4" size="5" value="" disabled><br/>
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="2" onclick="check13()">有。</label><br/>      		
      		<INPUT disabled="disabled" TYPE="checkbox" NAME="d" id=d1 value="癌症" onclick="check14()">癌症
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d2 value="高血壓" onclick="check14()">高血壓
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d3 value="糖尿病" onclick="check14()">糖尿病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d4 value="肺結核" onclick="check14()">肺結核
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d5 value="高血脂症" onclick="check14()">高血脂症<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d6 value="肝病" onclick="check14()">肝病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d7 value="心臟病" onclick="check14()">心臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d8 value="腦中風" onclick="check14()">腦中風
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d9 value="腎臟病" onclick="check14()">腎臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d10 value="慢性肺病" onclick="check14()">慢性肺病<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d11 value="氣喘" onclick="check14()">氣喘
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d12 value="風濕" onclick="check14()">風濕
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d13 value="消化性潰瘍" onclick="check14()">消化性潰瘍
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d14 value="其他" onclick="check14()">其他
      		<INPUT disabled="disabled"  TYPE="text" NAME="other1" id=other1 size="8">
<%
	}
	else{
%> 
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="0" onclick="check11()">無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a4" id="a4" size="5" value="" disabled><br/>
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="2" onclick="check13()" checked>有。</label><br/>
      		<%
      		String sql3 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '癌症'";
			ResultSet rs3 = smt.executeQuery(sql3);
			rs3.last();
			int count3=rs3.getRow();
			if(count3 == 0){
			%>
			<INPUT TYPE="checkbox" NAME="d" id=d1 value="癌症" onclick="check14()">癌症
			<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d1 value="癌症" onclick="check14()" checked>癌症
      		<%}
			String sql4 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '高血壓'";
			ResultSet rs4 = smt.executeQuery(sql4);
			rs4.last();
			int count4=rs4.getRow();
			if(count4 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d2 value="高血壓" onclick="check14()">高血壓
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d2 value="高血壓" onclick="check14()" checked>高血壓
      		<%}
			String sql5 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '糖尿病'";
			ResultSet rs5 = smt.executeQuery(sql5);
			rs5.last();
			int count5=rs5.getRow();
			if(count5 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d3 value="糖尿病" onclick="check14()">糖尿病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d3 value="糖尿病" onclick="check14()" checked>糖尿病
      		<%}
			String sql6 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '肺結核'";
			ResultSet rs6 = smt.executeQuery(sql6);
			rs6.last();
			int count6=rs6.getRow();
			if(count6 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d4 value="肺結核" onclick="check14()">肺結核
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d4 value="肺結核" onclick="check14()" checked>肺結核
      		<%}
			String sql7 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '高血脂症'";
			ResultSet rs7 = smt.executeQuery(sql7);
			rs7.last();
			int count7=rs7.getRow();
			if(count7 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d5 value="高血脂症" onclick="check14()">高血脂症<br/>
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d5 value="高血脂症" onclick="check14()" checked>高血脂症<br/>
      		<%}
			String sql8 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '肝病'";
			ResultSet rs8 = smt.executeQuery(sql8);
			rs8.last();
			int count8=rs8.getRow();
			if(count8 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d6 value="肝病" onclick="check14()">肝病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d6 value="肝病" onclick="check14()" checked>肝病
      		<%}
			String sql9 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '心臟病'";
			ResultSet rs9 = smt.executeQuery(sql9);
			rs9.last();
			int count9=rs9.getRow();
			if(count9 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d7 value="心臟病" onclick="check14()">心臟病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d7 value="心臟病" onclick="check14()" checked>心臟病
      		<%}
			String sql10 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '腦中風'";
			ResultSet rs10 = smt.executeQuery(sql10);
			rs10.last();
			int count10=rs10.getRow();
			if(count10 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d8 value="腦中風" onclick="check14()">腦中風
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d8 value="腦中風" onclick="check14()" checked>腦中風
      		<%}
			String sql11 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '腎臟病'";
			ResultSet rs11 = smt.executeQuery(sql11);
			rs11.last();
			int count11=rs11.getRow();
			if(count11 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d9 value="腎臟病" onclick="check14()">腎臟病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d9 value="腎臟病" onclick="check14()" checked>腎臟病
      		<%}
			String sql12 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '慢性肺病'";
			ResultSet rs12 = smt.executeQuery(sql12);
			rs12.last();
			int count12=rs12.getRow();
			if(count12 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d10 value="慢性肺病" onclick="check14()">慢性肺病<br/>
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d10 value="慢性肺病" onclick="check14()" checked>慢性肺病<br/>
      		<%}
			String sql13 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '氣喘'";
			ResultSet rs13 = smt.executeQuery(sql13);
			rs13.last();
			int count13=rs13.getRow();
			if(count13 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d11 value="氣喘" onclick="check14()">氣喘
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d11 value="氣喘" onclick="check14()" checked>氣喘
      		<%}
			String sql14 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '風濕'";
			ResultSet rs14 = smt.executeQuery(sql14);
			rs14.last();
			int count14=rs14.getRow();
			if(count14 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d12 value="風濕" onclick="check14()">風濕
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d12 value="風濕" onclick="check14()" checked>風濕
      		<%}
			String sql15 = "SELECT d_name from my_medical_history where account = '"+name+"' and d_name = '消化性潰瘍'";
			ResultSet rs15 = smt.executeQuery(sql15);
			rs15.last();
			int count15=rs15.getRow();
			if(count15 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d" id=d13 value="消化性潰瘍" onclick="check14()">消化性潰瘍
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d" id=d13 value="消化性潰瘍" onclick="check14()" checked>消化性潰瘍
      		<%} %>
      		<INPUT TYPE="checkbox" NAME="d" id=d14 value="其他" onclick="check14()">其他
      		<INPUT TYPE="text" NAME="other1" id=other1 size="8">
<%
	}
%>     		
      		</td>
      		</tr>
      		<tr>
      		<td style="padding-top:30px;">家族<br/>病史</td>
      		<td>
<%
	String sql3 = "SELECT * from family_medical_history where account = '"+name+"'";
	ResultSet rs3 = smt.executeQuery(sql3);
	rs3.last();
	int count3=rs3.getRow();
	rs3.first();
	
	if(count3 == 0){
%>      		
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="0" onclick="check15()" checked>無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a5" id="a5" size="5" value="" disabled><br/>
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="2" onclick="check17()">有。</label><br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d15 value="癌症" onclick="check18()">癌症
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d16 value="高血壓" onclick="check18()">高血壓
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d17 value="糖尿病" onclick="check18()">糖尿病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d18 value="肺結核" onclick="check18()">肺結核
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d19 value="高血脂症" onclick="check18()">高血脂症<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d20 value="肝病" onclick="check18()">肝病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d21 value="心臟病" onclick="check18()">心臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d22 value="腦中風" onclick="check18()">腦中風
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d23 value="腎臟病" onclick="check18()">腎臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d24 value="慢性肺病" onclick="check18()">慢性肺病<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d25 value="氣喘" onclick="check18()">氣喘
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d26 value="風濕" onclick="check18()">風濕
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d27 value="消化性潰瘍" onclick="check18()">消化性潰瘍
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d28 value="其他" onclick="check18()">其他
      		<INPUT disabled="disabled"  TYPE="text" NAME="other2" id=other2 size="8"><br/>
<%
	}
	else{
%> 
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="0" onclick="check15()">無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a5" id="a5" size="5" value="" disabled><br/>
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="2" onclick="check17()" checked>有。</label><br/>
      		<%
      		String sql16 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '癌症'";
			ResultSet rs16 = smt.executeQuery(sql16);
			rs16.last();
			int count16=rs16.getRow();
			if(count16 == 0){
			%>
			<INPUT TYPE="checkbox" NAME="d1" id=d15 value="癌症" onclick="check18()">癌症
			<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d15 value="癌症" onclick="check18()" checked>癌症
      		<%}
			String sql4 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '高血壓'";
			ResultSet rs4 = smt.executeQuery(sql4);
			rs4.last();
			int count4=rs4.getRow();
			if(count4 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d16 value="高血壓" onclick="check18()">高血壓
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d16 value="高血壓" onclick="check18()" checked>高血壓
      		<%}
			String sql5 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '糖尿病'";
			ResultSet rs5 = smt.executeQuery(sql5);
			rs5.last();
			int count5=rs5.getRow();
			if(count5 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d17 value="糖尿病" onclick="check18()">糖尿病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d17 value="糖尿病" onclick="check18()" checked>糖尿病
      		<%}
			String sql6 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '肺結核'";
			ResultSet rs6 = smt.executeQuery(sql6);
			rs6.last();
			int count6=rs6.getRow();
			if(count6 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d18 value="肺結核" onclick="check18()">肺結核
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d18 value="肺結核" onclick="check18()" checked>肺結核
      		<%}
			String sql7 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '高血脂症'";
			ResultSet rs7 = smt.executeQuery(sql7);
			rs7.last();
			int count7=rs7.getRow();
			if(count7 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d19 value="高血脂症" onclick="check18()">高血脂症<br/>
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d19 value="高血脂症" onclick="check18()" checked>高血脂症<br/>
      		<%}
			String sql8 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '肝病'";
			ResultSet rs8 = smt.executeQuery(sql8);
			rs8.last();
			int count8=rs8.getRow();
			if(count8 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d20 value="肝病" onclick="check18()">肝病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d20 value="肝病" onclick="check18()" checked>肝病
      		<%}
			String sql9 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '心臟病'";
			ResultSet rs9 = smt.executeQuery(sql9);
			rs9.last();
			int count9=rs9.getRow();
			if(count9 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d21 value="心臟病" onclick="check18()">心臟病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d21 value="心臟病" onclick="check18()" checked>心臟病
      		<%}
			String sql10 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '腦中風'";
			ResultSet rs10 = smt.executeQuery(sql10);
			rs10.last();
			int count10=rs10.getRow();
			if(count10 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d22 value="腦中風" onclick="check18()">腦中風
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d22 value="腦中風" onclick="check18()" checked>腦中風
      		<%}
			String sql11 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '腎臟病'";
			ResultSet rs11 = smt.executeQuery(sql11);
			rs11.last();
			int count11=rs11.getRow();
			if(count11 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d23 value="腎臟病" onclick="check18()">腎臟病
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d23 value="腎臟病" onclick="check18()" checked>腎臟病
      		<%}
			String sql12 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '慢性肺病'";
			ResultSet rs12 = smt.executeQuery(sql12);
			rs12.last();
			int count12=rs12.getRow();
			if(count12 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d24 value="慢性肺病" onclick="check18()">慢性肺病<br/>
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d24 value="慢性肺病" onclick="check18()" checked>慢性肺病<br/>
      		<%}
			String sql13 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '氣喘'";
			ResultSet rs13 = smt.executeQuery(sql13);
			rs13.last();
			int count13=rs13.getRow();
			if(count13 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d25 value="氣喘" onclick="check18()">氣喘
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d25 value="氣喘" onclick="check18()" checked>氣喘
      		<%}
			String sql14 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '風濕'";
			ResultSet rs14 = smt.executeQuery(sql14);
			rs14.last();
			int count14=rs14.getRow();
			if(count14 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d26 value="風濕" onclick="check18()">風濕
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d26 value="風濕" onclick="check18()" checked>風濕
      		<%}
			String sql15 = "SELECT d_name from family_medical_history where account = '"+name+"' and d_name = '消化性潰瘍'";
			ResultSet rs15 = smt.executeQuery(sql15);
			rs15.last();
			int count15=rs15.getRow();
			if(count15 == 0){
			%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d27 value="消化性潰瘍" onclick="check18()">消化性潰瘍
      		<%}else{%>
      		<INPUT TYPE="checkbox" NAME="d1" id=d27 value="消化性潰瘍" onclick="check18()" checked>消化性潰瘍
      		<%} %>
      		<INPUT TYPE="checkbox" NAME="d1" id=d28 value="其他" onclick="check18()">其他
      		<INPUT TYPE="text" NAME="other2" id=other2 size="8">
<%
	}
%>
      		
      		</td>
      		</tr>
      	</table>
      		<input style="position:absolute; bottom:0; right:-53px" name="subm1" id="subm1" type="submit" value="修改" disabled="disabled" onclick="if(confirm('確定要修改我的病史嗎?')) return true;else return false"/>
</form>
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