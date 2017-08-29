<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>飲食營養計算</title>

<style type="text/css">
<!--
body,div,ul,li{
margin:0 auto;
padding:0;
}
.main{
clear:both;
padding:8px;
text-align:center;
}

#tabs0 {
height: 193px;
width: 930px;
background:url(images/food/food_choice_table.png) no-repeat;
}
.menu0{
width: 930px;
}
.menu0 li{
display:block;
float: left;
padding: 4px 0;
width:93px;
text-align: center;
background:url(images/food/food_title.png) no-repeat;
cursor:pointer;
}
.menu0 li.hover{
background:url(images/food/food_title1.png) no-repeat;
color:#ffffff;
}
#main0 ul{
display: none;
}
#main0 ul.block{
display: block;
}
</style>

</head>
<body>
<%@ include file="JDBCConstants.jsp"%>
<%@ include file="menu.jsp"%>
<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:990px; height:800px; margin:0 auto 0 auto">
		<div style="width:988px; height:13px; background:url(images/index/inside_top.gif) no-repeat;">
		</div>
		<div align=left style="position:relative; width:988px; height:715px; background:url(images/index/inside_bg.gif) repeat-y;">
		<img style="position:absolute; top:5px; right:30px;" src="images/food/use_method.png"
		onclick="window.open('menu_method.jsp', 'newwindow', 'height=165, width=870, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
<script>
<!--
function setTab(m,n){
var tli=document.getElementById("menu"+m).getElementsByTagName("li");
var mli=document.getElementById("main"+m).getElementsByTagName("ul");
for(i=0;i<tli.length;i++){
   tli[i].className=i==n?"hover":"";
   mli[i].style.display=i==n?"block":"none";
}
}
</script>		
		<div id="tabs0" style="position:absolute; top:52px; left:29px">
			<ul style="list-style:none; font-weight:bold;" class="menu0" id="menu0">
   				<li onclick="setTab(0,0)" class="hover">穀物類</li>
   				<li onclick="setTab(0,1)">澱粉類</li>
   				<li onclick="setTab(0,2)">蔬菜類</li>
   				<li onclick="setTab(0,3)">水果類</li>
   				<li onclick="setTab(0,4)">蛋類</li>
   				<li onclick="setTab(0,5)">豆類</li>
   				<li onclick="setTab(0,6)">魚貝類</li>
   				<li onclick="setTab(0,7)">肉類</li>
   				<li onclick="setTab(0,8)">油脂類</li>
   				<li onclick="setTab(0,9)">奶類</li>
			</ul>		
			<div class="main" id="main0">
   				<ul style="list-style:none;" class="block">
  					<li style="position:relative;">
  						<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql1 = "SELECT * from food where type = '穀物類'";
   						ResultSet rs1 = smt.executeQuery(sql1);
   						rs1.last();
   						int count1=rs1.getRow();
   						rs1.first();  						
   						for(int i=0; i<count1; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs1.getString("food_name")%>

<script type="text/javascript">
function count(tid,food,cal,car,prot,fat,Ca,P,Fe,Zn,vitA,vitB1,vitB2,vitB6,vitB12,vitC,vitE,nic){
	var table = document.getElementById(tid);
    var nextIndex = table.rows.length;
    var nextRow = table.insertRow(nextIndex);
    if(tid=="tid1"){nextRow.insertCell(0).innerHTML = food+'(早)<input type=hidden name=food id=food value='+food+'(早)>';}
    if(tid=="tid2"){nextRow.insertCell(0).innerHTML = food+'(中)<input type=hidden name=food id=food value='+food+'(中)>';}
    if(tid=="tid3"){nextRow.insertCell(0).innerHTML = food+'(晚)<input type=hidden name=food id=food value='+food+'(晚)>';}
    nextRow.insertCell(1).innerHTML = '<input style="width:20px" type=text name=num value=1 onkeyup="modify(this.value, this)">份';
    nextRow.insertCell(2).innerHTML = '<a href="javascript:;" onclick="return del(this)">刪除</a>';
    nextRow.insertCell(3).innerHTML = cal;
    nextRow.insertCell(4).innerHTML = 1;
    nextRow.insertCell(5).innerHTML = car;
    nextRow.insertCell(6).innerHTML = prot;
    nextRow.insertCell(7).innerHTML = fat;
    nextRow.insertCell(8).innerHTML = Ca;
    nextRow.insertCell(9).innerHTML = P;
    nextRow.insertCell(10).innerHTML = Fe;
    nextRow.insertCell(11).innerHTML = Zn;
    nextRow.insertCell(12).innerHTML = vitA;
    nextRow.insertCell(13).innerHTML = vitB1;
    nextRow.insertCell(14).innerHTML = vitB2;
    nextRow.insertCell(15).innerHTML = vitB6;
    nextRow.insertCell(16).innerHTML = vitB12;
    nextRow.insertCell(17).innerHTML = vitC;
    nextRow.insertCell(18).innerHTML = vitE;
    nextRow.insertCell(19).innerHTML = nic;
    //熱量新增
    var o_cal = parseFloat(document.getElementById('cal1').value);
    var n_cal = (o_cal+cal).toFixed(0);
    var b_cal = parseFloat(document.getElementById('cal').value)*0.1;
    if(n_cal > b_cal){document.getElementById('cal1').style.color='red';document.getElementById('cal11').style.color='red';}
    if(n_cal >= -b_cal && n_cal <= b_cal){document.getElementById('cal1').style.color='green';document.getElementById('cal11').style.color='green';}
    if(n_cal < -b_cal){document.getElementById('cal1').style.color='blue';document.getElementById('cal11').style.color='blue';}
    document.getElementById('cal1').value = n_cal;
    //醣類新增
    var o_car = parseFloat(document.getElementById('n11').value);
    var n_car = (o_car+car).toFixed(1);
    var b_car = parseFloat(document.getElementById('n1').value)*0.1;
    if(n_car > b_car){document.getElementById('n11').style.color='red';document.getElementById('n111').style.color='red';}
    if(n_car >= -b_car && n_car <= b_car){document.getElementById('n11').style.color='green';document.getElementById('n111').style.color='green';}
    if(n_car < -b_cal){document.getElementById('n11').style.color='blue';document.getElementById('n111').style.color='blue';}
    document.getElementById('n11').value = n_car;
  	//蛋白質新增
    var o_prot = parseFloat(document.getElementById('n22').value);
    var n_prot = (o_prot+prot).toFixed(1);
    var b_prot = parseFloat(document.getElementById('n2').value)*0.1;
    if(n_prot > b_prot){document.getElementById('n22').style.color='red';document.getElementById('n222').style.color='red';}
    if(n_prot >= -b_prot && n_prot <= b_prot){document.getElementById('n22').style.color='green';document.getElementById('n222').style.color='green';}
    if(n_prot < -b_cal){document.getElementById('n22').style.color='blue';document.getElementById('n222').style.color='blue';}
    document.getElementById('n22').value = n_prot;
    //脂質
    var o_fat = parseFloat(document.getElementById('n33').value);
    var n_fat = (o_fat+fat).toFixed(1);
    var b_fat = parseFloat(document.getElementById('n3').value)*0.1;
    if(n_fat > b_fat){document.getElementById('n33').style.color='red';document.getElementById('n333').style.color='red';}
    if(n_fat >= -b_fat && n_fat <= b_fat){document.getElementById('n33').style.color='green';document.getElementById('n333').style.color='green';}
    if(n_fat < -b_cal){document.getElementById('n33').style.color='blue';document.getElementById('n333').style.color='blue';}
    document.getElementById('n33').value = n_fat;
  	//鈣
    var o_Ca = parseFloat(document.getElementById('Ca1').value);
    var n_Ca = (o_Ca+Ca).toFixed(0);
    var b_Ca = parseFloat(document.getElementById('Ca').value)*0.1;
    if(n_Ca > b_Ca){document.getElementById('Ca1').style.color='red';document.getElementById('Ca11').style.color='red';}
    if(n_Ca >= -b_Ca && n_Ca <= b_Ca){document.getElementById('Ca1').style.color='green';document.getElementById('Ca11').style.color='green';}
    if(n_Ca < -b_cal){document.getElementById('Ca1').style.color='blue';document.getElementById('Ca11').style.color='blue';}
    document.getElementById('Ca1').value = n_Ca;
  	//磷
    var o_P = parseFloat(document.getElementById('P1').value);
    var n_P = (o_P+P).toFixed(0);
    var b_P = parseFloat(document.getElementById('P').value)*0.1;
    if(n_P > b_P){document.getElementById('P1').style.color='red';document.getElementById('P11').style.color='red';}
    if(n_P >= -b_P && n_P <= b_P){document.getElementById('P1').style.color='green';document.getElementById('P11').style.color='green';}
    if(n_P < -b_P){document.getElementById('P1').style.color='blue';document.getElementById('P11').style.color='blue';}
    document.getElementById('P1').value = n_P;
  	//鐵
    var o_Fe = parseFloat(document.getElementById('Fe1').value);
    var n_Fe = (o_Fe+Fe).toFixed(1);
    var b_Fe = parseFloat(document.getElementById('Fe').value)*0.1;
    if(n_Fe > b_Fe){document.getElementById('Fe1').style.color='red';document.getElementById('Fe11').style.color='red';}
    if(n_Fe >= -b_Fe && n_Fe <= b_Fe){document.getElementById('Fe1').style.color='green';document.getElementById('Fe11').style.color='green';}
    if(n_Fe < -b_Fe){document.getElementById('Fe1').style.color='blue';document.getElementById('Fe11').style.color='blue';}
    document.getElementById('Fe1').value = n_Fe;
  	//鋅
    var o_Zn = parseFloat(document.getElementById('Zn1').value);
    var n_Zn = (o_Zn+Zn).toFixed(1);
    var b_Zn = parseFloat(document.getElementById('Zn').value)*0.1;
    if(n_Zn > b_Zn){document.getElementById('Zn1').style.color='red';document.getElementById('Zn11').style.color='red';}
    if(n_Zn >= -b_Zn && n_Zn <= b_Zn){document.getElementById('Zn1').style.color='green';document.getElementById('Zn11').style.color='green';}
    if(n_Zn < -b_Zn){document.getElementById('Zn1').style.color='blue';document.getElementById('Zn11').style.color='blue';}
    document.getElementById('Zn1').value = n_Zn;
  	//維生素A
    var o_vitA = parseFloat(document.getElementById('vitaminsA1').value);
    var n_vitA = (o_vitA+vitA).toFixed(1);
    var b_vitA = parseFloat(document.getElementById('vitaminsA').value)*0.1;
    if(n_vitA > b_vitA){document.getElementById('vitaminsA1').style.color='red';document.getElementById('vitaminsA11').style.color='red';}
    if(n_vitA >= -b_vitA && n_vitA <= b_vitA){document.getElementById('vitaminsA1').style.color='green';document.getElementById('vitaminsA11').style.color='green';}
    if(n_vitA < -b_vitA){document.getElementById('vitaminsA1').style.color='blue';document.getElementById('vitaminsA11').style.color='blue';}
    document.getElementById('vitaminsA1').value = n_vitA;  	
  	//維生素B1
    var o_vitB1 = parseFloat(document.getElementById('vitaminsB11').value);
    var n_vitB1 = (o_vitB1+vitB1).toFixed(2);
    var b_vitB1 = parseFloat(document.getElementById('vitaminsB1').value)*0.1;
    if(n_vitB1 > b_vitB1){document.getElementById('vitaminsB11').style.color='red';document.getElementById('vitaminsB111').style.color='red';}
    if(n_vitB1 >= -b_vitB1 && n_vitB1 <= b_vitB1){document.getElementById('vitaminsB11').style.color='green';document.getElementById('vitaminsB111').style.color='green';}
    if(n_vitB1 < -b_vitB1){document.getElementById('vitaminsB11').style.color='blue';document.getElementById('vitaminsB111').style.color='blue';}
    document.getElementById('vitaminsB11').value = n_vitB1;
  	//維生素B2
    var o_vitB2 = parseFloat(document.getElementById('vitaminsB21').value);
    var n_vitB2 = (o_vitB2+vitB2).toFixed(2);
    var b_vitB2 = parseFloat(document.getElementById('vitaminsB2').value)*0.2;
    if(n_vitB2 > b_vitB2){document.getElementById('vitaminsB21').style.color='red';document.getElementById('vitaminsB211').style.color='red';}
    if(n_vitB2 >= -b_vitB2 && n_vitB2 <= b_vitB2){document.getElementById('vitaminsB21').style.color='green';document.getElementById('vitaminsB211').style.color='green';}
    if(n_vitB2 < -b_vitB2){document.getElementById('vitaminsB21').style.color='blue';document.getElementById('vitaminsB211').style.color='blue';}
    document.getElementById('vitaminsB21').value = n_vitB2;
  	//維生素B6
    var o_vitB6 = parseFloat(document.getElementById('vitaminsB61').value);
    var n_vitB6 = (o_vitB6+vitB6).toFixed(2);
    var b_vitB6 = parseFloat(document.getElementById('vitaminsB6').value)*0.6;
    if(n_vitB6 > b_vitB6){document.getElementById('vitaminsB61').style.color='red';document.getElementById('vitaminsB611').style.color='red';}
    if(n_vitB6 >= -b_vitB6 && n_vitB6 <= b_vitB6){document.getElementById('vitaminsB61').style.color='green';document.getElementById('vitaminsB611').style.color='green';}
    if(n_vitB6 < -b_vitB6){document.getElementById('vitaminsB61').style.color='blue';document.getElementById('vitaminsB611').style.color='blue';}
    document.getElementById('vitaminsB61').value = n_vitB6;
  	//維生素B12
    var o_vitB12 = parseFloat(document.getElementById('vitaminsB121').value);
    var n_vitB12 = (o_vitB12+vitB12).toFixed(2);
    var b_vitB12 = parseFloat(document.getElementById('vitaminsB12').value)*0.12;
    if(n_vitB12 > b_vitB12){document.getElementById('vitaminsB121').style.color='red';document.getElementById('vitaminsB1211').style.color='red';}
    if(n_vitB12 >= -b_vitB12 && n_vitB12 <= b_vitB12){document.getElementById('vitaminsB121').style.color='green';document.getElementById('vitaminsB1211').style.color='green';}
    if(n_vitB12 < -b_vitB12){document.getElementById('vitaminsB121').style.color='blue';document.getElementById('vitaminsB1211').style.color='blue';}
    document.getElementById('vitaminsB121').value = n_vitB12;
  	//維生素C
    var o_vitC = parseFloat(document.getElementById('vitaminsC1').value);
    var n_vitC = (o_vitC+vitC).toFixed(1);
    var b_vitC = parseFloat(document.getElementById('vitaminsC').value)*0.6;
    if(n_vitC > b_vitC){document.getElementById('vitaminsC1').style.color='red';document.getElementById('vitaminsC11').style.color='red';}
    if(n_vitC >= -b_vitC && n_vitC <= b_vitC){document.getElementById('vitaminsC1').style.color='green';document.getElementById('vitaminsC11').style.color='green';}
    if(n_vitC < -b_vitC){document.getElementById('vitaminsC1').style.color='blue';document.getElementById('vitaminsC11').style.color='blue';}
    document.getElementById('vitaminsC1').value = n_vitC;
  	//維生素E
    var o_vitE = parseFloat(document.getElementById('vitaminsE1').value);
    var n_vitE = (o_vitE+vitE).toFixed(2);
    var b_vitE = parseFloat(document.getElementById('vitaminsE').value)*0.6;
    if(n_vitE > b_vitE){document.getElementById('vitaminsE1').style.Eolor='red';document.getElementById('vitaminsE11').style.Eolor='red';}
    if(n_vitE >= -b_vitE && n_vitE <= b_vitE){doEument.getElementById('vitaminsE1').style.Eolor='green';document.getElementById('vitaminsE11').style.Eolor='green';}
    if(n_vitE < -b_vitE){document.getElementById('vitaminsE1').style.Eolor='blue';document.getElementById('vitaminsE11').style.Eolor='blue';}
    document.getElementById('vitaminsE1').value = n_vitE;
  	//菸鹼素
    var o_nic = parseFloat(document.getElementById('nicotine_element1').value);
    var n_nic = (o_nic+nic).toFixed(2);
    var b_nic = parseFloat(document.getElementById('nicotine_element').value)*0.6;
    if(n_nic > b_nic){document.getElementById('nicotine_element1').style.Eolor='red';document.getElementById('nicotine_element11').style.Eolor='red';}
    if(n_nic >= -b_nic && n_nic <= b_nic){document.getElementById('nicotine_element1').style.Eolor='green';document.getElementById('nicotine_element11').style.Eolor='green';}
    if(n_nic < -b_nic){document.getElementById('nicotine_element1').style.Eolor='blue';document.getElementById('nicotine_element11').style.Eolor='blue';}
    document.getElementById('nicotine_element1').value = n_nic;
}
function modify(num, obj)
{
	if(num=='-'){alert('數量不能為負!'); return false;}
	if(num<0){alert('數量不能為負!'); return false;}
	if(num==""){num = 0;}
	var number = parseFloat(num);
	var number1 = parseFloat(obj.parentNode.parentNode.childNodes[4].innerText);
	//熱量修改
	var cal = parseFloat(obj.parentNode.parentNode.childNodes[3].innerText);
	var o_cal = parseFloat(document.getElementById('cal1').value);	
	var n_cal = (o_cal+cal*(number-number1)).toFixed(0);
	var b_cal = parseFloat(document.getElementById('cal').value)*0.1;
	if(n_cal > b_cal){document.getElementById('cal1').style.color='red';document.getElementById('cal11').style.color='red';}
    if(n_cal >= -b_cal && n_cal <= b_cal){document.getElementById('cal1').style.color='green';document.getElementById('cal11').style.color='green';}
    if(n_cal < -b_cal){document.getElementById('cal1').style.color='blue';document.getElementById('cal11').style.color='blue';}
	document.getElementById('cal1').value = n_cal;
	obj.parentNode.parentNode.childNodes[4].innerText = num;	
	//醣類修改
	var car = parseFloat(obj.parentNode.parentNode.childNodes[5].innerText);
	var o_car = parseFloat(document.getElementById('n11').value);	
	var n_car = (o_car+car*(number-number1)).toFixed(1);
	var b_car = parseFloat(document.getElementById('n1').value)*0.1;
	if(n_car > b_car){document.getElementById('n11').style.color='red';document.getElementById('n111').style.color='red';}
    if(n_car >= -b_car && n_car <= b_car){document.getElementById('n11').style.color='green';document.getElementById('n111').style.color='green';}
    if(n_car < -b_car){document.getElementById('n11').style.color='blue';document.getElementById('n111').style.color='blue';}
	document.getElementById('n11').value = n_car;
	//蛋白質
	var prot = parseFloat(obj.parentNode.parentNode.childNodes[6].innerText);
	var o_prot = parseFloat(document.getElementById('n22').value);	
	var n_prot = (o_prot+prot*(number-number1)).toFixed(1);
	var b_prot = parseFloat(document.getElementById('n2').value)*0.1;
	if(n_prot > b_prot){document.getElementById('n22').style.color='red';document.getElementById('n222').style.color='red';}
    if(n_prot >= -b_prot && n_prot <= b_prot){document.getElementById('n22').style.color='green';document.getElementById('n222').style.color='green';}
    if(n_prot < -b_prot){document.getElementById('n22').style.color='blue';document.getElementById('n222').style.color='blue';}
	document.getElementById('n22').value = n_prot;
	//脂質
	var fat = parseFloat(obj.parentNode.parentNode.childNodes[7].innerText);
	var o_fat = parseFloat(document.getElementById('n33').value);	
	var n_fat = (o_fat+fat*(number-number1)).toFixed(1);
	var b_fat = parseFloat(document.getElementById('n3').value)*0.1;
	if(n_fat > b_fat){document.getElementById('n33').style.color='red';document.getElementById('n333').style.color='red';}
    if(n_fat >= -b_fat && n_fat <= b_fat){document.getElementById('n33').style.color='green';document.getElementById('n333').style.color='green';}
    if(n_fat < -b_fat){document.getElementById('n33').style.color='blue';document.getElementById('n333').style.color='blue';}
	document.getElementById('n33').value = n_fat;
	//鈣
	var Ca = parseFloat(obj.parentNode.parentNode.childNodes[8].innerText);
	var o_Ca = parseFloat(document.getElementById('Ca1').value);	
	var n_Ca = (o_Ca+Ca*(number-number1)).toFixed(0);
	var b_Ca = parseFloat(document.getElementById('Ca').value)*0.1;
	if(n_Ca > b_Ca){document.getElementById('Ca1').style.color='red';document.getElementById('Ca11').style.color='red';}
    if(n_Ca >= -b_Ca && n_Ca <= b_Ca){document.getElementById('Ca1').style.color='green';document.getElementById('Ca11').style.color='green';}
    if(n_Ca < -b_Ca){document.getElementById('Ca1').style.color='blue';document.getElementById('Ca11').style.color='blue';}
	document.getElementById('Ca1').value = n_Ca;
	//磷
	var P = parseFloat(obj.parentNode.parentNode.childNodes[9].innerText);
	var o_P = parseFloat(document.getElementById('P1').value);	
	var n_P = (o_P+P*(number-number1)).toFixed(0);
	var b_P = parseFloat(document.getElementById('P').value)*0.1;
	if(n_P > b_P){document.getElementById('P1').style.color='red';document.getElementById('P11').style.color='red';}
    if(n_P >= -b_P && n_P <= b_P){document.getElementById('P1').style.color='green';document.getElementById('P11').style.color='green';}
    if(n_P < -b_P){document.getElementById('P1').style.color='blue';document.getElementById('P11').style.color='blue';}
	document.getElementById('P1').value = n_P;
	//鐵
	var Fe = parseFloat(obj.parentNode.parentNode.childNodes[10].innerText);
	var o_Fe = parseFloat(document.getElementById('Fe1').value);	
	var n_Fe = (o_Fe+Fe*(number-number1)).toFixed(1);
	var b_Fe = parseFloat(document.getElementById('Fe').value)*0.1;
	if(n_Fe > b_Fe){document.getElementById('Fe1').style.color='red';document.getElementById('Fe11').style.color='red';}
    if(n_Fe >= -b_Fe && n_Fe <= b_Fe){document.getElementById('Fe1').style.color='green';document.getElementById('Fe11').style.color='green';}
    if(n_Fe < -b_Fe){document.getElementById('Fe1').style.color='blue';document.getElementById('Fe11').style.color='blue';}
	document.getElementById('Fe1').value = n_Fe;	
	//鋅
	var Zn = parseFloat(obj.parentNode.parentNode.childNodes[11].innerText);
	var o_Zn = parseFloat(document.getElementById('Zn1').value);	
	var n_Zn = (o_Zn+Zn*(number-number1)).toFixed(1);
	var b_Zn = parseFloat(document.getElementById('Zn').value)*0.1;
	if(n_Zn > b_Zn){document.getElementById('Zn1').style.color='red';document.getElementById('Zn11').style.color='red';}
    if(n_Zn >= -b_Zn && n_Zn <= b_Zn){document.getElementById('Zn1').style.color='green';document.getElementById('Zn11').style.color='green';}
    if(n_Zn < -b_Zn){document.getElementById('Zn1').style.color='blue';document.getElementById('Zn11').style.color='blue';}
	document.getElementById('Zn1').value = n_Zn;
	//維生素A
	var vitA = parseFloat(obj.parentNode.parentNode.childNodes[12].innerText);
	var o_vitA = parseFloat(document.getElementById('vitaminsA1').value);	
	var n_vitA = (o_vitA+vitA*(number-number1)).toFixed(1);
	var b_vitA = parseFloat(document.getElementById('vitaminsA').value)*0.1;
	if(n_vitA > b_vitA){document.getElementById('vitaminsA1').style.color='red';document.getElementById('vitaminsA11').style.color='red';}
    if(n_vitA >= -b_vitA && n_vitA <= b_vitA){document.getElementById('vitaminsA1').style.color='green';document.getElementById('vitaminsA11').style.color='green';}
    if(n_vitA < -b_vitA){document.getElementById('vitaminsA1').style.color='blue';document.getElementById('vitaminsA11').style.color='blue';}
	document.getElementById('vitaminsA1').value = n_vitA;	
	//維生素B1
	var vitB1 = parseFloat(obj.parentNode.parentNode.childNodes[13].innerText);
	var o_vitB1 = parseFloat(document.getElementById('vitaminsB11').value);	
	var n_vitB1 = (o_vitB1+vitB1*(number-number1)).toFixed(2);
	var b_vitB1 = parseFloat(document.getElementById('vitaminsB1').value)*0.1;
	if(n_vitB1 > b_vitB1){document.getElementById('vitaminsB11').style.color='red';document.getElementById('vitaminsB111').style.color='red';}
    if(n_vitB1 >= -b_vitB1 && n_vitB1 <= b_vitB1){document.getElementById('vitaminsB11').style.color='green';document.getElementById('vitaminsB111').style.color='green';}
    if(n_vitB1 < -b_vitB1){document.getElementById('vitaminsB11').style.color='blue';document.getElementById('vitaminsB111').style.color='blue';}
	document.getElementById('vitaminsB11').value = n_vitB1;
	//維生素B2
	var vitB2 = parseFloat(obj.parentNode.parentNode.childNodes[14].innerText);
	var o_vitB2 = parseFloat(document.getElementById('vitaminsB21').value);	
	var n_vitB2 = (o_vitB2+vitB2*(number-number1)).toFixed(2);
	var b_vitB2 = parseFloat(document.getElementById('vitaminsB2').value)*0.1;
	if(n_vitB2 > b_vitB2){document.getElementById('vitaminsB21').style.color='red';document.getElementById('vitaminsB211').style.color='red';}
    if(n_vitB2 >= -b_vitB2 && n_vitB2 <= b_vitB2){document.getElementById('vitaminsB21').style.color='green';document.getElementById('vitaminsB211').style.color='green';}
    if(n_vitB2 < -b_vitB2){document.getElementById('vitaminsB21').style.color='blue';document.getElementById('vitaminsB211').style.color='blue';}
	document.getElementById('vitaminsB21').value = n_vitB2;	
	//維生素B6
	var vitB6 = parseFloat(obj.parentNode.parentNode.childNodes[15].innerText);
	var o_vitB6 = parseFloat(document.getElementById('vitaminsB61').value);	
	var n_vitB6 = (o_vitB6+vitB6*(number-number1)).toFixed(2);
	var b_vitB6 = parseFloat(document.getElementById('vitaminsB6').value)*0.1;
	if(n_vitB6 > b_vitB6){document.getElementById('vitaminsB61').style.color='red';document.getElementById('vitaminsB611').style.color='red';}
    if(n_vitB6 >= -b_vitB6 && n_vitB6 <= b_vitB6){document.getElementById('vitaminsB61').style.color='green';document.getElementById('vitaminsB611').style.color='green';}
    if(n_vitB6 < -b_vitB6){document.getElementById('vitaminsB61').style.color='blue';document.getElementById('vitaminsB611').style.color='blue';}
	document.getElementById('vitaminsB61').value = n_vitB6;	
	//維生素B12
	var vitB12 = parseFloat(obj.parentNode.parentNode.childNodes[16].innerText);
	var o_vitB12 = parseFloat(document.getElementById('vitaminsB121').value);	
	var n_vitB12 = (o_vitB12+vitB12*(number-number1)).toFixed(2);
	var b_vitB12 = parseFloat(document.getElementById('vitaminsB12').value)*0.1;
	if(n_vitB12 > b_vitB12){document.getElementById('vitaminsB121').style.color='red';document.getElementById('vitaminsB1211').style.color='red';}
    if(n_vitB12 >= -b_vitB12 && n_vitB12 <= b_vitB12){document.getElementById('vitaminsB121').style.color='green';document.getElementById('vitaminsB1211').style.color='green';}
    if(n_vitB12 < -b_vitB12){document.getElementById('vitaminsB121').style.color='blue';document.getElementById('vitaminsB1211').style.color='blue';}
	document.getElementById('vitaminsB121').value = n_vitB12;
	//維生素C
	var vitC = parseFloat(obj.parentNode.parentNode.childNodes[17].innerText);
	var o_vitC = parseFloat(document.getElementById('vitaminsC1').value);	
	var n_vitC = (o_vitC+vitC*(number-number1)).toFixed(1);
	var b_vitC = parseFloat(document.getElementById('vitaminsC').value)*0.1;
	if(n_vitC > b_vitC){document.getElementById('vitaminsC1').style.color='red';document.getElementById('vitaminsC11').style.color='red';}
    if(n_vitC >= -b_vitC && n_vitC <= b_vitC){document.getElementById('vitaminsC1').style.color='green';document.getElementById('vitaminsC11').style.color='green';}
    if(n_vitC < -b_vitC){document.getElementById('vitaminsC1').style.color='blue';document.getElementById('vitaminsC11').style.color='blue';}
	document.getElementById('vitaminsC1').value = n_vitC;
	//維生素E
	var vitE = parseFloat(obj.parentNode.parentNode.childNodes[18].innerText);
	var o_vitE = parseFloat(document.getElementById('vitaminsE1').value);	
	var n_vitE = (o_vitE+vitE*(number-number1)).toFixed(2);
	var b_vitE = parseFloat(document.getElementById('vitaminsE').value)*0.1;
	if(n_vitE > b_vitE){document.getElementById('vitaminsE1').style.color='red';document.getElementById('vitaminsE11').style.color='red';}
    if(n_vitE >= -b_vitE && n_vitE <= b_vitE){document.getElementById('vitaminsE1').style.color='green';document.getElementById('vitaminsE11').style.color='green';}
    if(n_vitE < -b_vitE){document.getElementById('vitaminsE1').style.color='blue';document.getElementById('vitaminsE11').style.color='blue';}
	document.getElementById('vitaminsE1').value = n_vitE;
	//菸鹼素
	var nic = parseFloat(obj.parentNode.parentNode.childNodes[19].innerText);
	var o_nic = parseFloat(document.getElementById('nicotine_element1').value);	
	var n_nic = (o_nic+nic*(number-number1)).toFixed(2);
	var b_nic = parseFloat(document.getElementById('nicotine_element').value)*0.1;
	if(n_nic > b_nic){document.getElementById('nicotine_element1').style.color='red';document.getElementById('nicotine_element11').style.color='red';}
    if(n_nic >= -b_nic && n_nic <= b_nic){document.getElementById('nicotine_element1').style.color='green';document.getElementById('nicotine_element11').style.color='green';}
    if(n_nic < -b_nic){document.getElementById('nicotine_element1').style.color='blue';document.getElementById('nicotine_element11').style.color='blue';}
	document.getElementById('nicotine_element1').value = n_nic;
	
	obj.parentNode.parentNode.childNodes[4].innerText = number;		
}
function del(obj)
{
	var number = parseFloat(obj.parentNode.parentNode.childNodes[4].innerText);
	//熱量刪除
	var cal = parseFloat(obj.parentNode.parentNode.childNodes[3].innerText);
	var o_cal = parseFloat(document.getElementById('cal1').value);	
	var n_cal = (o_cal-cal*number).toFixed(0);
	var b_cal = parseFloat(document.getElementById('cal').value)*0.1;
	if(n_cal > b_cal){document.getElementById('cal1').style.color='red';document.getElementById('cal11').style.color='red';}
    if(n_cal >= -b_cal && n_cal <= b_cal){document.getElementById('cal1').style.color='green';document.getElementById('cal11').style.color='green';}
    if(n_cal < -b_cal){document.getElementById('cal1').style.color='blue';document.getElementById('cal11').style.color='blue';}
	document.getElementById('cal1').value = n_cal;
	//醣類刪除
	var car = parseFloat(obj.parentNode.parentNode.childNodes[5].innerText);
	var o_car = parseFloat(document.getElementById('n11').value);	
	var n_car = (o_car-car*number).toFixed(1);
	var b_car = parseFloat(document.getElementById('n1').value)*0.1;
	if(n_car > b_car){document.getElementById('n11').style.color='red';document.getElementById('n111').style.color='red';}
    if(n_car >= -b_car && n_car <= b_car){document.getElementById('n11').style.color='green';document.getElementById('n111').style.color='green';}
    if(n_car < -b_car){document.getElementById('n11').style.color='blue';document.getElementById('n111').style.color='blue';}
	document.getElementById('n11').value = n_car;
	//蛋白質
	var prot = parseFloat(obj.parentNode.parentNode.childNodes[6].innerText);
	var o_prot = parseFloat(document.getElementById('n22').value);	
	var n_prot = (o_prot-prot*number).toFixed(1);
	var b_prot = parseFloat(document.getElementById('n2').value)*0.1;
	if(n_prot > b_prot){document.getElementById('n22').style.color='red';document.getElementById('n222').style.color='red';}
    if(n_prot >= -b_prot && n_prot <= b_prot){document.getElementById('n22').style.color='green';document.getElementById('n222').style.color='green';}
    if(n_prot < -b_prot){document.getElementById('n22').style.color='blue';document.getElementById('n222').style.color='blue';}
	document.getElementById('n22').value = n_prot;
	//脂質
	var fat = parseFloat(obj.parentNode.parentNode.childNodes[7].innerText);
	var o_fat = parseFloat(document.getElementById('n33').value);	
	var n_fat = (o_fat-fat*number).toFixed(1);
	var b_fat = parseFloat(document.getElementById('n3').value)*0.1;
	if(n_fat > b_fat){document.getElementById('n33').style.color='red';document.getElementById('n333').style.color='red';}
    if(n_fat >= -b_fat && n_fat <= b_fat){document.getElementById('n33').style.color='green';document.getElementById('n333').style.color='green';}
    if(n_fat < -b_fat){document.getElementById('n33').style.color='blue';document.getElementById('n333').style.color='blue';}
	document.getElementById('n33').value = n_fat;
	//鈣
	var Ca = parseFloat(obj.parentNode.parentNode.childNodes[8].innerText);
	var o_Ca = parseFloat(document.getElementById('Ca1').value);	
	var n_Ca = (o_Ca-Ca*number).toFixed(0);
	var b_Ca = parseFloat(document.getElementById('Ca').value)*0.1;
	if(n_Ca > b_Ca){document.getElementById('Ca1').style.color='red';document.getElementById('Ca11').style.color='red';}
    if(n_Ca >= -b_Ca && n_Ca <= b_Ca){document.getElementById('Ca1').style.color='green';document.getElementById('Ca11').style.color='green';}
    if(n_Ca < -b_Ca){document.getElementById('Ca1').style.color='blue';document.getElementById('Ca11').style.color='blue';}
	document.getElementById('Ca1').value = n_Ca;
	//磷
	var P = parseFloat(obj.parentNode.parentNode.childNodes[9].innerText);
	var o_P = parseFloat(document.getElementById('P1').value);	
	var n_P = (o_P-P*number).toFixed(0);
	var b_P = parseFloat(document.getElementById('P').value)*0.1;
	if(n_P > b_P){document.getElementById('P1').style.color='red';document.getElementById('P11').style.color='red';}
    if(n_P >= -b_P && n_P <= b_P){document.getElementById('P1').style.color='green';document.getElementById('P11').style.color='green';}
    if(n_P < -b_P){document.getElementById('P1').style.color='blue';document.getElementById('P11').style.color='blue';}
	document.getElementById('P1').value = n_P;
	//鐵
	var Fe = parseFloat(obj.parentNode.parentNode.childNodes[10].innerText);
	var o_Fe = parseFloat(document.getElementById('Fe1').value);	
	var n_Fe = (o_Fe-Fe*number).toFixed(1);
	var b_Fe = parseFloat(document.getElementById('Fe').value)*0.1;
	if(n_Fe > b_Fe){document.getElementById('Fe1').style.color='red';document.getElementById('Fe11').style.color='red';}
    if(n_Fe >= -b_Fe && n_Fe <= b_Fe){document.getElementById('Fe1').style.color='green';document.getElementById('Fe11').style.color='green';}
    if(n_Fe < -b_Fe){document.getElementById('Fe1').style.color='blue';document.getElementById('Fe11').style.color='blue';}
	document.getElementById('Fe1').value = n_Fe;
	//鋅
	var Zn = parseFloat(obj.parentNode.parentNode.childNodes[11].innerText);
	var o_Zn = parseFloat(document.getElementById('Zn1').value);	
	var n_Zn = (o_Zn-Zn*number).toFixed(1);
	var b_Zn = parseFloat(document.getElementById('Zn').value)*0.1;
	if(n_Zn > b_Zn){document.getElementById('Zn1').style.color='red';document.getElementById('Zn11').style.color='red';}
    if(n_Zn >= -b_Zn && n_Zn <= b_Zn){document.getElementById('Zn1').style.color='green';document.getElementById('Zn11').style.color='green';}
    if(n_Zn < -b_Zn){document.getElementById('Zn1').style.color='blue';document.getElementById('Zn11').style.color='blue';}
	document.getElementById('Zn1').value = n_Zn;
	//維生素A
	var vitA = parseFloat(obj.parentNode.parentNode.childNodes[12].innerText);
	var o_vitA = parseFloat(document.getElementById('vitaminsA1').value);	
	var n_vitA = (o_vitA-vitA*number).toFixed(1);
	var b_vitA = parseFloat(document.getElementById('vitaminsA').value)*0.1;
	if(n_vitA > b_vitA){document.getElementById('vitaminsA1').style.color='red';document.getElementById('vitaminsA11').style.color='red';}
    if(n_vitA >= -b_vitA && n_vitA <= b_vitA){document.getElementById('vitaminsA1').style.color='green';document.getElementById('vitaminsA11').style.color='green';}
    if(n_vitA < -b_vitA){document.getElementById('vitaminsA1').style.color='blue';document.getElementById('vitaminsA11').style.color='blue';}
	document.getElementById('vitaminsA1').value = n_vitA;
	//維生素B1
	var vitB1 = parseFloat(obj.parentNode.parentNode.childNodes[13].innerText);
	var o_vitB1 = parseFloat(document.getElementById('vitaminsB11').value);	
	var n_vitB1 = (o_vitB1-vitB1*number).toFixed(2);
	var b_vitB1 = parseFloat(document.getElementById('vitaminsB1').value)*0.1;
	if(n_vitB1 > b_vitB1){document.getElementById('vitaminsB11').style.color='red';document.getElementById('vitaminsB111').style.color='red';}
    if(n_vitB1 >= -b_vitB1 && n_vitB1 <= b_vitB1){document.getElementById('vitaminsB11').style.color='green';document.getElementById('vitaminsB111').style.color='green';}
    if(n_vitB1 < -b_vitB1){document.getElementById('vitaminsB11').style.color='blue';document.getElementById('vitaminsB111').style.color='blue';}
	document.getElementById('vitaminsB11').value = n_vitB1;	
	//維生素B2
	var vitB2 = parseFloat(obj.parentNode.parentNode.childNodes[14].innerText);
	var o_vitB2 = parseFloat(document.getElementById('vitaminsB21').value);	
	var n_vitB2 = (o_vitB2-vitB2*number).toFixed(2);
	var b_vitB2 = parseFloat(document.getElementById('vitaminsB2').value)*0.1;
	if(n_vitB2 > b_vitB2){document.getElementById('vitaminsB21').style.color='red';document.getElementById('vitaminsB211').style.color='red';}
    if(n_vitB2 >= -b_vitB2 && n_vitB2 <= b_vitB2){document.getElementById('vitaminsB21').style.color='green';document.getElementById('vitaminsB211').style.color='green';}
    if(n_vitB2 < -b_vitB2){document.getElementById('vitaminsB21').style.color='blue';document.getElementById('vitaminsB211').style.color='blue';}
	document.getElementById('vitaminsB21').value = n_vitB2;	
	//維生素B6
	var vitB6 = parseFloat(obj.parentNode.parentNode.childNodes[15].innerText);
	var o_vitB6 = parseFloat(document.getElementById('vitaminsB61').value);	
	var n_vitB6 = (o_vitB6-vitB6*number).toFixed(2);
	var b_vitB6 = parseFloat(document.getElementById('vitaminsB6').value)*0.1;
	if(n_vitB6 > b_vitB6){document.getElementById('vitaminsB61').style.color='red';document.getElementById('vitaminsB611').style.color='red';}
    if(n_vitB6 >= -b_vitB6 && n_vitB6 <= b_vitB6){document.getElementById('vitaminsB61').style.color='green';document.getElementById('vitaminsB611').style.color='green';}
    if(n_vitB6 < -b_vitB6){document.getElementById('vitaminsB61').style.color='blue';document.getElementById('vitaminsB611').style.color='blue';}
	document.getElementById('vitaminsB61').value = n_vitB6;	
	//維生素B12
	var vitB12 = parseFloat(obj.parentNode.parentNode.childNodes[16].innerText);
	var o_vitB12 = parseFloat(document.getElementById('vitaminsB121').value);	
	var n_vitB12 = (o_vitB12-vitB12*number).toFixed(2);
	var b_vitB12 = parseFloat(document.getElementById('vitaminsB12').value)*0.1;
	if(n_vitB12 > b_vitB12){document.getElementById('vitaminsB121').style.color='red';document.getElementById('vitaminsB1211').style.color='red';}
    if(n_vitB12 >= -b_vitB12 && n_vitB12 <= b_vitB12){document.getElementById('vitaminsB121').style.color='green';document.getElementById('vitaminsB1211').style.color='green';}
    if(n_vitB12 < -b_vitB12){document.getElementById('vitaminsB121').style.color='blue';document.getElementById('vitaminsB1211').style.color='blue';}
	document.getElementById('vitaminsB121').value = n_vitB12;
	//維生素C
	var vitC = parseFloat(obj.parentNode.parentNode.childNodes[17].innerText);
	var o_vitC = parseFloat(document.getElementById('vitaminsC1').value);	
	var n_vitC = (o_vitC-vitC*number).toFixed(1);
	var b_vitC = parseFloat(document.getElementById('vitaminsC').value)*0.1;
	if(n_vitC > b_vitC){document.getElementById('vitaminsC1').style.color='red';document.getElementById('vitaminsC11').style.color='red';}
    if(n_vitC >= -b_vitC && n_vitC <= b_vitC){document.getElementById('vitaminsC1').style.color='green';document.getElementById('vitaminsC11').style.color='green';}
    if(n_vitC < -b_vitC){document.getElementById('vitaminsC1').style.color='blue';document.getElementById('vitaminsC11').style.color='blue';}
	document.getElementById('vitaminsC1').value = n_vitC;
	//維生素E
	var vitE = parseFloat(obj.parentNode.parentNode.childNodes[18].innerText);
	var o_vitE = parseFloat(document.getElementById('vitaminsE1').value);	
	var n_vitE = (o_vitE-vitE*number).toFixed(2);
	var b_vitE = parseFloat(document.getElementById('vitaminsE').value)*0.1;
	if(n_vitE > b_vitE){document.getElementById('vitaminsE1').style.color='red';document.getElementById('vitaminsE11').style.color='red';}
    if(n_vitE >= -b_vitE && n_vitE <= b_vitE){document.getElementById('vitaminsE1').style.color='green';document.getElementById('vitaminsE11').style.color='green';}
    if(n_vitE < -b_vitE){document.getElementById('vitaminsE1').style.color='blue';document.getElementById('vitaminsE11').style.color='blue';}
	document.getElementById('vitaminsE1').value = n_vitE;
	//菸鹼素
	var nic = parseFloat(obj.parentNode.parentNode.childNodes[19].innerText);
	var o_nic = parseFloat(document.getElementById('nicotine_element1').value);	
	var n_nic = (o_nic-nic*number).toFixed(2);
	var b_nic = parseFloat(document.getElementById('nicotine_element').value)*0.1;
	if(n_nic > b_nic){document.getElementById('nicotine_element1').style.color='red';document.getElementById('nicotine_element11').style.color='red';}
    if(n_nic >= -b_nic && n_nic <= b_nic){document.getElementById('nicotine_element1').style.color='green';document.getElementById('nicotine_element11').style.color='green';}
    if(n_nic < -b_nic){document.getElementById('nicotine_element1').style.color='blue';document.getElementById('nicotine_element11').style.color='blue';}
	document.getElementById('nicotine_element1').value = n_nic;	
	
    var table = obj.parentNode.parentNode.parentNode;
    table.deleteRow(obj.parentNode.parentNode.rowIndex);
}
</script> 							 
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs1.getString("food_name")%>',
   							 <%=rs1.getFloat("food_kcal")%>,
   							 <%=rs1.getFloat("carbohydrate")%>,
   							 <%=rs1.getFloat("protein")%>,
   							 <%=rs1.getFloat("fat")%>,
   							 <%=rs1.getFloat("Ca")%>,
   							 <%=rs1.getFloat("P")%>,
   							 <%=rs1.getFloat("Fe")%>,
   							 <%=rs1.getFloat("Zn")%>,
   							 <%=rs1.getFloat("vitaminA")%>,
   							 <%=rs1.getFloat("vitaminB1")%>,
   							 <%=rs1.getFloat("vitaminB2")%>,
   							 <%=rs1.getFloat("vitaminB6")%>,
   							 <%=rs1.getFloat("vitaminB12")%>,
   							 <%=rs1.getFloat("vitaminC")%>,
   							 <%=rs1.getFloat("vitaminE")%>,
   							 <%=rs1.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs1.getString("food_name")%>',
   							 <%=rs1.getFloat("food_kcal")%>,
   							 <%=rs1.getFloat("carbohydrate")%>,
   							 <%=rs1.getFloat("protein")%>,
   							 <%=rs1.getFloat("fat")%>,
   							 <%=rs1.getFloat("Ca")%>,
   							 <%=rs1.getFloat("P")%>,
   							 <%=rs1.getFloat("Fe")%>,
   							 <%=rs1.getFloat("Zn")%>,
   							 <%=rs1.getFloat("vitaminA")%>,
   							 <%=rs1.getFloat("vitaminB1")%>,
   							 <%=rs1.getFloat("vitaminB2")%>,
   							 <%=rs1.getFloat("vitaminB6")%>,
   							 <%=rs1.getFloat("vitaminB12")%>,
   							 <%=rs1.getFloat("vitaminC")%>,
   							 <%=rs1.getFloat("vitaminE")%>,
   							 <%=rs1.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs1.getString("food_name")%>',
   							 <%=rs1.getFloat("food_kcal")%>,
   							 <%=rs1.getFloat("carbohydrate")%>,
   							 <%=rs1.getFloat("protein")%>,
   							 <%=rs1.getFloat("fat")%>,
   							 <%=rs1.getFloat("Ca")%>,
   							 <%=rs1.getFloat("P")%>,
   							 <%=rs1.getFloat("Fe")%>,
   							 <%=rs1.getFloat("Zn")%>,
   							 <%=rs1.getFloat("vitaminA")%>,
   							 <%=rs1.getFloat("vitaminB1")%>,
   							 <%=rs1.getFloat("vitaminB2")%>,
   							 <%=rs1.getFloat("vitaminB6")%>,
   							 <%=rs1.getFloat("vitaminB12")%>,
   							 <%=rs1.getFloat("vitaminC")%>,
   							 <%=rs1.getFloat("vitaminE")%>,
   							 <%=rs1.getFloat("nicotine_element")%>)">   								
   						</fieldset>
   						<%
   							rs1.next();
   						}
   						%>
   						</DIV>
   					</li>
   				</ul>
  				<ul style="list-style:none;"><li style="position:relative;">
  				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">
   						<%
   						String sql2 = "SELECT * from food where type = '澱粉類'";
   						ResultSet rs2 = smt.executeQuery(sql2);
   						rs2.last();
   						int count2=rs2.getRow();
   						rs2.first();  						
   						for(int i=0; i<count2; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs2.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs2.getString("food_name")%>',
   							 <%=rs2.getFloat("food_kcal")%>,
   							 <%=rs2.getFloat("carbohydrate")%>,
   							 <%=rs2.getFloat("protein")%>,
   							 <%=rs2.getFloat("fat")%>,
   							 <%=rs2.getFloat("Ca")%>,
   							 <%=rs2.getFloat("P")%>,
   							 <%=rs2.getFloat("Fe")%>,
   							 <%=rs2.getFloat("Zn")%>,
   							 <%=rs2.getFloat("vitaminA")%>,
   							 <%=rs2.getFloat("vitaminB1")%>,
   							 <%=rs2.getFloat("vitaminB2")%>,
   							 <%=rs2.getFloat("vitaminB6")%>,
   							 <%=rs2.getFloat("vitaminB12")%>,
   							 <%=rs2.getFloat("vitaminC")%>,
   							 <%=rs2.getFloat("vitaminE")%>,
   							 <%=rs2.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs2.getString("food_name")%>',
   							 <%=rs2.getFloat("food_kcal")%>,
   							 <%=rs2.getFloat("carbohydrate")%>,
   							 <%=rs2.getFloat("protein")%>,
   							 <%=rs2.getFloat("fat")%>,
   							 <%=rs2.getFloat("Ca")%>,
   							 <%=rs2.getFloat("P")%>,
   							 <%=rs2.getFloat("Fe")%>,
   							 <%=rs2.getFloat("Zn")%>,
   							 <%=rs2.getFloat("vitaminA")%>,
   							 <%=rs2.getFloat("vitaminB1")%>,
   							 <%=rs2.getFloat("vitaminB2")%>,
   							 <%=rs2.getFloat("vitaminB6")%>,
   							 <%=rs2.getFloat("vitaminB12")%>,
   							 <%=rs2.getFloat("vitaminC")%>,
   							 <%=rs2.getFloat("vitaminE")%>,
   							 <%=rs2.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs2.getString("food_name")%>',
   							 <%=rs2.getFloat("food_kcal")%>,
   							 <%=rs2.getFloat("carbohydrate")%>,
   							 <%=rs2.getFloat("protein")%>,
   							 <%=rs2.getFloat("fat")%>,
   							 <%=rs2.getFloat("Ca")%>,
   							 <%=rs2.getFloat("P")%>,
   							 <%=rs2.getFloat("Fe")%>,
   							 <%=rs2.getFloat("Zn")%>,
   							 <%=rs2.getFloat("vitaminA")%>,
   							 <%=rs2.getFloat("vitaminB1")%>,
   							 <%=rs2.getFloat("vitaminB2")%>,
   							 <%=rs2.getFloat("vitaminB6")%>,
   							 <%=rs2.getFloat("vitaminB12")%>,
   							 <%=rs2.getFloat("vitaminC")%>,
   							 <%=rs2.getFloat("vitaminE")%>,
   							 <%=rs2.getFloat("nicotine_element")%>)"> 
   						</fieldset>
   						<%
   							rs2.next();
   						}
   						%>
   						</DIV>
  				</li></ul>
   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql3 = "SELECT * from food where type = '蔬菜類'";
   						ResultSet rs3 = smt.executeQuery(sql3);
   						rs3.last();
   						int count3=rs3.getRow();
   						rs3.first();  						
   						for(int i=0; i<count3; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs3.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs3.getString("food_name")%>',
   							 <%=rs3.getFloat("food_kcal")%>,
   							 <%=rs3.getFloat("carbohydrate")%>,
   							 <%=rs3.getFloat("protein")%>,
   							 <%=rs3.getFloat("fat")%>,
   							 <%=rs3.getFloat("Ca")%>,
   							 <%=rs3.getFloat("P")%>,
   							 <%=rs3.getFloat("Fe")%>,
   							 <%=rs3.getFloat("Zn")%>,
   							 <%=rs3.getFloat("vitaminA")%>,
   							 <%=rs3.getFloat("vitaminB1")%>,
   							 <%=rs3.getFloat("vitaminB2")%>,
   							 <%=rs3.getFloat("vitaminB6")%>,
   							 <%=rs3.getFloat("vitaminB12")%>,
   							 <%=rs3.getFloat("vitaminC")%>,
   							 <%=rs3.getFloat("vitaminE")%>,
   							 <%=rs3.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs3.getString("food_name")%>',
   							 <%=rs3.getFloat("food_kcal")%>,
   							 <%=rs3.getFloat("carbohydrate")%>,
   							 <%=rs3.getFloat("protein")%>,
   							 <%=rs3.getFloat("fat")%>,
   							 <%=rs3.getFloat("Ca")%>,
   							 <%=rs3.getFloat("P")%>,
   							 <%=rs3.getFloat("Fe")%>,
   							 <%=rs3.getFloat("Zn")%>,
   							 <%=rs3.getFloat("vitaminA")%>,
   							 <%=rs3.getFloat("vitaminB1")%>,
   							 <%=rs3.getFloat("vitaminB2")%>,
   							 <%=rs3.getFloat("vitaminB6")%>,
   							 <%=rs3.getFloat("vitaminB12")%>,
   							 <%=rs3.getFloat("vitaminC")%>,
   							 <%=rs3.getFloat("vitaminE")%>,
   							 <%=rs3.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs3.getString("food_name")%>',
   							 <%=rs3.getFloat("food_kcal")%>,
   							 <%=rs3.getFloat("carbohydrate")%>,
   							 <%=rs3.getFloat("protein")%>,
   							 <%=rs3.getFloat("fat")%>,
   							 <%=rs3.getFloat("Ca")%>,
   							 <%=rs3.getFloat("P")%>,
   							 <%=rs3.getFloat("Fe")%>,
   							 <%=rs3.getFloat("Zn")%>,
   							 <%=rs3.getFloat("vitaminA")%>,
   							 <%=rs3.getFloat("vitaminB1")%>,
   							 <%=rs3.getFloat("vitaminB2")%>,
   							 <%=rs3.getFloat("vitaminB6")%>,
   							 <%=rs3.getFloat("vitaminB12")%>,
   							 <%=rs3.getFloat("vitaminC")%>,
   							 <%=rs3.getFloat("vitaminE")%>,
   							 <%=rs3.getFloat("nicotine_element")%>)">
   						</fieldset>
   						<%
   							rs3.next();
   						}
   						%>
   						</DIV>  				
   				</li></ul>
   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql4 = "SELECT * from food where type = '水果類'";
   						ResultSet rs4 = smt.executeQuery(sql4);
   						rs4.last();
   						int count4=rs4.getRow();
   						rs4.first();  						
   						for(int i=0; i<count4; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs4.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs4.getString("food_name")%>',
   							 <%=rs4.getFloat("food_kcal")%>,
   							 <%=rs4.getFloat("carbohydrate")%>,
   							 <%=rs4.getFloat("protein")%>,
   							 <%=rs4.getFloat("fat")%>,
   							 <%=rs4.getFloat("Ca")%>,
   							 <%=rs4.getFloat("P")%>,
   							 <%=rs4.getFloat("Fe")%>,
   							 <%=rs4.getFloat("Zn")%>,
   							 <%=rs4.getFloat("vitaminA")%>,
   							 <%=rs4.getFloat("vitaminB1")%>,
   							 <%=rs4.getFloat("vitaminB2")%>,
   							 <%=rs4.getFloat("vitaminB6")%>,
   							 <%=rs4.getFloat("vitaminB12")%>,
   							 <%=rs4.getFloat("vitaminC")%>,
   							 <%=rs4.getFloat("vitaminE")%>,
   							 <%=rs4.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs4.getString("food_name")%>',
   							 <%=rs4.getFloat("food_kcal")%>,
   							 <%=rs4.getFloat("carbohydrate")%>,
   							 <%=rs4.getFloat("protein")%>,
   							 <%=rs4.getFloat("fat")%>,
   							 <%=rs4.getFloat("Ca")%>,
   							 <%=rs4.getFloat("P")%>,
   							 <%=rs4.getFloat("Fe")%>,
   							 <%=rs4.getFloat("Zn")%>,
   							 <%=rs4.getFloat("vitaminA")%>,
   							 <%=rs4.getFloat("vitaminB1")%>,
   							 <%=rs4.getFloat("vitaminB2")%>,
   							 <%=rs4.getFloat("vitaminB6")%>,
   							 <%=rs4.getFloat("vitaminB12")%>,
   							 <%=rs4.getFloat("vitaminC")%>,
   							 <%=rs4.getFloat("vitaminE")%>,
   							 <%=rs4.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs4.getString("food_name")%>',
   							 <%=rs4.getFloat("food_kcal")%>,
   							 <%=rs4.getFloat("carbohydrate")%>,
   							 <%=rs4.getFloat("protein")%>,
   							 <%=rs4.getFloat("fat")%>,
   							 <%=rs4.getFloat("Ca")%>,
   							 <%=rs4.getFloat("P")%>,
   							 <%=rs4.getFloat("Fe")%>,
   							 <%=rs4.getFloat("Zn")%>,
   							 <%=rs4.getFloat("vitaminA")%>,
   							 <%=rs4.getFloat("vitaminB1")%>,
   							 <%=rs4.getFloat("vitaminB2")%>,
   							 <%=rs4.getFloat("vitaminB6")%>,
   							 <%=rs4.getFloat("vitaminB12")%>,
   							 <%=rs4.getFloat("vitaminC")%>,
   							 <%=rs4.getFloat("vitaminE")%>,
   							 <%=rs4.getFloat("nicotine_element")%>)"> 
   						</fieldset>
   						<%
   							rs4.next();
   						}
   						%>
   						</DIV> 
   				</li></ul>
  				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql5 = "SELECT * from food where type = '蛋類'";
   						ResultSet rs5 = smt.executeQuery(sql5);
   						rs5.last();
   						int count5=rs5.getRow();
   						rs5.first();  						
   						for(int i=0; i<count5; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs5.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs5.getString("food_name")%>',
   							 <%=rs5.getFloat("food_kcal")%>,
   							 <%=rs5.getFloat("carbohydrate")%>,
   							 <%=rs5.getFloat("protein")%>,
   							 <%=rs5.getFloat("fat")%>,
   							 <%=rs5.getFloat("Ca")%>,
   							 <%=rs5.getFloat("P")%>,
   							 <%=rs5.getFloat("Fe")%>,
   							 <%=rs5.getFloat("Zn")%>,
   							 <%=rs5.getFloat("vitaminA")%>,
   							 <%=rs5.getFloat("vitaminB1")%>,
   							 <%=rs5.getFloat("vitaminB2")%>,
   							 <%=rs5.getFloat("vitaminB6")%>,
   							 <%=rs5.getFloat("vitaminB12")%>,
   							 <%=rs5.getFloat("vitaminC")%>,
   							 <%=rs5.getFloat("vitaminE")%>,
   							 <%=rs5.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs5.getString("food_name")%>',
   							 <%=rs5.getFloat("food_kcal")%>,
   							 <%=rs5.getFloat("carbohydrate")%>,
   							 <%=rs5.getFloat("protein")%>,
   							 <%=rs5.getFloat("fat")%>,
   							 <%=rs5.getFloat("Ca")%>,
   							 <%=rs5.getFloat("P")%>,
   							 <%=rs5.getFloat("Fe")%>,
   							 <%=rs5.getFloat("Zn")%>,
   							 <%=rs5.getFloat("vitaminA")%>,
   							 <%=rs5.getFloat("vitaminB1")%>,
   							 <%=rs5.getFloat("vitaminB2")%>,
   							 <%=rs5.getFloat("vitaminB6")%>,
   							 <%=rs5.getFloat("vitaminB12")%>,
   							 <%=rs5.getFloat("vitaminC")%>,
   							 <%=rs5.getFloat("vitaminE")%>,
   							 <%=rs5.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs5.getString("food_name")%>',
   							 <%=rs5.getFloat("food_kcal")%>,
   							 <%=rs5.getFloat("carbohydrate")%>,
   							 <%=rs5.getFloat("protein")%>,
   							 <%=rs5.getFloat("fat")%>,
   							 <%=rs5.getFloat("Ca")%>,
   							 <%=rs5.getFloat("P")%>,
   							 <%=rs5.getFloat("Fe")%>,
   							 <%=rs5.getFloat("Zn")%>,
   							 <%=rs5.getFloat("vitaminA")%>,
   							 <%=rs5.getFloat("vitaminB1")%>,
   							 <%=rs5.getFloat("vitaminB2")%>,
   							 <%=rs5.getFloat("vitaminB6")%>,
   							 <%=rs5.getFloat("vitaminB12")%>,
   							 <%=rs5.getFloat("vitaminC")%>,
   							 <%=rs5.getFloat("vitaminE")%>,
   							 <%=rs5.getFloat("nicotine_element")%>)">
   						</fieldset>
   						<%
   							rs5.next();
   						}
   						%>
   						</DIV> 
  				</li></ul>
   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql6 = "SELECT * from food where type = '豆類'";
   						ResultSet rs6 = smt.executeQuery(sql6);
   						rs6.last();
   						int count6=rs6.getRow();
   						rs6.first();  						
   						for(int i=0; i<count6; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs6.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs6.getString("food_name")%>',
   							 <%=rs6.getFloat("food_kcal")%>,
   							 <%=rs6.getFloat("carbohydrate")%>,
   							 <%=rs6.getFloat("protein")%>,
   							 <%=rs6.getFloat("fat")%>,
   							 <%=rs6.getFloat("Ca")%>,
   							 <%=rs6.getFloat("P")%>,
   							 <%=rs6.getFloat("Fe")%>,
   							 <%=rs6.getFloat("Zn")%>,
   							 <%=rs6.getFloat("vitaminA")%>,
   							 <%=rs6.getFloat("vitaminB1")%>,
   							 <%=rs6.getFloat("vitaminB2")%>,
   							 <%=rs6.getFloat("vitaminB6")%>,
   							 <%=rs6.getFloat("vitaminB12")%>,
   							 <%=rs6.getFloat("vitaminC")%>,
   							 <%=rs6.getFloat("vitaminE")%>,
   							 <%=rs6.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs6.getString("food_name")%>',
   							 <%=rs6.getFloat("food_kcal")%>,
   							 <%=rs6.getFloat("carbohydrate")%>,
   							 <%=rs6.getFloat("protein")%>,
   							 <%=rs6.getFloat("fat")%>,
   							 <%=rs6.getFloat("Ca")%>,
   							 <%=rs6.getFloat("P")%>,
   							 <%=rs6.getFloat("Fe")%>,
   							 <%=rs6.getFloat("Zn")%>,
   							 <%=rs6.getFloat("vitaminA")%>,
   							 <%=rs6.getFloat("vitaminB1")%>,
   							 <%=rs6.getFloat("vitaminB2")%>,
   							 <%=rs6.getFloat("vitaminB6")%>,
   							 <%=rs6.getFloat("vitaminB12")%>,
   							 <%=rs6.getFloat("vitaminC")%>,
   							 <%=rs6.getFloat("vitaminE")%>,
   							 <%=rs6.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs6.getString("food_name")%>',
   							 <%=rs6.getFloat("food_kcal")%>,
   							 <%=rs6.getFloat("carbohydrate")%>,
   							 <%=rs6.getFloat("protein")%>,
   							 <%=rs6.getFloat("fat")%>,
   							 <%=rs6.getFloat("Ca")%>,
   							 <%=rs6.getFloat("P")%>,
   							 <%=rs6.getFloat("Fe")%>,
   							 <%=rs6.getFloat("Zn")%>,
   							 <%=rs6.getFloat("vitaminA")%>,
   							 <%=rs6.getFloat("vitaminB1")%>,
   							 <%=rs6.getFloat("vitaminB2")%>,
   							 <%=rs6.getFloat("vitaminB6")%>,
   							 <%=rs6.getFloat("vitaminB12")%>,
   							 <%=rs6.getFloat("vitaminC")%>,
   							 <%=rs6.getFloat("vitaminE")%>,
   							 <%=rs6.getFloat("nicotine_element")%>)"> 
   						</fieldset>
   						<%
   							rs6.next();
   						}
   						%>
   						</DIV> 
   				</li></ul>
   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql7 = "SELECT * from food where type = '魚貝類'";
   						ResultSet rs7 = smt.executeQuery(sql7);
   						rs7.last();
   						int count7=rs7.getRow();
   						rs7.first();  						
   						for(int i=0; i<count7; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs7.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs7.getString("food_name")%>',
   							 <%=rs7.getFloat("food_kcal")%>,
   							 <%=rs7.getFloat("carbohydrate")%>,
   							 <%=rs7.getFloat("protein")%>,
   							 <%=rs7.getFloat("fat")%>,
   							 <%=rs7.getFloat("Ca")%>,
   							 <%=rs7.getFloat("P")%>,
   							 <%=rs7.getFloat("Fe")%>,
   							 <%=rs7.getFloat("Zn")%>,
   							 <%=rs7.getFloat("vitaminA")%>,
   							 <%=rs7.getFloat("vitaminB1")%>,
   							 <%=rs7.getFloat("vitaminB2")%>,
   							 <%=rs7.getFloat("vitaminB6")%>,
   							 <%=rs7.getFloat("vitaminB12")%>,
   							 <%=rs7.getFloat("vitaminC")%>,
   							 <%=rs7.getFloat("vitaminE")%>,
   							 <%=rs7.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs7.getString("food_name")%>',
   							 <%=rs7.getFloat("food_kcal")%>,
   							 <%=rs7.getFloat("carbohydrate")%>,
   							 <%=rs7.getFloat("protein")%>,
   							 <%=rs7.getFloat("fat")%>,
   							 <%=rs7.getFloat("Ca")%>,
   							 <%=rs7.getFloat("P")%>,
   							 <%=rs7.getFloat("Fe")%>,
   							 <%=rs7.getFloat("Zn")%>,
   							 <%=rs7.getFloat("vitaminA")%>,
   							 <%=rs7.getFloat("vitaminB1")%>,
   							 <%=rs7.getFloat("vitaminB2")%>,
   							 <%=rs7.getFloat("vitaminB6")%>,
   							 <%=rs7.getFloat("vitaminB12")%>,
   							 <%=rs7.getFloat("vitaminC")%>,
   							 <%=rs7.getFloat("vitaminE")%>,
   							 <%=rs7.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs7.getString("food_name")%>',
   							 <%=rs7.getFloat("food_kcal")%>,
   							 <%=rs7.getFloat("carbohydrate")%>,
   							 <%=rs7.getFloat("protein")%>,
   							 <%=rs7.getFloat("fat")%>,
   							 <%=rs7.getFloat("Ca")%>,
   							 <%=rs7.getFloat("P")%>,
   							 <%=rs7.getFloat("Fe")%>,
   							 <%=rs7.getFloat("Zn")%>,
   							 <%=rs7.getFloat("vitaminA")%>,
   							 <%=rs7.getFloat("vitaminB1")%>,
   							 <%=rs7.getFloat("vitaminB2")%>,
   							 <%=rs7.getFloat("vitaminB6")%>,
   							 <%=rs7.getFloat("vitaminB12")%>,
   							 <%=rs7.getFloat("vitaminC")%>,
   							 <%=rs7.getFloat("vitaminE")%>,
   							 <%=rs7.getFloat("nicotine_element")%>)">
   						</fieldset>
   						<%
   							rs7.next();
   						}
   						%>
   						</DIV>
   				</li></ul>
  				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql8 = "SELECT * from food where type = '肉類'";
   						ResultSet rs8 = smt.executeQuery(sql8);
   						rs8.last();
   						int count8=rs8.getRow();
   						rs8.first();  						
   						for(int i=0; i<count8; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs8.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs8.getString("food_name")%>',
   							 <%=rs8.getFloat("food_kcal")%>,
   							 <%=rs8.getFloat("carbohydrate")%>,
   							 <%=rs8.getFloat("protein")%>,
   							 <%=rs8.getFloat("fat")%>,
   							 <%=rs8.getFloat("Ca")%>,
   							 <%=rs8.getFloat("P")%>,
   							 <%=rs8.getFloat("Fe")%>,
   							 <%=rs8.getFloat("Zn")%>,
   							 <%=rs8.getFloat("vitaminA")%>,
   							 <%=rs8.getFloat("vitaminB1")%>,
   							 <%=rs8.getFloat("vitaminB2")%>,
   							 <%=rs8.getFloat("vitaminB6")%>,
   							 <%=rs8.getFloat("vitaminB12")%>,
   							 <%=rs8.getFloat("vitaminC")%>,
   							 <%=rs8.getFloat("vitaminE")%>,
   							 <%=rs8.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs8.getString("food_name")%>',
   							 <%=rs8.getFloat("food_kcal")%>,
   							 <%=rs8.getFloat("carbohydrate")%>,
   							 <%=rs8.getFloat("protein")%>,
   							 <%=rs8.getFloat("fat")%>,
   							 <%=rs8.getFloat("Ca")%>,
   							 <%=rs8.getFloat("P")%>,
   							 <%=rs8.getFloat("Fe")%>,
   							 <%=rs8.getFloat("Zn")%>,
   							 <%=rs8.getFloat("vitaminA")%>,
   							 <%=rs8.getFloat("vitaminB1")%>,
   							 <%=rs8.getFloat("vitaminB2")%>,
   							 <%=rs8.getFloat("vitaminB6")%>,
   							 <%=rs8.getFloat("vitaminB12")%>,
   							 <%=rs8.getFloat("vitaminC")%>,
   							 <%=rs8.getFloat("vitaminE")%>,
   							 <%=rs8.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs8.getString("food_name")%>',
   							 <%=rs8.getFloat("food_kcal")%>,
   							 <%=rs8.getFloat("carbohydrate")%>,
   							 <%=rs8.getFloat("protein")%>,
   							 <%=rs8.getFloat("fat")%>,
   							 <%=rs8.getFloat("Ca")%>,
   							 <%=rs8.getFloat("P")%>,
   							 <%=rs8.getFloat("Fe")%>,
   							 <%=rs8.getFloat("Zn")%>,
   							 <%=rs8.getFloat("vitaminA")%>,
   							 <%=rs8.getFloat("vitaminB1")%>,
   							 <%=rs8.getFloat("vitaminB2")%>,
   							 <%=rs8.getFloat("vitaminB6")%>,
   							 <%=rs8.getFloat("vitaminB12")%>,
   							 <%=rs8.getFloat("vitaminC")%>,
   							 <%=rs8.getFloat("vitaminE")%>,
   							 <%=rs8.getFloat("nicotine_element")%>)">
   						</fieldset>
   						<%
   							rs8.next();
   						}
   						%>
   						</DIV>
  				</li></ul>
  				   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql9 = "SELECT * from food where type = '油脂類'";
   						ResultSet rs9 = smt.executeQuery(sql9);
   						rs9.last();
   						int count9=rs9.getRow();
   						rs9.first();  						
   						for(int i=0; i<count9; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs9.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs9.getString("food_name")%>',
   							 <%=rs9.getFloat("food_kcal")%>,
   							 <%=rs9.getFloat("carbohydrate")%>,
   							 <%=rs9.getFloat("protein")%>,
   							 <%=rs9.getFloat("fat")%>,
   							 <%=rs9.getFloat("Ca")%>,
   							 <%=rs9.getFloat("P")%>,
   							 <%=rs9.getFloat("Fe")%>,
   							 <%=rs9.getFloat("Zn")%>,
   							 <%=rs9.getFloat("vitaminA")%>,
   							 <%=rs9.getFloat("vitaminB1")%>,
   							 <%=rs9.getFloat("vitaminB2")%>,
   							 <%=rs9.getFloat("vitaminB6")%>,
   							 <%=rs9.getFloat("vitaminB12")%>,
   							 <%=rs9.getFloat("vitaminC")%>,
   							 <%=rs9.getFloat("vitaminE")%>,
   							 <%=rs9.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs9.getString("food_name")%>',
   							 <%=rs9.getFloat("food_kcal")%>,
   							 <%=rs9.getFloat("carbohydrate")%>,
   							 <%=rs9.getFloat("protein")%>,
   							 <%=rs9.getFloat("fat")%>,
   							 <%=rs9.getFloat("Ca")%>,
   							 <%=rs9.getFloat("P")%>,
   							 <%=rs9.getFloat("Fe")%>,
   							 <%=rs9.getFloat("Zn")%>,
   							 <%=rs9.getFloat("vitaminA")%>,
   							 <%=rs9.getFloat("vitaminB1")%>,
   							 <%=rs9.getFloat("vitaminB2")%>,
   							 <%=rs9.getFloat("vitaminB6")%>,
   							 <%=rs9.getFloat("vitaminB12")%>,
   							 <%=rs9.getFloat("vitaminC")%>,
   							 <%=rs9.getFloat("vitaminE")%>,
   							 <%=rs9.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs9.getString("food_name")%>',
   							 <%=rs9.getFloat("food_kcal")%>,
   							 <%=rs9.getFloat("carbohydrate")%>,
   							 <%=rs9.getFloat("protein")%>,
   							 <%=rs9.getFloat("fat")%>,
   							 <%=rs9.getFloat("Ca")%>,
   							 <%=rs9.getFloat("P")%>,
   							 <%=rs9.getFloat("Fe")%>,
   							 <%=rs9.getFloat("Zn")%>,
   							 <%=rs9.getFloat("vitaminA")%>,
   							 <%=rs9.getFloat("vitaminB1")%>,
   							 <%=rs9.getFloat("vitaminB2")%>,
   							 <%=rs9.getFloat("vitaminB6")%>,
   							 <%=rs9.getFloat("vitaminB12")%>,
   							 <%=rs9.getFloat("vitaminC")%>,
   							 <%=rs9.getFloat("vitaminE")%>,
   							 <%=rs9.getFloat("nicotine_element")%>)">
   						</fieldset>
   						<%
   							rs9.next();
   						}
   						%>
   						</DIV>
   				</li></ul>  	
   				<ul style="list-style:none;"><li style="position:relative;">
   				  		<DIV style="position:absolute; top:-4px; left:0px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:920px; HEIGHT:151px; font-size:15px">	
   						<%
   						String sql10 = "SELECT * from food where type = '奶類'";
   						ResultSet rs10 = smt.executeQuery(sql10);
   						rs10.last();
   						int count10=rs10.getRow();
   						rs10.first();  						
   						for(int i=0; i<count10; i++){
   						%>				
   						<fieldset style="position:relative; width:100px; height:48px; border:1px solid orange">
   							<%=rs10.getString("food_name")%>
   							<img style="position:absolute; top:22px; left:11px;" src="images/food/mor.png"
   							 onclick="count('tid1',
   							 '<%=rs10.getString("food_name")%>',
   							 <%=rs10.getFloat("food_kcal")%>,
   							 <%=rs10.getFloat("carbohydrate")%>,
   							 <%=rs10.getFloat("protein")%>,
   							 <%=rs10.getFloat("fat")%>,
   							 <%=rs10.getFloat("Ca")%>,
   							 <%=rs10.getFloat("P")%>,
   							 <%=rs10.getFloat("Fe")%>,
   							 <%=rs10.getFloat("Zn")%>,
   							 <%=rs10.getFloat("vitaminA")%>,
   							 <%=rs10.getFloat("vitaminB1")%>,
   							 <%=rs10.getFloat("vitaminB2")%>,
   							 <%=rs10.getFloat("vitaminB6")%>,
   							 <%=rs10.getFloat("vitaminB12")%>,
   							 <%=rs10.getFloat("vitaminC")%>,
   							 <%=rs10.getFloat("vitaminE")%>,
   							 <%=rs10.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; left:38px;" src="images/food/mid.png"
   							 onclick="count('tid2',
   							 '<%=rs10.getString("food_name")%>',
   							 <%=rs10.getFloat("food_kcal")%>,
   							 <%=rs10.getFloat("carbohydrate")%>,
   							 <%=rs10.getFloat("protein")%>,
   							 <%=rs10.getFloat("fat")%>,
   							 <%=rs10.getFloat("Ca")%>,
   							 <%=rs10.getFloat("P")%>,
   							 <%=rs10.getFloat("Fe")%>,
   							 <%=rs10.getFloat("Zn")%>,
   							 <%=rs10.getFloat("vitaminA")%>,
   							 <%=rs10.getFloat("vitaminB1")%>,
   							 <%=rs10.getFloat("vitaminB2")%>,
   							 <%=rs10.getFloat("vitaminB6")%>,
   							 <%=rs10.getFloat("vitaminB12")%>,
   							 <%=rs10.getFloat("vitaminC")%>,
   							 <%=rs10.getFloat("vitaminE")%>,
   							 <%=rs10.getFloat("nicotine_element")%>)">
   							<img style="position:absolute; top:22px; right:12px;" src="images/food/night.png"
   							 onclick="count('tid3',
   							 '<%=rs10.getString("food_name")%>',
   							 <%=rs10.getFloat("food_kcal")%>,
   							 <%=rs10.getFloat("carbohydrate")%>,
   							 <%=rs10.getFloat("protein")%>,
   							 <%=rs10.getFloat("fat")%>,
   							 <%=rs10.getFloat("Ca")%>,
   							 <%=rs10.getFloat("P")%>,
   							 <%=rs10.getFloat("Fe")%>,
   							 <%=rs10.getFloat("Zn")%>,
   							 <%=rs10.getFloat("vitaminA")%>,
   							 <%=rs10.getFloat("vitaminB1")%>,
   							 <%=rs10.getFloat("vitaminB2")%>,
   							 <%=rs10.getFloat("vitaminB6")%>,
   							 <%=rs10.getFloat("vitaminB12")%>,
   							 <%=rs10.getFloat("vitaminC")%>,
   							 <%=rs10.getFloat("vitaminE")%>,
   							 <%=rs10.getFloat("nicotine_element")%>)"> 
   						</fieldset>
   						<%
   							rs10.next();
   						}
   						%>
   						</DIV>
   				</li></ul>  				   				
			</div>
		</div>
		
<script type="text/javascript">
function check()
{
	if(document.getElementById('menu_name').value=="")
	{
		alert('請輸入您的菜單名稱!');
		return false;
	}
}
</script>
		
		<form action="save_food_menu.jsp" method="post" onsubmit="return check()">
		
		<div style="position:absolute; top:0px; left:29px; width:336px; height:44px; background:url(images/food/menu_name.png) no-repeat;">
			<input style="width:150px; margin:11px 0 0 160px" type="text" name="menu_name" id="menu_name">
		</div>				
<%
	String age = request.getParameter("age");
	int age1 = Integer.parseInt(age);
	int age2 = 0;
	if(age1>=1 && age1<=3){ age2 = 1; }
	if(age1>=4 && age1<=6){ age2 = 4; }
	if(age1>=7 && age1<=9){ age2 = 7; }
	if(age1>=10 && age1<=12){ age2 = 10; }
	if(age1>=13 && age1<=15){ age2 = 13; }
	if(age1>=16 && age1<=19){ age2 = 16; }
	if(age1>=20 && age1<=24){ age2 = 20; }
	if(age1>=25 && age1<=34){ age2 = 25; }
	if(age1>=35 && age1<=54){ age2 = 35; }
	if(age1>=55 && age1<=69){ age2 = 55; }
	if(age1>=70){ age2 = 70; }
	
	String gender = request.getParameter("gender");
	
	String height = request.getParameter("height");
	int height1 = Integer.parseInt(height);
	double height2 = height1;
	double height3 = height2/100;
	String weight = request.getParameter("weight");
	int weight1 = Integer.parseInt(weight);
	double bmi = weight1/(height3*height3);
	int bmi1 = 0;
	if(bmi<18.5){
		bmi1 = 1;
	}if(bmi>=18.5 && bmi<24){
		bmi1 = 2;	
	}if(bmi>=24 && bmi<30){
		bmi1 = 3;
	}if(bmi>=30){
		bmi1 = 4;
	}
	if(age2 < 20){
		String sql = "SELECT * from suggest_nutrition where age = '"+age2+"' and gender = '"+gender+"' ";
		ResultSet rs = smt.executeQuery(sql);
		rs.first();
		
		double n1 = rs.getInt("cal")*0.55/4;
		int n11 = (int)n1;
		double n2 = rs.getInt("cal")*0.15/4;
		int n22 = (int)n2;
		double n3 = rs.getInt("cal")*0.3/9;
		int n33 = (int)n3;
	%>
			<div style="position:absolute; top:260px; left:29px; position:relative; width:269px; height:161px; background:url(images/food/nutrition1.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=cal id=cal value="<%=rs.getInt("cal")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=cal1 id=cal1 value="-<%=rs.getInt("cal")%>">
				<div id=cal11 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">大卡</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n1 id=n1 value="<%=n11%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n11 id=n11 value="-<%=n11%>">
				<div id=n111 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">公克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n2 id=n2 value="<%=n22%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n22 id=n22 value="-<%=n22%>">
				<div id=n222 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">公克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n3 id=n3 value="<%=n33%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n33 id=n33 value="-<%=n33%>">
				<div id=n333 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">公克</div>
			</div>
			<div style="position:absolute; top:276px; left:585px; position:relative; width:269px; height:161px; background:url(images/food/nutrition2.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Ca id=Ca value="<%=rs.getInt("Ca")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Ca1 id=Ca1 value="-<%=rs.getInt("Ca")%>">
				<div id=Ca11 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=P id=P value="<%=rs.getInt("P")%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=P1 id=P1 value="-<%=rs.getInt("P")%>">
				<div id=P11 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Fe id=Fe value="<%=rs.getInt("Fe")%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Fe1 id=Fe1 value="-<%=rs.getInt("Fe")%>">
				<div id=Fe11 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Zn id=Zn value="<%=rs.getInt("Zn")%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Zn1 id=Zn1 value="-<%=rs.getInt("Zn")%>">
				<div id=Zn11 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">毫克</div>
			</div>
			<div style="position:absolute; top:115px; left:28px; position:relative; width:536px; height:162px; background:url(images/food/nutrition3.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsA id=vitaminsA value="<%=rs.getInt("vitaminsA")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsA1 id=vitaminsA1 value="-<%=rs.getInt("vitaminsA")%>">
				<div id=vitaminsA11 style="position:absolute; top:58px; left:220px; font-size:15px; color:blue">微克</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB1 id=vitaminsB1 value="<%=rs.getFloat("vitaminsB1")%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB11 id=vitaminsB11 value="-<%=rs.getFloat("vitaminsB1")%>">
				<div id=vitaminsB111 style="position:absolute; top:85px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB2 id=vitaminsB2 value="<%=rs.getFloat("vitaminsB2")%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB21 id=vitaminsB21 value="-<%=rs.getFloat("vitaminsB2")%>">
				<div id=vitaminsB211 style="position:absolute; top:112px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB6 id=vitaminsB6 value="<%=rs.getFloat("vitaminsB6")%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB61 id=vitaminsB61 value="-<%=rs.getFloat("vitaminsB6")%>">
				<div id=vitaminsB611 style="position:absolute; top:137px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:58px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB12 id=vitaminsB12 value="<%=rs.getFloat("vitaminsB12")%>">
				<input style="position:absolute; top:58px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB121 id=vitaminsB121 value="-<%=rs.getFloat("vitaminsB12")%>">
				<div id=vitaminsB1211 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:85px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsC id=vitaminsC value="<%=rs.getInt("vitaminsC")%>">
				<input style="position:absolute; top:85px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsC1 id=vitaminsC1 value="-<%=rs.getInt("vitaminsC")%>">
				<div id=vitaminsC11 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsE id=vitaminsE value="<%=rs.getInt("vitaminsE")%>">
				<input style="position:absolute; top:112px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsE1 id=vitaminsE1 value="-<%=rs.getInt("vitaminsE")%>">
				<div id=vitaminsE11 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=nicotine_element id=nicotine_element value="<%=rs.getInt("nicotine_element")%>">
				<input style="position:absolute; top:137px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=nicotine_element1 id=nicotine_element1 value="-<%=rs.getInt("nicotine_element")%>">
				<div id=nicotine_element11 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">毫克</div>
			</div>				
	<%
	}
	if(age2 >= 20){
		String sql = "SELECT * from suggest_nutrition where age = '"+age2+"' and gender = '"+gender+"' and bmi = '"+bmi1+"' ";
		ResultSet rs = smt.executeQuery(sql);
		rs.first();	
		
		double n1 = rs.getInt("cal")*0.55/4;
		int n11 = (int)n1;
		double n2 = rs.getInt("cal")*0.15/4;
		int n22 = (int)n2;
		double n3 = rs.getInt("cal")*0.3/9;
		int n33 = (int)n3;
		%>
			<div style="position:absolute; top:260px; left:29px; position:relative; width:269px; height:161px; background:url(images/food/nutrition1.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=cal id=cal value="<%=rs.getInt("cal")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=cal1 id=cal1 value="-<%=rs.getInt("cal")%>">
				<div id=cal11 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">大卡</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n1 id=n1 value="<%=n11%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n11 id=n11 value="-<%=n11%>">
				<div id=n111 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">公克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n2 id=n2 value="<%=n22%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n22 id=n22 value="-<%=n22%>">
				<div id=n222 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">公克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=n3 id=n3 value="<%=n33%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=n33 id=n33 value="-<%=n33%>">
				<div id=n333 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">公克</div>
			</div>
			<div style="position:absolute; top:276px; left:585px; position:relative; width:269px; height:161px; background:url(images/food/nutrition2.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Ca id=Ca value="<%=rs.getInt("Ca")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Ca1 id=Ca1 value="-<%=rs.getInt("Ca")%>">
				<div id=Ca11 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=P id=P value="<%=rs.getInt("P")%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=P1 id=P1 value="-<%=rs.getInt("P")%>">
				<div id=P11 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Fe id=Fe value="<%=rs.getInt("Fe")%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Fe1 id=Fe1 value="-<%=rs.getInt("Fe")%>">
				<div id=Fe11 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=Zn id=Zn value="<%=rs.getInt("Zn")%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=Zn1 id=Zn1 value="-<%=rs.getInt("Zn")%>">
				<div id=Zn11 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">毫克</div>
			</div>
			<div style="position:absolute; top:115px; left:28px; position:relative; width:536px; height:162px; background:url(images/food/nutrition3.png) no-repeat;">
				<input style="position:absolute; top:58px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsA id=vitaminsA value="<%=rs.getInt("vitaminsA")%>">
				<input style="position:absolute; top:58px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsA1 id=vitaminsA1 value="-<%=rs.getInt("vitaminsA")%>">
				<div id=vitaminsA11 style="position:absolute; top:58px; left:220px; font-size:15px; color:blue">微克</div>
				<input style="position:absolute; top:85px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB1 id=vitaminsB1 value="<%=rs.getFloat("vitaminsB1")%>">
				<input style="position:absolute; top:85px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB11 id=vitaminsB11 value="-<%=rs.getFloat("vitaminsB1")%>">
				<div id=vitaminsB111 style="position:absolute; top:85px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB2 id=vitaminsB2 value="<%=rs.getFloat("vitaminsB2")%>">
				<input style="position:absolute; top:112px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB21 id=vitaminsB21 value="-<%=rs.getFloat("vitaminsB2")%>">
				<div id=vitaminsB211 style="position:absolute; top:112px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:64px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB6 id=vitaminsB6 value="<%=rs.getFloat("vitaminsB6")%>">
				<input style="position:absolute; top:137px; left:148px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB61 id=vitaminsB61 value="-<%=rs.getFloat("vitaminsB6")%>">
				<div id=vitaminsB611 style="position:absolute; top:137px; left:220px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:58px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsB12 id=vitaminsB12 value="<%=rs.getFloat("vitaminsB12")%>">
				<input style="position:absolute; top:58px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsB121 id=vitaminsB121 value="-<%=rs.getFloat("vitaminsB12")%>">
				<div id=vitaminsB1211 style="position:absolute; top:58px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:85px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsC id=vitaminsC value="<%=rs.getInt("vitaminsC")%>">
				<input style="position:absolute; top:85px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsC1 id=vitaminsC1 value="-<%=rs.getInt("vitaminsC")%>">
				<div id=vitaminsC11 style="position:absolute; top:85px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:112px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=vitaminsE id=vitaminsE value="<%=rs.getInt("vitaminsE")%>">
				<input style="position:absolute; top:112px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=vitaminsE1 id=vitaminsE1 value="-<%=rs.getInt("vitaminsE")%>">
				<div id=vitaminsE11 style="position:absolute; top:112px; right:20px; font-size:15px; color:blue">毫克</div>
				<input style="position:absolute; top:137px; left:333px; border:0; width:32px; background:url(); font-size:15px" type=text name=nicotine_element id=nicotine_element value="<%=rs.getInt("nicotine_element")%>">
				<input style="position:absolute; top:137px; left:415px; border:0; width:140px; background:url(); font-size:15px; color:blue" type=text name=nicotine_element1 id=nicotine_element1 value="-<%=rs.getInt("nicotine_element")%>">
				<div id=nicotine_element11 style="position:absolute; top:137px; right:20px; font-size:15px; color:blue">毫克</div>
			</div>
		<%
	}
%>
		
			<div style="position:absolute; top:260px; right:29px; width:642px; height:161px; background:url(images/food/eat_table.png) no-repeat;">
<%
if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
{
	String name = session.getAttribute("username").toString();
%>				
				<input style="position:absolute; top:173px; right:-4px;" type=image src=images/food/save_menu.png>
				<input type="hidden" name="account" value="<%=name %>">
<%
}
else{
%>
				<input title="您尚未登入會員!" style="position:absolute; top:173px; right:-4px;" type=image src=images/food/save_menu.png disabled>
<%
} 
%>						
				<DIV style="position:absolute; top:35px; left:2px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:210px; HEIGHT:122px; font-size:12px">	
					<table width="1050" id="tid1">
					<tr><td width=100></td><td width=60></td><td width=40></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td></tr>
					</table>
				</DIV>
				<DIV style="position:absolute; top:35px; left:216px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:210px; HEIGHT:122px; font-size:12px">	
					<table width="1050" id="tid2">
					<tr><td width=100></td><td width=60></td><td width=40></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td></tr>
					</table>
				</DIV>
				<DIV style="position:absolute; top:35px; left:429px; border:0px solid black; OVERFLOW:scroll; overflow-x:hidden; WIDTH:210px; HEIGHT:122px; font-size:12px">	
					<table width="1050" id="tid3">
					<tr><td width=100></td><td width=60></td><td width=40></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td><td width=50></td>
					<td width=50></td><td width=50></td></tr>
					</table>
				</DIV>
			</form>	
			</div>
			<img style="position:absolute; top:348px; left:278px;" src="images/food/link.png">
			<img style="position:absolute; top:525px; left:546px;" src="images/food/link.png">
			<div style="position:absolute; bottom:20px; right:29px; width:930px; height:81px; background:url(images/food/nutrition_know.png) no-repeat;">
				<img style="position:absolute; top:9px; left:230px;" src="images/food/nut1.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu1.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:281px;" src="images/food/nut2.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu2.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:332px;" src="images/food/nut3.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu3.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:383px;" src="images/food/nut4.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu4.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:434px;" src="images/food/nut5.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu5.png', 'newwindow', 'height=465, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:485px;" src="images/food/nut6.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu6.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:536px;" src="images/food/nut7.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu7.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:587px;" src="images/food/nut8.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu8.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				
				<img style="position:absolute; top:10px; left:743px;" src="images/food/nut9.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu9.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
				
				<img style="position:absolute; top:10px; left:788px;" src="images/food/nut10.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu10.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:833px;" src="images/food/nut11.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu11.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">

				<img style="position:absolute; top:10px; left:878px;" src="images/food/nut12.png" 
				onclick="window.open ('illustrate_nutrition.jsp?nut=illu12.png', 'newwindow', 'height=530, width=575, top=0, left=0, toolbar=0, menubar=0, scrollbars=1, resizable=0, location=0, status=0')">
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
</body>
</html>