<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.cart" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2017/10/12 14:48:55.
		本页面代码由DTcms模板引擎生成于 2017/10/12 14:48:55. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>购物车 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/cart.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"index-bg\">\r\n    <div class=\"w1200 clearfix\">\r\n        <div class=\"top\">\r\n            <div class=\"you\">\r\n                <div id=\"txt\"></div>\r\n                <div class=\"search\">\r\n                    <input id=\"keywords\" name=\"keywords\" class=\"input sousuo\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入回车搜索\" x-webkit-speech=\"\" />\r\n                    <input class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" value=\"搜索\" style=\"border:none; background:none;\"/>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"logo\">\r\n            <a href=\"/\">\r\n                <img src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/logo.png\" alt=\"\">\r\n            </a>\r\n        </div>\r\n        <div class=\"head_r\">\r\n            <ul>\r\n                <li class=\"active\"><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"首 页\">首 页</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("about"));

	templateBuilder.Append("\" title=\"公司概况\">公司概况</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter"));

	templateBuilder.Append("\" title=\"新闻中心\">新闻中心</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("achieve"));

	templateBuilder.Append("\" title=\"经典业绩\">经典业绩</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("culture"));

	templateBuilder.Append("\" title=\"企业文化\">企业文化</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("server"));

	templateBuilder.Append("\" title=\"客户服务\">客户服务</a></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n</div>\r\n<script>\r\n    $(function(){\r\n        startTime();\r\n    })\r\n    //获取当前系统日期\r\n    function startTime()\r\n    {\r\n        var today=new Date();\r\n        var y=today.getFullYear();   //获取完整的年份(4位,1970-????)\r\n        var mo=today.getMonth();      //获取当前月份(0-11,0代表1月)\r\n        var d=today.getDate();       //获取当前日(1-31)\r\n        var h=today.getHours();\r\n        var m=today.getMinutes();\r\n        var s=today.getSeconds();\r\n        var t=today.getDay();\r\n        //调用checkTime（）函数，小于十的数字前加0\r\n        y=checkTime(y);\r\n        mo=checkTime(mo+1);\r\n        d=checkTime(d);\r\n        m=checkTime(m);\r\n        s=checkTime(s);\r\n        t=checkTime(t);\r\n\r\n        //s设置层txt的内容\r\n        document.getElementById('txt').innerHTML=y+\"年\"+mo+\"月\"+d+\"日\"+\"&nbsp;&nbsp;&nbsp;\"+h+\":\"+m+\"&nbsp;&nbsp;&nbsp;\";\r\n        //过500毫秒再调用一次\r\n        t=setTimeout('startTime()',500);\r\n        //小于10，加0\r\n        function checkTime(i)\r\n        {\r\n            if(i<10)\r\n            {i=\"0\"+i}\r\n            return i\r\n        }\r\n    }\r\n</");
	templateBuilder.Append("script>\r\n\r\n");


	templateBuilder.Append("\r\n<!--/Header-->\r\n  \r\n<div class=\"section clearfix\">\r\n  <div class=\"cart-box\">\r\n    <h1>我的购物车</h1>\r\n    <div class=\"cart-step\">\r\n      <ul>\r\n        <li class=\"selected\"><span>1</span>放进购物车</li>\r\n        <li><span>2</span>填写订单信息</li>\r\n        <li class=\"last\"><span>3</span>支付/确定订单</li>\r\n      </ul>\r\n    </div>\r\n  </div>\r\n  \r\n  <div class=\"line30\"></div>\r\n  <input id=\"jsondata\" name=\"jsondata\" type=\"hidden\" />\r\n  <table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"8\" cellspacing=\"0\" class=\"cart-table\">\r\n    <tr>\r\n      <th width=\"48\" align=\"center\"><a href=\"javascript:;\" onclick=\"selectCart(this);\">全选</a></th>\r\n      <th colspan=\"2\" align=\"left\">商品信息</th>\r\n      <th width=\"84\" align=\"left\">单价</th>\r\n      <th width=\"104\" align=\"center\">数量</th>\r\n      <th width=\"104\" align=\"left\">金额(元)</th>\r\n      <th width=\"84\" align=\"center\">积分</th>\r\n      <th width=\"54\" align=\"center\">操作</th>\r\n    </tr>\r\n    ");
	foreach(DTcms.Model.cart_items modelt in goodsList)
	{

	templateBuilder.Append("\r\n    <tr>\r\n      <td align=\"center\">\r\n        <input type=\"checkbox\" name=\"checkall\" class=\"checkall\" onclick=\"selectCart();\" />\r\n        <input name=\"hideArticleId\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.article_id));
	templateBuilder.Append("\" />\r\n        <input name=\"hideStockQuantity\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.stock_quantity));
	templateBuilder.Append("\" />\r\n        <input name=\"hideGoodsPrice\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.user_price));
	templateBuilder.Append("\" />\r\n        <input name=\"hidePoint\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.point));
	templateBuilder.Append("\" />\r\n      </td>\r\n      <td width=\"68\">\r\n        <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\">\r\n          <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\" class=\"img\" />\r\n        </a>\r\n      </td>\r\n      <td>\r\n        <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("</a>\r\n      </td>\r\n      <td>\r\n        ￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.user_price));
	templateBuilder.Append("\r\n      </td>\r\n      <td align=\"center\">\r\n        <div class=\"buy-box\">\r\n          <a href=\"javascript:;\" class=\"reduce\" onclick=\"updateCart(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', -1);\">-</a>\r\n          <input type=\"text\" name=\"goodsQuantity\" class=\"input\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("\" onblur=\"updateCart(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("');\" onkeydown=\"return checkNumber(event);\" />\r\n          <a href=\"javascript:;\" class=\"subjoin\" onclick=\"updateCart(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', 1);\">+</a>\r\n        </div>\r\n      </td>\r\n      <td>\r\n        <span class=\"red\">\r\n          ￥<label name=\"amountCount\">");
	templateBuilder.Append((modelt.user_price*modelt.quantity).ToString());

	templateBuilder.Append("</label>\r\n        </span>\r\n      </td>\r\n      <td align=\"center\">\r\n        <label name=\"pointCount\">\r\n          ");
	if (modelt.point>0)
	{

	templateBuilder.Append("\r\n            +\r\n          ");
	}	//end for if

	templateBuilder.Append((modelt.point*modelt.quantity).ToString());

	templateBuilder.Append("\r\n        </label>\r\n      </td>\r\n      <td align=\"center\">\r\n        <a onclick=\"deleteCart('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', this);\" href=\"javascript:;\">删除</a>\r\n      </td>\r\n    </tr>\r\n    ");
	}	//end for if

	if (goodsList.Count<1)
	{

	templateBuilder.Append("\r\n    <tr>\r\n      <td colspan=\"10\">\r\n        <div class=\"msg-tips\">\r\n          <div class=\"ico warning\"></div>\r\n          <div class=\"msg\">\r\n            <strong>购物车没有商品！</strong>\r\n            <p>您的购物车为空，<a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">马上去购物</a>吧！</p>\r\n          </div>\r\n        </div>\r\n      </td>\r\n    </tr>\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n    <tr>\r\n      <th colspan=\"8\" align=\"right\">\r\n        已选择商品 <b id=\"totalQuantity\" class=\"red\">0</b> 件 &nbsp;&nbsp;&nbsp;\r\n        商品总金额（不含运费）：<span class=\"red\">￥</span><b id=\"totalAmount\" class=\"red\">0</b>元\r\n      </th>\r\n    </tr>\r\n  </table>\r\n  \r\n  <div class=\"cart-foot\">\r\n    <div class=\"left btn-box\">\r\n      <a href=\"javascript:;\" onclick=\"selectCart(this);\">全选</a>\r\n      <a href=\"javascript:;\" onclick=\"deleteCart('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("');\">清空购物车</a>\r\n    </div>\r\n    <div class=\"right\">\r\n      <button class=\"btn\" onclick=\"javascript:location.href='");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("';\">继续购物</button>\r\n      <button class=\"btn btn-success\" onclick=\"formSubmit(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', '");
	templateBuilder.Append(linkurl("shopping"));

	templateBuilder.Append("');\">立即结算</button>\r\n    </div>\r\n  </div>\r\n  <div class=\"clear\"></div>\r\n    \r\n</div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</p>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
