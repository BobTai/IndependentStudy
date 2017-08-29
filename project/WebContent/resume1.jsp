<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康履歷</title>

</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
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
	double height = rs.getInt("height");
	double height1 = height/100;
	int weight = rs.getInt("weight");
	double waist = rs.getInt("waist");
	double hip = rs.getInt("hip");
	String gender = rs.getString("member_gender");
	String date = rs.getString("member_birthday");
	String year = date.substring(0,4);
	int year2 = Integer.parseInt(year);
	java.util.Date today = new java.util.Date();
	int year1 = today.getYear()+1900;
	int age = year1-year2;
	double bmi = (weight/(height1*height1));
	double waisttohip = waist/hip;
	double bmr1 = 13.7*weight+5*height-6.8*age+66;
	double bmr2 = 9.6*weight+1.8*height-4.7*age+655;
	
	java.text.DecimalFormat nf = new java.text.DecimalFormat("#.##");
	java.text.DecimalFormat nf1 = new java.text.DecimalFormat("#");
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:700px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:570px; background:url(images/index/inside_bg.gif) repeat-y;">
			<div style="position:absolute; top:12px; left:40px; width:210px; height:242px;">
				<img src="images/resume/bio_head.png" >
				<a href="resume1.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle1.png" onmouseover="this.src='images/resume/bio_middle11.png'" onmouseout="this.src='images/resume/bio_middle1.png'"></a>
				<a href="resume2.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle2.png" onmouseover="this.src='images/resume/bio_middle22.png'" onmouseout="this.src='images/resume/bio_middle2.png'"></a>
				<a href="resume3.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle3.png" onmouseover="this.src='images/resume/bio_middle33.png'" onmouseout="this.src='images/resume/bio_middle3.png'"></a>
				<img style="margin-top:-3px" src="images/resume/bio_head2.png" >
				<a href="resume4.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle4.png" onmouseover="this.src='images/resume/bio_middle44.png'" onmouseout="this.src='images/resume/bio_middle4.png'"></a>
				<a href="resume5.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle5.png" onmouseover="this.src='images/resume/bio_middle55.png'" onmouseout="this.src='images/resume/bio_middle5.png'"></a>
				<a href="resume6.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle6.png" onmouseover="this.src='images/resume/bio_middle66.png'" onmouseout="this.src='images/resume/bio_middle6.png'"></a>
				<a href="resume7.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle7.png" onmouseover="this.src='images/resume/bio_middle77.png'" onmouseout="this.src='images/resume/bio_middle7.png'"></a>
				<a href="resume8.jsp"><img style="margin-top:-3px" src="images/resume/bio_middle8.png" onmouseover="this.src='images/resume/bio_middle88.png'" onmouseout="this.src='images/resume/bio_middle8.png'"></a>
				<img style="margin-top:-5px" src="images/resume/bio_bottom.png" >
			</div>
			<div style="position:absolute; top:12px; right:36px;">
				<div style="width:676px; height:48px; background:url(images/resume/body_title.png) no-repeat;">
				</div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body1.png) no-repeat;">
					<div style="margin:8px 0 0 119px;"><%=nf1.format(height) %></div>
				</div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body2.png) no-repeat;">
					<div style="margin:8px 0 0 123px;"><%=weight %></div>
				</div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body3.png) no-repeat;">
					<div style="margin:8px 0 0 123px;"><%=nf1.format(waist) %></div>
				</div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body4.png) no-repeat;">
					<div style="margin:8px 0 0 123px;"><%=nf1.format(hip) %></div>
				</div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body5.png) no-repeat;">
					<div style="margin:8px 0 0 103px;"><%=nf.format(bmi) %></div>
				</div>
<%if(bmi<18.5){%>				
				<div style="width:676px; height:20px; background:url(images/resume/body5a_1.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body5b_1.png) no-repeat;"></div>				
<%}if(bmi>=18.5 && bmi<24){%>
				<div style="width:676px; height:20px; background:url(images/resume/body5a_2.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body5b_2.png) no-repeat;"></div>				
<%}if(bmi>=24 && bmi<27){%>
				<div style="width:676px; height:20px; background:url(images/resume/body5a_3.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body5b_3.png) no-repeat;"></div>
<%}if(bmi>=27 && bmi<30){%>
				<div style="width:676px; height:20px; background:url(images/resume/body5a_4.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body5b_4.png) no-repeat;"></div>
<%}if(bmi>=30 && bmi<35){%>
				<div style="width:676px; height:20px; background:url(images/resume/body5a_5.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body5b_5.png) no-repeat;"></div>
<%}if(bmi>=35){%>
				<div style="width:676px; height:20px; background:url(images/resume/body5a_6.png) no-repeat;"></div>
				<div style="width:676px; height:39px; background:url(images/resume/body5b_6.png) no-repeat;"></div>
<%}%>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body6.png) no-repeat;">
					<div style="margin:8px 0 0 127px;"><%=nf.format(waisttohip) %></div>
				</div>
<%if(gender.equals("男性")){
if(waisttohip<0.95){%>
				<div style="width:676px; height:20px; background:url(images/resume/body6a_1.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body6b_1.png) no-repeat;"></div>
<%}if(waisttohip>=0.95){%>
				<div style="width:676px; height:20px; background:url(images/resume/body6a_2.png) no-repeat;"></div>
				<div style="width:676px; height:39px; background:url(images/resume/body6b_2.png) no-repeat;"></div>
<%}}
else{
if(waisttohip<0.85){%>
				<div style="width:676px; height:20px; background:url(images/resume/body6a_1.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/body6b_1.png) no-repeat;"></div>
<%}if(waisttohip>=0.85){%>
				<div style="width:676px; height:20px; background:url(images/resume/body6a_2.png) no-repeat;"></div>
				<div style="width:676px; height:39px; background:url(images/resume/body6b_2.png) no-repeat;"></div>
<%}}%>		
				<div align=left style="width:676px; height:40px; background:url(images/resume/body7.png) no-repeat;">
<%if(gender.equals("男性")){%>					
					<div style="margin:8px 0 0 180px;"><%=nf1.format(bmr1) %></div>
<%}else{ %>	
					<div style="margin:8px 0 0 180px;"><%=nf1.format(bmr2) %></div>
<%} %>				
				</div>
				<div style="width:676px; height:39px; background:url(images/resume/body7_1.png) no-repeat;"></div>
				<div align=left style="width:676px; height:40px; background:url(images/resume/body8.png) no-repeat;">
<%if(gender.equals("男性")){
	if(age>=4 && age <=6){
%>				
					<div style="margin:8px 0 0 162px;">1700</div>
<%
	}
	if(age>=7 && age <=9){
%>
					<div style="margin:8px 0 0 162px;">1900</div>
<%		
	}
	if(age>=10 && age <=12){
%>
					<div style="margin:8px 0 0 162px;">2150</div>
<%		
	}
	if(age>=13 && age <=15){
%>
					<div style="margin:8px 0 0 162px;">2500</div>
<%		
	}
	if(age>=16 && age <=19){
%>
					<div style="margin:8px 0 0 162px;">2650</div>
<%		
	}
	if(age>=20 && age <=24){
		if(bmi<18.5){
%>
					<div style="margin:8px 0 0 162px;">2200</div>
<%			
		}
		if(bmi>=18.5 && bmi<24){
%>
					<div style="margin:8px 0 0 162px;">2450</div>
<%			
		}
		if(bmi>=24 && bmi<30){
%>
					<div style="margin:8px 0 0 162px;">2850</div>
<%			
		}
		if(bmi>=30){
%>
					<div style="margin:8px 0 0 162px;">3300</div>
<%			
		}
	}
	if(age>=25 && age <=54){
		if(bmi<18.5){
%>
					<div style="margin:8px 0 0 162px;">2100</div>
<%			
		}
		if(bmi>=18.5 && bmi<24){
%>
					<div style="margin:8px 0 0 162px;">2350</div>
<%			
		}
		if(bmi>=24 && bmi<30){
%>
					<div style="margin:8px 0 0 162px;">2750</div>
<%			
		}
		if(bmi>=30){
%>
					<div style="margin:8px 0 0 162px;">3200</div>
<%			
		}
	}
	if(age>=55 && age <=69){
		if(bmi<18.5){
%>
					<div style="margin:8px 0 0 162px;">2050</div>
<%			
		}
		if(bmi>=18.5 && bmi<24){
%>
					<div style="margin:8px 0 0 162px;">2250</div>
<%			
		}
		if(bmi>=24 && bmi<30){
%>
					<div style="margin:8px 0 0 162px;">2650</div>
<%			
		}
		if(bmi>=30){
%>
					<div style="margin:8px 0 0 162px;">3000</div>
<%			
		}
	}
	if(age>=70){
		if(bmi<18.5){
%>
					<div style="margin:8px 0 0 162px;">1800</div>
<%			
		}
		if(bmi>=18.5 && bmi<24){
%>
					<div style="margin:8px 0 0 162px;">2000</div>
<%			
		}
		if(bmi>=24 && bmi<30){
%>
					<div style="margin:8px 0 0 162px;">2400</div>
<%			
		}
		if(bmi>=30){
%>
					<div style="margin:8px 0 0 162px;">2750</div>
<%			
		}
	}
}else{
	if(age>=4 && age <=6){
		%>				
							<div style="margin:8px 0 0 162px;">1550</div>
		<%
			}
			if(age>=7 && age <=9){
		%>
							<div style="margin:8px 0 0 162px;">1650</div>
		<%		
			}
			if(age>=10 && age <=12){
		%>
							<div style="margin:8px 0 0 162px;">2100</div>
		<%		
			}
			if(age>=13 && age <=15){
		%>
							<div style="margin:8px 0 0 162px;">2200</div>
		<%		
			}
			if(age>=16 && age <=19){
		%>
							<div style="margin:8px 0 0 162px;">2100</div>
		<%		
			}
			if(age>=20 && age <=24){
				if(bmi<18.5){
		%>
							<div style="margin:8px 0 0 162px;">1800</div>
		<%			
				}
				if(bmi>=18.5 && bmi<24){
		%>
							<div style="margin:8px 0 0 162px;">2000</div>
		<%			
				}
				if(bmi>=24 && bmi<30){
		%>
							<div style="margin:8px 0 0 162px;">2350</div>
		<%			
				}
				if(bmi>=30){
		%>
							<div style="margin:8px 0 0 162px;">2650</div>
		<%			
				}
			}
			if(age>=25 && age <=54){
				if(bmi<18.5){
		%>
							<div style="margin:8px 0 0 162px;">1700</div>
		<%			
				}
				if(bmi>=18.5 && bmi<24){
		%>
							<div style="margin:8px 0 0 162px;">1900</div>
		<%			
				}
				if(bmi>=24 && bmi<30){
		%>
							<div style="margin:8px 0 0 162px;">2200</div>
		<%			
				}
				if(bmi>=30){
		%>
							<div style="margin:8px 0 0 162px;">2500</div>
		<%			
				}
			}
			if(age>=55 && age <=69){
				if(bmi<18.5){
		%>
							<div style="margin:8px 0 0 162px;">1650</div>
		<%			
				}
				if(bmi>=18.5 && bmi<24){
		%>
							<div style="margin:8px 0 0 162px;">1850</div>
		<%			
				}
				if(bmi>=24 && bmi<30){
		%>
							<div style="margin:8px 0 0 162px;">2150</div>
		<%			
				}
				if(bmi>=30){
		%>
							<div style="margin:8px 0 0 162px;">2450</div>
		<%			
				}
			}
			if(age>=70){
				if(bmi<18.5){
		%>
							<div style="margin:8px 0 0 162px;">1600</div>
		<%			
				}
				if(bmi>=18.5 && bmi<24){
		%>
							<div style="margin:8px 0 0 162px;">1800</div>
		<%			
				}
				if(bmi>=24 && bmi<30){
		%>
							<div style="margin:8px 0 0 162px;">2100</div>
		<%			
				}
				if(bmi>=30){
		%>
							<div style="margin:8px 0 0 162px;">2400</div>
		<%			
				}
			}
} %>					
				</div>
				<div style="width:676px; height:20px; background:url(images/resume/body8_1.png) no-repeat;"></div>
				<div style="width:676px; height:40px; background:url(images/resume/body_bottom.png) no-repeat;"></div>
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