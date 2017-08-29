<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import=" javax.mail.*, javax.mail.internet.*, javax.activation.*,java.util.*" %>
<%@ page import="java.security.Security.*"%> 
<%@ page import="java.util.Date"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include file="JDBCConstants.jsp"%>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String account = request.getParameter("account");
	String e_mail = request.getParameter("e_mail");
	String ques = request.getParameter("ques");
	String ans = request.getParameter("ans");
	String rand = (String)session.getAttribute("rand");  
	String input = request.getParameter("insrand");
	String sql = "SELECT account, password, member_email, ques, ans from member where account = '"+account+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
	if(count==0){
		out.print("沒有此帳號!");
	}
	else{
		if(account.equals(rs.getString("account")) && e_mail.equals(rs.getString("member_email")) && ques.equals(rs.getString("ques")) && ans.equals(rs.getString("ans")) && rand.equals(input)){
			int[] word = new int[12];
	        int mod;
	        for(int i = 0; i < 12; i++){
	          mod = (int)((Math.random()*7)%3);
	                if(mod ==1){    //數字
	                       word[i]=(int)((Math.random()*10) + 48);
	                }else if(mod ==2){  //大寫英文
	                       word[i] = (char)((Math.random()*26) + 65);
	                }else{    //小寫英文
	                       word[i] = (char)((Math.random()*26) + 97);
	                }
	            }
	        StringBuffer newPassword = new StringBuffer();
	        for(int j = 0; j < 12; j++){
	         newPassword.append((char)word[j]);
	        }
	        String sql1 = "UPDATE member SET password = '"+ newPassword +"' WHERE account = '"+account+"';";
	        smt.executeUpdate(sql1);
	        
	        
	        try{
	        	String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	        	Properties props = System.getProperties();
	        	  props.setProperty("mail.smtp.host", "smtp.gmail.com");
	        	  props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	        	  props.setProperty("mail.smtp.socketFactory.fallback", "false");
	        	  props.setProperty("mail.smtp.port", "465");
	        	  props.setProperty("mail.smtp.socketFactory.port", "465");
	        	  props.put("mail.smtp.auth", "true");


	        	  String username = "q19900106@gmail.com";
	        	  String password = "y2j22805839";

	        	    Session sendMailSession;
	        	  Store store;
	        	  Transport transport;
	        	  sendMailSession = Session.getInstance(props, new Authenticator(){
	        	    protected PasswordAuthentication getPasswordAuthentication() {
	        	        return new PasswordAuthentication("q19900106@gmail.com", "y2j22805839");
	        	    }});


	        	       // -- Create a new message --
	        	  Message msg = new MimeMessage(sendMailSession);

	        	  // -- Set the FROM and TO fields --
	        	  msg.setFrom(new InternetAddress("q19900106@gmail.com"));
	        	  msg.setRecipients(Message.RecipientType.TO,
	        	    InternetAddress.parse(e_mail,false));
	        	  msg.setSubject("健康e起Go會員找回密碼!");
	        	  msg.setText("您的新密碼：\n"+newPassword+"\n馬上前往修改:\nhttp://localhost:81/project/");
	        	  msg.setSentDate(new Date());
	        	  Transport.send(msg);
	        	 
	        	  out.println("密碼已送至您的電子信箱!");

	        	    }
	        	catch(MessagingException m)
	        	{
	        	out.println(m.toString());
	        	}
		}
		else{
			out.print("資料輸入錯誤!");
%>
	<meta http-equiv="refresh" content="1;url=forget_pass.jsp">
<%			
		}
	}
%>
</body>
</html>