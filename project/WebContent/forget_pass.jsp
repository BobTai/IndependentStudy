<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>忘記密碼</title>

<%@ include file="JDBCConstants.jsp"%>

<script type="text/javascript">
		function check(s)
		{
			if(s=="")
			{ 
				document.apLogin.a1.value="請輸入您的註冊帳號!";
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
			if(s!="")
			{
				document.apLogin.a1.value="OK!";
				if(
				document.apLogin.a1.value=="OK!"&&
				document.apLogin.a2.value=="OK!"&&
				document.apLogin.a3.value=="OK!"&&
				document.apLogin.a4.value=="OK!"){
				document.getElementById("subm").disabled = false;}
			}
		}
		function check1(s) 
	    {
			if(s==0){
				document.apLogin.a2.value="請選擇當初設定的問題!";
				document.getElementById("subm").disabled = true;
			}
			if(s==1 || s==2 || s==3 || s==4 || s==5 ){
				document.apLogin.a2.value="OK!";
				if(
						document.apLogin.a1.value=="OK!"&&
						document.apLogin.a2.value=="OK!"&&
						document.apLogin.a3.value=="OK!"&&
						document.apLogin.a4.value=="OK!"){
						document.getElementById("subm").disabled = false;}
			}
	    }
	    function check2(s) 
	    {
	    	if(s==""){
	    		document.apLogin.a3.value="請輸入問題的答案!";
	    		document.getElementById("subm").disabled = true;
	    	}
	    	if(s!=="" && document.apLogin.ques.value>=1){
	    		document.apLogin.a3.value="OK!";
	    		if(
	    				document.apLogin.a1.value=="OK!"&&
	    				document.apLogin.a2.value=="OK!"&&
	    				document.apLogin.a3.value=="OK!"&&
	    				document.apLogin.a4.value=="OK!"){
	    				document.getElementById("subm").disabled = false;}
	    	}
	    }
	    function isEmail(strEmail) {
			if(strEmail==""){
				document.apLogin.a4.value="請輸入您註冊的信箱!";
				document.getElementById("subm").disabled = true;}
			else if(strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
	  		  	document.apLogin.a4.value="OK!";
	  		  	if(document.apLogin.a1.value=="OK!" && 
	  	  			   document.apLogin.a2.value=="OK!" &&
	  	  			   document.apLogin.a3.value=="OK!" &&
	  	  			   document.apLogin.a4.value=="OK!"){document.getElementById("subm").disabled = false;}}
	  	  	else{
	  		  	document.apLogin.a4.value="格式錯誤!";
	  		  	document.getElementById("subm").disabled = true;}
	  	}
</script>

</head>
<body>
<%@ include file="menu.jsp" %>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
			<IMG SRC="images/member/forgetpass_title.png">
			<div align=left style="margin:30px 0 0 155px; font-size:20px; color:#646464"> 
			<form action="forget_pass_result.jsp" method="post" name="apLogin">
				<table>
					<tr>
						<td align="right" style="padding-top:2px">帳號：</td>
						<td>
							<input style="width:175px" type="text" name="account" id="account" value="" onkeyup="check(this.value)" onfocus="check(this.value)" onblur="check(this.value)">
      						<input style="border:0" type="text" name="aaa" id="a1" size="20" value="" disabled>
						</td>
					</tr>
					<tr>
						<td align="right" style="padding-top:2px; border-top:1px dashed gray; border-bottom:1px dashed gray;">信箱：</td>
						<td width=450 style="border-top:1px dashed gray; border-bottom:1px dashed gray;">
							<input style="width:175px" type="text" name="e_mail" id="e_mail" value="" onblur="isEmail(this.value)" onkeyup="isEmail(this.value)" onfocus="isEmail(this.value)">
        					<input style="border:0" type="text" name="aaa" id="a4" size="20" value="" disabled>
        					<div style="font-size:14px; color:#646464">
	    						請輸入有效的電子信箱，系統將會寄送新密碼至您的電子信箱。 
	    					</div>
						</td>
					</tr>
					<tr>
						<td align="right" style="padding-top:2px">密碼提示問題：</td>
						<td>
							<select name="ques" id="ques" onfocus="check1(this.value)" onclick="check1(this.value)" onblur="check1(this.value)">
      							<option value="0">請選擇一個密碼提示問題：</option>
      							<option value="1">您最喜歡的人物？</option>
      							<option value="2">您最喜歡的動物？</option>
      							<option value="3">您最喜歡的植物？</option>
      							<option value="4">您最喜歡的休閒？</option>
      							<option value="5">您最喜歡的影集？</option>
							</select>
							<input style="border:0" type="text" name="aaa" id="a2" size="20" value="" disabled>
						</td>
					</tr>
					<tr>
						<td align="right" style="padding-top:2px; border-bottom:1px dashed gray;">密碼提示答案：</td>
						<td style="border-bottom:1px dashed gray;">
							<input style="width:175px" type="text" name="ans" id="ans" onfocus="check2(this.value)" onkeyup="check2(this.value)" onblur="check2(this.value)">
	    					<input style="border:0" type="text" name="aaa" id="a3" size="15" value="" disabled>
	    					<div style="font-size:14px; color:#646464">
	    						請輸入您當初設定的密碼提示問題與答案。
	    					</div>
						</td>
					</tr>
					<tr>
						<td align="right" style="padding-top:2px">驗證碼：</td>
						<td>
							<input type="text" size="23" name="insrand"/>
      						<img src="image.jsp" alt="可以點擊刷新!" onclick="this.src=this.src+'?'"/>
						</td>
					</tr>
				</table>
				<div style="padding:20px 0 0 250px;">
					<input name="test" id="subm" type="submit" value="確認" disabled/>
				</div>
			</form>
			</div>
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