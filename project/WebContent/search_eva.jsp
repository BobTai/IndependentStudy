<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%
String eva_name = new String(request.getParameter("eva_name").getBytes("ISO-8859-1"),"utf-8");

if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
	String sql = "SELECT * from evaluation_result where account = '"+name+"' and evaluation_name = '"+eva_name+"' Order By date desc";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
	if(eva_name.equals("胃功能自我評量")){
%>	
<div style="width:676px; height:48px; background:url(images/resume/eva4_title.png) no-repeat;"></div>
	<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title_new.png) no-repeat;">
		<div style="position:absolute; top:10px; left:105px;">1</div>
		<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
	</div>
<%
if(rs.getInt("score")<=10){
%>				
<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s1.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
%>				
<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s2.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
%>				
<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
<div align=left style="width:676px; height:39px; background:url(images/resume/eva4_yes_s3.png) no-repeat;"></div>				
<%
}
if(rs.getInt("score")>=50){
%>				
<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
<div align=left style="width:676px; height:39px; background:url(images/resume/eva4_yes_s4.png) no-repeat;"></div>				
<%
}
rs.next();
	
	
	for(int i=0; i<count-1; i++){
%>				
						<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title.png) no-repeat;">
							<div style="position:absolute; top:10px; left:105px;"><%=i+2%></div>
							<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
						</div>
		<%
		if(rs.getInt("score")<=10){
		%>				
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s1.png) no-repeat;"></div>				
		<%
		}
		if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
		%>				
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s2.png) no-repeat;"></div>				
		<%
		}
		if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
		%>				
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s3.png) no-repeat;"></div>				
		<%
		}
		if(rs.getInt("score")>=50){
		%>				
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
						<div align=left style="width:676px; height:20px; background:url(images/resume/eva4_yes_s4.png) no-repeat;"></div>				
		<%
		}
		rs.next();
	}
}
if(eva_name.equals("腎功能自我評量")){
	%>	
	<div style="width:676px; height:48px; background:url(images/resume/eva5_title.png) no-repeat;"></div>
		<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title_new.png) no-repeat;">
			<div style="position:absolute; top:10px; left:105px;">1</div>
			<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
		</div>
	<%
	if(rs.getInt("score")<=10){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s1.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s2.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva5_yes_s3.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")>=50){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva5_yes_s4.png) no-repeat;"></div>				
	<%
	}
	rs.next();
		
		
		for(int i=0; i<count-1; i++){
	%>				
							<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title.png) no-repeat;">
								<div style="position:absolute; top:10px; left:105px;"><%=i+2%></div>
								<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
							</div>
			<%
			if(rs.getInt("score")<=10){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s1.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s2.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s3.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")>=50){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva5_yes_s4.png) no-repeat;"></div>				
			<%
			}
			rs.next();
		}
}
if(eva_name.equals("肝功能自我評量")){
	%>	
	<div style="width:676px; height:48px; background:url(images/resume/eva3_title.png) no-repeat;"></div>
		<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title_new.png) no-repeat;">
			<div style="position:absolute; top:10px; left:105px;">1</div>
			<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
		</div>
	<%
	if(rs.getInt("score")<=10){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s1.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s2.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s3.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")>=50){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva3_yes_s4.png) no-repeat;"></div>				
	<%
	}
	rs.next();
		
		
		for(int i=0; i<count-1; i++){
	%>				
							<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title.png) no-repeat;">
								<div style="position:absolute; top:10px; left:105px;"><%=i+2%></div>
								<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
							</div>
			<%
			if(rs.getInt("score")<=10){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s1.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s2.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s3.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")>=50){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva3_yes_s4.png) no-repeat;"></div>				
			<%
			}
			rs.next();
		}
}
if(eva_name.equals("心功能自我評量")){
	%>	
	<div style="width:676px; height:48px; background:url(images/resume/eva2_title.png) no-repeat;"></div>
		<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title_new.png) no-repeat;">
			<div style="position:absolute; top:10px; left:105px;">1</div>
			<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
		</div>
	<%
	if(rs.getInt("score")<=10){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s1.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s2.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva2_yes_s3.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")>=50){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva2_yes_s4.png) no-repeat;"></div>				
	<%
	}
	rs.next();
		
		
		for(int i=0; i<count-1; i++){
	%>				
							<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title.png) no-repeat;">
								<div style="position:absolute; top:10px; left:105px;"><%=i+2%></div>
								<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
							</div>
			<%
			if(rs.getInt("score")<=10){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s1.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s2.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s3.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")>=50){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva2_yes_s4.png) no-repeat;"></div>				
			<%
			}
			rs.next();
		}
}
if(eva_name.equals("肺功能自我評量")){
	%>	
	<div style="width:676px; height:48px; background:url(images/resume/eva1_title.png) no-repeat;"></div>
		<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title_new.png) no-repeat;">
			<div style="position:absolute; top:10px; left:105px;">1</div>
			<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
		</div>
	<%
	if(rs.getInt("score")<=10){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s1.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s2.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s3.png) no-repeat;"></div>				
	<%
	}
	if(rs.getInt("score")>=50){
	%>				
	<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
	<div align=left style="width:676px; height:39px; background:url(images/resume/eva1_yes_s4.png) no-repeat;"></div>				
	<%
	}
	rs.next();
		
		
		for(int i=0; i<count-1; i++){
	%>				
							<div align=left style="position:relative; width:676px; height:40px; background:url(images/resume/record_title.png) no-repeat;">
								<div style="position:absolute; top:10px; left:105px;"><%=i+2%></div>
								<div style="position:absolute; top:10px; left:442px;"><%=rs.getString("date")%></div>
							</div>
			<%
			if(rs.getInt("score")<=10){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s1.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s1.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=29 && rs.getInt("score")>=11){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s2.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s2.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")<=49 && rs.getInt("score")>=30){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s3.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s3.png) no-repeat;"></div>				
			<%
			}
			if(rs.getInt("score")>=50){
			%>				
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva_s4.png) no-repeat;"></div>
							<div align=left style="width:676px; height:20px; background:url(images/resume/eva1_yes_s4.png) no-repeat;"></div>				
			<%
			}
			rs.next();
		}
}
}
%>
<div style="width:676px; height:23px; background:url(images/resume/eva_bottom.png) no-repeat;"></div>
</body>
</html>