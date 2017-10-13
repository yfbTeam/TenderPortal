<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.userorder_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2017/10/13 15:04:37.
		本页面代码由DTcms模板引擎生成于 2017/10/13 15:04:37. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>查看订单 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/ui-dialog.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/dialog-plus-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"index-bg\">\r\n    <div class=\"w1200 clearfix\">\r\n        <div class=\"top\">\r\n            <div class=\"you\">\r\n                <div id=\"txt\"></div>\r\n                <!--<div class=\"search\">\r\n                    <input id=\"keywords\" name=\"keywords\" class=\"input sousuo\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入回车搜索\" x-webkit-speech=\"\" />\r\n                    <input class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" value=\"搜索\" style=\"border:none; background:none;\"/>\r\n                </div>-->\r\n            </div>\r\n        </div>\r\n        <div class=\"logo\">\r\n            <a href=\"/\">\r\n                <img src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/logo.png\" alt=\"\">\r\n            </a>\r\n        </div>\r\n        <div class=\"head_r\">\r\n            <ul>\r\n                <li class=\"active\"><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"首 页\">首 页</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("about_list",65));

	templateBuilder.Append("\" title=\"公司概况\">公司概况</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter_list",52));

	templateBuilder.Append("\" title=\"新闻中心\">新闻中心</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("mes_list",53));

	templateBuilder.Append("\" title=\"招标信息\">招标信息</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("achieve_list",60));

	templateBuilder.Append("\" title=\"经典业绩\">经典业绩</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("culture_list",57));

	templateBuilder.Append("\" title=\"企业文化\">企业文化</a></li>\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("server_list",61));

	templateBuilder.Append("\" title=\"客户服务\">客户服务</a></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n</div>\r\n<script>\r\n    $(function(){\r\n        startTime();\r\n        var href = window.location.href,host = window.location.host;\r\n        $('.head_r ul li').each(function () {\r\n            itemhref = $(this).children('a').attr('href');\r\n            itemhref = itemhref.slice(host);\r\n            itemhref = itemhref.slice(0,itemhref.lastIndexOf('/'))\r\n           \r\n            if (href.indexOf(itemhref) > 1) {\r\n                $(this).addClass('active').siblings().removeClass('active');\r\n            }\r\n        })\r\n    })\r\n    //获取当前系统日期\r\n    function startTime()\r\n    {\r\n        var today=new Date();\r\n        var y=today.getFullYear();   //获取完整的年份(4位,1970-????)\r\n        var mo=today.getMonth();      //获取当前月份(0-11,0代表1月)\r\n        var d=today.getDate();       //获取当前日(1-31)\r\n        var h=today.getHours();\r\n        var m=today.getMinutes();\r\n        var s=today.getSeconds();\r\n        var t=today.getDay();\r\n        //调用checkTime（）函数，小于十的数字前加0\r\n        y=checkTime(y);\r\n        mo=checkTime(mo+1);\r\n        d=checkTime(d);\r\n        m=checkTime(m);\r\n        s=checkTime(s);\r\n        t=checkTime(t);\r\n\r\n        //s设置层txt的内容\r\n        document.getElementById('txt').innerHTML=y+\"年\"+mo+\"月\"+d+\"日\"+\"&nbsp;&nbsp;&nbsp;\"+h+\":\"+m+\"&nbsp;&nbsp;&nbsp;\";\r\n        //过500毫秒再调用一次\r\n        t=setTimeout('startTime()',500);\r\n        //小于10，加0\r\n        function checkTime(i)\r\n        {\r\n            if(i<10)\r\n            {i=\"0\"+i}\r\n            return i\r\n        }\r\n    }\r\n</");
	templateBuilder.Append("script>\r\n\r\n");


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"section clearfix\">\r\n  <div class=\"line30\"></div>\r\n\r\n  <div class=\"info-wrap\">\r\n    <!--左侧导航-->\r\n    ");



	templateBuilder.Append("\r\n    <!--/左侧导航-->\r\n    \r\n    <!--右侧内容-->\r\n    <div class=\"home-box\">\r\n      <!--查看订单-->\r\n      <div class=\"u-tab-head\">\r\n        <p>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("userorder","list"));

	templateBuilder.Append("\">交易订单</a>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("userorder","close"));

	templateBuilder.Append("\">已关闭订单</a>\r\n        </p>\r\n      </div>\r\n      <div class=\"u-tab-content\">\r\n        <div class=\"title-div\">\r\n          <strong>查看订单</strong>\r\n        </div>\r\n        \r\n        ");
	if (model.status<4)
	{

	if (model.payment_status>0)
	{

	templateBuilder.Append("\r\n        <div class=\"step-box\">\r\n        ");
	}
	else
	{

	templateBuilder.Append("\r\n        <div class=\"step-box mini\">\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n          <ul>\r\n            <!--下单-->\r\n            <li class=\"first done\">\r\n              <div class=\"progress\">\r\n                <span class=\"text\">下单</span>\r\n              </div>\r\n              <div class=\"info\">\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("\r\n              </div>\r\n            </li>\r\n            <!--/下单-->\r\n            \r\n            ");
	if (model.payment_status>0)
	{

	templateBuilder.Append("\r\n            <!--付款-->\r\n            ");
	if (model.payment_status==2)
	{

	templateBuilder.Append("\r\n              <li class=\"done\">\r\n            ");
	}
	else
	{

	templateBuilder.Append("\r\n              <li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n              <div class=\"progress\">\r\n                <span class=\"text\">付款</span>\r\n              </div>\r\n              <div class=\"info\">\r\n                ");
	if (model.payment_status==2)
	{

	templateBuilder.Append("\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.payment_time));
	templateBuilder.Append("\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n              </div>\r\n            </li>\r\n            <!--/付款-->\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            \r\n            <!--确认-->\r\n            ");
	if (model.status>=2)
	{

	templateBuilder.Append("\r\n            <li class=\"done\">\r\n            ");
	}
	else
	{

	templateBuilder.Append("\r\n            <li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n              <div class=\"progress\">\r\n                <span class=\"text\">确认</span>\r\n              </div>\r\n              <div class=\"info\">\r\n                ");
	if (model.status>=2)
	{

	templateBuilder.Append("\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.confirm_time));
	templateBuilder.Append("\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n              </div>\r\n            </li>\r\n            <!--/确认-->\r\n            \r\n            <!--发货-->\r\n            ");
	if (model.express_status==2)
	{

	templateBuilder.Append("\r\n            <li class=\"done\">\r\n            ");
	}
	else
	{

	templateBuilder.Append("\r\n            <li>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n              <div class=\"progress\">\r\n                <span class=\"text\">发货</span>\r\n              </div>\r\n              <div class=\"info\">\r\n                ");
	if (model.express_status==2)
	{

	templateBuilder.Append("\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.express_time));
	templateBuilder.Append("\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n              </div>\r\n            </li>\r\n            <!--发货-->\r\n            \r\n            <!--完成-->\r\n            ");
	if (model.status>2)
	{

	templateBuilder.Append("\r\n            <li class=\"last done\">\r\n            ");
	}
	else
	{

	templateBuilder.Append("\r\n            <li class=\"last\">\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n              <div class=\"progress\">\r\n                <span class=\"text\">完成</span>\r\n              </div>\r\n              <div class=\"info\">\r\n                ");
	if (model.status>2)
	{

	templateBuilder.Append("\r\n                ");
	templateBuilder.Append(Utils.ObjectToStr(model.complete_time));
	templateBuilder.Append("\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n              </div>\r\n            </li>\r\n            <!--完成-->\r\n          </ul>\r\n        </div>\r\n        <div class=\"line20\"></div>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n\r\n        <div class=\"form-box accept-box\">\r\n          <dl class=\"head\">\r\n            <dd>\r\n              订单号：");
	templateBuilder.Append(Utils.ObjectToStr(model.order_no));
	templateBuilder.Append("\r\n              ");
	if (get_order_payment_status(model.id))
	{

	templateBuilder.Append("\r\n              <a class=\"btn-pay\" href=\"");
	templateBuilder.Append(linkurl("payment","?action=confirm&order_no="+model.order_no));

	templateBuilder.Append("\">去付款</a>\r\n              ");
	}	//end for if

	templateBuilder.Append("\r\n            </dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>订单状态：</dt>\r\n            <dd>\r\n              ");
	templateBuilder.Append(get_order_status(model.id).ToString());

	templateBuilder.Append("\r\n            </dd>\r\n          </dl>\r\n          ");
	if (model.payment_status>0)
	{

	templateBuilder.Append("\r\n          <dl>\r\n            <dt>支付方式：</dt>\r\n            <dd>");
	templateBuilder.Append(get_payment_title(model.payment_id).ToString());

	templateBuilder.Append("</dd>\r\n          </dl>\r\n          ");
	}	//end for if

	if (model.express_status==2)
	{

	templateBuilder.Append("\r\n          <dl>\r\n            <dt>发货单号：</dt>\r\n            <dd>");
	templateBuilder.Append(get_express_title(model.express_id).ToString());

	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.express_no));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </div>\r\n              \r\n        <div class=\"line10\"></div>\r\n        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\" class=\"ftable\">\r\n          <tr>\r\n            <th align=\"left\" colspan=\"2\">商品信息</th>\r\n            <th width=\"10%\">单价</td>\r\n            <th width=\"10%\">积分</th>\r\n            <th width=\"10%\">数量</th>\r\n            <th width=\"10%\">金额</th>\r\n            <th width=\"10%\">积分</th>\r\n          </tr>\r\n          ");
	if (model.order_goods!=null)
	{

	foreach(DTcms.Model.order_goods modelt in model.order_goods)
	{

	templateBuilder.Append("\r\n          <tr>\r\n            <td width=\"60\">\r\n              <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\">\r\n                <img src=\"");
	templateBuilder.Append(get_article_img_url(modelt.article_id).ToString());

	templateBuilder.Append("\" class=\"img\" />\r\n              </a>\r\n            </td>\r\n            <td align=\"left\">\r\n              <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.article_id));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.goods_title));
	templateBuilder.Append("</a>\r\n              <p>");
	templateBuilder.Append(Utils.ObjectToStr(modelt.spec_text));
	templateBuilder.Append("</p>\r\n            </td>\r\n            <td align=\"center\">\r\n              <s>￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.goods_price));
	templateBuilder.Append("</s>\r\n              <p>￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.real_price));
	templateBuilder.Append("</p>\r\n            </td>\r\n            <td align=\"center\">\r\n              ");
	if (modelt.point>0)
	{

	templateBuilder.Append("\r\n              +\r\n              ");
	}	//end for if

	templateBuilder.Append("\r\n              ");
	templateBuilder.Append(Utils.ObjectToStr(modelt.point));
	templateBuilder.Append("\r\n            </td>\r\n            <td align=\"center\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("</td>\r\n            <td align=\"center\">￥");
	templateBuilder.Append((modelt.real_price*modelt.quantity).ToString());

	templateBuilder.Append("</td>\r\n            <td align=\"center\">");
	templateBuilder.Append((modelt.point*modelt.quantity).ToString());

	templateBuilder.Append("</td>\r\n          </tr>\r\n          ");
	}	//end for if

	}
	else
	{

	templateBuilder.Append("\r\n          <tr><td colspan=\"7\" align=\"center\">暂无记录</td></tr>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n          <tr>\r\n            <td colspan=\"7\" align=\"right\">\r\n              <p>商品金额：<b class=\"red\">￥");
	templateBuilder.Append(Utils.ObjectToStr(model.real_amount));
	templateBuilder.Append("</b>&nbsp;&nbsp;+&nbsp;&nbsp;运费：<b class=\"red\">￥");
	templateBuilder.Append(Utils.ObjectToStr(model.express_fee));
	templateBuilder.Append("</b>&nbsp;&nbsp;+ &nbsp;&nbsp;支付手续费：<b class=\"red\">￥");
	templateBuilder.Append(Utils.ObjectToStr(model.payment_fee));
	templateBuilder.Append("</b>&nbsp;&nbsp;税费：<b class=\"red\">");
	templateBuilder.Append(Utils.ObjectToStr(model.invoice_taxes));
	templateBuilder.Append("</b></p>\r\n              <p style=\"font-size:22px;\">应付总金额：<b class=\"red\">￥");
	templateBuilder.Append(Utils.ObjectToStr(model.order_amount));
	templateBuilder.Append("</b></p>\r\n            </td>\r\n          </tr>\r\n        </table>\r\n        \r\n        <div class=\"line10\"></div>\r\n        <div class=\"form-box accept-box\">\r\n          <dl class=\"head\">\r\n            <dd>收货信息</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>顾客姓名：</dt>\r\n            <dd>");
	templateBuilder.Append(Utils.ObjectToStr(model.accept_name));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>送货地址：</dt>\r\n            <dd>");
	templateBuilder.Append(Utils.ObjectToStr(model.area));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.address));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.post_code));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>联系电话：</dt>\r\n            <dd>");
	templateBuilder.Append(Utils.ObjectToStr(model.mobile));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(model.telphone));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>电子邮箱：</dt>\r\n            <dd>");
	templateBuilder.Append(Utils.ObjectToStr(model.email));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>备注留言：</dt>\r\n            <dd>");
	templateBuilder.Append(Utils.ObjectToStr(model.message));
	templateBuilder.Append("</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>开具发票：</dt>\r\n            <dd>\r\n              ");
	if (model.is_invoice==1)
	{

	templateBuilder.Append("\r\n               是\r\n              ");
	}
	else
	{

	templateBuilder.Append("\r\n               否\r\n              ");
	}	//end for if

	templateBuilder.Append("\r\n            </dd>\r\n          </dl>\r\n          ");
	if (model.is_invoice==1)
	{

	templateBuilder.Append("\r\n          <dl>\r\n            <dt>发票抬头：</dt>\r\n            <dd>\r\n              ");
	templateBuilder.Append(Utils.ObjectToStr(model.invoice_title));
	templateBuilder.Append("\r\n            </dd>\r\n          </dl>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </div>\r\n        \r\n      </div>\r\n      <!--/查看订单-->\r\n    </div>\r\n    <!--/右侧内容-->\r\n  </div>\r\n</div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</p>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
