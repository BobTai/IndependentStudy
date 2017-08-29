<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>自我評量</title>
<script type="text/javascript">
function change()
{
	document.images[4].src="images/evaluation/d_no.png";
}
function change1()
{
	document.images[4].src="images/evaluation/d_bottom.png";
}
function change2()
{
	document.images[4].src="images/evaluation/d1.png";
}
function change3()
{
	document.images[4].src="images/evaluation/d2.png";
}
function change4()
{
	document.images[4].src="images/evaluation/d3.png";
}
function change5()
{
	document.images[4].src="images/evaluation/d4.png";
}
function change6()
{
	document.images[4].src="images/evaluation/d5.png";
}
</script>
</head>

<body>
<%@ include file="menu.jsp" %>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:700px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:898px; height:540px; background:url(images/index/index_bg.gif) repeat-y;">
		
		<fieldset style="position:relative; background:url(images/evaluation/body_head.png) no-repeat; border:0px; width:810px; height:89px;">
			
		</fieldset>

<img style="position: absolute; top: 95px; left: 102px;" src="images/evaluation/d_head.png">
<img style="position: absolute; top: 315px; left: 102px;" src="images/evaluation/d_bottom.png">


<IMG style="position: absolute; top: 95px; right: 102px;" border="0" SRC="images/evaluation/head.png" onmouseover="change()" onmouseout="change1()">
<IMG style="position: absolute; top: 275px; right: 102px;" border="0" SRC="images/evaluation/body.png">
	<form action="evaluation.jsp" method="post">
		<div style="position: absolute; top: 280px; right: 238px; z-index: 10">
		<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev002">
		<INPUT TYPE="hidden" NAME="score" VALUE="0">
		<input title="肺功能評量" TYPE="image" SRC="images/evaluation/b1.png" onmouseover="this.src='images/evaluation/b11.png';change2()" onmousedown="this.src='images/evaluation/b1.png'" onmouseout="this.src='images/evaluation/b1.png';change1()">
		</div>
	</form>
	<form action="evaluation.jsp" method="post">
		<div style="position: absolute; top: 340px; right: 235px; width: 60px; height: 45px; z-index: 10">
		<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev003">
		<INPUT TYPE="hidden" NAME="score" VALUE="0">
		<input title="心功能評量" TYPE="image" SRC="images/evaluation/b2.png" onmouseover="this.src='images/evaluation/b22.png';change3()" onmousedown="this.src='images/evaluation/b2.png'" onmouseout="this.src='images/evaluation/b2.png';change1()">
		</div>
	</form>
	<form action="evaluation.jsp" method="post">
		<div style="position: absolute; top: 400px; right: 265px; width: 60px; height: 45px; z-index: 10">
		<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev004">
		<INPUT TYPE="hidden" NAME="score" VALUE="0">
		<input title="肝功能評量" TYPE="image" SRC="images/evaluation/b3.png" onmouseover="this.src='images/evaluation/b33.png';change4()" onmousedown="this.src='images/evaluation/b3.png'" onmouseout="this.src='images/evaluation/b3.png';change1()">
		</div>
	</form>
	<form action="evaluation.jsp" method="post">
		<div style="position: absolute; top: 400px; right: 215px; width: 60px; height: 45px; z-index: 10">
		<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev001">
		<INPUT TYPE="hidden" NAME="score" VALUE="0">
		<input title="胃功能評量" TYPE="image" SRC="images/evaluation/b4.png" onmouseover="this.src='images/evaluation/b44.png';change5()" onmousedown="this.src='images/evaluation/b4.png'" onmouseout="this.src='images/evaluation/b4.png';change1()">
		</div>
	</form>
	<form action="evaluation.jsp" method="post">
		<div style="position: absolute; top: 455px; right: 245px; width: 60px; height: 45px; z-index: 10">
		<INPUT TYPE="hidden" NAME="eva_number" VALUE="ev005">
		<INPUT TYPE="hidden" NAME="score" VALUE="0">
		<input title="腎功能評量" TYPE="image" SRC="images/evaluation/b5.png" onmouseover="this.src='images/evaluation/b55.png';change6()" onmousedown="this.src='images/evaluation/b5.png'" onmouseout="this.src='images/evaluation/b5.png';change1()">
		</div>
	</form>
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
</body>
</html>