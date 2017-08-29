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
background:url(images/food/food.png) no-repeat;
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
left:-90px;
width:144px;
height:79px;
background:url(images/food/food1.png) no-repeat;
text-align:left;
padding:28px 0 0 16px;
color:black;
}
/*Tooltipsb*/
<!--
li{ list-style:none}
.rolinList{position:relative; width:500px; height:auto; margin:15px auto 0 auto; text-align:left}
.rolinList li{margin-bottom:1px; background:url(images/food/foodt.png) no-repeat; position:relative;}
.rolinList li h2{ width:480px; height:40px; font-size:14px; line-height:40px; padding-left:20px; color:#333; cursor:pointer}
.content{height:200px; width:500px; background:#fff;}
.content p{ margin:12px}
-->
</style>
<script type="text/javascript">
	function inRow(s,t)
	{
		if(document.f1.d[0].checked == false && document.f1.d[1].checked == false && document.f1.d[2].checked == false && document.f1.d[3].checked == false){
			alert('尚未選擇用餐時段!');
			return false;
		}
		if(document.f1.num[t].value==""){
			alert('尚未填寫數量!');
			return false;
		}
		var d;
		var f;
		if(document.f1.d[0].checked == true){
			d = document.f1.d[0].value;
			f = s+"(早)";
		}
		if(document.f1.d[1].checked == true){
			d = document.f1.d[1].value;
			f = s+"(中)";
		}
		if(document.f1.d[2].checked == true){
			d = document.f1.d[2].value;
			f = s+"(晚)";
		}
		if(document.f1.d[3].checked == true){
			d = document.f1.d[3].value;
			f = s+"(點心)";
		}
	    var table = document.getElementById(d);
	    var nextIndex = table.rows.length;
	    var nextRow = table.insertRow(nextIndex);
	    var num = parseFloat(document.f1.num[t].value);
	    var number = parseInt(document.f1.number[t].value);
	    var unit = document.f1.unit[t].value;
	    var ca = parseInt(document.f1.ca[t].value);
	    var tot = num/number*ca;
	    var total = parseFloat(document.f1.totca.value);
	    total = total + tot;
	    document.f1.totca.value = total.toFixed(0);
	    nextRow.insertCell(0).innerHTML = f+"<input type=hidden name=food value="+f+">";
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
this.style.background = "url(images/food/foodt1.png) no-repeat";
}

head.onmouseout = mouseout;

head.onclick = function() {
this.style.background = "url(images/food/foodt1.png) no-repeat";
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
this.style.background = "url(images/food/foodt.png) no-repeat"
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
	<div style="width:990px; height:910px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div style="width:988px; height:810px; background:url(images/index/inside_bg.gif) repeat-y;">
		<img src="images/food/ftitle.png">
<form name="f1" method="post" action="food_to_resume.jsp">
<table><tr><td width=520 style="position:relative;">

<div style="position:relative; background:url(images/food/foodsele.png) no-repeat; width:496px; height:50px;">
	<INPUT style="position:absolute; top:15px; left:160px;" TYPE="radio" name=d id=d value=tid>
	<INPUT style="position:absolute; top:15px; left:240px;" TYPE="radio" name=d id=d value=tid1>
	<INPUT style="position:absolute; top:15px; left:320px;" TYPE="radio" name=d id=d value=tid2>
	<INPUT style="position:absolute; top:15px; left:400px;" TYPE="radio" name=d id=d value=tid3>
</div>

<div style="position:relative; background:url(images/food/total.png) no-repeat; width:241px; height:133px; margin-top:15px">
	<input style="background:url(images/food/totalb.png) no-repeat; position:absolute; top:52px; left:87px; border:0; width:60px; font-size:25px" type="text" name="totca" id="totca" value="0">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name1 = session.getAttribute("username").toString();	
%>		
	<input type="hidden" id=name name="name" value="<%=name1 %>">
	<input type="image" name="submit" src="images/food/save.png" style="position:absolute; bottom:12px; right:73px;">
<%}else{ %>	
	<input title="您尚未登入會員!" type="image" name="submit" src="images/food/save.png" style="position:absolute; bottom:12px; right:73px;" disabled>
<%} %>	
</div>

<ul class="rolinList" id="rolin">
  <li>
    <h2>五穀根莖類</h2>
    <div class="content">  
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>   	
      	<table>   	
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat"><span class="tooltips"><font>白飯</font>
      		<span>數量:<input type="text" id="num" size=1/>碗<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('白飯',0)"><BR/>1碗(200克)/280大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="碗"/>
			<input type="hidden" id="ca" value="280"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat"><span class="tooltips"><font>稀飯</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>碗<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('稀飯',1)"><BR/>1碗(250克)/140大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="碗"/>
			<input type="hidden" id="ca" value="140"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat"><span class="tooltips"><font>麵條</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>碗<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('麵條',2)"><BR/>1碗(120克)/140大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="碗"/>
			<input type="hidden" id="ca" value="140"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat"><span class="tooltips"><font>吐司麵包</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>片<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('吐司麵包',3)"><BR/>1片(25克)/70大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="片"/>
			<input type="hidden" id="ca" value="70"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat"><span class="tooltipsb"><font>漢堡麵包</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>個<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('漢堡麵包',4)"><BR/>1個(50克)/140大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="個"/>
			<input type="hidden" id="ca" value="140"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>饅頭</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>個
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('饅頭',5)">
			<BR/>1個(120克)/280大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="個"/>
			<input type="hidden" id="ca" value="280"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>馬鈴薯</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>個
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('馬鈴薯',6)">
			<BR/>1個(180克)/140大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="個"/>
			<input type="hidden" id="ca" value="140"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>紅豆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('紅豆',7)">
			<BR/>100克/350大卡</span></span>
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="350"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>綠豆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('綠豆',8)">
			<BR/>100克/350大卡</span></span>
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="350"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>大紅豆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('大紅豆',9)">
			<BR/>100克/350大卡</span></span>
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="350"/>
			</td>
		</tr>
		<tr height=30>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>油條</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>根
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('油條',10)">
			<BR/>1根(35克)/70大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="根"/>
			<input type="hidden" id="ca" value="70"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>餃子皮</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>張
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('餃子皮',11)">
			<BR/>1張/17大卡</span></span>
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="張"/>
			<input type="hidden" id="ca" value="17"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬血糕</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬血糕',12)">
			<BR/>100克/233大卡</span></span>
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="233"/>
			</td>
		</tr>
      	</table> 
    </div>  		
    </div>
  </li>
  <li>
    <h2>蛋豆類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>     	
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>全蛋</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>顆
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('全蛋',13)">
			<BR/>1顆(55克)/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="顆"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆腐</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆腐',14)">
			<BR/>1兩/19大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="19"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>素雞</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('素雞',15)">
			<BR/>1兩/41大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="41"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆干</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆干',16)">
			<BR/>1兩/46大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="46"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>麵腸</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('麵腸',17)">
			<BR/>1兩/52大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="52"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆漿</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>杯
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆漿',18)">
			<BR/>1杯(240毫升)/55大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="杯"/>
			<input type="hidden" id="ca" value="55"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>油豆腐</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('油豆腐',19)">
			<BR/>1兩/59大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="59"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆腐乳</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆腐乳',20)">
			<BR/>1兩/69大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="69"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆包</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆包',21)">
			<BR/>1兩/82大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="82"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>干絲</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('干絲',22)">
			<BR/>1兩/82大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="82"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>百頁</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('百頁',23)">
			<BR/>1兩/82大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="82"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>百頁結</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('百頁結',24)">
			<BR/>1兩/82大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="82"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>黃豆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('黃豆',25)">
			<BR/>1兩/103大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="103"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豆皮</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豆皮',26)">
			<BR/>1兩/138大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="138"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>麵筋泡</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('麵筋泡',27)">
			<BR/>1兩/225大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="225"/>
			</td>
      	</tr>
      	</table>
    </DIV>
    </div>
  </li>
  <li>
    <h2>魚肉類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>
    	<tr height=30>
    		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>火腿</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('火腿',28)">
			<BR/>50克/61大卡</span></span>
    		
      		<input type="hidden" id="number" value="50"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="61"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>蝦米</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('蝦米',29)">
			<BR/>50克/225大卡</span></span>
			
      		<input type="hidden" id="number" value="50"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="225"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>小魚干</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('小魚干',30)">
			<BR/>50克/225大卡</span></span>
			
      		<input type="hidden" id="number" value="50"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="225"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>一般魚類</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('一般魚類',31)">
			<BR/>1兩/59大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="59"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>牡蠣</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('牡蠣',32)">
			<BR/>1兩/32大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="32"/>
			</td>
    	</tr>
    	<tr height=30>
    		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>文蛤</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('文蛤',33)">
			<BR/>1兩/35大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="35"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>雞腿</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('雞腿',34)">
			<BR/>1兩/59大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="59"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>雞翅</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('雞翅',35)">
			<BR/>1兩/75大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>雞排</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('雞排',36)">
			<BR/>1兩/75大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>鱈魚</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('鱈魚',37)">
			<BR/>1兩/56大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="56"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬大里肌</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬大里肌',38)">
			<BR/>1兩/59大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="59"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬肚</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬肚',39)">
			<BR/>1兩/56大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="56"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬後腿肉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬後腿肉',40)">
			<BR/>1兩/80大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="80"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬肉鬆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬肉鬆',41)">
			<BR/>1兩/103大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="103"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>豬肉酥</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬肉酥',42)">
			<BR/>1兩/103大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="103"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>梅花肉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('梅花肉',43)">
			<BR/>1兩/112大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="112"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>豬前腿肉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬前腿肉',44)">
			<BR/>1兩/112大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="112"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>五花肉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('五花肉',45)">
			<BR/>1兩/112大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="112"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>臘肉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('臘肉',46)">
			<BR/>1兩/113大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="113"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>豬蹄膀</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬蹄膀',47)">
			<BR/>1兩/127大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="127"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>香腸</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('香腸',48)">
			<BR/>1兩/127大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="127"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>培根</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>兩
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('培根',49)">
			<BR/>1兩/180大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="兩"/>
			<input type="hidden" id="ca" value="180"/>
			</td>
      	</tr>
    	</table>
    	#除了豬肉鬆與豬肉酥外，其他皆為生食(未料理)的熱量。
    	<P>&nbsp;</P><P>&nbsp;</P>
    </DIV>
    </div>
  </li>
  <li>
    <h2>蔬菜類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
    	<table>
    	<tr height=30>
    		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>冬瓜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('冬瓜',50)">
			<BR/>300克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>白莧菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('白莧菜',51)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>花菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('花菜',52)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>絲瓜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('絲瓜',53)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>苦瓜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('苦瓜',54)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>空心菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('空心菜',55)">
			<BR/>300克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>小白菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('小白菜',56)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>綠竹筍</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('綠竹筍',57)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>大白菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('大白菜',58)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>金針</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('金針',59)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>綠豆芽</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('綠豆芽',60)">
			<BR/>300克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>西洋菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('西洋菜',61)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>青江菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('青江菜',62)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>油菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('油菜',63)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>韭菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('韭菜',64)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>高麗菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('高麗菜',65)">
			<BR/>300克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>四季豆</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('四季豆',66)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>菠菜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('菠菜',67)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>草菇</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('草菇',68)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>黃豆芽</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('黃豆芽',69)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
      	</tr>
      		<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>蘆筍</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('蘆筍',70)">
			<BR/>300克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>小黃瓜</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('小黃瓜',71)">
			<BR/>300克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="300"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
      	</tr>
      	</table>
      	<P>&nbsp;</P><P>&nbsp;</P>
    </DIV>
    </div>
  </li>
  <li>
    <h2>水果類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
      	<table>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>紅柿</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('紅柿',72)">
			<BR/>100克/86大卡</span></span>
      		
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="86"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>硬柿</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('硬柿',73)">
			<BR/>100克/67大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="67"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>李子</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('李子',74)">
			<BR/>100克/41大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="41"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>蘋果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('蘋果',75)">
			<BR/>100克/55大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="55"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>葡萄</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('葡萄',76)">
			<BR/>100克/60大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="60"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>葡萄柚</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('葡萄柚',77)">
			<BR/>100克/43大卡</span></span>
      		
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="43"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>楊桃</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('楊桃',78)">
			<BR/>100克/33大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="33"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>百香果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('百香果',79)">
			<BR/>100克/100大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="100"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>櫻桃</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('櫻桃',80)">
			<BR/>100克/75大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>橘子</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('橘子',810)">
			<BR/>100克/52大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="52"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>荔枝</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('荔枝',82)">
			<BR/>100克/67大卡</span></span>
      		
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="67"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>枇杷</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('枇杷',83)">
			<BR/>100克/48大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="48"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>香蕉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('香蕉',84)">
			<BR/>100克/109大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="109"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>加州李</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('加州李',85)">
			<BR/>100克/50大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="50"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>蓮霧</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('蓮霧',86)">
			<BR/>100克/27大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="27"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>龍眼</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('龍眼',87)">
			<BR/>100克/75大卡</span></span>
      		
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="75"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>芒果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('芒果',88)">
			<BR/>100克/60大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="60"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>鳳梨</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('鳳梨',89)">
			<BR/>100克/48大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="48"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>柳丁</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('柳丁',90)">
			<BR/>100克/46大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="46"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>奇異果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('奇異果',91)">
			<BR/>100克/55大卡</span></span>
			
      		<input type="hidden" id="number" value="100"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="55"/>
			</td>
      	</tr>
      	</table>
      	#份量計算以去皮、去籽後可食量計算。
      	<P>&nbsp;</P><P>&nbsp;</P>
    </DIV>
    </div>
  </li>
  <li>
    <h2>油脂類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
      	<table>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>大豆油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('大豆油',92)">
			<BR/>1湯匙/15大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>玉米油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('玉米油',93)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>葵花子油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('葵花子油',94)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>花生油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('花生油',95)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>豬油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('豬油',96)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>牛油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('牛油',97)">
			<BR/>1湯匙/15大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>麻油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('麻油',98)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>椰子油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('椰子油',99)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>瑪琪琳</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('瑪琪琳',100)">
			<BR/>1湯匙/15大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="15"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>鮮奶油</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>克
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('鮮奶油',101)">
			<BR/>50克/150大卡</span></span>
			
      		<input type="hidden" id="number" value="50"/>
			<input type="hidden" id="unit" value="克"/>
			<input type="hidden" id="ca" value="150"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>腰果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>粒
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('腰果',102)">
			<BR/>10粒/90大卡</span></span>
      		
      		<input type="hidden" id="number" value="10"/>
			<input type="hidden" id="unit" value="粒"/>
			<input type="hidden" id="ca" value="90"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>花生</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>粒
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('花生',103)">
			<BR/>10粒/45大卡</span></span>
			
      		<input type="hidden" id="number" value="10"/>
			<input type="hidden" id="unit" value="粒"/>
			<input type="hidden" id="ca" value="45"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>開心果</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>粒
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('開心果',104)">
			<BR/>10粒/45大卡</span></span>
			
      		<input type="hidden" id="number" value="10"/>
			<input type="hidden" id="unit" value="粒"/>
			<input type="hidden" id="ca" value="45"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>核桃仁</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>粒
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('核桃仁',105)">
			<BR/>10粒/225大卡</span></span>
			
      		<input type="hidden" id="number" value="10"/>
			<input type="hidden" id="unit" value="粒"/>
			<input type="hidden" id="ca" value="225"/>
			</td>
      	</tr>
      	</table>
    </DIV>
    </div>
  </li>
  <li>
    <h2>奶類</h2>
    <div class="content">
    <DIV style="margin-top:10px; margin-left:5px; position:relative; OVERFLOW: scroll; overflow-x:hidden; WIDTH: 490px; HEIGHT: 190px; font-size:12px" align=center>
      	<table>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>脫脂奶</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>杯
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('脫脂奶',106)">
			<BR/>1杯/80大卡</span></span>
      		
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="杯"/>
			<input type="hidden" id="ca" value="80"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>低脂奶</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>杯
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('低脂奶',107)">
			<BR/>1杯/120大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="杯"/>
			<input type="hidden" id="ca" value="120"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>全脂奶</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>杯
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('全脂奶',108)">
			<BR/>1杯/150大卡</span></span>
			
      		<input type="hidden" id="number" value="1"/>
			<input type="hidden" id="unit" value="杯"/>
			<input type="hidden" id="ca" value="150"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>脫脂奶粉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('脫脂奶粉',109)">
			<BR/>3湯匙/80大卡</span></span>
			
      		<input type="hidden" id="number" value="3"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="80"/>
			</td>
			<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltipsb"><font>低脂奶粉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('低脂奶粉',110)">
			<BR/>3湯匙/120大卡</span></span>
			
      		<input type="hidden" id="number" value="3"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="120"/>
			</td>
      	</tr>
      	<tr height=30>
      		<td width=95 style="padding-top:5px; background:url(images/food/foodtd.png) no-repeat">
      		<span class="tooltips"><font>全脂奶粉</font>
			<span>數量:<input type="text" id="num" size=1 value=""/>湯匙
			<img style="position:absolute; top:30px; right:35px;" src="images/food/add_icon.png" onclick="inRow('全脂奶粉',111)">
			<BR/>3湯匙/150大卡</span></span>
			
      		<input type="hidden" id="number" value="3"/>
			<input type="hidden" id="unit" value="湯匙"/>
			<input type="hidden" id="ca" value="150"/>
			</td>
      	</tr>
      	</table>
    </DIV>
    </div>
  </li>
</ul>
</td>
<td width=420>
<div style="position:relative; background:url(images/food/foodbreak.png) no-repeat; width:402px; height:161px;">
<input style="position:absolute; top:13px; right:20px;  background:url(images/food/calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t1" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 98px; margin-top:40px" align=center>
		<table width="300" id="tid">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/food/foodlunch.png) no-repeat; width:402px; height:161px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(images/food/calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t2" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 98px; margin-top:40px" align=center>
		<table width="300" id="tid1">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/food/fooddinner.png) no-repeat; width:402px; height:161px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(images/food/calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t3" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 98px; margin-top:40px" align=center>
		<table width="300" id="tid2">
	
		</table>
	</DIV>
</div>
<div style="position:relative; background:url(images/food/foodcake.png) no-repeat; width:402px; height:161px; margin-top:15px">
<input style="position:absolute; top:13px; right:20px;  background:url(images/food/calb.png) no-repeat; border:0px; width:50px; font-size:18px" type="text" id="t4" value="0" disabled>
	<DIV style="OVERFLOW: scroll; overflow-x:hidden; WIDTH: 400px; HEIGHT: 98px; margin-top:40px" align=center>
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