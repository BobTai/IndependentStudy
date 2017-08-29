<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>基本資料</title>

<%@ include file="JDBCConstants.jsp"%>

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
			  			   document.apLogin.a2.value=="OK!" &&
			  			   document.apLogin.a3.value=="OK!" &&
			  			   document.apLogin.a4.value=="OK!" &&
			  			   document.apLogin.a5.value=="OK!" && 
			  			   document.apLogin.a6.value=="OK!" &&
			  			   document.apLogin.a7.value=="OK!" &&
			  			   document.apLogin.a8.value=="OK!" &&
		  	  			   document.apLogin.a9.value=="OK!" &&
		  	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
			}
	}
    function check1(s)
    {
		if(s=="")
        {
    	    document.apLogin.a2.value="麻煩再輸入一次密碼!";
    	    document.getElementById("subm").disabled = true;
        }
		if(document.apLogin.password.value!=s && s!="") 
		{
			document.apLogin.a2.value="兩次密碼輸入不相同!";
			document.getElementById("subm").disabled = true;
			return false;
		}
		if(document.apLogin.password.value==s && s!="")
    	{
    	    document.apLogin.a2.value="OK!";
    	    if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!" &&
    	  			   document.apLogin.a3.value=="OK!" &&
    	  			   document.apLogin.a4.value=="OK!" &&
    	  			   document.apLogin.a5.value=="OK!" && 
    	  			   document.apLogin.a6.value=="OK!" &&
    	  			   document.apLogin.a7.value=="OK!" &&
    	  			   document.apLogin.a8.value=="OK!" &&
      	  			   document.apLogin.a9.value=="OK!" &&
      	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
    	}
	}
    function check2(s)
    {
    	var reg = /^[u4E00-u9FA5]+$/;
  	    if(s=="") 
		{
			document.apLogin.a3.value="麻煩輸入您的大名!";
			document.getElementById("subm").disabled = true;
		}
  	    else if(reg.test(s) && s!="")
  	  	{
            document.apLogin.a3.value="只允許輸入中文字體!";
            document.getElementById("subm").disabled = true;
            return false;
        }
  	    else	
  		    document.apLogin.a3.value="OK!";
  	  if(document.apLogin.a1.value=="OK!" && 
 			   document.apLogin.a2.value=="OK!" &&
 			   document.apLogin.a3.value=="OK!" &&
 			   document.apLogin.a4.value=="OK!" &&
 			   document.apLogin.a5.value=="OK!" && 
 			   document.apLogin.a6.value=="OK!" &&
 			   document.apLogin.a7.value=="OK!" &&
 			   document.apLogin.a8.value=="OK!" &&
	  		   document.apLogin.a9.value=="OK!" &&
	  		   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
    }
    function check3(s)
    {
    	if(s=="") 
		{
			document.apLogin.a4.value="您在本站所使用的稱呼!";
			document.getElementById("subm").disabled = true;
		}
    	if(s!="") 
		{
			document.apLogin.a4.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  			   document.apLogin.a2.value=="OK!" &&
		  			   document.apLogin.a3.value=="OK!" &&
		  			   document.apLogin.a4.value=="OK!" &&
		  			   document.apLogin.a5.value=="OK!" && 
		  			   document.apLogin.a6.value=="OK!" &&
		  			   document.apLogin.a7.value=="OK!" &&
		  			   document.apLogin.a8.value=="OK!" &&
	  	  			   document.apLogin.a9.value=="OK!" &&
	  	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
		}
    }
    function check4(s)
    {
    	if(s=1) 
		{
			document.apLogin.a5.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  			   document.apLogin.a2.value=="OK!" &&
		  			   document.apLogin.a3.value=="OK!" &&
		  			   document.apLogin.a4.value=="OK!" &&
		  			   document.apLogin.a5.value=="OK!" && 
		  			   document.apLogin.a6.value=="OK!" &&
		  			   document.apLogin.a7.value=="OK!" &&
		  			   document.apLogin.a8.value=="OK!" &&
	  	  			   document.apLogin.a9.value=="OK!" &&
	  	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
		}
    }
    function check5(s)
    {
    	if(s==""){
  		    document.apLogin.a6.value="格式:yyyy年";
    		document.getElementById("subm").disabled = true;}
  	 	if(s>2011 || s<1900 && s!=""){
  		  	document.apLogin.a6.value="年份輸入錯誤!";
  	 		document.getElementById("subm").disabled = true;}
  	 	if(s<2011 && s>1900 && s!="")
  	  	{
  	 		document.apLogin.a6.value="年份OK!";
  	  	}
  	 	if(document.apLogin.day.value<=31 && document.apLogin.day.value>=1 && s!="" && document.apLogin.year.value<2011 && document.apLogin.year.value>1900 && document.apLogin.month.value<=12 && document.apLogin.month.value>=1){
    		document.apLogin.a6.value="OK!";
    		if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!" &&
    	  			   document.apLogin.a3.value=="OK!" &&
    	  			   document.apLogin.a4.value=="OK!" &&
    	  			   document.apLogin.a5.value=="OK!" && 
    	  			   document.apLogin.a6.value=="OK!" &&
    	  			   document.apLogin.a7.value=="OK!" &&
    	  			   document.apLogin.a8.value=="OK!" &&
      	  			   document.apLogin.a9.value=="OK!" &&
      	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}}
  	 	for( var loc=0; loc<s.length; loc++ )
			if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
			{
				document.apLogin.a6.value="只允許輸入數字!";
				document.getElementById("subm").disabled = true;
			}
    }
    function check6(s)
    {
    	if(s==""){
    		document.apLogin.a6.value="格式:mm月";
    		document.getElementById("subm").disabled = true;
    	}
    	if(s>12 || s<1 && s!="")
  		  	{document.apLogin.a6.value="月份輸入錯誤!";
    		document.getElementById("subm").disabled = true;}
    	if(s<=12 && s>=1 && s!="")
    	{
    		document.apLogin.a6.value="月份OK!";
        }
    	if(document.apLogin.day.value<=31 && document.apLogin.day.value>=1 && s!="" && document.apLogin.year.value<2011 && document.apLogin.year.value>1900 && document.apLogin.month.value<=12 && document.apLogin.month.value>=1){
    		document.apLogin.a6.value="OK!";
    		if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!" &&
    	  			   document.apLogin.a3.value=="OK!" &&
    	  			   document.apLogin.a4.value=="OK!" &&
    	  			   document.apLogin.a5.value=="OK!" && 
    	  			   document.apLogin.a6.value=="OK!" &&
    	  			   document.apLogin.a7.value=="OK!" &&
    	  			   document.apLogin.a8.value=="OK!" &&
      	  			   document.apLogin.a9.value=="OK!" &&
      	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}}
  	  	for( var loc=0; loc<s.length; loc++ )
			if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
			{
				document.apLogin.a6.value="只允許數字!";
				document.getElementById("subm").disabled = true;
			}
    }
    function check7(s)
    {
    	if(s==""){
    		document.apLogin.a6.value="格式:dd日";
    		document.getElementById("subm").disabled = true;
    	}
    	if(s>31 || s<1 && s!=""){
    		document.apLogin.a6.value="日期輸入錯誤!";
    		document.getElementById("subm").disabled = true;}
    	if(s<=31 && s>=1 && s!="")
    	{
    		document.apLogin.a6.value="日期OK!";
        }
        if(document.apLogin.day.value<=31 && document.apLogin.day.value>=1 && s!="" && document.apLogin.year.value<2011 && document.apLogin.year.value>1900 && document.apLogin.month.value<=12 && document.apLogin.month.value>=1){
    		document.apLogin.a6.value="OK!";
    		if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!" &&
    	  			   document.apLogin.a3.value=="OK!" &&
    	  			   document.apLogin.a4.value=="OK!" &&
    	  			   document.apLogin.a5.value=="OK!" && 
    	  			   document.apLogin.a6.value=="OK!" &&
    	  			   document.apLogin.a7.value=="OK!" &&
    	  			   document.apLogin.a8.value=="OK!" &&
      	  			   document.apLogin.a9.value=="OK!" &&
      	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}}
    	for( var loc=0; loc<s.length; loc++ )
			if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
			{
				document.apLogin.a6.value="只允許輸入數字!";
				document.getElementById("subm").disabled = true;
			}
    }
    function isEmail(strEmail) {
		if(strEmail==""){
			document.apLogin.a7.value="";
			document.getElementById("subm").disabled = true;}
		else if(strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
  		  	document.apLogin.a7.value="OK!";
  		  	if(document.apLogin.a1.value=="OK!" && 
  	  			   document.apLogin.a2.value=="OK!" &&
  	  			   document.apLogin.a3.value=="OK!" &&
  	  			   document.apLogin.a4.value=="OK!" &&
  	  			   document.apLogin.a5.value=="OK!" && 
  	  			   document.apLogin.a6.value=="OK!" &&
  	  			   document.apLogin.a7.value=="OK!" &&
  	  			   document.apLogin.a8.value=="OK!" &&
  	  			   document.apLogin.a9.value=="OK!" &&
  	  			   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}}
  	  	else{
  		  	document.apLogin.a7.value="格式錯誤!";
  		  	document.getElementById("subm").disabled = true;}
  	}
    function check8(s) 
    {
		if(s==""){
			document.apLogin.a8.value="";
			document.getElementById("subm").disabled = true;}
  	 	else
  	  	{
  		  	document.apLogin.a8.value="OK!";
  		    if(document.apLogin.a1.value=="OK!" && 
  			   document.apLogin.a2.value=="OK!" &&
  			   document.apLogin.a3.value=="OK!" &&
  			   document.apLogin.a4.value=="OK!" &&
  			   document.apLogin.a5.value=="OK!" && 
  			   document.apLogin.a6.value=="OK!" &&
  			   document.apLogin.a7.value=="OK!" &&
  			   document.apLogin.a8.value=="OK!" &&
  	  		   document.apLogin.a9.value=="OK!" &&
  	  		   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
  		}
  	}
    function check9(s) 
    {
		if(s==0){
			document.apLogin.a9.value="請選擇一個問題!";
			document.getElementById("subm").disabled = true;
		}
		if(s==1 || s==2 || s==3 || s==4 || s==5 ){
			document.apLogin.a9.value="OK!";
			if(document.apLogin.a1.value=="OK!" && 
		  			   document.apLogin.a2.value=="OK!" &&
		  			   document.apLogin.a3.value=="OK!" &&
		  			   document.apLogin.a4.value=="OK!" &&
		  			   document.apLogin.a5.value=="OK!" && 
		  			   document.apLogin.a6.value=="OK!" &&
		  			   document.apLogin.a7.value=="OK!" &&
		  			   document.apLogin.a8.value=="OK!" &&
		  	  		   document.apLogin.a9.value=="OK!" &&
		  	  		   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
		}
    }
    function check10(s) 
    {
    	if(s==""){
    		document.apLogin.a10.value="請輸入問題的答案!";
    		document.getElementById("subm").disabled = true;
    	}
    	if(s!=="" && document.apLogin.ques.value>=1){
    		document.apLogin.a10.value="OK!";
    		if(document.apLogin.a1.value=="OK!" && 
    	  			   document.apLogin.a2.value=="OK!" &&
    	  			   document.apLogin.a3.value=="OK!" &&
    	  			   document.apLogin.a4.value=="OK!" &&
    	  			   document.apLogin.a5.value=="OK!" && 
    	  			   document.apLogin.a6.value=="OK!" &&
    	  			   document.apLogin.a7.value=="OK!" &&
    	  			   document.apLogin.a8.value=="OK!" &&
    	  	  		   document.apLogin.a9.value=="OK!" &&
    	  	  		   document.apLogin.a10.value=="OK!"){document.getElementById("subm").disabled = false;}
    	}
    }
</script>

</head>
<body>
<%@ include file="menu1.jsp"%>
<%
	String account = request.getParameter("account");
	String rand = (String)session.getAttribute("rand");  
	String input = request.getParameter("insrand"); 
	String sql = "SELECT account from member where account = '"+account+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	
	if(count==0 && account.length()!=0 && rand.equals(input))
	{
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="width:898px; height:620px; background:url(images/index/index_bg.gif) repeat-y;">
			<IMG SRC="images/member/step1.png">
			<IMG SRC="images/member/step22.png">
			<IMG SRC="images/member/step3.png">
			<IMG SRC="images/member/step4.png">
			<IMG SRC="images/member/step5.png">
			<IMG SRC="images/member/step6.png">
			<form action="member_step3.jsp" method="post" name="apLogin">
				<input type="hidden" name="account" value="<%=account%>">
				<div align=left style="margin:20px 0 0 80px; font-size:20px; color:#646464">
		<table>
      		<tr>
      			<td align=right style="padding-top:2px;">帳號：</td>
      			<td width=600><%=account%></td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">密碼：</td>
      			<td>
      				<input type="password" name="password" id="password" size="18" maxlength=15 onkeyup="check(this.value)" onfocus="check(this.value)" onblur="check(this.value)">
	    			<input style="border:0;background:#fff" type="text" name="aaa" id="a1" size="20" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px; border-bottom:1px dashed gray">密碼確認：</td>
      			<td style="border-bottom:1px dashed gray">
      				<input type="password" name="confirm_password" id="confirm_password" size="18" onkeyup="check1(this.value)" onfocus="check1(this.value)" onblur="check1(this.value)"/>
	   				<input style="border:0;background:#fff" type="text" name="aaa" id="a2" size="15" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">密碼提示問題：</td>
      			<td>
					<select name="ques" id="ques" onfocus="check9(this.value)" onclick="check9(this.value)" onblur="check9(this.value)">
      					<option value="0">請選擇一個問題：</option>
      					<option value="1">最喜歡的人物？</option>
      					<option value="2">最喜歡的動物？</option>
      					<option value="3">最喜歡的植物？</option>
      					<option value="4">最喜歡的休閒？</option>
      					<option value="5">最喜歡的影集？</option>
					</select>
					<input style="border:0;background:#fff" type="text" name="aaa" id="a9" size="15" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px; border-bottom:1px dashed gray">密碼提示答案：</td>
      			<td style="border-bottom:1px dashed gray">
					<input type="text" name="ans" id="ans" size="18" onfocus="check10(this.value)" onkeyup="check10(this.value)" onblur="check10(this.value)">
	    			<input style="border:0;background:#fff" type="text" name="aaa" id="a10" size="15" value="" disabled><br/>
	    			<div style="font-size:14px; color:#646464">
	    			請填寫您最容易記憶的問答，並好好保管。當您忘記密碼時，您可以使用此問答來找回密碼。
	    			</div>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">姓名：</td>
      			<td>
					<input type="text" name="name" id="name" size="18" onkeyup="check2(this.value)" onfocus="check2(this.value)" onblur="check2(this.value)">
	    			<input style="border:0;background:#fff" type="text" name="aaa" id="a3" size="20" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">稱呼：</td>
      			<td>
					<input type="text" name="user_name" id="user_name" value="" size="18" onkeyup="check3(this.value)" onfocus="check3(this.value)" onblur="check3(this.value)">
	    			<input style="border:0;background:#fff" type="text" name="aaa" id="a4" size="20" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">性別：</td>
      			<td>
					<input type="radio" name="gender" value="男性" onClick="check4(1)">男性
	    			<input style="margin:0px 0 0 0px;" type="radio" name="gender" value="女性" onClick="check4(1)">女性
	    			<input style="border:0;margin:0 0 0 22px;background:#fff" type="text" name="aaa" id="a5" size="20" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px; border-bottom:1px dashed gray">生日：</td>
      			<td style="border-bottom:1px dashed gray">
					<input type="text" name="year" id="year" size="2" onkeyup="check5(this.value)" onfocus="check5(this.value)" onblur="check5(this.value)"/>年
        			<input type="text" name="month" id="month" size="1" onkeyup="check6(this.value)" onfocus="check6(this.value)" onblur="check6(this.value)"/>月
        			<input type="text" name="day" id="day" size="1" onkeyup="check7(this.value)" onfocus="check7(this.value)" onblur="check7(this.value)"/>日
					<input style="border:0;background:#fff" type="text" name="aaa" id="a6" size="10" value="" disabled>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px; border-bottom:1px dashed gray">信箱：</td>
      			<td style="border-bottom:1px dashed gray">
					<input type="text" name="e_mail" id="e_mail" value="" size="25" onkeyup="isEmail(this.value)" onfocus="isEmail(this.value)" onblur="isEmail(this.value)">
        			<input style="border:0;background:#fff" type="text" name="aaa" id="a7" size="5" value="" disabled>
      				<div style="font-size:14px; color:#646464">
	    			請輸入有效的電子信箱。當您忘記密碼時，您可以使用此信箱查收密碼重置資訊。 
	    			</div>
      			</td>
      		</tr>
      		<tr>
      			<td align=right style="padding-top:2px;">地址：</td>
      			<td>
					<input type="text" name="address" id="address" value="" size="25" onkeyup="check8(this.value)" onfocus="check8(this.value)" onblur="check8(this.value)"/>
        			<input style="border:0;background:#fff" type="text" name="aaa" id="a8" size="5" value="" disabled>
      				<div style="font-size:14px; color:#646464">
	    			只必須輸入您的所屬的城市與區域，可以方便日後使用本站功能。例如：新北市蘆洲區。
	    			</div>
      			</td>
      		</tr>
        </table>
				</div>
				<div style="text-align:center; padding-top:15px;">
        			<input name="subm" id="subm" type="submit" value="送出" disabled="disabled"/>
    			</div>
			</form>	
		</div>
		<div style="width:898px; height:47px; background:url(images/index/index_bottom.gif) no-repeat;">
		</div>
		<div align=left style="margin-left:12px; margin-top:10px;">
		<a href="#">首頁</a>&nbsp;|
		<a href="#">關於我們</a>&nbsp;|
		<a href="#">聯絡我們</a>
		</div>
	</div>
</div>
	
<%		
	}
	else
	{
%>
     <script type="text/javascript">
		function check(s)
		{
			if(s.length<5)
			{ 
				document.apLogin.aaa.value="最少6字符，最多12字符。";
				document.getElementById("test").disabled = true;
			}
			for( var loc=0; loc<s.length; loc++ )
				   if( (s.charAt(loc) < '0') || (s.charAt(loc) > '9') )  
				   if( (s.charAt(loc) < 'a') || (s.charAt(loc) > 'z') )
				    {
					document.apLogin.aaa.value="只允許小寫英文或數字!";
					document.getElementById("test").disabled = true;
					return false;
				    }
			if(s.length>=5)
			{
				document.apLogin.aaa.value="用戶名OK!";
				document.getElementById("test").disabled = false;
			}
		}
     </script>
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
      							<input type="text" name="account" id="account" size="23" maxlength=12 onkeyup="check(this.value)" onfocus="check(this.value)">
      							<input style="border:0" type="text" name="aaa" id="aaa" size="20" value="帳號重複或驗證碼錯誤!" disabled>
							</td>
						</tr>
						<tr>
      						<td align=right style="padding-top:2px;">驗證碼：</td>
      						<td>
      							<input type="text" size="23" name="insrand"/>
      							<img src="image.jsp" alt="可以點擊刷新!" onclick="this.src=this.src+'?'"/>
      						</td>	
      					</tr>
      				</table>
      				<input style="margin:10px 0 0 145px;" name="test" id="test" type="submit" value="確認" disabled/>
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
<%
	}
%>
</body>
</html>