<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	function inRow(s,t)
	{
		if(document.f1.d[0].checked == false && document.f1.d[1].checked == false && document.f1.d[2].checked == false){
			alert('尚未選擇用餐時段!');
			return false;
		}
		if(document.f1.num[t].value==""){
			alert('尚未填寫數量!');
			return false;
		}
		var d;
		if(document.f1.d[0].checked == true){
			d = document.f1.d[0].value;
		}
		if(document.f1.d[1].checked == true){
			d = document.f1.d[1].value;
		}
		if(document.f1.d[2].checked == true){
			d = document.f1.d[2].value;
		}
	    var table = document.getElementById(d);
	    var nextIndex = table.rows.length;
	    var nextRow = table.insertRow(nextIndex);
	    var num = parseInt(document.f1.num[t].value);
	    var number = parseInt(document.f1.number[t].value);
	    var unit = document.f1.unit[t].value;
	    var ca = parseInt(document.f1.ca[t].value);
	    var tot = num/number*ca;
	    var total = parseInt(document.f1.totca.value);
	    total = total + tot;
	    document.f1.totca.value = total;
	    nextRow.insertCell(0).innerHTML = s;
	    nextRow.insertCell(1).innerHTML = num+unit;
	    nextRow.insertCell(2).innerHTML = tot+"大卡";
	    nextRow.insertCell(3).innerHTML = '<a href="javascript:;" onclick="return del(this)">刪除</a>';
	    return false;
	}
	function del(obj)
	{
	    var table = obj.parentNode.parentNode.parentNode;
	    table.deleteRow(obj.parentNode.parentNode.rowIndex);
	}
</script>
</head>
<body>
<form name="f1" method="post">
<INPUT TYPE="radio" name=d id=d value=tid>早餐
<INPUT TYPE="radio" name=d id=d value=tid1>中餐
<INPUT TYPE="radio" name=d id=d value=tid2>晚餐<br/>


<span onclick="return inRow('爆米花',0)">爆米花</span><br/>
<input type="text" id="num" size=3 value=""/>克
<input type="hidden" id="number" value="100"/>
<input type="hidden" id="unit" value="克"/>
<input type="hidden" id="ca" value="320"/><br/>

<span onclick="return inRow('可樂',1)">可樂</span><br/>
<input type="text" id="num" size=3 value=""/>瓶
<input type="hidden" id="number" value="1"/>
<input type="hidden" id="unit" value="瓶"/>
<input type="hidden" id="ca" value="220"/>

總攝取熱量<input type="text" id="totca" size=3 value="0"/>
</form>
	<table border="1" width="300"><tr><td>早餐</td></tr></table>
	<table border="1" width="300" id="tid">
	
	</table>
	<p/>
	<table border="1" width="300"><tr><td>中餐</td></tr></table>
	<table border="1" width="300" id="tid1">
	    
	</table>
	<p/>
	<table border="1" width="300"><tr><td>晚餐</td></tr></table>
	<table border="1" width="300" id="tid2">
	   
	</table>
</body>
</html>