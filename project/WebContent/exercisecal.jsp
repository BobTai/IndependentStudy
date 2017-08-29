<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include file="JDBCConstants.jsp"%>
<style type="text/css">
/*Tooltips*/
.tooltips{
position:relative; 
z-index:2;
}
.tooltips:hover{
z-index:3;
width:144px;
height:79px; 
border:1px solid #969696;
}
.tooltips span{
display: none;
}
.tooltips:hover span{ 
display:block;
position:absolute;
top:15px;
left:-18px;
width:144px;
height:79px;
background:url(images/exercise/exercise.png) no-repeat;
text-align:left;
padding:28px 0 0 16px;
color:black;
}
/*Tooltips*/
/*Tooltipsb*/
.tooltipsb{
position:relative; 
z-index:2;
}
.tooltipsb:hover{
z-index:3;
background:none; 
border:1px solid #969696;
}
.tooltipsb span{
display: none;
}
.tooltipsb:hover span{ 
display:block;
position:absolute;
top:15px;
left:-105px;
width:144px;
height:79px;
background:url(images/exercise/exercise1.png) no-repeat;
text-align:left;
padding:28px 0 0 16px;
color:black;
}
/*Tooltipsb*/
<!--
li{ list-style:none}
.rolinList{position:relative; width:500px; height:auto; margin:15px auto 0 auto; text-align:left}
.rolinList li{margin-bottom:1px; background:url(images/exercise/exerciset.png) no-repeat; position:relative;}
.rolinList li h2{ width:480px; height:40px; font-size:14px; line-height:40px; padding-left:20px; color:#333; cursor:pointer}
.content{height:200px; width:500px; background:#fff;}
.content p{ margin:12px}
-->
</style>
<script type="text/javascript">
	function inRow(s,t)
	{
		if(document.f1.d[0].checked == false && document.f1.d[1].checked == false && document.f1.d[2].checked == false && document.f1.d[3].checked == false){
			alert('尚未選擇運動時段!');
			return false;
		}
		if(document.f1.weight.value==""){
			alert('您尚未填寫體重!');
			return false;
		}
		if(document.f1.num[t].value==""){
			alert('您尚未填寫運動時間數!');
			return false;
		}
		var d;
		var e;
		if(document.f1.d[0].checked == true){
			d = document.f1.d[0].value;
			e = s+"(早)";
		}
		if(document.f1.d[1].checked == true){
			d = document.f1.d[1].value;
			e = s+"(中)";
		}
		if(document.f1.d[2].checked == true){
			d = document.f1.d[2].value;
			e = s+"(午)";
		}
		if(document.f1.d[3].checked == true){
			d = document.f1.d[3].value;
			e = s+"(晚)";
		}
		var weight = parseFloat(document.f1.weight.value);
	    var table = document.getElementById(d);
	    var nextIndex = table.rows.length;
	    var nextRow = table.insertRow(nextIndex);
	    var num = parseFloat(document.f1.num[t].value);
	    var number = parseInt(document.f1.number[t].value);
	    var unit = document.f1.unit[t].value;
	    var ca = parseInt(document.f1.ca[t].value);
	    var tot = (num/number*ca/1000*weight);
	    var total = parseFloat(document.f1.totca.value);
	    total = total + tot;
	    document.f1.totca.value = total.toFixed(2);
	    nextRow.insertCell(0).innerHTML = e+"<input type=hidden name=exer value="+e+">";
	    nextRow.insertCell(1).innerHTML = num+unit+"<input type=hidden name=amount value="+num+unit+">";
	    nextRow.insertCell(2).innerHTML = tot.toFixed(2)+"大卡";
	    nextRow.insertCell(3).innerHTML = '<a href="javascript:;" onclick="return del(this)">刪除</a>';

	    if(document.f1.d[0].checked == true){
			var t1=0;
	    	for(i=0;i<nextIndex+1;i++)
	    	{
				t1 = t1+parseInt(table.rows[i].cells[2].innerText);
			}
	    	document.f1.t1.value = t1;
	    }
	    if(document.f1.d[1].checked == true){
			var t2=0;
		    for(i=0;i<nextIndex+1;i++)
		    {
				t2 = t2+parseInt(table.rows[i].cells[2].innerText);
			}
		    document.f1.t2.value = t2;
		}
	    if(document.f1.d[2].checked == true){
			var t3=0;
		    for(i=0;i<nextIndex+1;i++)
		    {
				t3 = t3+parseInt(table.rows[i].cells[2].innerText);
			}
		    document.f1.t3.value = t3;
		}
	    if(document.f1.d[3].checked == true){
			var t4=0;
		    for(i=0;i<nextIndex+1;i++)
		    {
				t4 = t4+parseInt(table.rows[i].cells[2].innerText);
			}
		    document.f1.t4.value = t4;
		}
	    return false;
	}
	function del(obj)
	{	
	  	var m = parseInt(obj.parentNode.parentNode.childNodes[2].innerText);
	  	var n = parseInt(document.f1.totca.value);
	  	document.f1.totca.value = n-m;
	  			
	    var table = obj.parentNode.parentNode.parentNode;
	    table.deleteRow(obj.parentNode.parentNode.rowIndex);
	    var nextIndex = table.rows.length;

	    if(document.f1.d[0].checked == true){
			var n1 = 0;
	    	for(i=0;i<nextIndex;i++)
	    	{
				n1 = n1+parseInt(table.rows[i].cells[2].innerText);
			}
	    	document.f1.t1.value = n1;
	    }
	    if(document.f1.d[1].checked == true){
			var n2 = 0;
	    	for(i=0;i<nextIndex;i++)
	    	{
				n2 = n2+parseInt(table.rows[i].cells[2].innerText);
			}
	    	document.f1.t2.value = n2;
	    }
	    if(document.f1.d[2].checked == true){
			var n3 = 0;
	    	for(i=0;i<nextIndex;i++)
	    	{
				n3 = n3+parseInt(table.rows[i].cells[2].innerText);
			}
	    	document.f1.t3.value = n3;
	    }
	    if(document.f1.d[3].checked == true){
			var n4 = 0;
	    	for(i=0;i<nextIndex;i++)
	    	{
				n4 = n4+parseInt(table.rows[i].cells[2].innerText);
			}
	    	document.f1.t4.value = n4;
	    }
	}

//<![CDATA[
window.onload = function() {
rolinTab("rolin")
}
function rolinTab(obj) {
var list = $(obj).getElementsByTagName("LI");
var state = {show:false,hidden:false,showObj:false};

for (var i=0; i<list.length; i++) {
var tmp = new rolinItem(list[i],state);
if (i == 0) tmp.pShow();
}
}

function rolinItem(obj,state) {
var speed = 0.0666; 
var range = 1;
var interval;
var tarH;
var tar = this;
var head = getFirstChild(obj);
var content = getNextChild(head);
var isOpen = false;
this.pHidden = function() {
if (isOpen) hidden();
}
this.pShow = show;

var baseH = content.offsetHeight;
content.style.display = "none";
var isOpen = false;

head.onmouseover = function() {
this.style.background = "url(images/exercise/exerciset1.png) no-repeat";
}

head.onmouseout = mouseout;

head.onclick = function() {
this.style.background = "url(images/exercise/exerciset1.png) no-repeat";
if (!state.show && !state.hidden) {
if (!isOpen) {
head.onmouseout = null;
show();
} else {
hidden();
}

}
}

function mouseout() {
this.style.background = "url(images/exercise/exerciset.png) no-repeat"
}
function show() {
head.style.borderBottom = "0px solid #DADADA";
state.show = true;
if (state.openObj && state.openObj != tar ) {
state.openObj.pHidden();
}
content.style.height = "0px";
content.style.display = "block";
content.style.overflow = "hidden";
state.openObj = tar;
tarH = baseH;

interval = setInterval(move,10);
}
function showS() {
isOpen = true;
state.show = false;
}

function hidden() {
state.hidden = true;
tarH = 0;
interval = setInterval(move,10);
}

function hiddenS() {
head.style.borderBottom = "none";
head.onmouseout = mouseout;
head.onmouseout();
content.style.display = "none";
isOpen = false;
state.hidden = false;
}

function move() {
var dist = (tarH - content.style.height.pxToNum())*speed;
if (Math.abs(dist) < 1) dist = dist > 0 ? 1: -1;
content.style.height = (content.style.height.pxToNum() + dist) + "px";
if (Math.abs(content.style.height.pxToNum() - tarH) <= range ) {
clearInterval(interval);
content.style.height = tarH + "px";
if (tarH != 0) {
showS()
} else {
hiddenS();
}
}
}

}
var $ = function($) {return document.getElementById($)};
String.prototype.pxToNum = function() {return Number(this.replace("px",""))}
function getFirstChild(obj) {
var result = obj.firstChild;
while (!result.tagName) {
result = result.nextSibling;
}
return result;
}

function getNextChild(obj) {
var result = obj.nextSibling;
while (!result.tagName) {
result = result.nextSibling;
}
return result;
}
//]]>
</script>
</head>
<body>
<%@ include file="menu.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:800px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="width:988px; height:700px; background:url(images/index/inside_bg.gif) repeat-y;">
		<img src="images/exercise/etitle.png">
<form action="exer_to_resume.jsp" name="f1" method="post">
<table><tr><td width=520 style="position:relative;">

<div style="position:relative; background:url(images/exercise/exercisesele.png) no-repeat; width:496px; height:50px;">
	<INPUT style="position:absolute; top:15px; left:160px;" TYPE="radio" name=d id=d value=tid>
	<INPUT style="position:absolute; top:15px; left:240px;" TYPE="radio" name=d id=d value=tid1>
	<INPUT style="position:absolute; top:15px; left:320px;" TYPE="radio" name=d id=d value=tid2>
	<INPUT style="position:absolute; top:15px; left:400px;" TYPE="radio" name=d id=d value=tid3>
</div>

<table><tr>
<td width=250>
<div style="position:relative; background:url(images/exercise/weight.png) no-repeat; width:241px; height:133px; margin-top:15px">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name1 = session.getAttribute("username").toString();
	String sql = "SELECT weight from member where account = '"+name1+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.first();
%>
	<INPUT style="width:30px; position:absolute; top:51px; left:102px; font-size:20px" TYPE="text" id=weight value="<%=rs.getInt("weight") %>">
<%}else{ %>	
	<INPUT style="width:30px; position:absolute; top:51px; left:102px; font-size:20px" TYPE="text" id=weight>
<%} %>
</div>
</td>
<td width=250>
<div style="position:relative; background:url(images/exercise/etotal.png) no-repeat; width:241px; height:133px; margin-top:15px">
		<input style="background:url(totalb.png) no-repeat; position:absolute; top:52px; left:87px; border:0; width:61px; font-size:25px" type="text" name="totca" id="totca" value="0">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name1 = session.getAttribute("username").toString();	
%>				
		<input type="hidden" id=name name="name" value="<%=name1 %>">
		<input type="image" name="submit" value=123 src="images/exercise/esave.png" style="position:absolute; bottom:12px; right:73px;">
<%}else{ %>	
		<input title="您尚未登入會員!" type="image" name="submit" src="images/exercise/esave.png" style="position:absolute; bottom:12px; right:73px;" disabled>
<%} %>	
</div>
</td>
</tr></table>

<ul class="rolinList" id="rolin">
  <li>
    <h2>極輕度運動</h2>
    <div class="content">  
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>   	
      	<table>   	
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>醒臥</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('醒臥',0)">
      		<BR/>1公斤/1小時/0.1大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>靜坐</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('靜坐',1)">
      		<BR/>1公斤/1小時/0.4大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>寫字</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('寫字',2)">
      		<BR/>1公斤/1小時/0.4大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>朗讀</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('朗讀',3)">
      		<BR/>1公斤/1小時/0.4大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>靜立</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('靜立',4)">
      		<BR/>1公斤/1小時/0.5大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="500"/>
			</td>
      	</tr>
 	    <tr height=30>
 	    	<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>聽音樂</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('聽音樂',5)">
      		<BR/>1公斤/1小時/0.3大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="300"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>溜狗</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('溜狗',6)">
      		<BR/>1公斤/1小時/0.6大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="600"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>立正</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('立正',7)">
      		<BR/>1公斤/1小時/0.6大卡</span></span>
			
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="600"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>穿衣</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('穿衣',8)">
      		<BR/>1公斤/1小時/0.7大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="700"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>手縫衣</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('手縫衣',9)">
      		<BR/>1公斤/1小時/0.4大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="400"/>
			</td>
      	</tr>
 	    <tr height=30>
 	    	<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>縫衣機</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('縫衣機',10)">
      		<BR/>1公斤/1小時/0.6大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="600"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>大聲唱歌</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('大聲唱歌',11)">
      		<BR/>1公斤/1小時/0.8大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="800"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>拉小提琴</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('拉小提琴',12)">
      		<BR/>1公斤/1小時/0.6大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="600"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>彈鋼琴</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('彈鋼琴',13)">
      		<BR/>1公斤/1小時/0.8大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="800"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>看電影</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('看電影',14)">
      		<BR/>1公斤/1小時/0.3大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="300"/>
			</td>
      	</tr>
 	    <tr height=30>
 	    	<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>購物</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('購物',15)">
      		<BR/>1公斤/1小時/0.7大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="700"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>上樓</font><span>數量:<input type="text" id="num" size=1 value=""/>階
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('上樓',16)">
      		<BR/>15階/0.036大卡</span></span>
			
      		<input type="hidden" id="number" value="15"/>
			<input type="hidden" id="unit" value="階"/>
			<input type="hidden" id="ca" value="36"/>
			</td>
      	</tr>
      	</table> 
      	<p>&nbsp;</p><p>&nbsp;</p>
    </div>  		
    </div>
  </li>
  <li>
    <h2>輕度運動</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>     	
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>慢走</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('慢走',17)">
      		<BR/>1公斤/1小時/2大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="2000"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>洗衣</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('洗衣',18)">
      		<BR/>1公斤/1小時/1.3大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="1300"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>吸塵器</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('吸塵器',19)">
      		<BR/>1公斤/1小時/2.7大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="2700"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>熨衣服</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('熨衣服',20)">
      		<BR/>1公斤/1小時/1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="1000"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>掃地</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('掃地',21)">
      		<BR/>1公斤/1小時/1.4大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="1400"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>打字</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('打字',22)">
      		<BR/>1公斤/1小時/1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="1000"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>玩紙牌</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('玩紙牌',23)">
      		<BR/>1公斤/1小時/2.3大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="2300"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>洗碗</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('洗碗',24)">
      		<BR/>1公斤/1小時/1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="1000"/>
			</td>
      	</tr>
      	
      	</table>
    </DIV>
    </div>
  </li>
  <li>
    <h2>中度運動</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>快走</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('快走',25)">
      		<BR/>1公斤/1小時/6.4大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="6400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>鋸木</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('鋸木',26)">
      		<BR/>1公斤/1小時/5.7大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="5700"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>騎馬</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('騎馬',27)">
      		<BR/>1公斤/1小時/5.1大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="5100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>溜輪鞋</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('溜輪鞋',28)">
      		<BR/>1公斤/1小時/5.1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="5100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>乒乓球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('乒乓球',29)">
      		<BR/>1公斤/1小時/5.3大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="5300"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>腳踏車</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('腳踏車',30)">
      		<BR/>1公斤/1小時/2.5大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="2500"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>排球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('排球',31)">
      		<BR/>1公斤/1小時/5.1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="5100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>跳舞</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('跳舞',32)">
      		<BR/>1公斤/1小時/5.1大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="5100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>羽毛球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('羽毛球',33)">
      		<BR/>1公斤/1小時/5.1大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="5100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>高爾夫球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('高爾夫球',34)">
      		<BR/>1公斤/1小時/3.7大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="3700"/>
			</td>
      	</tr>  	
    	</table>
    
    	<P>&nbsp;</P><P>&nbsp;</P>
    </DIV>
    </div>
  </li>
  <li>
    <h2>重度運動</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>跑步</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('跑步',35)">
      		<BR/>1公斤/1小時/7大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="7000"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>游泳</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('游泳',36)">
      		<BR/>1公斤/1小時/7.9大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="7900"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>籃球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('籃球',37)">
      		<BR/>1公斤/1小時/13.8大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="13800"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>划船比賽</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('划船比賽',38)">
      		<BR/>1公斤/1小時/12.4大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="12400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>騎腳踏車</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('騎腳踏車',39)">
      		<BR/>1公斤/1小時/9.7大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="9700"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>拳擊</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('拳擊',40)">
      		<BR/>1公斤/1小時/11.4大卡</span></span>
      		
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="11400"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>柔道</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('柔道',41)">
      		<BR/>1公斤/1小時/19.2大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>
			<input type="hidden" id="ca" value="19200"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>跳繩</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('跳繩',42)">
      		<BR/>1公斤/1小時/16.2大卡</span></span>
			
			<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="16200"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>網球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('網球',43)">
      		<BR/>1公斤/1小時/10.9大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="10900"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltipsb"><font>手球</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('手球',44)">
      		<BR/>1公斤/1小時/8.8大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="8800"/>
			</td>
			
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/exercise/exercisetd.png) no-repeat">
      		<span class="tooltips"><font>勿點選</font><span>時間:<input type="text" id="num" size=1 value=""/>分鐘
      		<img style="position:absolute; top:31px; right:30px" src="images/exercise/add_icon1.png" onclick="return inRow('勿點選',45)">
      		<BR/>1公斤/1小時/8.8大卡</span></span>
			
      		<input type="hidden" id="number" value="60"/>
			<input type="hidden" id="unit" value="分鐘"/>			
			<input type="hidden" id="ca" value="8800"/>
			</td>
      	</tr>  	
    	</table>

    	<P>&nbsp;</P><P>&nbsp;</P>
    </DIV>
    </div>
  </li>
</ul>
</td>
<td width=420>
<div style="position:relative; background:url(images/exercise/emorning.png) no-repeat; width:402px; height:135px;">
<input style="position:absolute; top:13px; right:20px;  background:url(calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t1" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 75px; margin-top:40px" align=center>
		<table width="300" id="tid">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/exercise/emidday.png) no-repeat; width:402px; height:135px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t2" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 75px; margin-top:40px" align=center>
		<table width="300" id="tid1">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/exercise/eafternoon.png) no-repeat; width:402px; height:135px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t3" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 75px; margin-top:40px" align=center>
		<table width="300" id="tid2">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/exercise/enight.png) no-repeat; width:402px; height:135px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t4" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 75px; margin-top:40px" align=center>
		<table width="300" id="tid3">
	
		</table>
	</DIV>
</div>
</td>
</tr>
</table>
</form>
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


</body>
</html>