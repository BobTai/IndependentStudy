<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="3;url=index.jsp">
<title>Insert title here</title>
<%@ include file="JDBCConstants.jsp"%>

<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
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
	int h11 = Integer.parseInt(h1);
	String h1_num = request.getParameter("h1_num");
	int h1_num1 = Integer.parseInt(h1_num);
	String h1_year = request.getParameter("h1_year");
	int h1_year1 = Integer.parseInt(h1_year);
	String h2 = request.getParameter("h2");
	int h21 = Integer.parseInt(h2);
	String h2_num = request.getParameter("h2_num");
	int h2_num1 = Integer.parseInt(h2_num);
	String h2_year = request.getParameter("h2_year");
	int h2_year1 = Integer.parseInt(h2_year);
	String h3 = request.getParameter("h3");
	int h31 = Integer.parseInt(h3);
	String h3_num = request.getParameter("h3_num");
	int h3_num1 = Integer.parseInt(h3_num);
	String h3_year = request.getParameter("h3_year");
	int h3_year1 = Integer.parseInt(h3_year);
	
	String n1 = request.getParameter("n1");
	int n11 = Integer.parseInt(n1);
	if(n11==2){
		String[] d=request.getParameterValues("d");
		for (int i = 0; i < d.length; i++){
	    	String sql2 = "INSERT INTO my_medical_history(d_name, account) VALUES ('"+d[i]+"','"+account+"');";
	    	smt.execute(sql2);
	    }
	}
	String n2 = request.getParameter("n2");
	int n21 = Integer.parseInt(n2);
	if(n21==2){
		String[] d1=request.getParameterValues("d1");
		for (int i = 0; i < d1.length; i++){
	    	String sql3 = "INSERT INTO family_medical_history(d_name, account) VALUES ('"+d1[i]+"','"+account+"');";
	    	smt.execute(sql3);
	    }
	}
	String sql = "INSERT INTO member(account, password, member_name, online_name, member_gender, member_birthday, member_email, member_address, height, weight, waist, hip, ques, ans) VALUES('"+account+"','"+password+"','"+name+"','"+user_name+"','"+gender+"','"+date+"','"+e_mail+"','"+address+"','"+height1+"','"+weight1+"','"+waist1+"','"+hip1+"','"+ques+"','"+ans+"');";
    smt.execute(sql);
    String sql1 = "INSERT INTO hobby(smoke, smoke_number, smoke_year, drink, drink_number, drink_year, betel, betel_number, betel_year, account) VALUES ('"+h11+"','"+h1_num1+"','"+h1_year1+"','"+h21+"','"+h2_num1+"','"+h2_year1+"','"+h31+"','"+h3_num1+"','"+h3_year1+"','"+account+"');";
    smt.execute(sql1);
%>

<%@ include file="menu1.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="padding-top:40px; width:898px; height:400px; background:url(images/index/index_bg.gif) repeat-y;">
			<fieldset style="position:relative; background:url(images/member/regist_f.png) no-repeat; border:0px; width:603px; height:375px;">
				<a href="#"><IMG border=0 style="position:absolute; bottom:70px; left:250px;" SRC="images/member/home.png" onmouseover="this.src='images/member/home1.png'" onmouseout="this.src='images/member/home.png'"></a>
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
</body>
</html>