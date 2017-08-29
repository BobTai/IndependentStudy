<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import=" javax.mail.*, javax.mail.internet.*, javax.activation.*,java.util.*" %>
<%@ page import="java.security.Security.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%
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
    InternetAddress.parse("q19900106@hotmail.com",false));
  msg.setSubject("健康e起Go會員繳活信件!");
  msg.setText("How are you\nhttp://tw.yahoo.com/");
  msg.setSentDate(new Date());
  Transport.send(msg);
 
  out.println("Message sent");

    }
catch(MessagingException m)
{
out.println(m.toString());
}
%>
</body>
</html>