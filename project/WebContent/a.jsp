
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
</head>
<%


String leveltwovlaue = "";
String levelthreevlaue = "";
String levelfourvlaue = "";
String levelonevlaue = "";


	

	if(request.getParameter("levelonevlaue")!=null)
	{
		levelonevlaue = new String(request.getParameter("levelonevlaue").getBytes("ISO-8859-1"),"utf-8");
	}
	
	
	if(request.getParameter("leveltwovlaue")!=null)
	{
		leveltwovlaue = new String(request.getParameter("leveltwovlaue").getBytes("ISO-8859-1"),"utf-8");
	}
	if(request.getParameter("levelthreevlaue")!=null)
	{
		levelthreevlaue = new String(request.getParameter("levelthreevlaue").getBytes("ISO-8859-1"),"utf-8");
	}
	if(request.getParameter("levelfourvlaue")!=null)
	{
		levelfourvlaue = new String(request.getParameter("levelfourvlaue").getBytes("ISO-8859-1"),"utf-8");
	}
	
	
	if(levelonevlaue.equals("")){
		leveltwovlaue = "";
		levelthreevlaue = "";
		levelfourvlaue = "";
	}

	if(leveltwovlaue.equals("")){
		
		levelthreevlaue = "";
		levelfourvlaue = "";
	}
	if(levelthreevlaue.equals("")){
		levelfourvlaue = "";
	}
	
	
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
    
     // 設定連線,連到資料庫名稱"caidiy5",使用者帳號"mark",密碼"cool",使用UTF-8編碼"true",字元集用"UTF-8"

     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthy2?user=root&password=123&useUnicode=true&characterEncoding=UTF-8"); 
     
     // 判斷資料庫是否載入成功

     if(!con.isClosed()){   
       //out.print("<BR>載入 MySql 資料庫成功!");
     }
%>
<%@ include file="menu.jsp"%>
<body>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:800px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:898px; height:690px; background:url(images/index/index_bg.gif) repeat-y;">
		
		<img style="position:absolute; top:10px; left:40px" src="images/diagnose/people.png">
		<div align=left style="position:relative; position:absolute; top:10px; right:40px; width:592px; height:295px; background:url(images/diagnose/dialog1.png) no-repeat;">
		
<form action="diagnosisServer.jsp" method="post">
<font style="position:absolute; top:30px; left:80px; font-weight:bold">主要症狀</font>
<select style="position:absolute; top:28px; left:160px;" name="type1"
	onChange="go(1, this.options[this.selectedIndex].value)">
	<option></option>

	<%
          
             
             String s_Sql = "select distinct(type) FROM diagnos_pain";//，把材料準備好
             PreparedStatement pstmt = con.prepareStatement(s_Sql);//要與String s_Sql呼應，準備做
             ResultSet rs = pstmt.executeQuery(); //真的做
            // 取出 diagnos_pain 資料表中的內容
             
             while (rs.next()){         
            	 String type = rs.getString("type");
            	 type = type.replace(" ","");
                 if(!type.equals("")){
        	  
            	 if(type.equals(levelonevlaue)){
                       out.println("<option value='"+type+"' selected='selected'> "+type+"</option>");
            	 }else{
            		 out.println("<option value='"+type+"''> "+type+"</option>");
            	 }
                }       
             }   
            //關閉連線，要有順序rs, pstmt,stmt,con

             rs.close();
             rs = null;
             pstmt.close();
             pstmt = null;
             
            
            %>

</select>
<br/> <!-- type2 --> 
<%if(!levelonevlaue.equals("")){ %>
	<%
          
             
        s_Sql = "select distinct(onetype) FROM diagnos_pain";//，把材料準備好
        if(!levelonevlaue.equals("")){
       	 s_Sql = "select distinct(onetype) FROM diagnos_pain where type='"+levelonevlaue+"'";//，把材料準備好
        }
        
        pstmt = con.prepareStatement(s_Sql);//要與String s_Sql呼應，準備做
        rs = pstmt.executeQuery(); //真的做
       // 取出 diagnos_pain 資料表中的內容
        String onetypeContent="";
        String onetypeWord="";
        while (rs.next()){          
       	 String type = rs.getString("onetype");
       	type = type.replace(" ","");
       	 onetypeWord = onetypeWord + type;
       	 
         if(!type.equals("")){
	       	 if(type.equals(leveltwovlaue)){
	                onetypeContent = onetypeContent + "<option value='"+type+"' selected='selected'> "+type+"</option>";
	       	 }else{
	       		 onetypeContent = onetypeContent+ "<option value='"+type+"''> "+type+"</option>";
	       	 }
         }        
        }   
       //關閉連線，要有順序rs, pstmt,stmt,con

        rs.close();
        rs = null;
        pstmt.close();
        pstmt = null;      
        onetypeWord = onetypeWord.trim();
	%>
<%if(!onetypeWord.equals("")){%>
	<font style="position:absolute; top:70px; left:80px; font-weight:bold">次要症狀一</font>
	 <select style="position:absolute; top:68px; left:160px;" name="type2"
		onChange="go(2, this.options[this.selectedIndex].value)">
		<option></option>
		<%out.println(onetypeContent);%>
	</select> 
<%}%>
<%}%>
<br> <!-- type3 --> 
<%if(!leveltwovlaue.equals("")){ %>
	<%
        s_Sql = "select distinct(twotype) FROM diagnos_pain";//，把材料準備好
        
        if(!leveltwovlaue.equals("")){
       	 s_Sql = "select distinct(twotype) FROM diagnos_pain where onetype='"+leveltwovlaue+"'";//，把材料準備好
        }
        pstmt = con.prepareStatement(s_Sql);//要與String s_Sql呼應，準備做
        rs = pstmt.executeQuery(); //真的做
       // 取出 diagnos_pain 資料表中的內容
        String twotypeContent="";
        String twotypeWord="";
        while (rs.next()){   
       	 
       	 String type = rs.getString("twotype");
       	 type = type.replace(" ","");
       	 twotypeWord = twotypeWord + type;
         if(!type.equals("")){
	
	       	 if(type.equals(levelthreevlaue)){
	            twotypeContent = twotypeContent + "<option value='"+type+"' selected='selected'> "+type+"</option>";
	       	 }else{
	       		twotypeContent = twotypeContent+"<option value='"+type+"''> "+type+"</option>";
	       	 }
         }
       }   
       //關閉連線，要有順序rs, pstmt,stmt,con

        rs.close();
        rs = null;
        pstmt.close();
        pstmt = null;
        twotypeWord = twotypeWord.replace(" ","");
	%>
<%if(!twotypeWord.equals("")){%>
	<font style="position:absolute; top:110px; left:80px; font-weight:bold">次要症狀二</font>
	<select style="position:absolute; top:108px; left:160px;" name="type3"
		onChange="go(3, this.options[this.selectedIndex].value)">
		<option></option>
		<%out.println(twotypeContent);%>
	</select> <br> 
<%} %>
<%} %>
<%if(!levelthreevlaue.equals("")){ %>
	<%
        s_Sql = "select distinct(thirdtype) FROM diagnos_pain";//，把材料準備好
        if(!levelthreevlaue.equals("")){
       	 s_Sql = "select distinct(thirdtype) FROM diagnos_pain where twotype='"+levelthreevlaue+"'";//，把材料準備好
        }
        
        pstmt = con.prepareStatement(s_Sql);//要與String s_Sql呼應，準備做
         rs = pstmt.executeQuery(); //真的做
       // 取出 diagnos_pain 資料表中的內容
        String threetypeContent="";
        String threetypeWord="";
        while (rs.next()){          
          	String type = rs.getString("thirdtype");
          	type = type.replace(" ","");
          	threetypeWord = threetypeWord+type;
         if(!type.equals("")){
	       	 if(type.equals(levelfourvlaue)){
	             threetypeContent= threetypeContent + "<option value='"+type+"' selected='selected'> "+type+"</option>";
	       	 }else{
	       		 threetypeContent = threetypeContent+"<option value='"+type+"''> "+type+"</option>";
	       	 } 
         }      
        }   
       //關閉連線，要有順序rs, pstmt,stmt,con

        rs.close();
        rs = null;
        pstmt.close();
        pstmt = null;
        

        con.close();
	%>
	
<%
threetypeWord = threetypeWord.replace(" ","");

if(!threetypeWord.equals("")){%>
<font style="position:absolute; top:150px; left:80px; font-weight:bold">次要症狀三 </font>
<select style="position:absolute; top:148px; left:160px;" name="type4"
	onChange="go(4, this.options[this.selectedIndex].value)">
	<option></option>
	<%out.println(threetypeContent); %>
</select>
<br>
<%} %>
<%} %>
<input style="position:absolute; bottom:40px; right:40px" type="image" src="images/diagnose/submit.png" value="送出">
</form>
<form name="myform2" action="a.jsp" method="post">
<input type="hidden" name="levelonevlaue" value="<%=levelonevlaue%>">
<input type="hidden" name="leveltwovlaue" value="<%=leveltwovlaue%>">
<input type="hidden" name="levelthreevlaue" value="<%=levelthreevlaue%>">
<input type="hidden" name="levelfourvlaue" value="<%=levelfourvlaue%>">
</form>
	</div>
	<img style="position:absolute; bottom:60px; left:40px" src="images/diagnose/dialog2.png">
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
<script>
function go(value,select){
	if(value==1){
	 document.myform2.levelonevlaue.value=select;
	 document.myform2.leveltwovlaue.value="";
	 document.myform2.levelthreevlaue.value="";
	 document.myform2.levelfourvlaue.value="";
	 document.myform2.submit();
	}
	if(value==2){
		 document.myform2.leveltwovlaue.value=select;
		 document.myform2.levelthreevlaue.value="";
		 document.myform2.levelfourvlaue.value="";
		 document.myform2.submit();
		}
	if(value==3){
		 document.myform2.levelthreevlaue.value=select;
		 document.myform2.levelfourvlaue.value="";
		 document.myform2.submit();
		}
	if(value==4){
		 document.myform2.levelfourvlaue.value=select;
		 document.myform2.submit();
		}
	
}
</script>

