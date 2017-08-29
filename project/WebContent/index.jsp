<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康e起Go</title>

<LINK rel=stylesheet type=text/css href="css/sharejs.css">

<style type="text/css">
#slidingBlock {
    width:600px; margin-top:-25px; margin-left:17px; padding:1px; over-flow:hidden
}
#slidingBlock h4 {
    padding-top:5px; float:left;width:100px;height:30px;line-height:25px;text-align:center;font-size:12px;over-flow:hidden
}
#slidingBlock h4.menuNoh {
    font-weight:normal;color:#333333;background:url(images/index/title_h.png) no-repeat
}
#slidingBlock h4.menuNom {
    font-weight:normal;color:#333333;background:url(images/index/title_m.png) no-repeat
}
#slidingBlock h4.menuNob {
    font-weight:normal;color:#333333;background:url(images/index/title_b.png) no-repeat
}
#slidingBlock h4.menuOnh {
   padding-top:10px; font-weight:bold;color:#000;background:url(images/index/titleon_h.png) no-repeat
}
#slidingBlock h4.menuOnm {
   padding-top:10px; font-weight:bold;color:#000;background:url(images/index/titleon_m.png) no-repeat
}
#slidingBlock h4.menuOnb {
   padding-top:10px; font-weight:bold;color:#000;background:url(images/index/titleon_b.png) no-repeat
}
#slidingBlock DIV.slidingList_none {
    display:none
}
#slidingBlock DIV.slidingList {
    margin:0px;padding:5px;height:150px
}

/*Tooltips*/
.tooltips{
position:relative; 
}
.tooltips:hover{
z-index:3;
width:300px;
height:200px; 
}
.tooltips span{
display: none;
}
.tooltips:hover span{ 
display:block;
position:absolute;
top:0px;
left:-40px;
z-index:3;
width:300px;
height:200px;
background:url(images/index/illustrate_content.png) no-repeat;
text-align:left;
padding:33px 0 0 16px;
color:black;
}
/*Tooltips*/
</style>

<SCRIPT type=text/javascript>
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}

var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
	}
}

var Tween = {
	Quart: {
		easeOut: function(t,b,c,d){
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
	},
	Back: {
		easeOut: function(t,b,c,d,s){
			if (s == undefined) s = 1.70158;
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		}
	},
	Bounce: {
		easeOut: function(t,b,c,d){
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
	}
}


//容器对象,滑动对象,切换数量
var SlideTrans = function(container, slider, count, options) {
	this._slider = $(slider);
	this._container = $(container);//容器对象
	this._timer = null;//定时器
	this._count = Math.abs(count);//切换数量
	this._target = 0;//目标值
	this._t = this._b = this._c = 0;//tween参数
	
	this.Index = 0;//当前索引
	
	this.SetOptions(options);
	
	this.Auto = !!this.options.Auto;
	this.Duration = Math.abs(this.options.Duration);
	this.Time = Math.abs(this.options.Time);
	this.Pause = Math.abs(this.options.Pause);
	this.Tween = this.options.Tween;
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	var bVertical = !!this.options.Vertical;
	this._css = bVertical ? "top" : "left";//方向
	
	//样式设置
	var p = CurrentStyle(this._container).position;
	p == "relative" || p == "absolute" || (this._container.style.position = "relative");
	this._container.style.overflow = "hidden";
	this._slider.style.position = "absolute";
	
	this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
};
SlideTrans.prototype = {
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Vertical:	true,//是否垂直方向（方向不能改）
		Auto:		true,//是否自动
		Change:		0,//改变量
		Duration:	50,//滑动持续时间
		Time:		10,//滑动延时
		Pause:		2000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){},//完成转换时执行
		Tween:		Tween.Quart.easeOut//tween算子
	};
	Extend(this.options, options || {});
  },
  //开始切换
  Run: function(index) {
	//修正index
	index == undefined && (index = this.Index);
	index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
	//设置参数
	this._target = -Math.abs(this.Change) * (this.Index = index);
	this._t = 0;
	this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
	this._c = this._target - this._b;
	
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	//未到达目标继续移动否则进行下一次滑动
	if (this._c && this._t < this.Duration) {
		this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
		this._timer = setTimeout(Bind(this, this.Move), this.Time);
	}else{
		this.MoveTo(this._target);
		this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
	}
  },
  //移动到
  MoveTo: function(i) {
	this._slider.style[this._css] = i + "px";
  },
  //下一个
  Next: function() {
	this.Run(++this.Index);
  },
  //上一个
  Previous: function() {
	this.Run(--this.Index);
  },
  //停止
  Stop: function() {
	clearTimeout(this._timer); this.MoveTo(this._target);
  }
};
</SCRIPT>
</head>
<body>	
<%@ include file="menu.jsp" %>

<div style="background:url(images/index/background.jpg) repeat; margin-top:2px; padding-top:20px">
	<div style="width:900px; height:970px; margin:0 auto 0 auto">
		<div style="width:898px; height:17px; background:url(images/index/index_top.gif) no-repeat;">
		</div>
		<div style="position:relative; width:898px; height:856px; background:url(images/index/index_bg.gif) repeat-y;">
			<a href="resume1.jsp"><IMG style="position:absolute; top:1px; right:21px" border="0" SRC="images/index/resume.png"></a><br/>
			<a href="member_step1.jsp"><IMG style="position:absolute; top:265px; right:23px" border="0" SRC="images/index/member_join.png"></a>
			<a href="body.jsp"><IMG style="position:absolute; top:368px; right:22px" border="0" SRC="images/index/evaluation.png"></a>
			
			
			<div style="position:absolute; top:5px; left:20px">
				<div style="background:url(images/index/head1.png) no-repeat; width:637px; height:50px">
				</div>
				<div align=left style="background:url(images/index/middle.png) repeat-y; width:637px; height:186px">		
					<DIV style="margin:1px 0 0 18px" id=idContainer2 class=container>
						<TABLE id=idSlider2 border=0 cellSpacing=0 cellPadding=0>
  						<TBODY>
  						<TR>
    						<TD class=td_f><A href="#" target="_blank"><IMG src="images/index/01.png"></A></TD>
							<TD class=td_f><A href="#" target="_blank"><IMG src="images/index/02.png"></A></TD>
							<TD class=td_f><A href="#" target="_blank"><IMG src="images/index/03.png"></A></TD>
							<TD class=td_f><A href="#" target="_blank"><IMG src="images/index/04.png"></A></TD>
							<TD class=td_f><A href="#" target="_blank"><IMG src="images/index/05.png"></A></TD>
  						</TR></TBODY></TABLE>
						<UL id=idNum class=num></UL>
					</DIV>
				</div>
				<div style="background:url(images/index/bottom.png) no-repeat; width:637px; height:40px"></div>
				
<SCRIPT>
	var forEach = function(array, callback, thisObject){
		if(array.forEach){
			array.forEach(callback, thisObject);
		}else{
			for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
		}
	}
	
	var st = new SlideTrans("idContainer2", "idSlider2", 5, { Vertical: false });
	
	var nums = [];
	//插入數字
	for(var i = 0, n = st._count - 1; i <= n;){
		(nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
	}
	
	forEach(nums, function(o, i){
		o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
		o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
	})
	
	//設置按鈕樣式
	st.onStart = function(){
		forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
	}
	st.Run();
</SCRIPT>				
				
				<div style="background:url(images/index/head.png) no-repeat; width:637px; height:40px"></div>
				<div align=left style="position:relative; background:url(images/index/middle1.png) repeat-y; width:637px; height:200px">		
<div id="slidingBlock">
<script language="javascript">
  function switchmodTag(modtag,modcontent,modk) {
    for(i=1; i <7; i++) {
      if (i==modk) {
        if(i==1){
          document.getElementById(modtag+i).className="menuOnh";document.getElementById(modcontent+i).className="slidingList";}
        else if(i==6){
          document.getElementById(modtag+i).className="menuOnb";document.getElementById(modcontent+i).className="slidingList";}
        else{
          document.getElementById(modtag+i).className="menuOnm";document.getElementById(modcontent+i).className="slidingList";}
      }
      else {
          if(i==1){
       		document.getElementById(modtag+i).className="menuNoh";document.getElementById(modcontent+i).className="slidingList_none";}
       	  else if(i==6){
       		document.getElementById(modtag+i).className="menuNob";document.getElementById(modcontent+i).className="slidingList_none";}
       	  else{
       		document.getElementById(modtag+i).className="menuNom";document.getElementById(modcontent+i).className="slidingList_none";}
      }
    }
  }
</script>
	<h4 class="menuOnh" id="mod1" onmouseover="switchmodTag('mod','slidingList','1');this.blur();">
	測量小工具</h4>
	<h4 class="menuNom" id="mod2" onmouseover="switchmodTag('mod','slidingList','2');this.blur();">
	BMI</h4>
	<h4 class="menuNom" id="mod3" onmouseover="switchmodTag('mod','slidingList','3');this.blur();">
	標準體重</h4>
	<h4 class="menuNom" id="mod4" onmouseover="switchmodTag('mod','slidingList','4');this.blur();">
	腰臀比</h4>
	<h4 class="menuNom" id="mod5" onmouseover="switchmodTag('mod','slidingList','5');this.blur();">
	基礎代謝率</h4>
	<h4 class="menuNob" id="mod6" onmouseover="switchmodTag('mod','slidingList','6');this.blur();">
	熱量需求</h4>
	<div style="position:absolute; top:15px; left:12px" class="slidingList" id="slidingList1">
		<table><tr>
			<td style="position:relative;">
				<img style="position:absolute; top:25px; left:30px;" src="images/index/body.png">
			</td>
			<td width=800 height=200 style="position:relative;">
				<div style="position:absolute; top:35px; left:210px;">
					<B>BMI</B>：可以了解您的<B>身體質量指數</B><BR/>
					<B>標準體重</B>：可以了解您<B>最理想的體重數</B><BR/>
					<B>腰臀比</B>：可以了解您的<B>肥胖程度</B><BR/>
					<B>基礎代謝率</B>：可以了解您<B>每日最低消耗熱量</B><BR/>
					<B>熱量需求</B>：可以了解您<B>每日理想需求熱量</B>
				</div>	
			</td>
		</tr></table>	
	</div>	
<form method="post" name="f">
	<div style="position:absolute; top:15px; left:12px" class="slidingList_none" id="slidingList2">
		<table>
			<tr>
<script language="javascript">
function test1()
{
	var a=parseInt(document.f.height.value)/100;
	var b=parseInt(document.f.weight.value);
	document.f.bmi.value=(b/(a*a)).toFixed(2);
}
</script>			
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:20px; left:10px;"><img src="images/index/icon.png"></div> 
					<div style="position:absolute; top:20px; left:40px; font-size:18px; font-weight:bold;">測量 BMI 值，了解健康體態 </div> 
					<div style="position:absolute; top:70px; left:80px; font-size:15px;">身高:<input style="border:0; border-bottom:1px solid gray" type=text id=height size=5>公分 </div> 
					<div style="position:absolute; top:100px; left:80px; font-size:15px;">體重:<input style="border:0; border-bottom:1px solid gray" type=text id=weight size=5>公斤</div> 
					<div style="position:absolute; top:150px; left:165px;"><input type=button id=sumb1 value=測量 onclick="test1()"></div>
					<div style="position:absolute; top:150px; left:80px;"><input type=reset id=reset1 value=重填></div>
					<div style="position:absolute; top:170px; left:225px;"><img src="images/index/illustrate.png"></div>
					<div class="tooltips" style="position:absolute; top:172px; left:255px; font-size:13px;">說明
					<span style="position:relative;">
					<font style="font-size:18px; font-weight:bold">身體質量指數<br/>(Body Mass Index, 簡稱 BMI)</font><br/><br/>
					身體質量指數=體重(公斤)÷身高(公尺)平方 (BMI=Kg÷m<sup>2</sup>)<br/><br/>
					人體健康最理想的數值為：22<br/><br/>
					<font style="position:absolute; bottom:20px; right:30px; font-size:10px; font-weight:bold">資料來源:行政院衛生署</font>
					</span>
					</div>
				</td>
				<td style="border-left:1px solid #D2D2D2"></td>
				<td width=300 height=200  style="position:relative;">
					<div style="position:absolute; top:10px; left:40px; font-size:18px; font-weight:bold;">您的 BMI 值=<input type=text id=bmi size=5></div> 
					<div align=center style="position:absolute; top:45px; left:40px; font-size:15px;">
						<table style="border:1px solid gray">
						<tr><td width=150 style="border:1px solid gray">BMI＜18.5：</td><td width=80 style="border:1px solid gray">體重過輕</td></tr>
						<tr><td style="border:1px solid gray">18.5≦BMI＜24：</td><td style="border:1px solid gray">體重正常</td></tr>
						<tr><td style="border:1px solid gray">24≦BMI＜27：</td><td style="border:1px solid gray"> 過    重</td></tr>
						<tr><td style="border:1px solid gray">27≦BMI＜30：</td><td style="border:1px solid gray">輕度肥胖</td></tr>
						<tr><td style="border:1px solid gray">30≦BMI＜35：</td><td style="border:1px solid gray">中度肥胖</td></tr>
						<tr><td style="border:1px solid gray">BMI≧35：</td><td style="border:1px solid gray">重度肥胖</td></tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="position:absolute; top:15px; left:12px" class="slidingList_none" id="slidingList3">
		<table>
			<tr>
<script language="javascript">
function test2()
{
	if(document.f.gender1.checked == true)
	{
		var a=parseInt(document.f.height_s.value);
		var b=parseInt(document.f.weight_s.value);
		document.f.s_weight.value=((a-80)*0.7).toFixed(2);
		var c=(a-80)*0.7;
		document.f.p_weight.value=((b-c)/c*100).toFixed(2);
	}
	if(document.f.gender2.checked == true)
	{
		var a=parseInt(document.f.height_s.value);
		var b=parseInt(document.f.weight_s.value);
		document.f.s_weight.value=((a-70)*0.6).toFixed(2);
		var c=(a-70)*0.6;
		document.f.p_weight.value=((b-c)/c*100).toFixed(2);
	}
}
</script>				
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:10px; left:7px;"><img src="images/index/icon.png"></div> 
					<div style="position:absolute; top:12px; left:37px; font-size:18px; font-weight:bold;">測量標準體重，了解肥胖程度</div>
					<div style="position:absolute; top:50px; left:80px; font-size:15px;">
					性別:
						<label id=gender1><input type="radio" name="gender" id=gender1 value="男性">男性</label>
	    				<label id=gender2><input type="radio" name="gender" id=gender2 value="女性">女性</label> 
	    			</div>
	    			<div style="position:absolute; top:80px; left:80px; font-size:15px;">身高:<input style="border:0; border-bottom:1px solid gray" type=text id=height_s size=5>公分 </div>
					<div style="position:absolute; top:110px; left:80px; font-size:15px;">體重:<input style="border:0; border-bottom:1px solid gray" type=text id=weight_s size=5>公斤 </div>
					<div style="position:absolute; top:150px; left:165px;"><input type=button id=sumb2 value=測量 onclick="test2()"></div>
					<div style="position:absolute; top:150px; left:80px;"><input type=reset id=reset2 value=重填></div>
					<div style="position:absolute; top:170px; left:225px;"><img src="images/index/illustrate.png"></div>
					<div class="tooltips" style="position:absolute; top:172px; left:255px; font-size:13px;">說明
					<span style="position:relative;">
					<font style="font-size:18px; font-weight:bold">標準體重</font><br/><br/>
					男性： 標準體重 = (身高(公分)-80)×70%<br/>
					女性： 標準體重 = (身高(公分)-70)×60%<br/><br/>
					標準體重±10% 為 正常體重<br/><br/>
					<font style="position:absolute; bottom:20px; right:30px; font-size:10px; font-weight:bold">資料來源:行政院衛生署</font>
					</span>
					</div>
				</td>
				<td style="border-left:1px solid #D2D2D2"></td>
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:10px; left:30px; font-size:18px; font-weight:bold;">您的 標準體重=<input type=text id=s_weight size=5>公斤</div>
					<div style="position:absolute; top:35px; left:30px; font-size:18px; font-weight:bold;">您的 超重百分比=<input type=text id=p_weight size=5>％</div>
					<div align=center style="position:absolute; top:65px; left:80px; font-size:14px;">
						<table>
							<tr><td width=100 style="border:1px solid gray">超重百分比</td><td width=50 style="border:1px solid gray">意義</td></tr>
							<tr><td style="border:1px solid gray">+20%以上</td><td style="border:1px solid gray">肥胖</td></tr>
							<tr><td style="border:1px solid gray">+10%~+20%</td><td style="border:1px solid gray">過重</td></tr>
							<tr><td style="border:1px solid gray">+10%~-10%</td><td style="border:1px solid gray">正常</td></tr>
							<tr><td style="border:1px solid gray">-10%~-20%</td><td style="border:1px solid gray">過輕</td></tr>
							<tr><td style="border:1px solid gray">-20%以下</td><td style="border:1px solid gray">瘦弱</td></tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="position:absolute; top:15px; left:12px" class="slidingList_none" id="slidingList4">
		<table>
			<tr>
<script language="javascript">
function test3()
{
	var a=parseInt(document.f.waist.value);
	var b=parseInt(document.f.hip.value);
	document.f.my_waist.value=a;
	document.f.waist_hip.value=a/b;
}
</script>			
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:20px; left:18px;"><img src="images/index/icon.png"></div> 
					<div style="position:absolute; top:22px; left:48px; font-size:18px; font-weight:bold;">測量腰臀比，了解肥胖程度 </div>
					<div style="position:absolute; top:70px; left:90px; font-size:15px;">腰圍:<input style="border:0; border-bottom:1px solid gray" type=text id=waist size=5>吋</div> 
					<div style="position:absolute; top:100px; left:90px; font-size:15px;">臀圍:<input style="border:0; border-bottom:1px solid gray" type=text id=hip size=5>吋</div> 
					<div style="position:absolute; top:150px; left:165px;"><input type=button id=sumb3 value=測量 onclick="test3()"></div>
					<div style="position:absolute; top:150px; left:80px;"><input type=reset id=reset3 value=重填></div>
					<div style="position:absolute; top:170px; left:225px;"><img src="images/index/illustrate.png"></div>
					<div class="tooltips" style="position:absolute; top:172px; left:255px; font-size:13px;">說明
					<span style="position:relative;">
					<font style="font-size:18px; font-weight:bold">腰圍 & 腰臀比</font><br/><br/>
					<font style="position:absolute; top:70px; left:17px;">
					男性： 標準腰圍 = 小於35.5吋<br/>
					女性： 標準腰圍 = 小於31吋<br/>
					</font>
					<font style="position:absolute; bottom:40px; left:17px;">
					腰臀比 = 腰圍÷臀圍<br/>
					男性：超出0.95 / 女性：超出0.85<br/>
					易罹患心血管疾病、高血壓、動脈硬化、<br/>糖尿病、高血脂症等慢性病。
					</font>
					<font style="position:absolute; bottom:20px; right:30px; font-size:10px; font-weight:bold">資料來源:行政院衛生署</font>
					</span>
					</div>
				</td>
				<td style="border-left:1px solid #D2D2D2"></td>
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:3px; left:30px; font-size:18px; font-weight:bold;">您的 腰圍=<input type=text id=my_waist size=5>吋</div>
					<div style="position:absolute; top:33px; left:30px; font-size:18px; font-weight:bold;">您的 腰臀比=<input type=text id=waist_hip size=5></div>
					<div align=center style="position:absolute; top:65px; left:30px; font-size:13px;">
						<table>
						<tr><td width=50 style="border:1px solid gray">腰圍</td><td width=100 style="border:1px solid gray">男性</td><td width=100 style="border:1px solid gray">女性</td></tr>
						<tr><td style="border:1px solid gray">標準</td><td style="border:1px solid gray">＜35.5吋</td><td style="border:1px solid gray">＜31吋</td></tr>
						<tr><td style="border:1px solid gray">肥胖</td><td style="border:1px solid gray">≧35.5吋</td><td style="border:1px solid gray">≧31吋</td></tr>
						</table>
					</div>
					<div align=center style="position:absolute; top:135px; left:30px; font-size:13px;">
						<table>
						<tr><td width=50 style="border:1px solid gray">腰臀比</td><td width=100 style="border:1px solid gray">男性</td><td width=100 style="border:1px solid gray">女性</td></tr>
						<tr><td style="border:1px solid gray">標準</td><td style="border:1px solid gray">0.85-0.9</td><td style="border:1px solid gray">0.7-0.8</td></tr>
						<tr><td style="border:1px solid gray">異常</td><td style="border:1px solid gray">＞0.95</td><td style="border:1px solid gray">＞0.85</td></tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="position:absolute; top:15px; left:12px" class="slidingList_none" id="slidingList5">
		<table>
			<tr>
<script language="javascript">
function test4()
{
	if(document.f.gender3.checked == true)
	{
		var a=parseInt(document.f.height_b.value);
		var b=parseInt(document.f.weight_b.value);
		var c=parseInt(document.f.age1.value);
		document.f.bmr1.value=13.7*b+5*a-6.8*c+66;
		document.f.bmr2.value=13.7*b+5*a-6.8*c+66;
	}
	if(document.f.gender4.checked == true)
	{
		var a=parseInt(document.f.height_b.value);
		var b=parseInt(document.f.weight_b.value);
		var c=parseInt(document.f.age1.value);
		document.f.bmr1.value=9.6*b+1.8*a-4.7*c+655;
		document.f.bmr2.value=9.6*b+1.8*a-4.7*c+655;
	}
}
</script>			
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:5px; left:2px;"><img src="images/index/icon.png"></div> 
					<div style="position:absolute; top:7px; left:25px; font-size:18px; font-weight:bold;">測量基礎代謝率，維持健康體態</div>
					<div style="position:absolute; top:45px; left:80px; font-size:15px;">
					性別:
						<label id=gender3><input type="radio" name="gender" id=gender3 value="男性">男性</label>
	    				<label id=gender4><input type="radio" name="gender" id=gender4 value="女性">女性</label> 
	    			</div>
	    			<div style="position:absolute; top:75px; left:80px; font-size:15px;">年齡:<input style="border:0; border-bottom:1px solid gray" type=text id=age1 size=5>歲 </div>
	    			<div style="position:absolute; top:105px; left:80px; font-size:15px;">身高:<input style="border:0; border-bottom:1px solid gray" type=text id=height_b size=5>公分 </div>
					<div style="position:absolute; top:135px; left:80px; font-size:15px;">體重:<input style="border:0; border-bottom:1px solid gray" type=text id=weight_b size=5>公斤 </div>
					<div style="position:absolute; top:175px; left:165px;"><input type=button id=sumb2 value=測量 onclick="test4()"></div>
					<div style="position:absolute; top:175px; left:75px;"><input type=reset id=reset2 value=重填></div>
					<div style="position:absolute; top:170px; left:225px;"><img src="images/index/illustrate.png"></div>
					<div class="tooltips" style="position:absolute; top:172px; left:255px; font-size:13px;">說明
					<span style="position:relative;">
					<font style="font-size:18px; font-weight:bold">基礎代謝率 (簡稱 BMR)</font><br/><br/>
					<font style="position:absolute; top:75px;left:17px;">
					<b>基本代謝率</b>是指一個人在靜態的情況下，<br/>
					維持生命所需的最低熱量消耗卡數。<br/>
					</font>
					<font style="position:absolute; top:125px;left:9px; font-size:12px;">
					男性：BMR = (13.7×體重(公斤))+(5.0×身高(公分))-(6.8×年齡)+66<br/>
					女性：BMR = (9.6×體重(公斤))+(1.8×身高(公分))-(4.7×年齡)+655<br/>
					</font>
					<font style="position:absolute; bottom:20px; right:30px; font-size:10px; font-weight:bold">資料來源:行政院衛生署</font>
					</span>
					</div>
				</td>
				<td style="border-left:1px solid #D2D2D2"></td>
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:5px; left:25px; font-size:18px; font-weight:bold;">您的 基礎代謝率=<input type=text id=bmr1 size=5>大卡</div>
					<font style="position:absolute; top:45px;left:17px; font-size:15px">
					代表著你每天在靜止的狀況下至少會消耗<input type=text id=bmr2 size=5>大卡。<br/><br/>
					搭配<b>飲食</b>與<b>運動習慣</b>能有效的控制<b>自身體重</b>。
					</font>
				</td>
			</tr>
		</table>
	</div>
	<div style="position:absolute; top:15px; left:12px" class="slidingList_none" id="slidingList6">
		<table>
			<tr>
<script language="javascript">
function test5()
{
	if(document.f.gender5.checked == true)
	{
		var a=parseInt(document.f.height_c.value)/100;
		var b=parseInt(document.f.weight_c.value);
		var c=parseInt(document.f.age2.value);
		var bmi=b/(a*a);
		if(c>=4 && c<=6){
			document.f.cal.value=1700;
		}
		if(c>=7 && c<=9){
			document.f.cal.value=1900;
		}
		if(c>=10 && c<=12){
			document.f.cal.value=2150;
		}
		if(c>=13 && c<=15){
			document.f.cal.value=2500;
		}
		if(c>=16 && c<=19){
			document.f.cal.value=2650;
		}
		if(c>=20 && c<=24){
			if(bmi<18.5) {document.f.cal.value=2200;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=2450;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2850;}
			if(bmi>=30) {document.f.cal.value=3300;}	
		}
		if(c>=25 && c<=54){
			if(bmi<18.5) {document.f.cal.value=2100;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=2350;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2750;}
			if(bmi>=30) {document.f.cal.value=3100;}	
		}
		if(c>=55 && c<=69){
			if(bmi<18.5) {document.f.cal.value=2050;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=2250;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2650;}
			if(bmi>=30) {document.f.cal.value=3000;}	
		}
		if(c>=70){
			if(bmi<18.5) {document.f.cal.value=1800;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=2000;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2400;}
			if(bmi>=30) {document.f.cal.value=2750;}	
		}
	}
	if(document.f.gender6.checked == true)
	{
		var a=parseInt(document.f.height_c.value)/100;
		var b=parseInt(document.f.weight_c.value);
		var c=parseInt(document.f.age2.value);
		var bmi=b/(a*a);
		if(c>=4 && c<=6){
			document.f.cal.value=1550;
		}
		if(c>=7 && c<=9){
			document.f.cal.value=1650;
		}
		if(c>=10 && c<=12){
			document.f.cal.value=2100;
		}
		if(c>=13 && c<=15){
			document.f.cal.value=2200;
		}
		if(c>=16 && c<=19){
			document.f.cal.value=2100;
		}
		if(c>=20 && c<=24){
			if(bmi<18.5) {document.f.cal.value=1800;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=2000;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2350;}
			if(bmi>=30) {document.f.cal.value=2650;}	
		}
		if(c>=25 && c<=54){
			if(bmi<18.5) {document.f.cal.value=1700;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=1900;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2200;}
			if(bmi>=30) {document.f.cal.value=2500;}	
		}
		if(c>=55 && c<=69){
			if(bmi<18.5) {document.f.cal.value=1650;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=1850;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2150;}
			if(bmi>=30) {document.f.cal.value=2450;}	
		}
		if(c>=70){
			if(bmi<18.5) {document.f.cal.value=1600;}
			if(bmi>=18.5 && bmi<24) {document.f.cal.value=1800;}
			if(bmi>=24 && bmi<30) {document.f.cal.value=2100;}
			if(bmi>=30) {document.f.cal.value=2400;}	
		}
	}
}
</script>			
				<td width=300 height=200 style="position:relative;">
					<div style="position:absolute; top:5px; left:10px;"><img src="images/index/icon.png"></div> 
					<div style="position:absolute; top:7px; left:35px; font-size:18px; font-weight:bold;">測量熱量需求，維持健康體態</div>
					<div style="position:absolute; top:45px; left:80px; font-size:15px;">
					性別:
						<label id=gender5><input type="radio" name="gender" id=gender5 value="男性">男性</label>
	    				<label id=gender6><input type="radio" name="gender" id=gender6 value="女性">女性</label> 
	    			</div>
	    			<div style="position:absolute; top:75px; left:80px; font-size:15px;">年齡:<input style="border:0; border-bottom:1px solid gray" type=text id=age2 size=5>歲 </div>
	    			<div style="position:absolute; top:105px; left:80px; font-size:15px;">身高:<input style="border:0; border-bottom:1px solid gray" type=text id=height_c size=5>公分 </div>
					<div style="position:absolute; top:135px; left:80px; font-size:15px;">體重:<input style="border:0; border-bottom:1px solid gray" type=text id=weight_c size=5>公斤 </div>
					<div style="position:absolute; top:175px; left:165px;"><input type=button id=sumb2 value=測量 onclick="test5()"></div>
					<div style="position:absolute; top:175px; left:75px;"><input type=reset id=reset2 value=重填></div>
				</td>
				<td style="border-left:1px solid #D2D2D2"></td>
				<td width=300 height=200 style="position:relative;">
				<div style="position:absolute; top:5px; left:25px; font-size:18px; font-weight:bold;">您的 熱量需求=<input type=text id=cal size=5>大卡</div>
				<font style="position:absolute; top:45px; left:15px; font-size:15px;">
					國人<b>每日建議攝取熱量</b>，根據建議攝取量飲食，最能維持健康的體態。
				</font>
				<font style="position:absolute; bottom:0px; right:10px; font-size:10px; font-weight:bold">資料來源:行政院衛生署</font>
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
				</div>
				<div style="background:url(images/index/bottom1.png) no-repeat; width:637px; height:40px">
				</div>
			</div>
			
			<A HREF="foodnutrition1.jsp"><img style="position:absolute; top:565px; left:23px; z-index:-1" src="images/index/menu.png"></A>
			
			<A HREF="http://www.pdangel.com.tw/"><img style="position:absolute; top:570px; right:30px; z-index:-1" src="images/index/active.png"></A>
			
			<div style="position:relative; position:absolute; bottom:0px; right:25px; width:851px; height:97px; background:url(images/index/friend_site.png) no-repeat;">
				<A HREF="http://health.chinatimes.com/"><img style="position:absolute; top:41px; left:74px;" src="images/index/site1.png"></A>
				<A HREF="http://www.inventec.com/"><img style="position:absolute; top:47px; left:185px;" src="images/index/site2.png"></A>
				<A HREF="http://www.uho.com.tw/"><img style="position:absolute; top:46px; left:312px;" src="images/index/site3.png"></A>
				<A HREF="http://www.panda-star.com/"><img style="position:absolute; top:45px; left:473px;" src="images/index/site4.png"></A>
				<A HREF="http://touch.ncku.edu.tw/"><img style="position:absolute; top:44px; left:643px;" src="images/index/site5.png"></A>
			</div>
			
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