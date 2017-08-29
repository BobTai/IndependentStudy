<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page  import ="org.jfree.data.category.*"%>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.servlet.ServletUtilities" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%@ page  import ="org.jfree.chart.JFreeChart"%>
<%@ page  import ="org.jfree.chart.plot.PlotOrientation" %>

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康履歷</title>

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
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name1 = session.getAttribute("username").toString();
	
	String sql1 = "SELECT * from member where account = '"+name1+"'";
	ResultSet rs1 = smt.executeQuery(sql1);
	rs1.first();
	
	double height = rs1.getInt("height");
	double height1 = height/100;
	int weight = rs1.getInt("weight");
	String gender = rs1.getString("member_gender");
	String date = rs1.getString("member_birthday");
	String year = date.substring(0,4);
	int year2 = Integer.parseInt(year);
	java.util.Date today = new java.util.Date();
	int year1 = today.getYear()+1900;
	int age = year1-year2;
	double bmi = (weight/(height1*height1));
	int cal1 = 0;
	
	if(gender.equals("男性")){
		if(age>=4 && age <=6){cal1 = 1700;}
		if(age>=7 && age <=9){cal1 = 1900;}
		if(age>=10 && age <=12){cal1 = 2150;}
		if(age>=13 && age <=15){cal1 = 2500;}
		if(age>=16 && age <=19){cal1 = 2650;}
		if(age>=20 && age <=24){
			if(bmi<18.5){cal1 = 2200;}
			if(bmi>=18.5 && bmi<24){cal1 = 2450;}
			if(bmi>=24 && bmi<30){cal1 = 2850;}
			if(bmi>=30){cal1 = 3300;}
		}
		if(age>=25 && age <=54){
			if(bmi<18.5){cal1 = 2100;}
			if(bmi>=18.5 && bmi<24){cal1 = 2350;}
			if(bmi>=24 && bmi<30){cal1 = 2750;}
			if(bmi>=30){cal1 = 3200;}
		}
		if(age>=55 && age <=69){
			if(bmi<18.5){cal1 = 2050;}
			if(bmi>=18.5 && bmi<24){cal1 = 2250;}
			if(bmi>=24 && bmi<30){cal1 = 2650;}
			if(bmi>=30){cal1 = 3000;}
		}
		if(age>=70){
			if(bmi<18.5){cal1 = 1800;}
			if(bmi>=18.5 && bmi<24){cal1 = 2000;}
			if(bmi>=24 && bmi<30){cal1 = 2400;}
			if(bmi>=30){cal1 = 2750;}
		}
	}else{
		if(age>=4 && age <=6){cal1 = 1550;}
				if(age>=7 && age <=9){cal1 = 1650;}
				if(age>=10 && age <=12){cal1 = 2100;}
				if(age>=13 && age <=15){cal1 = 2200;}
				if(age>=16 && age <=19){cal1 = 2100;}
				if(age>=20 && age <=24){
					if(bmi<18.5){cal1 = 1800;}
					if(bmi>=18.5 && bmi<24){cal1 = 2000;}
					if(bmi>=24 && bmi<30){cal1 = 2350;}
					if(bmi>=30){cal1 = 2650;}
				}
				if(age>=25 && age <=54){
					if(bmi<18.5){cal1 = 1700;}
					if(bmi>=18.5 && bmi<24){cal1 = 1900;}
					if(bmi>=24 && bmi<30){cal1 = 2200;}
					if(bmi>=30){cal1 = 2500;}
				}
				if(age>=55 && age <=69){
					if(bmi<18.5){cal1 = 1650;}
					if(bmi>=18.5 && bmi<24){cal1 = 1850;}
					if(bmi>=24 && bmi<30){cal1 = 2150;}
					if(bmi>=30){cal1 = 2450;}
				}
				if(age>=70){
					if(bmi<18.5){cal1 = 1600;}
					if(bmi>=18.5 && bmi<24){cal1 = 1800;}
					if(bmi>=24 && bmi<30){cal1 = 2100;}
					if(bmi>=30){cal1 = 2400;}
				}
	}
	
	String date1 = "";
	int newMonth = iMonth+1;
 	if(newMonth>0 && newMonth<10){
		date1 = iYear+"-0"+newMonth;
	}
 	else{
 		date1 = iYear+"-"+newMonth;
 	}

	String sql = "SELECT * from eat_cal where account = '"+name1+"' and date_format(date,'%Y-%m')='"+date1+"' order by eat_cal_id";
	ResultSet rs = smt.executeQuery(sql);
	rs.last();
	int count=rs.getRow();
	rs.first();
	
	String chartURL = "";
	String fname = "";
	
if(count>1){
	DefaultCategoryDataset data = new DefaultCategoryDataset();
	String[] series = {"建議攝取熱量", "攝取熱量"};
	
	for(int i=0; i<count; i++)
	{
		String date2=rs.getString("date");
		data.addValue(cal1, series[0],date2.substring(8));
		rs.next();
	}

	rs.first();
	for(int i=0;i<count;i++)
	{
		String date2=rs.getString("date");
		data.addValue(rs.getInt("cal"), series[1], date2.substring(8));
		rs.next();
	}

	rs.first();
	String month=rs.getString("date");

	JFreeChart chart =
	ChartFactory.createLineChart(Integer.parseInt(month.substring(5,7))+"月份飲食熱量攝取統計圖",
	                               "日期",
	                               "熱量(大卡)",
	                               data,
	                               PlotOrientation.VERTICAL,
	                               true,
	                               true,
	                               false);

	          final ChartRenderingInfo info = new
	        ChartRenderingInfo(new StandardEntityCollection());

	chart.setBackgroundPaint(Color.WHITE); //將背景設定成白色      
	          
	fname = ServletUtilities.saveChartAsJPEG(chart, 600, 400, info, session);
	PrintWriter pw = new PrintWriter(out);
	ChartUtilities.writeImageMap(pw, fname, info, false);


	pw.flush();
	chartURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + fname;
}
else{
	 DefaultCategoryDataset data = new DefaultCategoryDataset();

	 JFreeChart chart =
		ChartFactory.createLineChart("資料尚未到達兩筆以上，無法顯示圖表。",
		                               "日期",
		                               "熱量(大卡)",
		                               data,
		                               PlotOrientation.VERTICAL,
		                               true,
		                               true,
		                               false);

		          final ChartRenderingInfo info = new
		        ChartRenderingInfo(new StandardEntityCollection());

		chart.setBackgroundPaint(Color.WHITE); //將背景設定成白色      
		          
		fname = ServletUtilities.saveChartAsJPEG(chart, 600, 400, info, session);
		PrintWriter pw = new PrintWriter(out);
		ChartUtilities.writeImageMap(pw, fname, info, false);


		pw.flush();
		chartURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + fname;
}
%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:1170px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:988px; height:1065px; background:url(images/index/inside_bg.gif) repeat-y;">
			<img style="position:absolute; top:444px; left:40px;" src="images/resume/illustrate_2.png">
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
				<div style="width:676px; height:48px; background:url(images/resume/foodcal_title.png) no-repeat;"></div>
				<div style="width:676px; height:15px; background:url(images/resume/foodcal_in_title.png) no-repeat;"></div>
				<div style="width:676px; height:495px; background:url(images/resume/foodcal_in_middle.png) repeat-y;">
<form name="frm" method="post">
<table width="600" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td><table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">年份&nbsp;</td>
        <td width="42">
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
        <td width="420" align="center" style="color:#4E96DE"><h3><%=iYear%>年&nbsp;-&nbsp;<%=new SimpleDateFormat("MMMM").format(new java.util.Date(2008,iMonth,01))%>&nbsp;-&nbsp;飲食熱量攝取日曆</h3></td>
        <td width="60">月份&nbsp;</td>
        <td width="42">
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
    <td><table style="border:1px solid gray" align="center"cellpadding="3" cellspacing="0" width="600">
      <tbody>
        <tr>
          <th style="border:1px solid gray">星期日</th>
          <th style="border:1px solid gray">星期一</th>
          <th style="border:1px solid gray">星期二</th>
          <th style="border:1px solid gray">星期三</th>
          <th style="border:1px solid gray">星期四</th>
          <th style="border:1px solid gray">星期五</th>
          <th style="border:1px solid gray">星期六</th>
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
                <td style="border:1px solid gray" align="center" height="40" class="dsb">&nbsp;</td>
               <% 
                }
                else
                {
                 %>
                <td style="border:1px solid gray" align="center" height="40" id="day_<%=(cnt-weekStartDay+1)%>">
                <span><%=(cnt-weekStartDay+1)%>日</span><br/>
                <%
                String date2 = "";
             	if((iMonth+1)<10 && (cnt-weekStartDay+1)<10){
            		date2 = iYear+"-0"+(iMonth+1)+"-0"+(cnt-weekStartDay+1);
            	}
             	if((iMonth+1)>=10 && (cnt-weekStartDay+1)>=10){
            		date2 = iYear+"-"+(iMonth+1)+"-"+(cnt-weekStartDay+1);
            	}
             	if((iMonth+1)>=10 && (cnt-weekStartDay+1)<10){
            		date2 = iYear+"-"+(iMonth+1)+"-0"+(cnt-weekStartDay+1);
            	}
             	if((iMonth+1)<10 && (cnt-weekStartDay+1)>=10){
            		date2 = iYear+"-0"+(iMonth+1)+"-"+(cnt-weekStartDay+1);
            	}
             	String sql2 = "SELECT eat_cal_id, cal from eat_cal where account = '"+name1+"' and date_format(date,'%Y-%m-%d')='"+date2+"'";
            	ResultSet rs2 = smt.executeQuery(sql2);
            	rs2.last();
            	int count2=rs2.getRow();
            	rs2.first();
            	int eat_cal_id = 0;
            	if(count2==0){
            		out.print("<div style='color:gray'>無紀錄</div>"); 
            	%>
            		<img src="images/resume/search_eat.png">
            	<%	
            	}
            	else{
            		out.print("<div style='color:red'>"+rs2.getString("cal")+"大卡</div>");
            		eat_cal_id = rs2.getInt("eat_cal_id");
            	%>
            		<img src="images/resume/search_eat.png" onclick="window.open ('food_data.jsp?eat_cal_id=<%=eat_cal_id%>', 'newwindow', 'height=265, width=900, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
            	<%	
            	}
                %>                           		
                </td>
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
					
				</div>
				<div style="width:676px; height:15px; background:url(images/resume/foodcal_in_bottom.png) no-repeat;"></div>
				<div style="width:676px; height:10px; background:url(images/resume/exer_middle.png) repeat-y;"></div>
				
				<div style="width:676px; height:15px; background:url(images/resume/foodcal_in_title.png) no-repeat;"></div>
				<div style="width:676px; height:410px; background:url(images/resume/foodcal_in_middle.png) repeat-y;">
					<IMG SRC="<%= chartURL %>" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#<%= fname %>">
				</div>
				<div style="width:676px; height:15px; background:url(images/resume/foodcal_in_bottom.png) no-repeat;"></div>
				<div style="width:676px; height:20px; background:url(images/resume/habit_bottom.png) no-repeat;"></div>	
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
<%}else{
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
} %>
</body>
</html>