<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.servlet.ServletUtilities" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%
      final DefaultPieDataset data = new DefaultPieDataset();
      data.setValue("First", new Double(43.2));
      data.setValue("Two", new Double(10.0));
      data.setValue("Three", new Double(27.5));
      data.setValue("Four", new Double(17.5));
      data.setValue("Five", new Double(11.0));
      data.setValue("Six", new Double(19.4));

      JFreeChart chart = ChartFactory.createPieChart
      ("Pie Chart ", data, true, true, false);

          final ChartRenderingInfo info = new
        ChartRenderingInfo(new StandardEntityCollection());

          String fname = ServletUtilities.saveChartAsJPEG(chart, 600, 400, info, session);
PrintWriter pw = new PrintWriter(out);
ChartUtilities.writeImageMap(pw, fname, info, false);
pw.flush();
String chartURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + fname;
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
</head>
<body>
<IMG SRC="<%= chartURL %>" WIDTH="600" HEIGHT="400"
BORDER="0" USEMAP="#<%= fname %>">
</body>
</html>
