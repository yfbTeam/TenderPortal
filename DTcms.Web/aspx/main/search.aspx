<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.search" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>站内搜索 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" rel=\"stylesheet\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"section clearfix\">\r\n  <!--右边-->\r\n  <div class=\"list-right\">\r\n    <div class=\"sidebar-box\">\r\n      <div class=\"line30\"></div>\r\n      <h3>栏目导航</h3>\r\n      <ul class=\"navbar\">\r\n        ");
	DataTable contentlist = get_article_list("content", 0, 0, "status=0");

	foreach(DataRow dr in contentlist.Rows)
	{

	templateBuilder.Append("\r\n        <li>\r\n          <h4><a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("content",Utils.ObjectToStr(dr["call_index"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></h4>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        <li>\r\n          <h4><a href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">留言反馈</a></h4>\r\n        </li>\r\n        <li>\r\n          <h4><a href=\"");
	templateBuilder.Append(linkurl("link"));

	templateBuilder.Append("\">友情链接</a></h4>\r\n        </li>\r\n      </ul>\r\n      \r\n      <div class=\"line20\"></div>\r\n      <h3>推荐资讯</h3>\r\n      <div class=\"focus-list\">\r\n        <ul>\r\n          ");
	DataTable redNews = get_article_list("news", 0, 4, "status=0 and is_red=1 and img_url<>''");

	foreach(DataRow dr in redNews.Rows)
	{

	templateBuilder.Append("\r\n          <li>\r\n            <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n              <b><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" /></b>\r\n              <span>" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n            </a>\r\n          </li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n      </div>\r\n      \r\n    </div>\r\n  </div>\r\n  <!--/右边-->\r\n  \r\n  <!--左边-->\r\n  <div class=\"list-auto\">\r\n    <!--取得一个DataTable-->\r\n    ");
	DataTable list = get_search_list(15, out totalcount);

	templateBuilder.Append("\r\n    <!--取得分页页码列表-->\r\n    ");
	 pagelist = get_page_link(15, page, totalcount, linkurl("search","?channel=" + channel + "&keyword=" + Server.UrlEncode(keyword) + "&page=__id__"));

	templateBuilder.Append("\r\n    <div class=\"ntitle\">\r\n      <h2><a>站内搜索</a></h2>\r\n      <i>搜索关健字： <b class=\"blue\">");
	templateBuilder.Append(Utils.ObjectToStr(keyword));
	templateBuilder.Append("</b> ，共有 <b class=\"red\">");
	templateBuilder.Append(Utils.ObjectToStr(totalcount));
	templateBuilder.Append("</b> 条记录</i>\r\n    </div>\r\n    <ul class=\"n-list\">\r\n      ");
	foreach(DataRow dr in list.Rows)
	{

	templateBuilder.Append("\r\n      <li>\r\n        <h2><a target=\"_blank\" href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></h2>\r\n        <div class=\"note\">\r\n          ");
	if (Utils.ObjectToStr(dr["img_url"])!="")
	{

	templateBuilder.Append("\r\n          <b><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" /></b>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n          <p>" + Utils.ObjectToStr(dr["remark"]) + "</p>\r\n          <div class=\"info\">\r\n            <span class=\"time\">" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n            <span class=\"comm\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_comment_count&id=" + Utils.ObjectToStr(dr["id"]) + "\"></");
	templateBuilder.Append("script>人评论</span>\r\n            <span class=\"view\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_article_click&id=" + Utils.ObjectToStr(dr["id"]) + "\"></");
	templateBuilder.Append("script>次浏览</span>\r\n          </div>\r\n        </div>\r\n      </li>\r\n      ");
	}	//end for if

	if (totalcount==0)
	{

	templateBuilder.Append("\r\n      <div class=\"nodata\">很抱歉，目前尚未查找到符合条件的信息！</div>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </ul>\r\n    \r\n    <!--页码列表-->\r\n    <div class=\"page-box\">\r\n      <div class=\"digg\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n    </div>\r\n    <!--/页码列表-->\r\n  </div>\r\n  <!--/左边-->\r\n\r\n</div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</p>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
