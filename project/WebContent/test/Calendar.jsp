<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.text.*"%>
<%!
public int nullIntconv(String inv)
{   
    int conv=0;
        
    try{
        conv=Integer.parseInt(inv);
    }
    catch(Exception e)
    {}
    return conv;
}
%>
<%
 int iYear=nullIntconv(request.getParameter("iYear"));
 int iMonth=nullIntconv(request.getParameter("iMonth"));

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth=ca.get(Calendar.MONTH);

 if(iYear==0)
 {
      iYear=iTYear;
      iMonth=iTMonth;
 }

 GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

 int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
 int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
 
 cal = new GregorianCalendar (iYear, iMonth, days); 
 int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
  
%>
<html>
<head>
<title>日曆表</title>
<script>
function goTo()
{
  document.frm.submit()
}
</script>
<style>
.dsb
{
 background-color:#EEEEEE
}
</style>
</head>
<body>
<form name="frm" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="25%">&nbsp;</td>
    <td width="45%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10%">年份&nbsp;</td>
        <td width="7%">
        <select name="iYear" onChange="goTo()">
        <%
        // start year and end year in combo box to change year in calendar
        for(int iy=iTYear-70;iy<=iTYear+70;iy++)
        {
          if(iy==iYear)
          {
            %>
          <option value="<%=iy%>" selected="selected"><%=iy%></option>
          <%
          }
          else
          {
            %>
          <option value="<%=iy%>"><%=iy%></option>
          <%
          }
        }
       %>
        </select></td>
        <td width="73%" align="center" style="color:#4E96DE"><h3><%=iYear%>年&nbsp;-&nbsp;<%=new SimpleDateFormat("MMMM").format(new java.util.Date(2008,iMonth,01))%></h3></td>
        <td width="10%">月份&nbsp;</td>
        <td width="8%">
        <select name="iMonth" onChange="goTo()">
        <%
        // print month in combo box to change month in calendar
        for(int im=0;im<=11;im++)
        {
          if(im==iMonth)
          {
         %>
          <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new java.util.Date(2008,im,01))%></option>
          <%
          }
          else
          {
            %>
          <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new java.util.Date(2008,im,01))%></option>
          <%
          }
        }
       %>
        </select></td>
      </tr>
    </table></td>
</form>
  </tr>
  <tr>
    <td><table align="center" border="1" cellpadding="3" cellspacing="0" width="700">
      <tbody>
        <tr>
          <th>星期日</th>
          <th>星期一</th>
          <th>星期二</th>
          <th>星期三</th>
          <th>星期四</th>
          <th>星期五</th>
          <th>星期六</th>
        </tr>
        <%
        int cnt =1;
        for(int i=1;i<=iTotalweeks;i++)
        {
        %>
        <tr>
          <% 
            for(int j=1;j<=7;j++)
            {
                if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
                {
                 %>
                <td align="center" height="40" class="dsb">&nbsp;</td>
               <% 
                }
                else
                {
                 %>
                <form method="post" action="food_data.jsp" Target="_blank">
                <td align="center" height="40" id="day_<%=(cnt-weekStartDay+1)%>">
                <span><%=(cnt-weekStartDay+1)%>日</span><br/>
                <%@ include file="JDBCConstants.jsp"%>
                <%
                String date = "";
             	if(iMonth<10 && (cnt-weekStartDay+1)<10){
            		date = iYear+"-0"+(iMonth+1)+"-0"+(cnt-weekStartDay+1);
            	}
             	if(iMonth>=10 && (cnt-weekStartDay+1)>=10){
            		date = iYear+"-"+(iMonth+1)+"-"+(cnt-weekStartDay+1);
            	}
             	if(iMonth>=10 && (cnt-weekStartDay+1)<10){
            		date = iYear+"-"+(iMonth+1)+"-0"+(cnt-weekStartDay+1);
            	}
             	if(iMonth<10 && (cnt-weekStartDay+1)>=10){
            		date = iYear+"-0"+(iMonth+1)+"-"+(cnt-weekStartDay+1);
            	}
             	String sql = "SELECT cal from eat_cal where account = '456456' and date_format(date,'%Y-%m-%d')='"+date+"'";
            	ResultSet rs = smt.executeQuery(sql);
            	rs.last();
            	int count=rs.getRow();
            	rs.first();
            	if(count==0){
            		out.print("無資料");
            	}
            	else{
            		out.print(rs.getString("cal")+"大卡");
            	}
                %>               
                	<input type = "submit" name = "insert" value = "吃了什麼">
                	<input type = "hidden" name = "date" value= "<%=date%>" >
               
                </td>
                </form>
               <% 
                }
                cnt++;
              }
            %>
        </tr>
        <% 
        }
        %>
      </tbody>
    </table></td>
  </tr>
</table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<%//-----------------------------------------------------------分隔線 %>
</body>
</html>
