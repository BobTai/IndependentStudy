<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
 
/* remember to define focus styles! */
:focus {
    outline: 0;
}
 
/* remember to highlight inserts somehow! */
ins {
    text-decoration: none;
}
del {
    text-decoration: line-through;
}
 
/* tables still need 'cellspacing="0"' in the markup */
table {
    border-collapse: collapse;
    border-spacing: 0;
}

<!--
div, ul, p{
    margin: 0;
    padding: 0;
    font-weight: normal;
    font-style: normal;
    font-size: 105%;
    font-family: inherit;
}
body {
	background: url(images/index/head_background.png) repeat-x;
    text-align: center;
    font: 12px/1.5 Tahoma, Helvetica, Arial, sans-serif;
}

a:link, a:visited {
    color: #333;
    text-decoration: none;
}



/* Nav
==========================================================*/
.nav {
width:790px;
    position: relative;
	margin:0px auto;
    background: url(images/menu/menu2.png) no-repeat 0 0;
}
.navinner {
    background: url(images/menu/menu3.png) no-repeat 100% 0;
}
.navlist {
    height: 36px;
    line-height: 36px;
    overflow: hidden;
    margin: 0 10px;
    background: url(images/menu/menu1.png) repeat-x 0 0;
}
.nav li {
    float: left;
    display: inline;
    margin: 0 0 0 -2px;
    padding: 0 4px 0 6px;
    background: url(images/menu/menu4.png) no-repeat 0 0;
}
.nav a {
    display: block;
    width: 102px;
    text-align: center;
    font-size: 120%;
}
.nav a:link, .nav a:visited {
    color: #fff;
}
.nav a.current, .nav a:hover, .nav a:active {
    color: #fff;
    font-weight: bold;
    background: url(images/menu/menu5.png) no-repeat 50% 0;
}
.subnav {
    position: absolute;
    top: 41px;
    left: 0;
    float: left;
    height: 27px;
    line-height: 27px;
    white-space: nowrap;
    background: url(images/menu/lrtk.png) no-repeat 0 -180px;
}
* html .subnav {
    margin: 0 10px 0 -10px; /* IE 6 and below */
}
.subnav p {
    padding: 0 10px;
    background: url(images/menu/lrtk.png) no-repeat 100% -234px;
}
.subnav p span {
    display: block;
    background: url(images/menu/lrtk.png) repeat-x 0 -207px;
}
.subnav p.pointer {
    position: absolute;
    top: -4px;
    left: 0;
    height: 5px;
    width: 11px;
    padding: 0;
    margin-left: 20px;
    text-indent: -999em;
    background: url(images/menu/lrtk.png) repeat-x 0 -261px;
}
.subnav a {
    display: inline;
    padding: 0;
    font-size: 100%;
}
[class~="subnav"] a {
    padding: 0 3px;
}
.subnav, .subnav a:link, .subnav a:visited {
    color: #235e99;
}
.subnav a:hover, .subnav a:active {
    color: #235e99;
}
.subnav a:hover, .subnav a:active {
    font-weight: normal;
    background: none;
    border-bottom: 2px solid;
}
/* subnav position and pointer position */
#subnav1 { left: 120px; }
#subnav2 { left: 230px; }
#subnav3 { left: 340px; }
#subnav4 { left: 450px; }
#subnav5, #subnav6 { 
    left: auto;
    right: 0px;
}

#subnav1 .pointer,
#subnav2 .pointer,
#subnav3 .pointer,
#subnav4 .pointer { left: 30px; }
#subnav5 .pointer { left: auto; right: 170px; }
#subnav6 .pointer { left: auto; right: 60px; }

#subnav1, #subnav2, #subnav3, #subnav4 {
    min-width: 110px;
}
#subnav5 { min-width: 340px; }
#subnav6 { min-width: 140px; }


/* Note
==========================================================*/
.note {
    margin: 0 15px 10px;
	color:#666666;
}
.note span{
	float:right;
}
.disable {
    display: none;
}
-->
</style>

<script type="text/javascript">function $(id) {
    return document.getElementById(id);
}

function showMenu (baseID, divID) {
    baseID = $(baseID);
    divID  = $(divID);
    if (showMenu.timer) clearTimeout(showMenu.timer);
	hideCur();
    divID.style.display = 'block';
	showMenu.cur = divID;

    if (! divID.isCreate) {
        divID.isCreate = true;
        //divID.timer = 0;
        divID.onmouseover = function () {
            if (showMenu.timer) clearTimeout(showMenu.timer);
			hideCur();
            divID.style.display = 'block';
        };

        function hide () {
            showMenu.timer = setTimeout(function () {divID.style.display = 'none';}, 1000);
        }

        divID.onmouseout = hide;
        baseID.onmouseout = hide;
    }
	function hideCur () {
		showMenu.cur && (showMenu.cur.style.display = 'none');
	}
}</script>

</head>
<body>
<div style="width:900px; margin:0 auto 0 auto;">
<IMG style="float:left" SRC="images/index/logo.png">
<fieldset style="text-align:center; background:url(images/index/date.png) no-repeat; border:0px; width:140px; height:65px; float:right;">
<div style="font-size:30px; margin:20px 0 0 -5px">
<%
Date myDate = new Date();
int thisMonth = myDate.getMonth() + 1;
int thisDate = myDate.getDate();
out.print(thisMonth+"月"+thisDate+"日");
%>
</div>
</fieldset>
</div>
<div style="clear:both"></div> 

<div class="nav">
<div class="navinner">
  <ul class="navlist">
  <li><a href="index.jsp" id="nav_5" onmouseover="showMenu('nav_5','subnav5')">首頁</a></li>
  <li><a href="#" id="nav_1" onmouseover="showMenu('nav_1','subnav1')">健康測驗</a>
    <div class="subnav disable" id="subnav1">

      <p class="pointer">.</p>
      <p><span>
      <a href="body.jsp">自我評量</a> |
      <a href="a.jsp">健康診斷</a> |
      <a href="http://localhost:83/ehealth/image_diag.jsp">圖像偵測</a>
      </span></p>
    </div>  
  </li>
  <li><a href="#" id="nav_2" onmouseover="showMenu('nav_2','subnav2')">飲食評估</a>
    <div class="subnav disable" id="subnav2">
    	<p class="pointer">.</p>
      <p><span>
      <a href="foodcal.jsp">熱量計算</a> |
      <a href="foodnutrition1.jsp">自訂菜單</a>
      </span></p>
    </div>
  </li>
  <li><a href="#" id="nav_3" onmouseover="showMenu('nav_3','subnav3')">運動保健</a>
    <div class="subnav disable" id="subnav3">
      <p class="pointer">.</p>
      <p><span>
      <a href="exercisecal.jsp">熱量消耗</a>
      </span></p>
    </div>  	
  </li>
  <li><a href="#" id="nav_4" onmouseover="showMenu('nav_4','subnav4')">醫療搜尋</a>
    <div class="subnav disable" id="subnav4">
      <p class="pointer">.</p>
      <p><span>
      <a href="for_you.jsp">快速搜尋</a>
      </span></p>
    </div>  
  </li>
  <li><a href="http://localhost:83/discuss/discuss_index.jsp" id="nav_5" onmouseover="showMenu('nav_5','subnav5')">討論區</a>
    
  </li>
  <li><a href="#" id="nav_6" onmouseover="showMenu('nav_6','subnav6')">會員專區</a>
    <div class="subnav disable" id="subnav6">
      <p class="pointer">.</p>
      <p><span>
      <a href="resume1.jsp">健康履歷</a> |
      <a href="member_data.jsp">會員中心</a>
      </span></p>
    </div>
  </li>
  
  </ul>
</div>  
</div>

</body>
</html>