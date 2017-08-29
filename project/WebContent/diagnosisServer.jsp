<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*,java.util.Date" %>
<%@ include file="menu.jsp"%>
<html>
<body>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:800px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:898px; height:690px; background:url(images/index/index_bg.gif) repeat-y;">
		
		<img style="position:absolute; top:10px; left:40px" src="images/diagnose/people.png">
<%
String strDate  = thisMonth+"月"+thisDate+"日";
String member_id ="";
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
member_id = session.getAttribute("username").toString();
}
String type="";
String onetype = "";
String sectype = "";
String thirdtype = "";
String pain_answer = "";
String mode = "";
if(request.getParameter("type1")!=null){
	type = new String(request.getParameter("type1").getBytes("ISO-8859-1"),"utf-8");
}
if(request.getParameter("type2")!=null){
	onetype = new String(request.getParameter("type2").getBytes("ISO-8859-1"),"utf-8");
}
if(request.getParameter("type3")!=null){
	sectype = new String(request.getParameter("type3").getBytes("ISO-8859-1"),"utf-8");
}
if(request.getParameter("type4")!=null){
	thirdtype = new String(request.getParameter("type4").getBytes("ISO-8859-1"),"utf-8");
}
if(request.getParameter("mode")!=null){
	mode = new String(request.getParameter("mode").getBytes("ISO-8859-1"),"utf-8");
}

%>		
		<div align=left style="position:relative; position:absolute; top:10px; right:40px; width:592px; height:295px; background:url(images/diagnose/dialog1.png) no-repeat;">
			<%if(!type.equals("")) %><font style="position:absolute; top:25px; left:80px; font-size:20px"><b>主要症狀：</b><%=type %></font>
			<%if(!onetype.equals("")) %><font style="position:absolute; top:65px; left:80px; font-size:20px"><b>次要症狀一：</b><%=onetype %></font>
			<%if(!sectype.equals("")) %><font style="position:absolute; top:105px; left:80px; font-size:20px"><b>次要症狀二：</b><%=sectype %></font>
			<%if(!thirdtype.equals("")) %><font style="position:absolute; top:145px; left:80px; font-size:20px"><b>次要症狀三：</b><%=thirdtype %></font>

		</div>

		<div align="left" style="position:relative; position:absolute; bottom:60px; left:40px; width:592px; height:295px; background:url(images/diagnose/dialog2.png) no-repeat;">
<%
//以下這段一定要用
try {      

 // 建立 MySQL 驅動程式
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 //out.print("<BR>驅動 MySql 資料庫成功!");
      
}catch(Exception E) {
 out.print("<BR>無法載入 com.mysql.jdbc.Driver ");  
 E.printStackTrace();  
} 
//以下這段一定要用
try { 
 
 // 設定連線,連到資料庫名稱"caidiy5",使用者帳號"mark",密碼"cool",使用UTF-8編碼"true",字元集用"UTF-8"

 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthy2?user=root&password=123&useUnicode=true&characterEncoding=UTF-8"); 
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthy2?user=root&password=123&useUnicode=true&characterEncoding=UTF-8"); 
 
 // 判斷資料庫是否載入成功

 if(!con.isClosed()){   
   //out.print("<BR>載入 MySql 資料庫成功!");
 }

 
 String s_Sql = "select * FROM diagnos_pain where type='"+type+"' and onetype='"+onetype+"'and twotype='"+sectype+"'and thirdtype='"+thirdtype+"' ";//，把材料準備好
 PreparedStatement pstmt = con.prepareStatement(s_Sql);//要與String s_Sql呼應，準備做
 ResultSet rs = pstmt.executeQuery(); //真的做
// 取出 diagnos_pain 資料表中的內容
 
 while (rs.next()){ 
	 pain_answer = rs.getString("pain_ans");
%>	 
           <font style="position:absolute; top:30px; left:190px; width:300px; font-size:20px"><%= pain_answer%></font>

<%
 }   
//關閉連線，要有順序rs, pstmt,stmt,con
 if(mode.equals("save")){
	 String s_SqlInsert = "insert INTO diagnos_save (account,date,type,one_pain,two_pain,third_pain,pain_answer) values ('"+member_id+"','"+strDate+"','"+type+"','"+onetype+"','"+sectype+"','"+thirdtype+"','"+pain_answer+"')";

	  System.out.println("124====>"+s_SqlInsert);
	  // 執行SQL語法
	  Statement stmt = conn.createStatement();//我要執行stmt
	  stmt.executeUpdate(s_SqlInsert);//我要執行s_SqlInsert
	  
 }

 rs.close();
 rs = null;
 pstmt.close();
 pstmt = null;
 

 con.close();
 }catch(Exception ex){
	 System.out.println("ex====>"+ex);
 }


%>

		<form name="myform2" action="diagnosisServer.jsp" method="post">
			<input type="hidden" name="member_id" value="<%=member_id%>">
			<input type="hidden" name="type1" value="<%=type%>">
			<input type="hidden" name="type2" value="<%=onetype%>">
			<input type="hidden" name="type3" value="<%=sectype%>">
			<input type="hidden" name="type4" value="<%=thirdtype%>">
			<input type="hidden" name="pain_answer" value="<%=pain_answer%>">
			<input type="hidden" name="date" value="<%=strDate%>">
			<input type="hidden" name="mode" value="save">
<%if(session.getAttribute("username")!=null && session.getAttribute("password")!=null){ %>			
			<input style="position:absolute; bottom:40px; right:90px" type="image" src="images/diagnose/save.png" value="儲存至個人履歷" onclick="alert('儲存成功!')">
<%}else{ %>	
			<input title="您尚未登入會員！" style="position:absolute; bottom:40px; right:90px" type="image" src="images/diagnose/save.png" value="123" disabled>
<%} %>	
		</form>
		</div>
		<img style="position:absolute; bottom:70px; right:40px" src="images/diagnose/doctor.png">
		<img style="position:absolute; bottom:-15px; right:40px" src="images/diagnose/declare.png">
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
</body>
</html>

