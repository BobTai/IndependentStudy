<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Evaluation</title>

<script type="text/javascript">
function check(s,t)
{
	if(s==0){
		if(document.f1.m[t].value==0){
			document.images[t+3].src="images/evaluation/mood1.png";
			document.getElementById("a1").value++;
			document.f1.m[t].value=1;
			document.f1.n[t].value=parseInt(s);
		}
		if(document.f1.m[t].value==1){
			if(document.f1.n[t].value>0){
				document.images[t+3].src="images/evaluation/mood1.png";
				document.getElementById("a1").value++;
				document.getElementById("a2").value--;
				var a=parseInt(document.f1.n[t].value);
				var b=parseInt(document.getElementById("a3").value);
				document.getElementById("a3").value=b-a;
				var c=parseInt(document.getElementById("a3").value);
				if(c<=10) document.getElementById("a4").value = "健康";
				if(c>10 && c<=29) document.getElementById("a4").value = "低危險";
				if(c>30 && c<=49) document.getElementById("a4").value = "中危險";
				if(c>=50) document.getElementById("a4").value = "高危險";
				document.f1.n[t].value=parseInt(s);
			}
		}
	}
	if(s>0){
		if(document.f1.m[t].value==0){
			document.images[t+3].src="images/evaluation/mood2.png";
			document.getElementById("a2").value++;
			document.f1.m[t].value=1;
			document.f1.n[t].value=parseInt(s);
			var a=parseInt(document.getElementById("a3").value);
			var b=parseInt(s);
			document.getElementById("a3").value=a+b;
			var c=parseInt(document.getElementById("a3").value);
			if(c<=10) document.getElementById("a4").value = "健康";
			if(c>10 && c<=29) document.getElementById("a4").value = "低危險";
			if(c>30 && c<=49) document.getElementById("a4").value = "中危險";
			if(c>=50) document.getElementById("a4").value = "高危險";
		}
		if(document.f1.m[t].value==1){
			if(document.f1.n[t].value==0){
				document.images[t+3].src="images/evaluation/mood2.png";
				document.getElementById("a2").value++;
				document.getElementById("a1").value--;
				var a=parseInt(document.getElementById("a3").value);
				var b=parseInt(s);
				document.getElementById("a3").value=a+b;
				var c=parseInt(document.getElementById("a3").value);
				if(c<=10) document.getElementById("a4").value = "健康";
				if(c>10 && c<=29) document.getElementById("a4").value = "低危險";
				if(c>30 && c<=49) document.getElementById("a4").value = "中危險";
				if(c>=50) document.getElementById("a4").value = "高危險";
				document.f1.n[t].value=parseInt(s);
			}
			if(document.f1.n[t].value>0){
				var a=parseInt(document.getElementById("a3").value);
				var b=parseInt(s);
				var c=parseInt(document.f1.n[t].value);
				document.getElementById("a3").value=a-c+b;
				var d=parseInt(document.getElementById("a3").value);
				if(d<=10) document.getElementById("a4").value = "健康";
				if(d>10 && d<=29) document.getElementById("a4").value = "低危險";
				if(d>30 && d<=49) document.getElementById("a4").value = "中危險";
				if(d>=50) document.getElementById("a4").value = "高危險";
				document.f1.n[t].value=parseInt(s);
			}
		}
	}
}
function checkall()
{
	if(document.f1.q1[0].checked == false && document.f1.q1[1].checked == false && document.f1.q1[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q2[0].checked == false && document.f1.q2[1].checked == false && document.f1.q2[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q3[0].checked == false && document.f1.q3[1].checked == false && document.f1.q3[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q4[0].checked == false && document.f1.q4[1].checked == false && document.f1.q4[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q5[0].checked == false && document.f1.q5[1].checked == false && document.f1.q5[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q6[0].checked == false && document.f1.q6[1].checked == false && document.f1.q6[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q7[0].checked == false && document.f1.q7[1].checked == false && document.f1.q7[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q8[0].checked == false && document.f1.q8[1].checked == false && document.f1.q8[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q9[0].checked == false && document.f1.q9[1].checked == false && document.f1.q9[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q10[0].checked == false && document.f1.q10[1].checked == false && document.f1.q10[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q11[0].checked == false && document.f1.q11[1].checked == false && document.f1.q11[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q12[0].checked == false && document.f1.q12[1].checked == false && document.f1.q12[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q13[0].checked == false && document.f1.q13[1].checked == false && document.f1.q13[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q14[0].checked == false && document.f1.q14[1].checked == false && document.f1.q14[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q15[0].checked == false && document.f1.q15[1].checked == false && document.f1.q15[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q16[0].checked == false && document.f1.q16[1].checked == false && document.f1.q16[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q17[0].checked == false && document.f1.q17[1].checked == false && document.f1.q17[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q18[0].checked == false && document.f1.q18[1].checked == false && document.f1.q18[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q19[0].checked == false && document.f1.q19[1].checked == false && document.f1.q19[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q20[0].checked == false && document.f1.q20[1].checked == false && document.f1.q20[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q21[0].checked == false && document.f1.q21[1].checked == false && document.f1.q21[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q22[0].checked == false && document.f1.q22[1].checked == false && document.f1.q22[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q23[0].checked == false && document.f1.q23[1].checked == false && document.f1.q23[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q24[0].checked == false && document.f1.q24[1].checked == false && document.f1.q24[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
	if(document.f1.q25[0].checked == false && document.f1.q25[1].checked == false && document.f1.q25[2].checked == false)
	{
		alert('您的題目尚未完成!');
		return false;
	}
}
</script>

</head>
<%@ include file="JDBCConstants.jsp" %>
<body>
<%@ include file="menu.jsp" %>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:1100px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div align=center style="width:898px; height:1000px; background:url(images/index/index_bg.gif) repeat-y;">

<%
	String eva_number = request.getParameter("eva_number");
	String sql2 = "SELECT evaluation_name from evaluation where evaluation_id = '"+eva_number+"'";
	ResultSet rs2 = smt.executeQuery(sql2);
	rs2.first();
	String evaluation_name = rs2.getString("evaluation_name");
%>
			<fieldset style="position:relative; background:url(images/evaluation/test_head.png) no-repeat; border:0px; width:812px; height:88px;">
				<div align=left style="line-height:88px; font-size:30px; font-weight:bold; margin-left:315px;"><%=evaluation_name %></div>
			</fieldset>
<%
	String sql = "SELECT * from question where evaluation_id = '"+eva_number+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.first();
%>			
	<form name="f1" action="evaluation_result.jsp" method="post" onSubmit="return checkall()">
		<input type="hidden" name="eva_number" value="<%=eva_number%>">	
		<input type="hidden" name="evaluation_name" value="<%=evaluation_name%>">
		
		<table>
		<tr>
		<td width=200>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q1.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q1><input TYPE="radio" NAME="q1" id=q1 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,0)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q1><input TYPE="radio" NAME="q1" id=q1 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,0)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q1><input TYPE="radio" NAME="q1" id=q1 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,0)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td width=200>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q2.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q2><input TYPE="radio" NAME="q2" id=q2 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,1)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q2><input TYPE="radio" NAME="q2" id=q2 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,1)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q2><input TYPE="radio" NAME="q2" id=q2 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,1)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td width=200>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q3.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q3><input TYPE="radio" NAME="q3" id=q3 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,2)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q3><input TYPE="radio" NAME="q3" id=q3 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,2)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q3><input TYPE="radio" NAME="q3" id=q3 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,2)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td width=200>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q4.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q4><input TYPE="radio" NAME="q4" id=q4 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,3)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q4><input TYPE="radio" NAME="q4" id=q4 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,3)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q4><input TYPE="radio" NAME="q4" id=q4 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,3)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q5.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q5><input TYPE="radio" NAME="q5" id=q5 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,4)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q5><input TYPE="radio" NAME="q5" id=q5 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,4)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q5><input TYPE="radio" NAME="q5" id=q5 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,4)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q6.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q6><input TYPE="radio" NAME="q6" id=q6 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,5)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q6><input TYPE="radio" NAME="q6" id=q6 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,5)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q6><input TYPE="radio" NAME="q6" id=q6 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,5)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q7.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q7><input TYPE="radio" NAME="q7" id=q7 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,6)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q7><input TYPE="radio" NAME="q7" id=q7 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,6)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q7><input TYPE="radio" NAME="q7" id=q7 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,6)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q8.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q8><input TYPE="radio" NAME="q8" id=q8 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,7)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q8><input TYPE="radio" NAME="q8" id=q8 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,7)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q8><input TYPE="radio" NAME="q8" id=q8 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,7)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q9.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q9><input TYPE="radio" NAME="q9" id=q9 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,8)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q9><input TYPE="radio" NAME="q9" id=q9 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,8)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q9><input TYPE="radio" NAME="q9" id=q9 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,8)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q10.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q10><input TYPE="radio" NAME="q10" id=q10 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,9)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q10><input TYPE="radio" NAME="q10" id=q10 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,9)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q10><input TYPE="radio" NAME="q10" id=q10 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,9)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q11.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q11><input TYPE="radio" NAME="q11" id=q11 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,10)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q11><input TYPE="radio" NAME="q11" id=q11 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,10)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q11><input TYPE="radio" NAME="q11" id=q11 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,10)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q12.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q12><input TYPE="radio" NAME="q12" id=q12 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,11)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q12><input TYPE="radio" NAME="q12" id=q12 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,11)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q12><input TYPE="radio" NAME="q12" id=q12 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,11)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q13.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q13><input TYPE="radio" NAME="q13" id=q13 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,12)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q13><input TYPE="radio" NAME="q13" id=q13 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,12)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q13><input TYPE="radio" NAME="q13" id=q13 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,12)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q14.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q14><input TYPE="radio" NAME="q14" id=q14 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,13)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q14><input TYPE="radio" NAME="q14" id=q14 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,13)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q14><input TYPE="radio" NAME="q14" id=q14 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,13)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q15.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q15><input TYPE="radio" NAME="q15" id=q15 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,14)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q15><input TYPE="radio" NAME="q15" id=q15 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,14)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q15><input TYPE="radio" NAME="q15" id=q15 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,14)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q16.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q16><input TYPE="radio" NAME="q16" id=q16 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,15)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q16><input TYPE="radio" NAME="q16" id=q16 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,15)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q16><input TYPE="radio" NAME="q16" id=q16 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,15)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q17.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q17><input TYPE="radio" NAME="q17" id=q17 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,16)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q17><input TYPE="radio" NAME="q17" id=q17 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,16)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q17><input TYPE="radio" NAME="q17" id=q17 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,16)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q18.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q18><input TYPE="radio" NAME="q18" id=q18 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,17)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q18><input TYPE="radio" NAME="q18" id=q18 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,17)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q18><input TYPE="radio" NAME="q18" id=q18 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,17)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q19.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q19><input TYPE="radio" NAME="q19" id=q19 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,18)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q19><input TYPE="radio" NAME="q19" id=q19 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,18)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q19><input TYPE="radio" NAME="q19" id=q19 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,18)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q20.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q20><input TYPE="radio" NAME="q20" id=q20 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,19)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q20><input TYPE="radio" NAME="q20" id=q20 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,19)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q20><input TYPE="radio" NAME="q20" id=q20 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,19)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q21.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q21><input TYPE="radio" NAME="q21" id=q21 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,20)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q21><input TYPE="radio" NAME="q21" id=q21 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,20)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q21><input TYPE="radio" NAME="q21" id=q21 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,20)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q22.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q22><input TYPE="radio" NAME="q22" id=q22 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,21)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q22><input TYPE="radio" NAME="q22" id=q22 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,21)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q22><input TYPE="radio" NAME="q22" id=q22 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,21)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q23.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q23><input TYPE="radio" NAME="q23" id=q23 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,22)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q23><input TYPE="radio" NAME="q23" id=q23 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,22)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q23><input TYPE="radio" NAME="q23" id=q23 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,22)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q24.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q24><input TYPE="radio" NAME="q24" id=q24 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,23)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q24><input TYPE="radio" NAME="q24" id=q24 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,23)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q24><input TYPE="radio" NAME="q24" id=q24 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,23)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		</tr>
		<tr>
		<td>
			<div style="position:relative; width:194px; height:130px; background:url(images/evaluation/q25.png) no-repeat;">
				<div align=left style="position:absolute; top:4px; left:45px; width:140px;">	
					<font><%=rs.getString("question_content")%></font>
				</div>
				<div align=left style="position:absolute; top:55px; left:20px;">
					<label id=q25><input TYPE="radio" NAME="q25" id=q25 value="<%=rs.getInt("answer_score1")%>" onclick="check(this.value,24)">
					<font size=3><%=rs.getString("answer_format1")%></font></label><br>
					<label id=q25><input TYPE="radio" NAME="q25" id=q25 value="<%=rs.getInt("answer_score2")%>" onclick="check(this.value,24)">
					<font size=3><%=rs.getString("answer_format2")%></font></label><br>
					<label id=q25><input TYPE="radio" NAME="q25" id=q25 value="<%=rs.getInt("answer_score3")%>" onclick="check(this.value,24)">
					<font size=3><%=rs.getString("answer_format3")%></font></label>
				</div>
				<img style="position:absolute; bottom:13px; right:15px;" name="123" src="images/evaluation/mbg.png">
			</div><%rs.next();%>
		</td>
		<td COLSPAN=3>
			<img src="images/evaluation/illustrate.png">
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

<div style="position:fixed; bottom:120px; right:0px; width:302px; height:123px; background:url(images/evaluation/qbg_r.png) no-repeat;">
	<input style="border:0; width:40px; position:absolute; top:13px; left:65px; font-size:30px; background-image:url(images/evaluation/qanbg.png); background-repeat: repeat-x;" type="text" name="a1" id="a1" value="0" disabled>
	<input style="border:0; width:40px; position:absolute; bottom:13px; left:65px; font-size:30px; background-image:url(images/evaluation/qanbg.png); background-repeat: repeat-x;" type="text" name="a2" id="a2" value="0" disabled>
	<input type="hidden" name="a3" id="a3" value="0" disabled>
	<input style="border:0; width:80px; position:absolute; top:18px; right:8px; font-size:25px; background-image:url(images/evaluation/qanbg.png); background-repeat: repeat-x; color:red" type="text" name="a4" id="a4" value="健康">
	
	<input type="image" name="submit" src="images/evaluation/submit1.png" style="position:absolute; bottom:7px; right:25px;" onmouseover="this.src='images/evaluation/submit11.png'" onmouseout="this.src='images/evaluation/submit1.png'">
</div>
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="m" id="m" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
<input type="hidden" name="n" id="n" value="0">
</form>	
</body>
</html>