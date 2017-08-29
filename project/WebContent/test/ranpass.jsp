<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%
         //產生亂數密碼
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
        out.print(newPassword+"<br/>");

        int a = (int)(Math.random()*10+1);
        out.print(a);
%>
</body>
</html>