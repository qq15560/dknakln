var blessingArray = new Array();
var classArray = new Array("blue", "sky", "red", "yellow", "green");
var marginArray = new Array("108,7", "111,217", "108,14", "111,214", "108,8", "111,198");
var curMaxIndex = 0;
var curIndex = 0;
var blessingLength = 0;
var zindex = 0;
var t;
var param1, param2;
var subid;
var userInfo;

var defaultRandom = new Array();
var otherRandom = new Array();

$(document).ready(function () {
    setTimeout(divHide, 13000);
    setTimeout(bindBlessing, 14000);
});

function divHide() {
    $(".op_con div").fadeOut(1000);
}

Array.prototype.S=String.fromCharCode(2);
Array.prototype.in_array = function (e) {
    var r = new RegExp(this.S + e + this.S);
    return (r.test(this.S + this.join(this.S) + this.S));
}

function getRandomIndex(data,arr,length) {
    for (var i = 0; i < length; i++) {
        var index = getRandomNo(data.length);
        if (!arr.in_array(index))
            arr.push(index); else i--;
    }
}

function bindBlessing() {
    $.getScript("js/msgdata.js", function (data) {
        getRandomIndex(msgData.defaultMsg, defaultRandom, 20);
        for (var i = 0; i < defaultRandom.length; i++) {
            items = msgData.defaultMsg[defaultRandom[i]];
            var blessing = new Object();
            blessing.UserName = items.username;
            blessing.Content = items.content;
            blessingArray.push(blessing);
        }
        getRandomIndex(msgData.otherMsg, otherRandom, 30);
        for (var i = 0; i < otherRandom.length; i++) {
            items = msgData.otherMsg[otherRandom[i]];
            var blessing = new Object();
            blessing.UserName = items.username;
            blessing.Content = items.content;
            blessingArray.push(blessing);
        }
        blessingArray.sort(randomsort);
        cycleBlessing(0, 0);
    })
}

function cycleBlessing(i, index) {
    if (index == blessingArray.length) index = 0;
    curIndex = index;
    var curBlessing = blessingArray[index];
    if (curBlessing != null && curBlessing != 'undefined') {
        curMaxIndex++;
        if (i < 6) {
            var htmlStr = '';
            var j = (i + 6) % 6;
            var margin1 = marginArray[j].split(',');
            curMaxIndex++;
            htmlStr = "<p class=\"" + classArray[getRandomNo(classArray.length)] + "\" onmouseover=\"toTop(this);\" onmouseout=\"toTheBottom(this);\" style=\"top:" + margin1[0] + "px; left:" + margin1[1] + "px; z-index:" + curMaxIndex + "; display:none;\"><span class=\"op_con_t\"></span><span class=\"op_con_m\">" + curBlessing.UserName + "：" + curBlessing.Content + "</span><span class=\"" + (j > 2 ? "op_con_br" : "op_con_bl") + "\"></span></p>";
            $(".op_con").append(htmlStr);
            $(".op_con p").eq(i).fadeIn(2500);
            setTimeout("upMoving(" + (i % 6) + ")", 1500);
        } else {
            var updateItem = $(".op_con p").eq(i % 6);
            updateItem.hide();
            updateItem.removeClass(updateItem.attr("class"));
            updateItem.addClass(classArray[getRandomNo(classArray.length)]);
            var margin2 = marginArray[i % 6].split(',');
            updateItem.css("top", margin2[0] + "px");
            updateItem.css("left", margin2[1] + "px");
            updateItem.css("z-index", curMaxIndex);
            updateItem.find(".op_con_m").text(curBlessing.UserName + "：" + curBlessing.Content);
            updateItem.fadeIn(2500);
            setTimeout("upMoving(" + (i % 6) + ")", 1500);
        }
        param1 = i + 1; param2 = index + 1;
        t = setTimeout("cycleBlessing(" + param1 + "," + param2 + ")", 3000);
    }
}

function upMoving(index) {
    var obj = $(".op_con p").eq(index);
    var curTop = parseInt($(obj).css("top").replace("px", ""));
    if (curTop == 1) { $(obj).hide(); return; }
    $(obj).css("top", curTop - 1);
    setTimeout(function () { upMoving(index); }, 80);
}

function toTop(obj) {
    zindex = $(obj).css("z-index");
    $(obj).css("z-index", "9999999");
}

function toTheBottom(obj) {
    $(obj).css("z-index", zindex);
}

function getRandomNo(max) {
    return parseInt(max * Math.random());
}

function randomsort(a, b) {
    return Math.random() > .5 ? -1 : 1; //用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1
}

