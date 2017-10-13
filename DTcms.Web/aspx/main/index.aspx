<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.index" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_title));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/layout.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.SuperSlide.js\"></");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div class=\"aa\">\r\n    <div class=\"main_serviceBox\">\r\n        <div class=\"float\">\r\n            <div class=\"banner-bg\">\r\n                <object id=\"FlashID\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"1199\" height=\"346\">\r\n                    <param name=\"movie\" value=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/hcjq.swf\" />\r\n                    <param name=\"quality\" value=\"high\" />\r\n                    <param name=\"wmode\" value=\"opaque\" />\r\n                    <param name=\"swfversion\" value=\"11.0.0.0\" />\r\n                    <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->\r\n                    <param name=\"expressinstall\" value=\"swf/hcjq.swf\" />\r\n                    <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->\r\n                    <!--[if !IE]>-->\r\n                    <object type=\"application/x-shockwave-flash\" data=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/hcjq.swf\" width=\"1199\" height=\"346\">\r\n                        <!--<![endif]-->\r\n                        <param name=\"quality\" value=\"high\" />\r\n                        <param name=\"wmode\" value=\"opaque\" />\r\n                        <param name=\"swfversion\" value=\"11.0.0.0\" />\r\n                        <param name=\"expressinstall\" value=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/hcjq.swf\" />\r\n                        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->\r\n                        <div>\r\n                            <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>\r\n                            <p><a href=\"http://www.adobe.com/go/getflashplayer\"><img src=\"http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif\" alt=\"获取 Adobe Flash Player\" width=\"1199\" height=\"346\" /></a></p>\r\n                        </div>\r\n                        <!--[if !IE]>-->\r\n                    </object>\r\n                    <!--<![endif]-->\r\n                </object>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n    <div class=\"wrap1\">\r\n        <div class=\"w1200\">\r\n            <div class=\"left\">\r\n                <div class=\"title\"><a>新闻中心</a></div>\r\n                <!-- 轮播-->\r\n                <div class=\"focusBox\">\r\n                    <ul class=\"pic\" >\r\n                        ");
	DataTable nlist = get_article_list("newscenter", 8, "status=0");

	templateBuilder.Append("\r\n                        <!--使用foreach循环输出-->\r\n                        ");
	foreach(DataRow dr in nlist.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                            ");
	if (Utils.ObjectToStr(dr["img_url"])!="")
	{

	templateBuilder.Append("\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\"  />\r\n                            ");
	}
	else
	{

	templateBuilder.Append("\r\n                                <img src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/logo.png\" title=\"\" />\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                    <div class=\"txt-bg\"></div>\r\n                    <div class=\"txt\">\r\n                        <ul>\r\n                            ");
	DataTable nlist1 = get_article_list("newscenter", 8, "status=0");

	templateBuilder.Append("\r\n                            <!--使用foreach循环输出-->\r\n                            ");
	foreach(DataRow dr in nlist1.Rows)
	{

	templateBuilder.Append("\r\n                            <li>\r\n                                <a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                    " + Utils.ObjectToStr(dr["title"]) + "\r\n                                </a>\r\n                            </li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                           \r\n                        </ul>\r\n                    </div>\r\n                    <ul class=\"num\">\r\n                            ");
	DataTable nlist2 = get_article_list("newscenter", 8, "status=0");

	templateBuilder.Append("\r\n                            <!--使用foreach循环输出-->\r\n                            ");
	int dr__loop__id=0;
	foreach(DataRow dr in nlist2.Rows)
	{
		dr__loop__id++;


	templateBuilder.Append("\r\n                            <li>\r\n                                <span>");
	templateBuilder.Append(dr__loop__id.ToString());

	templateBuilder.Append("</span>\r\n                            </li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n                <script type=\"text/javascript\">\r\n                jQuery(\".focusBox\").slide({ titCell:\".num li\", mainCell:\".pic\",effect:\"fold\", autoPlay:true,trigger:\"click\",startFun:function(i){jQuery(\".focusBox .txt li\").eq(i).animate({\"bottom\":0}).siblings().animate({\"bottom\":-20});}});\r\n                </");
	templateBuilder.Append("script>\r\n\r\n            </div>\r\n            <div class=\"right\">\r\n                <ul id=\"tab\">\r\n                    ");
	DataTable mesList = get_category_child_list("mes",0);

	int ncdr__loop__id=0;
	foreach(DataRow ncdr in mesList.Rows)
	{
		ncdr__loop__id++;


	if (ncdr__loop__id==1)
	{

	templateBuilder.Append("\r\n                    <li class=\"cur1\">招标公告</li>\r\n                    ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <li>" + Utils.ObjectToStr(ncdr["title"]) + "</li>\r\n                    ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                </ul>\r\n                <div id=\"cont1\">\r\n                    <ul style=\"display:block;\">\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("mes_list",53));

	templateBuilder.Append("\" target=\"_blank\"><div class=\"more\">more</div></a>\r\n                        <ul class=\"list\">\r\n                            ");
	DataTable mesList1 = get_article_list("mes",53, 6, "status=0");

	templateBuilder.Append("\r\n                            <!--使用foreach循环输出-->\r\n                            ");
	foreach(DataRow dr in mesList1.Rows)
	{

	templateBuilder.Append("\r\n                            <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                        </ul>\r\n                    </ul>\r\n                    <ul>\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("mes_list",54));

	templateBuilder.Append("\" target=\"_blank\"><div class=\"more\">more</div></a>\r\n                        <ul class=\"list\">\r\n                            ");
	DataTable mesList2 = get_article_list("mes",54, 6, "status=0");

	templateBuilder.Append("\r\n                            <!--使用foreach循环输出-->\r\n                            ");
	foreach(DataRow dr in mesList2.Rows)
	{

	templateBuilder.Append("\r\n                            <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                           \r\n                        </ul>\r\n                    </ul>\r\n                    <ul>\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("mes_list",55));

	templateBuilder.Append("\" target=\"_blank\"><div class=\"more\">more</div></a>\r\n                        <ul class=\"list\">\r\n                            ");
	DataTable mesList3 = get_article_list("mes",55, 6, "status=0");

	templateBuilder.Append("\r\n                            <!--使用foreach循环输出-->\r\n                            ");
	foreach(DataRow dr in mesList3.Rows)
	{

	templateBuilder.Append("\r\n                            <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                            ");
	}	//end for if

	templateBuilder.Append("\r\n                           \r\n                        </ul>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"clear\"></div>\r\n        <div class=\"w1300\">\r\n            <ul>\r\n                <div class=\"gsxw\"><div class=\"title\"><a>新闻中心</a></div><a href=\"");
	templateBuilder.Append(linkurl("newscenter_list",52));

	templateBuilder.Append("\"><div class=\"more\">more</div></a></div>\r\n                ");
	DataTable nlist4 = get_article_list("newscenter", 6, "status=0");

	templateBuilder.Append("\r\n                <!--使用foreach循环输出-->\r\n                ");
	foreach(DataRow dr in nlist4.Rows)
	{

	templateBuilder.Append("\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("newscenter_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n               \r\n            </ul>\r\n            <ul class=\"zxjd\">\r\n                <div class=\"gsxw\"><div class=\"title\"><a>企业文化</a></div><a href=\"");
	templateBuilder.Append(linkurl("culture_list",53));

	templateBuilder.Append("\"><div class=\"more\">more</div></a></div>\r\n                ");
	DataTable cultureList = get_article_list("culture", 6, "status=0");

	templateBuilder.Append("\r\n                <!--使用foreach循环输出-->\r\n                ");
	foreach(DataRow dr in cultureList.Rows)
	{

	templateBuilder.Append("\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("culture_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n               \r\n            </ul>\r\n            <ul>\r\n                <div class=\"gsxw\"><div class=\"title\"><a>成功案例</a></div><a href=\"");
	templateBuilder.Append(linkurl("achieve_list",59));

	templateBuilder.Append("\"><div class=\"more\">more</div></a></div>\r\n                ");
	DataTable achieveList = get_article_list("achieve",59, 6, "status=0");

	templateBuilder.Append("\r\n                <!--使用foreach循环输出-->\r\n                ");
	foreach(DataRow dr in achieveList.Rows)
	{

	templateBuilder.Append("\r\n                <li><a href=\"");
	templateBuilder.Append(linkurl("achieve_show",Utils.ObjectToStr(dr["category_id"]),Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" target=\"_blank\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n               \r\n            </ul>\r\n        </div>\r\n        <div class=\"clear\"></div>\r\n    </div>\r\n    <script>\r\n            $(function () {\r\n\r\n                var $tab = $('#tab li');\r\n                var $cont1 = $('#cont1>ul');\r\n\r\n                $tab.click(function () {\r\n                    var $this111 = $(this);\r\n                    var $t111 = $this111.index();\r\n                    $tab.removeClass();\r\n                    $this111.addClass('cur1');\r\n                    $cont1.css('display', 'none');\r\n                    $cont1.eq($t111).css('display', 'block');\r\n                })\r\n            })\r\n\r\n    </");
	templateBuilder.Append("script>\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <p>版权所有 ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append(" ");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</p>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
