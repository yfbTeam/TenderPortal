﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_list" ValidateRequest="false" %>
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
	const string channel = "achieve";
	const int pagesize = 10;

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n    <meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n    <meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n    <link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" rel=\"stylesheet\" />\r\n    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/layout.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n    <!--Header-->\r\n    ");

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


	templateBuilder.Append("\r\n    <!--/Header-->\r\n    <div class=\"banner\"><img src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/20161114013920275.png\" alt=\"\"></div>\r\n    <div class=\"wrap1\">\r\n        <div class=\"w1200 clearfix\">\r\n            <div class=\"left1\">\r\n                <div class=\"navtitle\">经典业绩</div>\r\n                <ul class=\"nav\">\r\n                    ");
	DataTable newsList = get_category_child_list("achieve",0);

	int ncdr__loop__id=0;
	foreach(DataRow ncdr in newsList.Rows)
	{
		ncdr__loop__id++;


	if (ncdr__loop__id==1)
	{

	templateBuilder.Append("\r\n                    <li class=\"active1\"><a href=\"");
	templateBuilder.Append(linkurl("achieve_list",Utils.ObjectToStr(ncdr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(ncdr["title"]) + "\">" + Utils.ObjectToStr(ncdr["title"]) + "</a></li>\r\n                    ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <li><a href=\"");
	templateBuilder.Append(linkurl("achieve_list",Utils.ObjectToStr(ncdr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(ncdr["title"]) + "\">" + Utils.ObjectToStr(ncdr["title"]) + "</a></li>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                </ul>\r\n            </div>\r\n            <div class=\"productr\">\r\n                ");
	string category_nav = get_category_menu("achieve_list", category_id);

	templateBuilder.Append("\r\n                <p>经典业绩<b><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"首页\">首页</a><span>");
	templateBuilder.Append(Utils.ObjectToStr(category_nav));
	templateBuilder.Append("</span></b></p>\r\n                <div class=\"news\">\r\n                    <ul>\r\n                        ");
	DataTable newsList1 = get_article_list(channel, category_id, pagesize, page, "status=0", out totalcount, out pagelist, "achieve_list", category_id, "__id__");

	templateBuilder.Append("<!--取得一个分页DataTable-->\r\n                        ");
	foreach(DataRow dr in newsList1.Rows)
	{

	templateBuilder.Append("\r\n                        <li><a href=\"");
	templateBuilder.Append(linkurl("achieve_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\" target=\"_blank\"><span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</span><p>" + Utils.ObjectToStr(dr["title"]) + "</p></a></li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                    <!--页码列表-->\r\n                    <div class=\"page-box\">\r\n                        <div class=\"digg clearfix\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n                    </div>\r\n                    <!--/页码列表-->\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n\r\n    <!--Footer-->\r\n    ");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</p>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n    <!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
