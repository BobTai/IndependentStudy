<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的病史</title>

<script type="text/javascript">
function check1()
{
	document.getElementById("d1").disabled = true;document.getElementById("d2").disabled = true;
	document.getElementById("d3").disabled = true;document.getElementById("d4").disabled = true;
	document.getElementById("d5").disabled = true;document.getElementById("d6").disabled = true;
	document.getElementById("d7").disabled = true;document.getElementById("d8").disabled = true;
	document.getElementById("d9").disabled = true;document.getElementById("d10").disabled = true;
	document.getElementById("d11").disabled = true;document.getElementById("d12").disabled = true;
	document.getElementById("d13").disabled = true;document.getElementById("d14").disabled = true;
	document.getElementById("other1").disabled = true;
	document.apLogin.a1.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
	   document.apLogin.a2.value=="OK!"){
		   document.getElementById("subm").disabled = false;}
}
function check2()
{
	document.getElementById("d1").disabled = true;document.getElementById("d2").disabled = true;
	document.getElementById("d3").disabled = true;document.getElementById("d4").disabled = true;
	document.getElementById("d5").disabled = true;document.getElementById("d6").disabled = true;
	document.getElementById("d7").disabled = true;document.getElementById("d8").disabled = true;
	document.getElementById("d9").disabled = true;document.getElementById("d10").disabled = true;
	document.getElementById("d11").disabled = true;document.getElementById("d12").disabled = true;
	document.getElementById("d13").disabled = true;document.getElementById("d14").disabled = true;
	document.getElementById("other1").disabled = true;
	document.apLogin.a1.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
	   document.apLogin.a2.value=="OK!"){
		   document.getElementById("subm").disabled = false;}
}
function check3()
{
	document.getElementById("d1").disabled = false;document.getElementById("d2").disabled = false;
	document.getElementById("d3").disabled = false;document.getElementById("d4").disabled = false;
	document.getElementById("d5").disabled = false;document.getElementById("d6").disabled = false;
	document.getElementById("d7").disabled = false;document.getElementById("d8").disabled = false;
	document.getElementById("d9").disabled = false;document.getElementById("d10").disabled = false;
	document.getElementById("d11").disabled = false;document.getElementById("d12").disabled = false;
	document.getElementById("d13").disabled = false;document.getElementById("d14").disabled = false;
	document.getElementById("other1").disabled = false;
	document.apLogin.a1.value="";
	document.getElementById("subm").disabled = true;
}
function check4()
{
	if(document.getElementById("d1").checked == true || document.getElementById("d2").checked == true ||
	   document.getElementById("d3").checked == true ||	document.getElementById("d4").checked == true ||
	   document.getElementById("d5").checked == true || document.getElementById("d6").checked == true ||
	   document.getElementById("d7").checked == true || document.getElementById("d8").checked == true ||
	   document.getElementById("d9").checked == true || document.getElementById("d10").checked == true ||
	   document.getElementById("d11").checked == true || document.getElementById("d12").checked == true ||
	   document.getElementById("d13").checked == true || document.getElementById("d14").checked == true){
		document.apLogin.a1.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
		   document.apLogin.a2.value=="OK!"){
			   document.getElementById("subm").disabled = false;}}
	else{
		document.apLogin.a1.value="";
		document.getElementById("subm").disabled = true;}
}function check5()
{
	document.getElementById("d15").disabled = true;document.getElementById("d16").disabled = true;
	document.getElementById("d17").disabled = true;document.getElementById("d18").disabled = true;
	document.getElementById("d19").disabled = true;document.getElementById("d20").disabled = true;
	document.getElementById("d21").disabled = true;document.getElementById("d22").disabled = true;
	document.getElementById("d23").disabled = true;document.getElementById("d24").disabled = true;
	document.getElementById("d25").disabled = true;document.getElementById("d26").disabled = true;
	document.getElementById("d27").disabled = true;document.getElementById("d28").disabled = true;
	document.getElementById("other2").disabled = true;
	document.apLogin.a2.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
	   document.apLogin.a2.value=="OK!"){
		   document.getElementById("subm").disabled = false;}
}
function check6()
{
	document.getElementById("d15").disabled = true;document.getElementById("d16").disabled = true;
	document.getElementById("d17").disabled = true;document.getElementById("d18").disabled = true;
	document.getElementById("d19").disabled = true;document.getElementById("d20").disabled = true;
	document.getElementById("d21").disabled = true;document.getElementById("d22").disabled = true;
	document.getElementById("d23").disabled = true;document.getElementById("d24").disabled = true;
	document.getElementById("d25").disabled = true;document.getElementById("d26").disabled = true;
	document.getElementById("d27").disabled = true;document.getElementById("d28").disabled = true;
	document.getElementById("other2").disabled = true;
	document.apLogin.a2.value="OK!";
	if(document.apLogin.a1.value=="OK!" && 
	   document.apLogin.a2.value=="OK!"){
		   document.getElementById("subm").disabled = false;}
}
function check7()
{
	document.getElementById("d15").disabled = false;document.getElementById("d16").disabled = false;
	document.getElementById("d17").disabled = false;document.getElementById("d18").disabled = false;
	document.getElementById("d19").disabled = false;document.getElementById("d20").disabled = false;
	document.getElementById("d21").disabled = false;document.getElementById("d22").disabled = false;
	document.getElementById("d23").disabled = false;document.getElementById("d24").disabled = false;
	document.getElementById("d25").disabled = false;document.getElementById("d26").disabled = false;
	document.getElementById("d27").disabled = false;document.getElementById("d28").disabled = false;
	document.getElementById("other2").disabled = false;
	document.apLogin.a2.value="";
	document.getElementById("subm").disabled = true;
}
function check8()
{
	if(document.getElementById("d15").checked == true || document.getElementById("d16").checked == true ||
	   document.getElementById("d17").checked == true || document.getElementById("d18").checked == true ||
	   document.getElementById("d19").checked == true || document.getElementById("d20").checked == true ||
	   document.getElementById("d21").checked == true || document.getElementById("d22").checked == true ||
	   document.getElementById("d23").checked == true || document.getElementById("d24").checked == true ||
	   document.getElementById("d25").checked == true || document.getElementById("d26").checked == true ||
	   document.getElementById("d27").checked == true || document.getElementById("d28").checked == true){
		document.apLogin.a2.value="OK!";
		if(document.apLogin.a1.value=="OK!" && 
		   document.apLogin.a2.value=="OK!"){
			   document.getElementById("subm").disabled = false;}}
	else{
		document.apLogin.a2.value="";
		document.getElementById("subm").disabled = true;}
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
	
	String h1 = request.getParameter("h1");
	int h1_1 = Integer.parseInt(h1);
	int h1_num1=0;
	int h1_year3=0;
	if(h1_1==0){h1_num1=0;h1_year3=0;}
	if(h1_1==1){
		String h1_num = request.getParameter("h1_num");
		h1_num1 = Integer.parseInt(h1_num);
		String h1_year1 = request.getParameter("h1_year1");
		h1_year3 = Integer.parseInt(h1_year1);
	}
	if(h1_1==2){
		h1_num1=0;
		String h1_year2 = request.getParameter("h1_year2");
		h1_year3 = Integer.parseInt(h1_year2);
	}
	String h2 = request.getParameter("h2");
	int h2_1 = Integer.parseInt(h2);
	int h2_num1=0;
	int h2_year3=0;
	if(h2_1==0){h2_num1=0;h2_year3=0;}
	if(h2_1==1){
		String h2_num = request.getParameter("h2_num");
		h2_num1 = Integer.parseInt(h2_num);
		String h2_year1 = request.getParameter("h2_year1");
		h2_year3 = Integer.parseInt(h2_year1);
	}
	if(h2_1==2){
		h2_num1=0;
		String h2_year2 = request.getParameter("h2_year2");
		h2_year3 = Integer.parseInt(h2_year2);
	}
	String h3 = request.getParameter("h3");
	int h3_1 = Integer.parseInt(h3);
	int h3_num1=0;
	int h3_year3=0;
	if(h3_1==0){h3_num1=0;h3_year3=0;}
	if(h3_1==1){
		String h3_num = request.getParameter("h3_num");
		h3_num1 = Integer.parseInt(h3_num);
		String h3_year1 = request.getParameter("h3_year1");
		h3_year3 = Integer.parseInt(h3_year1);
	}
	if(h3_1==2){
		h3_num1=0;
		String h3_year2 = request.getParameter("h3_year2");
		h3_year3 = Integer.parseInt(h3_year2);
	}
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:520px; background:url(images/index/index_bg.gif) repeat-y;">
			<IMG SRC="images/member/step1.png">
			<IMG SRC="images/member/step2.png">
			<IMG SRC="images/member/step3.png">
			<IMG SRC="images/member/step4.png">
			<IMG SRC="images/member/step55.png">
			<IMG SRC="images/member/step6.png">
			<form action="member_step6.jsp" method="post" name="apLogin">
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
      			<input type="hidden" name="h1" value="<%=h1_1%>">
      			<input type="hidden" name="h1_num" value="<%=h1_num1%>">
      			<input type="hidden" name="h1_year" value="<%=h1_year3%>">
      			<input type="hidden" name="h2" value="<%=h2_1%>">
      			<input type="hidden" name="h2_num" value="<%=h2_num1%>">
      			<input type="hidden" name="h2_year" value="<%=h2_year3%>">
      			<input type="hidden" name="h3" value="<%=h3_1%>">
      			<input type="hidden" name="h3_num" value="<%=h3_num1%>">
      			<input type="hidden" name="h3_year" value="<%=h3_year3%>">
      			<input type="hidden" name="ques" value="<%=ques%>">
      			<input type="hidden" name="ans" value="<%=ans%>">
				<div align=left style="margin:30px 0 0 200px; font-size:20px; color:#646464">
		<table>
      		<tr>
      		<td width=70 style="padding-top:50px; border-bottom:1px gray dashed;">個人<br/>病史</td>
      		<td style="border-bottom:1px gray dashed;">
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="0" onclick="check1()">無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a1" id="a1" size="5" value="" disabled><br/>
      		<label id=n2><INPUT TYPE="radio" NAME="n1" value="2" onclick="check3()">有。</label><br/>
      		<INPUT disabled="disabled" TYPE="checkbox" NAME="d" id=d1 value="癌症" onclick="check4()">癌症
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d2 value="高血壓" onclick="check4()">高血壓
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d3 value="糖尿病" onclick="check4()">糖尿病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d4 value="肺結核" onclick="check4()">肺結核
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d5 value="高血脂症" onclick="check4()">高血脂症<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d6 value="肝病" onclick="check4()">肝病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d7 value="心臟病" onclick="check4()">心臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d8 value="腦中風" onclick="check4()">腦中風
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d9 value="腎臟病" onclick="check4()">腎臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d10 value="慢性肺病" onclick="check4()">慢性肺病<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d11 value="氣喘" onclick="check4()">氣喘
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d12 value="風濕" onclick="check4()">風濕
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d13 value="消化性潰瘍" onclick="check4()">消化性潰瘍
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d" id=d14 value="其他" onclick="check4()">其他
      		<INPUT disabled="disabled"  TYPE="text" NAME="other1" id=other1 size="10">
      		</td>
      		</tr>
      		<tr>
      		<td style="padding-top:50px;">家族<br/>病史</td>
      		<td>
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="0" onclick="check5()">無/不知。</label>
      		<input style="border:0;background:#fff" type="text" name="a2" id="a2" size="5" value="" disabled><br/>
      		<label id=n2><INPUT  TYPE="radio" NAME="n2" id=n2 value="2" onclick="check7()">有。</label><br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d15 value="癌症" onclick="check8()">癌症
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d16 value="高血壓" onclick="check8()">高血壓
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d17 value="糖尿病" onclick="check8()">糖尿病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d18 value="肺結核" onclick="check8()">肺結核
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d19 value="高血脂症" onclick="check8()">高血脂症<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d20 value="肝病" onclick="check8()">肝病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d21 value="心臟病" onclick="check8()">心臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d22 value="腦中風" onclick="check8()">腦中風
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d23 value="腎臟病" onclick="check8()">腎臟病
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d24 value="慢性肺病" onclick="check8()">慢性肺病<br/>
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d25 value="氣喘" onclick="check8()">氣喘
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d26 value="風濕" onclick="check8()">風濕
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d27 value="消化性潰瘍" onclick="check8()">消化性潰瘍
      		<INPUT disabled="disabled"  TYPE="checkbox" NAME="d1" id=d28 value="其他" onclick="check8()">其他
      		<INPUT disabled="disabled"  TYPE="text" NAME="other2" id=other2 size="10"><br/>
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