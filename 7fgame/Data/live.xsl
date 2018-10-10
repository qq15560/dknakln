<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>直播聊天室--二级界面</title>
<script src="overlib_mini.js" type="text/javascript"></script>
<style type="text/css">
body{ font-family: 宋体; font-size:12px; line-height:19px;}
.font1{ font-family: 宋体; font-size:12px; line-height:19px;}
.text01{ font-size:12px; font-weight:bold; line-height:19px; color:#ff6c00; margin-left:100px; padding-top:3px;}
span {float:left;}
.text02{ font-size:12px; color:#3f3e3e; font-weight:bold; line-height:19px; margin-left:8px; padding-top:3px;}
.text03{ font-size:12px; color:#0066cb; line-height:19px; margin-left:-2px; margin-right:5px; padding-top:3px;}
.text04{ font-size:12px; color:#0066cb;}
.tab01{margin-bottom:3px; background-image: url(http://pt.7fgame.com/living/images/zz_02.gif); background-repeat:no-repeat;}
.tab02{margin-bottom:3px; background-image: url(http://pt.7fgame.com/living/images/tb_02.gif); background-repeat:no-repeat;}
.tab03{background-image: url(http://pt.7fgame.com/living/images/zz_02.gif); background-repeat:no-repeat;}
.tab04{background-image: url(http://pt.7fgame.com/living/images/tb_02.gif); background-repeat:no-repeat;}
#tab1{ font-size:12px; color:#3e3e3e; line-height:19px;}
#tab2{ font-size:12px; color:#3e3e3e; line-height:19px;}
#tab3{ font-size:12px; color:#3e3e3e; line-height:19px;}
#Table1{ font-size:12px; color:#3e3e3e; line-height:19px;}
#Table2{ font-size:12px; color:#3e3e3e; line-height:19px;}
#divZS{ overflow : auto; height:247; width:357; word-break:break-all; word-wrap:break-word; background-color:#FFFFFF; }
#divBI{ word-break:break-all; word-wrap:break-word; background-color:#FFFFFF;}
a img{border:none;}
.STYLE1 {color: #ff6d00}
table{ word-break:break-all; word-wrap:break-word;}
</style>
<script type="text/javascript">
var b1='&lt;table width="200" border="0"&gt;&lt;tr&gt;&lt;td bgcolor="#ffffff" width="200"&gt;&lt;font color="#000000" size="3";&gt;速度之靴&lt;/font&gt;&lt;br/&gt;&lt;br/&gt;&lt;font color="#dfcc00" size="2";&gt;价格：&lt;/font&gt;&lt;br/&gt;&lt;font color="#000000" size="2";&gt;500&lt;/font&gt;&lt;br/&gt;&lt;br/&gt;&lt;font color="#dfcc00" size="2";&gt;功能：&lt;/font&gt;&lt;br/&gt;&lt;font color="#000000" size="2";&gt;增加移动速度50（加速效果不可叠加）&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;';
</script>
<script language="javascript" type="text/javascript">
	var intervalId = null;
	var intervalId2 = null;
	var filepath = null;
	var LiveState = null;
	var matchid = 0;
	function loadZS()
	{
		var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = "false";
		if( filepath == null ) { return;}
		if( !xmlDoc.load(filepath) )
		{
			return false;
		}
		root = xmlDoc.documentElement;
		var strHTML,i,len,count=0;
		strHTML = "";
		i = 0;
		len = root.childNodes.length;
		for( i=0; i&lt;len; i++ )
		{
			var node = root.childNodes.item(i);
				
			if( i==0 )
			{
				if( node.childNodes.item(2).text == "1" )
				{
					strHTML = node.childNodes.item(1).text + "<br/>";
				}
				else
				{
					strHTML = '<span class="STYLE1">' + node.childNodes.item(1).text + '</span><br/>';
				}
			}
			else
			{
				if( node.childNodes.item(2).text == "1" )
				{
					strHTML += node.childNodes.item(1).text + "<br/>";
				}
				else
				{
					strHTML += '<span class="STYLE1">' + node.childNodes.item(1).text + '</span><br/>';
				}
			}
		}
		document.getElementById("divZS").innerHTML = "";
		document.getElementById("divZS").innerHTML = strHTML;
		document.getElementById("divZS").scrollTop = document.getElementById("divZS").scrollHeight;
	}
	
	function FormatUserName(username)
	{
		var  j  =  0; 
		var  len  =  username.length; 
		for(var i = 0; i &lt; len; i ++) 
		{ 
			if( j >= 13 )
			{
				username  =  username.substring(0, (i-1)) + "..";
				break;
			}
			if(username.substr(i,1).charCodeAt(0)> 255)  
			{ 
				j +=  2; 
			} 
			else 
			{ 
				j ++; 
			} 
		} 
		return username;
	}
			
	function loadBI()
	{
		var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = "false";
		if( !xmlDoc.load(document.URL) )
		{
			return false;
		}
		root = xmlDoc.documentElement;
		var strHTML,i;
		strHTML = "游戏名称：" + root.childNodes.item(1).text + "<br/>";
        if( root.childNodes.length == 6 )
		{
			strHTML += "游戏人数：0" + " VS 0" + "<br/>";
		}
        else if( root.childNodes.length == 7 )
		{
			strHTML += "游戏人数：" + root.childNodes.item(5).childNodes.item(2).text + " VS 0" + "<br/>";
		}
		else
		{
			strHTML += "游戏人数：" + root.childNodes.item(5).childNodes.item(2).text + " VS " + root.childNodes.item(6).childNodes.item(2).text + "<br/>";
		}
		strHTML += "游戏地图：" + root.childNodes.item(0).text + "<br/>";
		strHTML += "游戏时间：" + root.childNodes.item(2).text + "分钟<br/>";
		document.getElementById("divBI").innerHTML = "";
		document.getElementById("divBI").innerHTML = strHTML;
		document.getElementById("MapName").innerText = "";
		document.getElementById("GameName").innerText = "";
		document.getElementById("GameTime").innerText = "";
		document.getElementById("MapName").innerText = root.childNodes.item(0).text;
		if( root.childNodes.item(1).text.length > 6 )
			document.getElementById("GameName").innerText = root.childNodes.item(1).text.substring(0,6) + "..";
		else
			document.getElementById("GameName").innerText = root.childNodes.item(1).text;
		document.getElementById("GameTime").innerText = root.childNodes.item(2).text+"分钟";
		LiveState = root.childNodes.item(8).text;
		if(LiveState == "0" &amp;&amp; document.getElementById('tab1').style.backgroundImage=='url(http://pt.7fgame.com/living/images/main_01.jpg)')
		{
			document.getElementById("tab1").innerText = "本局竞猜";
			document.getElementById('table1').style.display='none';
			document.getElementById('table4').style.display='block';
			document.getElementById('table5').style.display='none';
		}
		else if(LiveState == "2" &amp;&amp; document.getElementById('tab1').style.backgroundImage=='url(http://pt.7fgame.com/living/images/main_01.jpg)')
		{
			document.getElementById("tab1").innerText = "最新战事";
			document.getElementById('table1').style.display='block';
			document.getElementById('table4').style.display='none';
			document.getElementById('table5').style.display='none';
		}
		else if(LiveState == "3" &amp;&amp; document.getElementById('tab1').style.backgroundImage=='url(http://pt.7fgame.com/living/images/main_01.jpg)')
		{
			document.getElementById("tab1").innerText = "竞猜结果";
			document.getElementById('table1').style.display='none';
			document.getElementById('table4').style.display='none';
			document.getElementById('table5').style.display='block';
		}
		document.getElementById('table0').style.display='none';
		if( parseInt(root.childNodes.item(9).text) > 0 &amp;&amp; matchid == 0 )
		{
			document.getElementById('td_iframe1').innerHTML = '<iframe name="tag2" align="center" width="100%" height="258" frameborder="0" scrolling="no"><xsl:attribute name="src">http://award.7fgame.com/LiveGuess/Guess.aspx?matchid=' + root.childNodes.item(9).text + '</xsl:attribute></iframe>';
			document.getElementById('td_iframe2').innerHTML = '<iframe name="tag3" align="center" width="100%" height="258" frameborder="0" scrolling="no"><xsl:attribute name="src">http://award.7fgame.com/LiveGuess/GuessResult.aspx?matchid=' + root.childNodes.item(9).text + '</xsl:attribute></iframe>';
			matchid = parseInt(root.childNodes.item(9).text);
		}
		
			if( root.childNodes.length >= 9 ){
				var len = root.childNodes.item(5).childNodes.length;
				for( i=3; i&lt;len; i++ )
				{
					var node = root.childNodes.item(5);
					document.getElementById(node.childNodes.item(i).childNodes.item(0).text).innerHTML = "";
					document.getElementById(node.childNodes.item(i).childNodes.item(0).text).innerHTML = FormatUserName(node.childNodes.item(i).childNodes.item(1).text) + "<br/>杀" + node.childNodes.item(i).childNodes.item(3).text + "人,死" + node.childNodes.item(i).childNodes.item(4).text + "次";
					document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).src = "http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=" + encodeURI(node.childNodes.item(i).childNodes.item(2).text);
					document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).alt = node.childNodes.item(i).childNodes.item(2).text;
					document.getElementById("Flower"+node.childNodes.item(i).childNodes.item(0).text).innerText = "(" + node.childNodes.item(i).childNodes.item(7).text + ")";
					document.getElementById("Egg"+node.childNodes.item(i).childNodes.item(0).text).innerText = "(" + node.childNodes.item(i).childNodes.item(8).text + ")";
					if( i == 7 || i == 12)
					{
						if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(离开)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(战斗)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(未知)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(未知)";
						}
						else
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(未知)";
						}					
					}
					else
					{
						if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(离开)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(战斗)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(未知)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(未知)";
						}
						else
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(未知)";
						}					
					}
				}
			}
			if( root.childNodes.length == 10 ){
				len = root.childNodes.item(6).childNodes.length;
				for( i=3; i&lt;len; i++ )
				{
					var node = root.childNodes.item(6);
					document.getElementById(node.childNodes.item(i).childNodes.item(0).text).innerHTML = "";
					document.getElementById(node.childNodes.item(i).childNodes.item(0).text).innerHTML = FormatUserName(node.childNodes.item(i).childNodes.item(1).text) + "<br/>杀" + node.childNodes.item(i).childNodes.item(3).text + "人,死" + node.childNodes.item(i).childNodes.item(4).text + "次";
					document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).src = "http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=" + encodeURI(node.childNodes.item(i).childNodes.item(2).text);
					document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).alt = node.childNodes.item(i).childNodes.item(2).text;
					document.getElementById("Flower"+node.childNodes.item(i).childNodes.item(0).text).innerText = "(" + node.childNodes.item(i).childNodes.item(7).text + ")";
					document.getElementById("Egg"+node.childNodes.item(i).childNodes.item(0).text).innerText = "(" + node.childNodes.item(i).childNodes.item(8).text + ")";
					if( i == 7 || i == 12)
					{
						if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(离开)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(战斗)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab03";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(未知)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(未知)";
						}
						else
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab04";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(未知)";
						}					
					}
					else
					{
						if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(战斗)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(离开)";
						}
						else if( node.childNodes.item(i).childNodes.item(5).text == "2" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "blue"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(战斗)";
						}
						else if( (node.childNodes.item(i).childNodes.item(5).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(5).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(6).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(离开)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "1" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab01";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "主战(未知)";
						}
						else if( (node.childNodes.item(i).childNodes.item(6).text != "1" &amp;&amp; node.childNodes.item(i).childNodes.item(6).text != "2") &amp;&amp; node.childNodes.item(i).childNodes.item(5).text == "2" )
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "替补(未知)";
						}
						else
						{
							document.getElementById(node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("R"+node.childNodes.item(i).childNodes.item(0).text).style.filter = "gray"; 
							document.getElementById("T"+node.childNodes.item(i).childNodes.item(0).text).className = "tab02";
							document.getElementById("Tbl"+node.childNodes.item(i).childNodes.item(0).text).title = node.childNodes.item(i).childNodes.item(1).text + "\r\n" + "未知(未知)";
						}					
					}
				}
			}
						
		for( i=0; i&lt;root.childNodes.length; i++ )
		{
			if( root.childNodes.item(i).nodeName == "MessageFile" )
			{
				filepath = root.childNodes.item(i).text;
				break;
			}
		}
	}

	intervalId = setInterval("loadZS()", 3000);
	intervalId2 = setInterval("loadBI()", 3000);	

function ChangeLab( count )
{
	if( count == 1 )
	{
		document.getElementById('tab1').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_01.jpg)';
		document.getElementById('tab2').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_02.jpg)';
		document.getElementById('tab3').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_05.jpg)';
		if(LiveState == "0")
		{
			document.getElementById("tab1").innerText = "本局竞猜";
			document.getElementById('table1').style.display='none';
			document.getElementById('table4').style.display='block';
			document.getElementById('table5').style.display='none';
		}
		else if(LiveState == "2")
		{
			document.getElementById("tab1").innerText = "最新战事";
			document.getElementById('table1').style.display='block';
			document.getElementById('table4').style.display='none';
			document.getElementById('table5').style.display='none';
		}
		else if(LiveState == "3")
		{
			document.getElementById("tab1").innerText = "竞猜结果";
			document.getElementById('table1').style.display='none';
			document.getElementById('table4').style.display='none';
			document.getElementById('table5').style.display='block';
		}
		document.getElementById('table2').style.display='none';
		document.getElementById('table3').style.display='none';
		document.getElementById("divZS").scrollTop = document.getElementById("divZS").scrollHeight;
	}
	else if( count == 2 )
	{
		document.getElementById('tab1').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_01_02.jpg)';
		document.getElementById('tab2').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_02_02.jpg)';
		document.getElementById('tab3').style.backgroundImage='url(http://pt.7fgame.com/living/images/main_05.jpg)';
		document.getElementById('table1').style.display='none';
		document.getElementById('table4').style.display='none';
		document.getElementById('table5').style.display='none';
		document.getElementById('table2').style.display='block';
		document.getElementById('table3').style.display='none';
	}

	document.getElementById('table0').style.display='none';
}
function loadCss()
{
	document.getElementById("divZS").scrollTop = document.getElementById("divZS").scrollHeight;
}
</script>
</head>

<body topmargin="0" leftmargin="0" scroll="no" onLoad="loadBI();loadZS();loadCss();" style="border-style: none;">
<table width="922" height="231" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22"><table id="__01" width="922" height="22" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="http://pt.7fgame.com/living/images/head_01.jpg" width="11" height="22" alt="" /></td>
        <td width="233" height="22" align="center" valign="buttom" background="http://pt.7fgame.com/living/images/head_02.jpg"><span class="text01"><xsl:value-of select="LiveGame/Team[1]/TeamName" /><xsl:if test="LiveGame/GameMap='三国争霸'">阵容</xsl:if><xsl:if test="LiveGame/GameMap='三国伏魔'">势力</xsl:if></span></td>
        <td width="434" height="22" align="center" valign="middle" background="http://pt.7fgame.com/living/images/head_02.jpg">
        <span class="text02">游戏地图：</span><span id="MapName" class="text03"></span>
        <span class="text02">游戏名称：</span><span id="GameName" class="text03"></span>
        <span class="text02">游戏已进行：</span><span id="GameTime" class="text03"></span>         </td>
        <td width="233" height="22" align="center" valign="buttom" background="http://pt.7fgame.com/living/images/head_02.jpg"><span class="text01"><xsl:value-of select="LiveGame/Team[2]/TeamName" /><xsl:if test="LiveGame/GameMap='三国争霸'">阵容</xsl:if><xsl:if test="LiveGame/GameMap='三国伏魔'">势力</xsl:if></span></td>
        <td><img src="http://pt.7fgame.com/living/images/head_05.jpg" width="11" height="22" alt="" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="202" bgcolor="#dddddd"><table width="922" height="202" border="0" cellspacing="0" cellpadding="0" style="background-image:url(http://pt.7fgame.com/living/images/bg_m03.jpg); background-position:top; background-repeat:repeat-x;">
      <tr>
        <td width="11" valign="top" style="background-image:url(http://pt.7fgame.com/living/images/bg_m01.jpg); background-position:center; background-repeat:repeat-y;"><img src="http://pt.7fgame.com/living/images/left_pic.jpg" width="11" height="40" /></td>
        <td width="260" height="202" valign="top"><table width="260" height="202" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="128" height="202" align="left" valign="top"><xsl:apply-templates select="/LiveGame/Team[1]/User[position()&lt;5]" /><xsl:apply-templates select="/LiveGame/Team[1]/User[position()&gt;4 and position()&lt;6]" /></td>
            <td width="4"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></td>
            <td width="128" valign="top"><xsl:apply-templates select="/LiveGame/Team[1]/User[position()&gt;5 and position()&lt;10]" /><xsl:apply-templates select="/LiveGame/Team[1]/User[position()&gt;9 and position()&lt;11]" /></td>
          </tr>
        </table></td>
        <td width="380" align="center" valign="top"><table id="__2" width="365" height="202" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td  width="365" height="24" align="center"><table width="365" height="24" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="74" align="center" valign="bottom" id="tab1" style="cursor:pointer;background-image:url(http://pt.7fgame.com/living/images/main_01.jpg);" onClick="ChangeLab(1)"></td>
                <td width="109" align="center" valign="bottom" id="tab2" style="cursor:pointer;background-image:url(http://pt.7fgame.com/living/images/main_02.jpg);" onClick="ChangeLab(2)">游戏局基本信息</td>
				<td width="125" align="center" valign="bottom" id="tab3" style="cursor:pointer;background-image:url(http://pt.7fgame.com/living/images/main_05.jpg);"></td>
                <td width="57"><img src="http://pt.7fgame.com/living/images/main_03.jpg" width="57" height="24" alt="" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td width="365" height="268" align="center" valign="top" bgcolor="#FFFFFF">
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table0">
              <tr>
                <td height="150" align="left" valign="top" bgcolor="#fbfbfb" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; padding:3px; border-bottom:1px #afafaf solid;"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></td>
              </tr>
            </table>
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table1" style="display:none;">
              <tr>
                <td height="150" align="left" valign="top" bgcolor="#fbfbfb" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; padding:3px; border-bottom:1px #afafaf solid;"><div id="divZS" class="#divZS"></div></td>
              </tr>
            </table>
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table2" style="display:none;"> 
                <tr>
                  <td bgcolor="#fbfbfb" valign="top" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; border-bottom:1px #afafaf solid; padding:3px;"><div id="divBI" class="#divBI"></div></td>
                </tr>
            </table>
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table3" style="display:none;">
              <tr>
                <td height="150" align="left" valign="top" bgcolor="#fbfbfb" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; padding:3px; border-bottom:1px #afafaf solid;"></td>
              </tr>
            </table>
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table4" style="display:none;">
              <tr>
                <td id="td_iframe1" height="150" align="left" valign="top" bgcolor="#fbfbfb" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; padding:3px; border-bottom:1px #afafaf solid;"></td>
              </tr>
            </table>
            <table width="365" height="268" border="0" cellspacing="0" cellpadding="0" id="Table5" style="display:none;">
              <tr>
                <td id="td_iframe2" height="150" align="left" valign="top" bgcolor="#fbfbfb" style="border-left:1px #afafaf solid; border-right:1px #afafaf solid; padding:3px; border-bottom:1px #afafaf solid;"></td>
              </tr>
            </table>
            </td>
          </tr>
        </table></td>
        <td width="260" valign="top"><table width="260" height="202" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="128" height="202" align="left" valign="top"><xsl:apply-templates select="/LiveGame/Team[2]/User[position()&lt;5]" /><xsl:apply-templates select="/LiveGame/Team[2]/User[position()&gt;4 and position()&lt;6]" /></td>
            <td width="4"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></td>
            <td width="128" valign="top"><xsl:apply-templates select="/LiveGame/Team[2]/User[position()&gt;5 and position()&lt;10]" /><xsl:apply-templates select="/LiveGame/Team[2]/User[position()&gt;9 and position()&lt;11]" /></td>
          </tr>
        </table></td>
        <td width="11" valign="top" style="background-image:url(http://pt.7fgame.com/living/images/bg_m02.jpg); background-position:center; background-repeat:repeat-y;"><img src="http://pt.7fgame.com/living/images/right_pic.jpg" width="11" height="40" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="7"><table id="__" width="922" height="4" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="http://pt.7fgame.com/living/images/bottom_01.jpg" width="11" height="7" alt="" /></td>
        <td><img src="http://pt.7fgame.com/living/images/bottom_02.jpg" width="900" height="7" alt="" /></td>
        <td><img src="http://pt.7fgame.com/living/images/bottom_03.jpg" width="11" height="7" alt="" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
</xsl:template>
<xsl:template match="/LiveGame/Team[1]/User[position()&lt;5]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>							
</xsl:template>
<xsl:template match="/LiveGame/Team[1]/User[position()&gt;4 and position()&lt;6]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>							
</xsl:template>
<xsl:template match="/LiveGame/Team[1]/User[position()&gt;5 and position()&lt;10]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
</xsl:template>			
<xsl:template match="/LiveGame/Team[1]/User[position()&gt;9 and position()&lt;11]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>							
</xsl:template>

<xsl:template match="/LiveGame/Team[2]/User[position()&lt;5]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>							
</xsl:template>
<xsl:template match="/LiveGame/Team[2]/User[position()&gt;4 and position()&lt;6]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>							
</xsl:template>
<xsl:template match="/LiveGame/Team[2]/User[position()&gt;5 and position()&lt;10]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab01"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab02"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
</xsl:template>			
<xsl:template match="/LiveGame/Team[2]/User[position()&gt;9 and position()&lt;11]">
			<xsl:if test="UserType=1 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=1"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(战斗)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF">
								<img width="28" height="28">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span>
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and UserState=2"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(离开)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=1 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab03"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="主战(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="UserType=2 and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="替补(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
			<xsl:if test="(UserType &lt; 1 or UserType &gt; 2) and (UserState &lt; 1 or UserState &gt; 2)"><table width="128" height="40" border="0" cellspacing="0" cellpadding="0" class="tab04"><xsl:attribute name="id">T<xsl:value-of select="UserId" /></xsl:attribute>
				<tr><td valign="middle"><table height="56"  style="margin-left:1px; cursor:hand;" title="未知(未知)"><xsl:attribute name="id">Tbl<xsl:value-of select="UserId" /></xsl:attribute><tr>
					<td width="32" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:1px;">
							<tr>
							<td width="32" align="center" valign="bottom" style="border:solid 1px #588598;" bgcolor="#FFFFFF" >
								<img width="28" height="28" style="filter:gray; ">
								<xsl:attribute name="id">R<xsl:value-of select="UserId" /></xsl:attribute>
								<xsl:attribute name="src">http://image.7fgame.com/heroitem/index.aspx?t=10&amp;v=<xsl:value-of select="RoleName" /></xsl:attribute>
								<xsl:attribute name="alt"><xsl:value-of select="RoleName" /></xsl:attribute>
								
								
								</img>
							</td>
							</tr>
							</table></td>
					<td width="88" align="left" style="padding-left:1px;" class="text04"><span style="filter:gray; ">
							<xsl:attribute name="id"><xsl:value-of select="UserId" /></xsl:attribute>
							<xsl:value-of select="UserName" /><br/>
					  杀<xsl:value-of select="KillNum" />人 死<xsl:value-of select="DeadNum" />次</span></td>
					  </tr>
                <tr>
                  <td height="13" colspan="2" align="center" valign="middle"><div><xsl:attribute name="id">DIV<xsl:value-of select="UserId" /></xsl:attribute><table width="" border="0" cellspacing="0" cellpadding="0" class="text04">
                      <tr>
                        <td width="11" height="13"><input type="image" src="http://pt.7fgame.com/living/images/up.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_1</xsl:attribute>
						</input></td>
                        <td width="42" height="13" align="center">
						<xsl:attribute name="id">Flower<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserFlower" />)</td>
                        <td width="4" height="13" align="left"></td>
                        <td width="11"><input type="image" src="http://pt.7fgame.com/living/images/low.gif" >
						<xsl:attribute name="id">Img<xsl:value-of select="UserId" />_2</xsl:attribute>
						</input></td>
                        <td width="42" align="center">
						<xsl:attribute name="id">Egg<xsl:value-of select="UserId" /></xsl:attribute>
						(<xsl:value-of select="UserEgg" />)</td>
                      </tr>
                  </table></div></td>
                </tr>
					</table></td></tr></table>
					</xsl:if>				
</xsl:template>
</xsl:stylesheet>