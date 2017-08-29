<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">
<!--
body,div,ul,li{
margin:0 auto;
padding:0;
}
body{
text-align:center;
}
a:link{
color:#00F;
text-decoration:none;
}
a:visited {
color: #00F;
text-decoration:none;
}
a:hover {
color: #c00;
text-decoration:underline;
}
ul{
list-style:none;
}
.main{
clear:both;
padding:8px;
text-align:center;
}
/*第一种形式*/
#tabs0 {
height: 200px;
width: 400px;
border: 1px solid #cbcbcb;
background-color: #f2f6fb;
}
.menu0{
width: 400px;
}
.menu0 li{
display:block;
float: left;
padding: 4px 0;
width:100px;
text-align: center;
cursor:pointer;
background: #FFFFff;
}
.menu0 li.hover{
background: #f2f6fb;
}
#main0 ul{
display: none;
}
#main0 ul.block{
display: block;
}
</style>

<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(m,n){
var tli=document.getElementById("menu"+m).getElementsByTagName("li");
var mli=document.getElementById("main"+m).getElementsByTagName("ul");
for(i=0;i<tli.length;i++){
   tli[i].className=i==n?"hover":"";
   mli[i].style.display=i==n?"block":"none";
}
}
</script>

</head>
<body>

<div id="tabs0">
<ul class="menu0" id="menu0">
   <li onclick="setTab(0,0)" class="hover">新闻</li>
   <li onclick="setTab(0,1)">评论</li>
   <li onclick="setTab(0,2)">技术</li>
   <li onclick="setTab(0,3)">点评</li>
</ul>
<div class="main" id="main0">
   <ul class="block">
   <li>
   		新闻列表<br/>
   </li>
   </ul>
   <ul><li>评论列表</li></ul>
   <ul><li>技术列表</li></ul>
   <ul><li>点评列表</li></ul>
</div>
</div>

</body>
</html>