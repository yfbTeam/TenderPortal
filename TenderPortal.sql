USE [master]
GO
/****** Object:  Database [TenderPortal]    Script Date: 2017/10/13 15:09:06 ******/
CREATE DATABASE [TenderPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DTcmsdb4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TenderPortal.mdf' , SIZE = 5632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DTcmsdb4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TenderPortal.ldf' , SIZE = 15040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TenderPortal] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TenderPortal].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TenderPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TenderPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TenderPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TenderPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TenderPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [TenderPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TenderPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TenderPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TenderPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TenderPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TenderPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TenderPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TenderPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TenderPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TenderPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TenderPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TenderPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TenderPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TenderPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TenderPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TenderPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TenderPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TenderPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [TenderPortal] SET  MULTI_USER 
GO
ALTER DATABASE [TenderPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TenderPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TenderPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TenderPortal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TenderPortal] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TenderPortal]
GO
/****** Object:  User [svndtcms]    Script Date: 2017/10/13 15:09:06 ******/
CREATE USER [svndtcms] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [svndtcms]
GO
/****** Object:  Table [dbo].[dt_article]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL DEFAULT ((0)),
	[category_id] [int] NOT NULL DEFAULT ((0)),
	[call_index] [nvarchar](50) NULL DEFAULT (''),
	[title] [nvarchar](100) NULL,
	[link_url] [nvarchar](255) NULL DEFAULT (''),
	[img_url] [nvarchar](255) NULL DEFAULT (''),
	[seo_title] [nvarchar](255) NULL DEFAULT (''),
	[seo_keywords] [nvarchar](255) NULL DEFAULT (''),
	[seo_description] [nvarchar](255) NULL DEFAULT (''),
	[tags] [nvarchar](500) NULL,
	[zhaiyao] [nvarchar](255) NULL DEFAULT (''),
	[content] [ntext] NULL,
	[sort_id] [int] NULL DEFAULT ((99)),
	[click] [int] NULL DEFAULT ((0)),
	[status] [tinyint] NULL DEFAULT ((0)),
	[is_msg] [tinyint] NULL DEFAULT ((0)),
	[is_top] [tinyint] NULL DEFAULT ((0)),
	[is_red] [tinyint] NULL DEFAULT ((0)),
	[is_hot] [tinyint] NULL DEFAULT ((0)),
	[is_slide] [tinyint] NULL DEFAULT ((0)),
	[is_sys] [tinyint] NULL DEFAULT ((0)),
	[user_name] [nvarchar](100) NULL,
	[add_time] [datetime] NULL DEFAULT (getdate()),
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_albums]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[thumb_path] [nvarchar](255) NULL,
	[original_path] [nvarchar](255) NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_ALBUMS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_attach]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[file_name] [nvarchar](255) NULL,
	[file_path] [nvarchar](255) NULL,
	[file_size] [int] NULL,
	[file_ext] [nvarchar](20) NULL,
	[down_num] [int] NULL,
	[point] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_ATTACH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_attribute_field]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attribute_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL DEFAULT (''),
	[control_type] [nvarchar](50) NULL,
	[data_type] [nvarchar](50) NULL,
	[data_length] [int] NULL DEFAULT ((0)),
	[data_place] [tinyint] NULL DEFAULT ((0)),
	[item_option] [ntext] NULL DEFAULT (''),
	[default_value] [ntext] NULL DEFAULT (''),
	[is_required] [tinyint] NULL DEFAULT ((0)),
	[is_password] [tinyint] NULL DEFAULT ((0)),
	[is_html] [tinyint] NULL DEFAULT ((0)),
	[editor_type] [tinyint] NULL DEFAULT ((0)),
	[valid_tip_msg] [nvarchar](255) NULL DEFAULT (''),
	[valid_error_msg] [nvarchar](255) NULL DEFAULT (''),
	[valid_pattern] [nvarchar](500) NULL DEFAULT (''),
	[sort_id] [int] NULL DEFAULT ((99)),
	[is_sys] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_ARTICLE_ATTRIBUTE_FIELD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_attribute_value]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attribute_value](
	[article_id] [int] NOT NULL,
	[sub_title] [nvarchar](255) NULL,
	[source] [nvarchar](100) NULL,
	[author] [nvarchar](50) NULL,
	[goods_no] [nvarchar](100) NULL,
	[stock_quantity] [int] NULL CONSTRAINT [DF_dt_article_attribute_value_stock_quantity]  DEFAULT ((0)),
	[market_price] [decimal](9, 2) NULL CONSTRAINT [DF_dt_article_attribute_value_market_price]  DEFAULT ((0)),
	[sell_price] [decimal](9, 2) NULL CONSTRAINT [DF_dt_article_attribute_value_sell_price]  DEFAULT ((0)),
	[point] [int] NULL CONSTRAINT [DF_dt_article_attribute_value_point]  DEFAULT ((0)),
	[video_src] [nvarchar](255) NULL,
 CONSTRAINT [PK_DT_ARTICLE_ATTRIBUTE_VALUE] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_category]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL CONSTRAINT [DF__dt_articl__call___7FA0E47B]  DEFAULT (''),
	[parent_id] [int] NULL CONSTRAINT [DF__dt_articl__paren__009508B4]  DEFAULT ((0)),
	[class_list] [nvarchar](500) NULL,
	[class_layer] [int] NULL CONSTRAINT [DF_dt_article_category_class_layer]  DEFAULT ((0)),
	[sort_id] [int] NULL CONSTRAINT [DF__dt_articl__sort___01892CED]  DEFAULT ((99)),
	[link_url] [nvarchar](255) NULL CONSTRAINT [DF__dt_articl__link___027D5126]  DEFAULT (''),
	[img_url] [nvarchar](255) NULL CONSTRAINT [DF__dt_articl__img_u__0371755F]  DEFAULT (''),
	[content] [ntext] NULL,
	[seo_title] [nvarchar](255) NULL CONSTRAINT [DF__dt_articl__seo_t__04659998]  DEFAULT (''),
	[seo_keywords] [nvarchar](255) NULL CONSTRAINT [DF__dt_articl__seo_k__0559BDD1]  DEFAULT (''),
	[seo_description] [nvarchar](255) NULL CONSTRAINT [DF__dt_articl__seo_d__064DE20A]  DEFAULT (''),
 CONSTRAINT [PK_DT_ARTICLE_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_article_comment]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[article_id] [int] NULL,
	[parent_id] [int] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[user_ip] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[is_lock] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[is_reply] [tinyint] NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_COMMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_channel]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dt_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_id] [int] NULL,
	[name] [varchar](50) NULL CONSTRAINT [DF__dt_channel__name__2101D846]  DEFAULT (''),
	[title] [varchar](100) NULL CONSTRAINT [DF__dt_channe__title__21F5FC7F]  DEFAULT (''),
	[is_albums] [tinyint] NULL CONSTRAINT [DF__dt_channe__is_al__22EA20B8]  DEFAULT ((0)),
	[is_attach] [tinyint] NULL CONSTRAINT [DF__dt_channe__is_at__23DE44F1]  DEFAULT ((0)),
	[is_spec] [tinyint] NULL CONSTRAINT [DF__dt_channe__is_sp__24D2692A]  DEFAULT ((0)),
	[sort_id] [int] NULL CONSTRAINT [DF__dt_channe__sort___25C68D63]  DEFAULT ((99)),
 CONSTRAINT [PK_DT_CHANNEL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dt_channel_field]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_channel_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[field_id] [int] NULL,
 CONSTRAINT [PK_DT_CHANNEL_FIELD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_channel_site]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_channel_site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[build_path] [nvarchar](100) NULL CONSTRAINT [DF__dt_channe__build__2B7F66B9]  DEFAULT (''),
	[templet_path] [nvarchar](100) NULL CONSTRAINT [DF__dt_channe__templ__2C738AF2]  DEFAULT (''),
	[domain] [nvarchar](255) NULL CONSTRAINT [DF__dt_channe__domai__2D67AF2B]  DEFAULT (''),
	[name] [nvarchar](255) NULL,
	[logo] [nvarchar](255) NULL,
	[company] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[tel] [nvarchar](30) NULL,
	[fax] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[crod] [nvarchar](100) NULL,
	[copyright] [text] NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keyword] [nvarchar](255) NULL,
	[seo_description] [nvarchar](500) NULL,
	[is_default] [tinyint] NULL CONSTRAINT [DF__dt_channe__is_de__2F4FF79D]  DEFAULT ((0)),
	[sort_id] [int] NULL CONSTRAINT [DF__dt_channe__sort___30441BD6]  DEFAULT ((99)),
 CONSTRAINT [PK_DT_CHANNEL_SITE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_express]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_express](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[express_code] [nvarchar](100) NULL DEFAULT (''),
	[express_fee] [decimal](9, 2) NULL DEFAULT ((0)),
	[website] [nvarchar](255) NULL DEFAULT (''),
	[remark] [ntext] NULL DEFAULT (''),
	[sort_id] [int] NULL DEFAULT ((99)),
	[is_lock] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_EXPRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_feedback]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_path] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[user_qq] [nvarchar](30) NULL,
	[user_email] [nvarchar](100) NULL,
	[add_time] [datetime] NOT NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
	[is_lock] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_link]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_path] [nvarchar](100) NULL,
	[title] [nvarchar](255) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[site_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[is_image] [int] NOT NULL DEFAULT ((0)),
	[sort_id] [int] NOT NULL DEFAULT ((99)),
	[is_red] [tinyint] NOT NULL DEFAULT ((0)),
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_mail_template]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_mail_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[maill_title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[is_sys] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_MAIL_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_manager]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[role_type] [int] NULL CONSTRAINT [DF__dt_manage__role___3D9E16F4]  DEFAULT ((2)),
	[user_name] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[salt] [nvarchar](20) NULL,
	[real_name] [nvarchar](50) NULL CONSTRAINT [DF__dt_manage__real___3E923B2D]  DEFAULT (''),
	[telephone] [nvarchar](30) NULL CONSTRAINT [DF__dt_manage__telep__3F865F66]  DEFAULT (''),
	[email] [nvarchar](30) NULL CONSTRAINT [DF__dt_manage__email__407A839F]  DEFAULT (''),
	[is_lock] [int] NULL CONSTRAINT [DF__dt_manage__is_lo__416EA7D8]  DEFAULT ((0)),
	[add_time] [datetime] NULL CONSTRAINT [DF__dt_manage__add_t__4262CC11]  DEFAULT (getdate()),
 CONSTRAINT [PK_DT_MANAGER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_manager_log]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[user_ip] [nvarchar](30) NULL,
	[add_time] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_DT_MANAGER_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_manager_role]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[role_type] [tinyint] NULL,
	[is_sys] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_MANAGER_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_manager_role_value]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_role_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[nav_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_DT_MANAGER_ROLE_VALUE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_navigation]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_navigation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL DEFAULT ((0)),
	[channel_id] [int] NULL DEFAULT ((0)),
	[nav_type] [nvarchar](50) NULL DEFAULT (''),
	[name] [nvarchar](50) NULL DEFAULT (''),
	[title] [nvarchar](100) NULL DEFAULT (''),
	[sub_title] [nvarchar](100) NULL DEFAULT (''),
	[icon_url] [nvarchar](255) NULL,
	[link_url] [nvarchar](255) NULL DEFAULT (''),
	[sort_id] [int] NULL DEFAULT ((99)),
	[is_lock] [tinyint] NULL DEFAULT ((0)),
	[remark] [nvarchar](500) NULL DEFAULT (''),
	[action_type] [nvarchar](500) NULL DEFAULT (''),
	[is_sys] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_NAVIGATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_order_goods]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_order_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[order_id] [int] NULL,
	[goods_no] [nvarchar](50) NULL,
	[goods_title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[spec_text] [text] NULL,
	[goods_price] [decimal](9, 2) NULL,
	[real_price] [decimal](9, 2) NULL,
	[quantity] [int] NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_DT_ORDER_GOODS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_orders]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dt_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [nvarchar](100) NULL,
	[trade_no] [nvarchar](100) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[payment_fee] [decimal](9, 2) NULL,
	[payment_status] [tinyint] NULL,
	[payment_time] [datetime] NULL,
	[express_id] [int] NULL,
	[express_no] [nvarchar](100) NULL,
	[express_fee] [decimal](9, 2) NULL,
	[express_status] [tinyint] NULL,
	[express_time] [datetime] NULL,
	[accept_name] [nvarchar](50) NULL,
	[post_code] [nvarchar](20) NULL,
	[telphone] [nvarchar](30) NULL,
	[mobile] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[area] [nvarchar](100) NULL,
	[address] [nvarchar](500) NULL,
	[message] [nvarchar](500) NULL,
	[remark] [nvarchar](500) NULL,
	[is_invoice] [tinyint] NULL,
	[invoice_title] [varchar](100) NULL,
	[invoice_taxes] [decimal](9, 2) NULL,
	[payable_amount] [decimal](9, 2) NULL,
	[real_amount] [decimal](9, 2) NULL,
	[order_amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[confirm_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ORDERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dt_payment]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL DEFAULT (''),
	[remark] [nvarchar](500) NULL,
	[type] [tinyint] NULL DEFAULT ((1)),
	[poundage_type] [tinyint] NULL DEFAULT ((1)),
	[poundage_amount] [decimal](9, 2) NULL DEFAULT ((0)),
	[sort_id] [int] NULL DEFAULT ((99)),
	[is_lock] [tinyint] NULL DEFAULT ((0)),
	[api_path] [nvarchar](100) NULL,
 CONSTRAINT [PK_DT_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_sms_template]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_sms_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL DEFAULT (''),
	[call_index] [nvarchar](50) NULL DEFAULT (''),
	[content] [ntext] NULL DEFAULT (''),
	[is_sys] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_SMS_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_amount_log]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_amount_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[value] [decimal](9, 2) NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_AMOUNT_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_attach_log]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_attach_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[attach_id] [int] NULL,
	[file_name] [nvarchar](255) NULL,
	[add_time] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_code]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[str_code] [nvarchar](255) NULL,
	[count] [int] NULL,
	[status] [tinyint] NULL,
	[user_ip] [nvarchar](20) NULL,
	[eff_time] [datetime] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_DT_USER_CODE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_group_price]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_group_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[group_id] [int] NULL,
	[price] [decimal](9, 2) NULL,
 CONSTRAINT [PK_DT_USER_GROUP_PRICE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_groups]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL DEFAULT (''),
	[grade] [int] NULL DEFAULT ((0)),
	[upgrade_exp] [int] NULL DEFAULT ((0)),
	[amount] [decimal](9, 2) NULL DEFAULT ((0)),
	[point] [int] NULL DEFAULT ((0)),
	[discount] [int] NULL,
	[is_default] [tinyint] NULL DEFAULT ((0)),
	[is_upgrade] [tinyint] NULL DEFAULT ((1)),
	[is_lock] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DT_USER_GROUPS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_login_log]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_login_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[login_time] [datetime] NULL,
	[login_ip] [nvarchar](50) NULL,
 CONSTRAINT [PK_DT_USER_LOGIN_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_message]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [tinyint] NULL,
	[post_user_name] [nvarchar](100) NULL,
	[accept_user_name] [nvarchar](100) NULL,
	[is_read] [tinyint] NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[post_time] [datetime] NOT NULL,
	[read_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_oauth]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_oauth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[oauth_name] [nvarchar](50) NOT NULL,
	[oauth_access_token] [nvarchar](500) NULL,
	[oauth_openid] [nvarchar](255) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_OAUTH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_oauth_app]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_oauth_app](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL DEFAULT (''),
	[img_url] [nvarchar](255) NULL DEFAULT (''),
	[app_id] [nvarchar](100) NULL,
	[app_key] [nvarchar](500) NULL,
	[remark] [nvarchar](500) NULL DEFAULT (''),
	[sort_id] [int] NULL DEFAULT ((99)),
	[is_lock] [tinyint] NULL DEFAULT ((0)),
	[api_path] [nvarchar](255) NULL DEFAULT (''),
 CONSTRAINT [PK_DT_USER_OAUTH_APP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_point_log]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_point_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[value] [int] NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_POINT_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_user_recharge]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_recharge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[recharge_no] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[amount] [decimal](9, 2) NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_RECHARGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dt_users]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](20) NULL,
	[password] [nvarchar](100) NOT NULL,
	[mobile] [nvarchar](20) NULL DEFAULT (''),
	[email] [nvarchar](50) NULL DEFAULT (''),
	[avatar] [nvarchar](255) NULL DEFAULT (''),
	[nick_name] [nvarchar](100) NULL DEFAULT (''),
	[sex] [nvarchar](20) NULL DEFAULT (''),
	[birthday] [datetime] NULL,
	[telphone] [nvarchar](50) NULL DEFAULT (''),
	[area] [nvarchar](255) NULL DEFAULT (''),
	[address] [nvarchar](255) NULL DEFAULT (''),
	[qq] [nvarchar](20) NULL DEFAULT (''),
	[msn] [nvarchar](100) NULL DEFAULT (''),
	[amount] [decimal](9, 2) NULL DEFAULT ((0)),
	[point] [int] NULL DEFAULT ((0)),
	[exp] [int] NULL DEFAULT ((0)),
	[status] [tinyint] NULL DEFAULT ((0)),
	[reg_time] [datetime] NULL DEFAULT (getdate()),
	[reg_ip] [nvarchar](20) NULL,
 CONSTRAINT [PK_DT_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_channel_about]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_about] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=13
GO
/****** Object:  View [dbo].[view_channel_achieve]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_achieve] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=15
GO
/****** Object:  View [dbo].[view_channel_culture]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_culture] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=17
GO
/****** Object:  View [dbo].[view_channel_index]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_index] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=12
GO
/****** Object:  View [dbo].[view_channel_mes]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_mes] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=18
GO
/****** Object:  View [dbo].[view_channel_newscenter]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_newscenter] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=14
GO
/****** Object:  View [dbo].[view_channel_server]    Script Date: 2017/10/13 15:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_server] as SELECT dt_article.*,dt_article_attribute_value.video_src,dt_article_attribute_value.sub_title,dt_article_attribute_value.source,dt_article_attribute_value.author FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=16
GO
SET IDENTITY_INSERT [dbo].[dt_article] ON 

INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (103, 14, 52, N'', N'汇诚金桥十一周岁生日快乐！', N'', N'/upload/201710/12/201710121359282505.jpg', N'', N'', N'', NULL, N'', N'<div style="text-align:center;">
	<img src="/upload/201710/12/201710121400074193.jpg" alt="" /> 
</div>', 99, 16, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-12 14:00:11.000' AS DateTime), CAST(N'2017-10-12 14:36:08.033' AS DateTime))
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (104, 18, 53, N'', N'队史馆及影院装修工程招标公告', N'', N'', N'', N'', N'', NULL, N'北京汇诚金桥国际招标有限公司受中国人民武装警察部队怀柔区消防支队委托，对“队史馆及影院装修工程”进行公开招标。现欢迎合格投标人参加投标。一、工程概况（1）工程名称：队史馆及影院装修工程；（2）项目编号：BJJQ-2017-786-01；（3）工程建设地点：北京市怀柔区杨宋镇北…', N'<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">北京汇诚金桥国际招标有限公司受中国人民武装警察部队怀柔区消防支队委托，对“队史馆及影院装修工程”进行公开招标。现欢迎合格投标人参加投标。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">一、工程概况</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（1）工程名称：队史馆及影院装修工程；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（2）项目编号：BJJQ-2017-786-01；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（3）工程建设地点：北京市怀柔区杨宋镇北辰路9号；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（4）招标范围：工程量清单及图纸内的全部内容；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（5）资金来源：财政性资金；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（6）招标控制价：人民币1106936.98元；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（7）招标方式：公开招标；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（8）计划工期：60日历天。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">二、招标人</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（1）名称：中国人民武装警察部队怀柔区消防支队；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（2）地址：北京市怀柔区杨宋镇北辰路9号；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（3）联系电话：61637966。&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">三、招标代理机构</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（1）名称：北京汇诚金桥国际招标有限公司；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（2）地址：北京市东城区朝内大街南竹杆胡同6号北京INN 3号楼9层；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（3）项目联系人：李鑫、雷天宠；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（4）联系方式：65170699、65173108；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（5）传真：65951037。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">四、工程情况简介</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（1）场地准备情况等：已具备本工程招标、施工条件。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">五、投标人资格条件</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（1）具有独立订立合同的权利；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（2）具有履行合同的能力，包括专业、技术资格和能力，资金、设备和其他物质设施状况，管理能力，经验、信誉和相应的从业人员；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（3）没有处于被责令停业，投标资格被取消，财产被接管、冻结，破产状态；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（4）在最近三年内没有骗取中标和严重违约及重大工程质量问题；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（5）政府有权机关核发的有效营业执照；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（6）有效的建筑装修装饰工程专业承包二级（含）以上资质；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（7）建设行政主管部门核发的有效期内的《建筑施工安全生产许可证》；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（8）项目经理资格条件：受聘于投标申请人的已取得建筑工程二级（含）以上建造师注册证书或建造师临时执业证书且注册证书或临时执业证书在有效期内并且已取得“安全生产考核合格证书”（简称B本）的人员；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（9）外地进京建筑业企业还应携带《北京市建筑业企业档案管理手册》；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（10）法律、行政法规规定的其他资格条件。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">六、资格审查方式：资格后审。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">七、本项目不允许联合体投标。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">八、报名及招标文件发售</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">凡前来报名的投标申请人，须由其项目经理本人携带以下资料文件（复印件每页须加盖投标人公章），到招标代理机构查验。经审查合格后，方可购买招标文件。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（1）有效的营业执照复印件；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（2）有效的建筑装修装饰工程专业承包二级（含）以上资质证书复印件；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（3）有效的建筑工程二级（含）以上建造师注册证书或建造师临时执业证书复印件和“安全生产考核合格证书”（简称B本）复印件； &nbsp;&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">（4）有效的《建筑施工安全生产许可证》复印件；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（5）外地进京建筑业企业还应携带有效的《北京市建筑业企业档案管理手册》复印件；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（6）法人授权委托书原件；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;（7）被授权代表人本人身份证原件及复印件。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">报名地点：北京市东城区朝内大街南竹杆胡同6号北京INN 3号楼9层（地铁2号线、6号线，朝阳门站H口出，向南200米）；&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">招标文件出售价格：现场购买，每本人民币400元（含电子版），售后不退。若邮购，须加付EMS费50元人民币。请按下述地址汇款，汇款单上应注明汇款用途、所购招标文件编号，然后将汇款单复印件、购买单位名称、详细通讯地址、电话、传真及联系人传真给我公司，我公司收到传真后将尽快以EMS方式将招标文件邮寄给贵方；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;标书款银行账号：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">收款单位：北京汇诚金桥国际招标有限公司 &nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">开 户 行：中国农业银行北京朝阳门支行 &nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">银行账号：1119 &nbsp;1701 &nbsp;0400 &nbsp;02067</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">开户行行号：1031 &nbsp;0001 &nbsp;9176</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">报名及招标文件出售时间：2017年10月12日起至2017年10月16日止，每天上午9:00-12:00到下午1:00-5:00(北京时间) (法定节假日休息)。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">九、开标时间及投标截止时间：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;投标截止时间：2017年 11月01日上午10点00分(北京时间)，逾期收到或不符合规定的投标文件恕不接受；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;开标时间：2017年11月01日上午10点00分(北京时间)；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&emsp;&emsp;开标地点：北京市东城区朝内大街南竹杆胡同6号北京INN 3号楼9层会议室（地铁2号线、6号线，朝阳门站H口出，向南200米）。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">十、其他：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">项目评分方法和标准：综合评估法。 &nbsp;&nbsp;</span><br />
<br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">本公告同时在中国政府采购网（http://www.ccgp.gov.cn）、北京市政府采购网站（http://www.ccgp-beijing.gov.cn/）以及北京汇诚金桥国际招标有限公司网站（http://www.hcjq.net/）发布。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">北京汇诚金桥国际招标有限公司</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">2017年10月11日</span>', 99, 3, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-12 14:21:16.937' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (105, 18, 54, N'', N'流浪未成年人救助管理专业服务岗位项目成交结果公告', N'', N'', N'', N'', N'', NULL, N'采购项目名称：流浪未成年人救助管理专业服务岗位项目采购项目编号：BJJQ-2017-800采购人名称：北京市未成年人救助保护中心采购人地址：北京市朝阳区王四营乡南花园村87号采购人联系方式：67378827采购代理机构全称：北京汇诚金桥国际招标有限公司采购代理机构地址：北京市东城…', N'<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购项目名称：流浪未成年人救助管理专业服务岗位项目</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购项目编号：BJJQ-2017-800</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人名称：北京市未成年人救助保护中心</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人地址：北京市朝阳区王四营乡南花园村87号</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人联系方式：67378827</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构全称：北京汇诚金桥国际招标有限公司</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构地址：北京市东城区朝内大街南竹杆胡同6号北京INN3号楼9层</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构联系方式：65699122、65244483</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购方式：竞争性磋商</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">选择该政府采购方式的原因：适用</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">确定成交的方法和标准：综合评分法</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">确定成交的日期：2017年10月11日</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">第一包：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交供应商名称：北京儒源社会工作事务所</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交供应商地址：北京市海淀区阜成路42号院6号楼C座212室</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交金额：人民币大写：壹拾伍万零叁佰柒拾元整</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">人民币小写：￥150370.00元</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">第二包：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交供应商名称：北京儒源社会工作事务所</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交供应商地址：北京市海淀区阜成路42号院6号楼C座212室</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">成交金额：人民币大写：贰拾伍万玖仟捌佰贰拾元整</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">人民币小写：￥259820.00元</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">主要成交标的：</span><br />
<table style="margin:0px;padding:0px;border:0px;color:#333333;font-family:微软雅黑, &quot;font-size:12px;background-color:#F2F2F2;width:605px;">
	<tbody>
		<tr>
			<td style="border:0px;">
				序号
			</td>
			<td style="border:0px;">
				名称
			</td>
			<td style="border:0px;">
				数量、规格、型号
			</td>
			<td style="border:0px;">
				单价（元）
			</td>
			<td style="border:0px;">
				标的的基本概况
			</td>
		</tr>
		<tr>
			<td style="border:0px;">
				1
			</td>
			<td style="border:0px;">
				流浪未成年人救助管理专业服务（第一包）
			</td>
			<td style="border:0px;">
				1项
			</td>
			<td style="border:0px;">
				150370.00
			</td>
			<td style="border:0px;">
				详见响应文件
			</td>
		</tr>
		<tr>
			<td style="border:0px;">
				&nbsp;
			</td>
			<td style="border:0px;">
				流浪未成年人救助管理专业服务（第二包）
			</td>
			<td style="border:0px;">
				1项
			</td>
			<td style="border:0px;">
				259820.00
			</td>
			<td style="border:0px;">
				详见响应文件
			</td>
		</tr>
	</tbody>
</table>
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">磋商小组成员名单： 郑楚和、裴晴、闫金凤</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">项目联系人：李庆平、赵一鸣</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">联系方式：65699122、65244483</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">传真：65951037</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">本公告同时在中国政府采购网（http://www.ccgp.gov.cn）、北京市政府采购网（http://www.ccgp-beijing.gov.cn/）以及北京汇诚金桥国际招标有限公司网站（http://www.hcjq.net/）发布，公告期限为1个工作日。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">北京汇诚金桥国际招标有限公司</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">2017年10月11日</span>', 99, 1, 0, 0, 0, 0, 0, 0, 1, N'admin', CAST(N'2017-10-12 14:21:56.530' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (106, 18, 55, N'', N'首都精神文明建设委员会办公室“2017北京榜样”大型主题活动宣传品项目更正公告（二次）', N'', N'', N'', N'', N'', NULL, N'项目名称：首都精神文明建设委员会办公室“2017北京榜样”大型主题活动宣传品项目项目编号：BJJQ-2017-596采购人名称：首都精神文明建设委员会办公室采购人地址：北京市东城区建国门内大街28号民生金融中心E座采购人联系方式：63087517采购代理机构全称：北京汇诚金桥国际招标…', N'<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">项目名称：首都精神文明建设委员会办公室“2017北京榜样”大型主题活动宣传品项目</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">项目编号：BJJQ-2017-596</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人名称：首都精神文明建设委员会办公室</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人地址：北京市东城区建国门内大街28号民生金融中心E座</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购人联系方式：63087517</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构全称：北京汇诚金桥国际招标有限公司</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构地址：北京市东城区朝内大街南竹杆胡同6号北京INN3号楼9层</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">采购代理机构联系方式：65244876、65915024、65699706</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">原公告的采购项目名称：首都精神文明建设委员会办公室“2017北京榜样”大型主题活动宣传品项目</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">首次公告日期：2017年09月08日</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">首次更正日期：2017年09月15日</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">二次更正日期：2017年09月30日</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">更正理由：招标文件变更</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">更正事项：</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">1、&nbsp;</span><strong>对</strong><strong>“2017北京榜样”人物彩印宣传册成品原尺寸：“210cm×140cm”</strong><span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">，现变更为</span><strong>“</strong><strong>21cm×14cm</strong><strong>”</strong><span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">2、&nbsp;</span><strong>对</strong><strong>“2017北京榜样”人物彩印宣传册原材质：“装裱25mm硬皮板”，</strong><span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">现变更为</span><strong>“</strong><strong>装裱1.5mm硬皮板</strong><strong>”</strong><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">3、&nbsp;原投标截止时间：2017年10月13日上午10点00分(北京时间)，现变更为2017年10月19日上午10点00分(北京时间)；</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">4、&nbsp;原开标时间：2017年10月13日上午10点00分(北京时间)，现变更为2017年10月19日上午10点00分(北京时间)。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">项目联系人：于洋、邢晶晶</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">联系方式：65244876、65915024、65699706</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">本公告同时在中国政府采购网（http://www.ccgp.gov.cn）、北京市政府采购网（http://www.ccgp-beijing.gov.cn/）以及北京汇诚金桥国际招标有限公司网站（http://www.hcjq.net/）发布。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">北京汇诚金桥国际招标有限公司</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">2017年09月30日</span>', 99, 1, 0, 0, 0, 0, 0, 0, 1, N'admin', CAST(N'2017-10-12 14:22:28.983' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (107, 17, 57, N'', N'骑行游记', N'', N'', N'', N'', N'', NULL, N'春天的总是个令人欢快的季节，因为冬之沉重被生机盎然所取代，因为凌冽寒风被和煦阳光所替代，因为不再需要躲在厚重的棉衣李瑟瑟发抖，因为可以骑上自行车去撒欢，去畅游，去感受春之美好，就在这样煦暖和畅的日子里，我们集体参加了公司组织的2017年春天骑行的活动。        …', N'<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;font-size:16px;">&nbsp;春天的总是个令人欢快的季节，因为冬之沉重被生机盎然所取代，因为凌冽寒风被和煦阳光所替代，因为不再需要躲在厚重的棉衣李瑟瑟发抖，因为可以骑上自行车去撒欢，去畅游，去感受春之美好，就在这样煦暖和畅的日子里，我们集体参加了公司组织的2017年春天骑行的活动。<br />
&nbsp; &nbsp; &nbsp; &nbsp; 通州，正在崛起的新兴之地，林立的高楼彰显它行政副中心的地位。刚到集合之地，整修一新的通州运河呈现眼前，高高架起的桥梁体现了现代建筑的魅力，沿河而建的回廊又将人带回古运河那种古色古香的氛围。<br />
&nbsp; &nbsp; &nbsp; &nbsp;今天的活动就是沿着运河骑行，每个人都愉快的交谈着，讨论的话题多种多样，言语之中无不透露着兴奋与喜悦。随着一声令下，一群欢乐的小伙伴齐头并进，欢快的自行车行进中这美景河畔。河畔的垂柳婀娜多姿，依水随风而动，运河两岸已然成为了花的世界，油菜花金黄耀眼，紫罗兰芬芳无限，一串红红的绚烂，碧桃花热烈奔放，令人目不暇接。河面上古色古香的船舶点缀着美丽的运河，有种置身南方水乡的错觉。<br />
&nbsp; &nbsp; &nbsp; &nbsp; 春之美好在每个人的眼睛里，也在每个人的言语里，公园里游人如织，最欢快的是那些小朋友，他们挣脱大人的怀抱，在阳光里撒欢，虽然牙牙学语还不能完全表述自己所想，但是却能深深感受到他们对这个世界的那份新鲜，那份喜悦，那份无忧无虑的快乐，让人深受感染。<br />
&nbsp; &nbsp; &nbsp; &nbsp; 春天的美丽怎么能从电脑屏幕里获取，春天的盛景怎能从冰冷的手机里获取，现在的压力和外界的诱惑让我们越来越不能静下心来去感受春之美好，让我们一次次与春之美好擦肩而过，视而不见听而不闻！多么让人惋惜啊！<br />
&nbsp; &nbsp; &nbsp; &nbsp; 自行车越骑越欢快，虽然骑了很长时间，却丝毫看不出大家有一丝的疲惫，平日里的那些疲惫与颓靡都被人心振奋所代替，都市里的我们，更多的被房贷和各种压力所折磨，越来越多的美景让我们所忽略，虽然我们总是说我们的周围并不缺乏美，只是缺少发现的眼睛，但是我们又有多少人真的用我们的双眼去发现我们周围的美景了呢？春天的美好稍纵即逝，人们惜春感秋，但是却很难让自己真心的沉浸在这无限春光里。焦躁与忧虑，沉闷与感伤，我们已经无数次错过了和春天的拥抱，我们也无数次错失了与春光春景的亲密接触，怎能不让人在此情此景中后悔叹息呢？<br />
&nbsp; &nbsp; &nbsp; &nbsp; 春天有它该有的模样，而我们却许久不曾记起我们沐浴春光时的模样。感谢春天，感谢公司的组织，让我们能在繁华和庸扰中返璞归真，卸下仆仆风尘的拖累，放下身心俱疲的烦扰，在这样美好的季节里，拥着一份希望，拥着一份新生，重新让自己找回春天应该的态度和模样。希望我们以后能有更多的机会参与到这样与自然亲密接触的活动中来，释放压力，活跃身心，也让我们能在有限的青春中撷取更多有关美好自然的记忆，能让我们的内心在仆仆风尘中涤荡清明，让我们获取更多的力量，砥砺前行，不负此生！<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0504/20170504101132171.jpg" style="width:600px;height:450px;" /></span><br />
<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0504/20170504101258351.jpg" style="width:600px;height:450px;" />', 99, 11, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-12 14:47:20.313' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (108, 15, 59, N'', N'第三届中国（北京）国际服务贸易交易会系列项目招标', N'', N'', N'', N'', N'', NULL, N'第三届中国（北京）国际服务贸易交易会系列项目招标   为更好地促进中外服务贸易合作，经中华人民共和国国务院批准，由国家商务部和北京市人民政府共同主办的中国（北京）国际服务贸易交易会（简称京交会）自2012年起在北京举行。世界贸易组织、联合国贸易和发展会议、经济合作…', N'<p align="center" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span><strong><span style="font-family:仿宋;font-size:16pt;">第三届中国（北京）国际服务贸易交易会系列项目招标</span><span style="font-family:仿宋;font-size:16pt;"></span></strong></span>
</p>
<span style="background-color:#F2F2F2;">
<p class="MsoNormal">
	<span style="font-family:仿宋;font-size:16pt;"><strong></strong></span>
</p>
<p class="MsoNormal">
	<span style="font-family:仿宋;font-size:16pt;">&nbsp;&nbsp;&nbsp;为更好地促进中外服务贸易合作，经中华人民共和国国务院批准，由国家商务部和北京市人民政府共同主办的中国（北京）国际服务贸易交易会（简称京交会）自2012年起在北京举行。世界贸易组织、联合国贸易和发展会议、经济合作与发展组织是京交会的永久支持单位。</span><span style="font-family:仿宋;font-size:16pt;"></span>
</p>
<p class="MsoNormal">
	<span style="font-family:仿宋;font-size:16pt;">&nbsp;&nbsp; 京交会定位于国家级、国际性、综合型，是世界上第一个专门为服务贸易搭建的国际交流平台，也是全球服务贸易规模最大、涵盖领域最广的交易会。京交会致力于成为国际服务贸易的洽谈交易平台、国际服务贸易政策的发布窗口和各国服务贸易企业的交流合作桥梁。&nbsp;</span><span style="font-family:仿宋;font-size:16pt;"></span>
</p>
<p class="MsoNormal">
	<span style="font-family:仿宋;font-size:16pt;">&nbsp;&nbsp; 京交会已成功举办两届，累计展览洽谈面积12.59万平方米，举办活动278场，参展企业3600多家次，133个国家和地区的到会客商23.8万人次。&nbsp;</span><span style="font-family:仿宋;font-size:16pt;"></span>
</p>
<p class="MsoNormal">
	<span style="font-family:仿宋;font-size:16pt;">&nbsp;&nbsp;&nbsp;第三届京交会将于2014年5月28日至6月1日在北京国家会议中心举办，由展览展示、论坛活动、洽谈交易三种形式133场活动组成，洽谈展览面积约5万平方米。展览展示由综合展区和专业展区构成，综合展区包括国别及台港澳展区、省区市展区；专业展区包括科技服务、电子商务、中医药服务等23个专题展区。论坛活动由高峰会系列活动、公众开放日、签约仪式、联合国贸发会议小型部长级会议4场活动和9场专业大会组成。组委会和经济合作与发展组织将以“服务贸易在全球价值链中的作用”为主题共同主办高峰会。洽谈交易由推介发布、对接交流、研讨互动、展演展示、主题日及专场活动、贸易匹配6种形式共120场活动组成。</span><span style="font-family:仿宋;font-size:16pt;"></span>
</p>
</span>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span></span><img id="eWebEditor_TempElement_Img" border="0" src="http://www.hcjq.net/UpFile/20140909142532.jpg" width="584" height="142" />
</p>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id="eWebEditor_TempElement_Img" border="0" src="http://www.hcjq.net/UpFile/20140909142618.jpg" width="505" height="336" />
</p>
<p class="MsoNormal" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span style="font-family:仿宋;font-size:16pt;">&nbsp;&nbsp;&nbsp;我公司有幸连续第三年承接京交会的招标工作，第三届京交会的招标涉及领域较多，包括会展搭建、媒体宣传、摄影摄像、翻译编辑、安全保障、音像制作、展会引进、场馆租赁等。在公司员工的共同努力下，顺利完成了以上各项招标工作，获得了京交会组委会的好评。</span>
</p>', 99, 8, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-12 14:48:50.540' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (109, 15, 60, N'', N'业绩说明', N'', N'', N'', N'', N'', NULL, N'作为财政部认定的政府采购代理甲级机构，我公司自成立至今，先后代理了数万个招标代理项目，累计服务客户上千家，招标服务范围涉及货物、服务、工程等各个领域，尤其是政府采购项目代理采购内容广泛多样。       2008年，北京主办了第29届夏季奥运会，奥运会是全球影响最大国际…', N'<p class="MsoNormal" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span style="font-family:微软雅黑;"><span style="font-size:20px;">作为财政部认定的政府采购代理甲级机构，我公司自成立至今，先后代理了数万个招标代理项目，累计服务客户上千家，招标服务范围涉及货物、服务、工程等各个领域，尤其是政府采购项目代理采购内容广泛多样。</span></span>
</p>
<span style="color:#333333;background-color:#F2F2F2;font-family:微软雅黑;"><span style="font-size:20px;">&nbsp; &nbsp; &nbsp; &nbsp;2008年，北京主办了第29届夏季奥运会，奥运会是全球影响最大国际体育盛会，是北京甚至中国在国际舞台上展现城市风貌和国家风貌的良好契机。在2006—2008年北京奥运会筹备期间，我公司有幸承接并圆满完成了大量时间紧、任务急、社会影响大、采购内容复杂多样的奥运相关项目，涉及领域有奥运城市环境景观、奥运场馆安保系统、奥运食品安全、奥运服装、奥运赛时住宿餐饮保障等，我公司出色高效的优质服务受到客户的一致好评，同时为北京2008年奥运会的安全保障工作做出了自己的贡献。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2010年，我公司完成了诸如居家养老（助残）服务券定制、北京市农村社区服务站建设、北京市农家书屋工程、北京市老龄协会为65周岁以上老年人配备购置“小帮手”电子服务器和北京市残疾人联合会为16—64周岁无业重残人配备“小帮手”电子服务器等政府办实事项目。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2011-2012年，我公司受北京市住房和城乡建设委员会委托，为北京市老旧房屋抗震加固建设入围项目组织公开招标程序。该项目投资300余亿元，计划改造老旧小区房屋260余万平方米，直接受益群众达5万户。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2014年，我公司受2022冬奥申委委托，为其办理国际咨询公司项目的招标代理工作及其他项目的政府采购咨询工作。此次招标面向国际公司，是我公司走向国际的重要里程碑。<br />
&nbsp; &nbsp; &nbsp; &nbsp;60年大庆筹备期间，我公司受国家60周年大庆指挥部委托，承接了天安门广场LED大屏项目、工作人员及游行人员餐饮保障、游行指挥通讯保障、游行人员服装道具和60年大庆纪念徽章等项目的招标代理工作。上述这些项目时间紧迫、影响重大，对项目进度和项目质量要求极高，历时3个月，最终高质高效地完成了采购任务。同时，还承接了北京市警卫局国庆游行队伍保障等项目，为国家60周年大庆的顺利进行贡献出自己的绵薄之力。我公司不仅仅将其作为招标代理项目来看待，更将其视为一项的政治任务，调动全公司每个部门的力量，最终我们以高效的服务完成了客户的委托，赢得了客户的赞誉。<br />
&nbsp; &nbsp; &nbsp; &nbsp; 2014年秋北京举办APEC会议，我公司受北京市旅游发展委员会以及北京市公安局警卫局等委托单位委托，承接了APEC第三次高官会会外活动、APEC会议第三次高官会保安员雇佣项目等项目的招标代理工作。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2015年为纪念中国人民抗日战争暨世界反法西斯战争胜利70周年，受北京市民政局委托，就“残疾军人康复辅助器具配置定点机构入围政府采购项目”进行国内公开招标，取得圆满成功。此项目保障了残疾军人的合法权益，不断提高和改善他们的生活质量。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2015年为纪念中国人民抗日战争暨世界反法西斯战争胜利70周年，受团市委委托，就“纪念大会气球放飞组织工作项目”进行竞争性谈判，该项目出于安全涉密的需要，经特批，在距离纪念大会气球放飞组织的时间很近的情况下，公司领导精心选调人员承担此项目，经过加班加点的连续作战，3个项目的竞争性谈判取得圆满成功，当纪念大会最后一个庆祝环节气球安全升空后，公司领导和项目负责人员流下了激动的泪水。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2016年我公司成为北京2022年冬奥会和冬残奥会指定招标代理机构，出色的完成了北京2022冬奥会网络安全保障规划研究项目、北京2022冬奥会主运行中心技术基础设施规划研究、北京2022年冬奥会和冬残奥会组织委员会项目管理系统（一期）等项目的招标代理工作，并受到冬奥组委会领导的高度认可。<br />
&nbsp; &nbsp; &nbsp; &nbsp;2012年-2017年，北京市连续六年举办中国（北京）国际服务商贸易大会（简称“京交会”）。京交会由国家商务部、北京市政府联合承办，是世界性规模的会议，定位于国家级、国际性、综合型会议，是世界上第一个专门为服务贸易搭建的国际交流平台，也是全球服务贸易规模最大、涵盖领域最广的交易会。我公司有幸连续三年承接京交会的招标工作，每届京交会的招标涉及领域较多，包括会展搭建、媒体宣传、摄影摄像、翻译编辑、安全保障、音像制作、展会引进、场馆租赁等。在公司员工的共同努力下，顺利完成了以上各项招标工作，获得了京交会组委会的一致好评。</span></span><br />
<p class="MsoNormal" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span style="font-family:微软雅黑;"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;总之，我们始终坚持以专业的知识、严谨的工作态度、优质的服务为客户提供满意服务。我公司政府采购业务量连续多年在北京市名列前茅，且凭借优质的服务和扎实的基本功在业内享有盛誉。</span></span>
</p>', 99, 2, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:00:21.667' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (110, 16, 61, N'', N'2016年公司新员工年度入职培训', N'', N'', N'', N'', N'', NULL, N'2016年2月29日至3月4日，由公司综合部牵头，联合行政部、财务部，组织完成了为期五天的“2016年公司新员工年度入职培训”，培训地点为公司会议室。此次参加培训的人员包括2016年度新入职员工、因工作未能全程参加上一期培训的部分已入职员工，培训内容包括公司各项管理制度、政…', N'<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	2016年2月29日至3月4日，由公司综合部牵头，联合行政部、财务部，组织完成了为期五天的“2016年公司新员工年度入职培训”，培训地点为公司会议室。
</p>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	此次参加培训的人员包括2016年度新入职员工、因工作未能全程参加上一期培训的部分已入职员工，培训内容包括公司各项管理制度、政府采购法律法规、业务工作流程等。
</p>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	公司希望通过此次培训，使新员工了解并熟悉政府采购法实施条例、非招标采购方式等基本法律法规及业务流程实务操作，以逐步提高工作人员的业务能力，了解并熟悉公司内部各项规章制度并自觉在工作中严格执行。所有参加培训人员学习态度非常认真，并在业务培训的时候积极提问交流，培训工作圆满结束。
</p>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<img id="eWebEditor_TempElement_Img" src="http://www.hcjq.net/uploadfile/2016/1112/20161112125816978.jpg" />
</p>
<p style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<img id="eWebEditor_TempElement_Img" src="http://www.hcjq.net/UpFile/20160406093130.jpg" />
</p>', 99, 1, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:33:45.220' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (111, 16, 61, N'', N'业务委托流程', N'', N'', N'', N'', N'', NULL, N'业务委托流程：', N'<p align="left" class="MsoNormal" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span><strong><span>业务委托流程：</span></strong></span>
</p>
<p align="center" class="MsoNormal" style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">
	<span><img border="0" id="eWebEditor_TempElement_Img" src="http://www.hcjq.net/UpFile/20150911101213.jpg" /></span>
</p>', 99, 7, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:34:13.200' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (112, 16, 64, N'', N'工商银行中小企业“政采通”产品介绍及客户调查问卷', N'', N'', N'', N'', N'', NULL, N'尊敬的客户：为做好广大中小企业的金融服务工作，工商银行北京市分行近期根据北京市财政局关于支持中小企业政府采购供应商融资的政策精神，针对政府采购供应商推出“政采通”产品组合，涵盖订单融资、应收款融资、信用贷款、保函等业务品种，可实现免抵押、免担保发放贷款。具…', N'
				<div style="margin:10px 0px 0px;padding:0px;border:0px;color:#333333;">
					<p class="MsoNormal">
						<span style="font-family:仿宋_GB2312;font-size:14pt;">尊敬的客户：</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:仿宋_GB2312;font-size:14pt;">为做好广大中小企业的金融服务工作，工商银行北京市分行近期根据北京市财政局关于支持中小企业政府采购供应商融资的政策精神，针对政府采购供应商推出</span><span style="font-size:14pt;"><span>“</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">政采通</span><span style="font-size:14pt;"><span>”</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">产品组合，涵盖订单融资、应收款融资、信用贷款、保函等业务品种，可实现</span><b><i><span style="font-family:仿宋_GB2312;font-size:16pt;">免抵押、免担保</span></i></b><span style="font-family:仿宋_GB2312;font-size:14pt;">发放贷款。具体产品介绍如下：</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:Wingdings;font-size:14pt;"><span><span>l</span><span style="font-size:7pt;line-height:normal;font-family:&quot;">&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:14pt;">订单融资：</span><span style="font-family:仿宋_GB2312;font-size:14pt;">针对已签订政府采购订单的中小微企业，工行可根据政府采购订单金额为企业匹配一定额度的融资支持，金额最高可达订单金额的</span><span style="font-size:14pt;"><span>70%</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">，期限最长一年，<b>无需提供抵质押担保</b>，满足企业采购、生产资金需求，<b>帮助企业加快资金周转回笼，承接更多订单</b>。</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:Wingdings;font-size:14pt;"><span><span>l</span><span style="font-size:7pt;line-height:normal;font-family:&quot;">&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:14pt;">应收款融资：</span><span style="font-family:仿宋_GB2312;font-size:14pt;">针对已按政府采购合同提供商品或服务的中小微企业，工行可根据企业由于提供政府采购所需货物及服务产生的应收账款情况匹配一定金额的融资支持，最高可达应收账款实有金额的</span><span style="font-size:14pt;"><span>90%</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">，期限最长可达</span><span style="font-size:14pt;"><span>2</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">年，<b>无需提供抵质押担保</b>，<b>满足企业资金回笼需求</b>。</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:Wingdings;font-size:14pt;"><span><span>l</span><span style="font-size:7pt;line-height:normal;font-family:&quot;">&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:14pt;">信用贷款</span><span style="font-family:仿宋_GB2312;font-size:14pt;">：对于具备高新技术资质且年收入在</span><span style="font-size:14pt;"><span>1000</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">万元以上的供应商，工行可以提供最高</span><span style="font-size:14pt;"><span>500</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">万元、最长一年期的<b>信用贷款</b>，该产品可以获得政府贴息，<b>降低供应商融资成本</b>。</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:Wingdings;font-size:14pt;"><span><span>l</span><span style="font-size:7pt;line-height:normal;font-family:&quot;">&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:14pt;">担保融资：</span><span style="font-family:仿宋_GB2312;font-size:14pt;">针对已中标政府采购项目的中小微企业，工行与试点担保公司合作可根据企业由于提供政府采购所需货物及服务情况匹配一定金额的融资支持，期限最长</span><span style="font-size:14pt;"><span>1</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">年，满足企业资金需求。</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28.1pt;">
						<b><span style="font-family:仿宋_GB2312;font-size:14pt;">温馨提示：除政府采购项目外，供应商承接的非政府采购项目也可办理上述融资业务，</span></b><span style="font-family:仿宋_GB2312;font-size:14pt;">此外，工行还可提供包括投标保函、履约保函等在内的综合金融服务。</span><span style="font-size:14pt;"></span> 
					</p>
					<p class="MsoNormal" style="text-indent:28pt;">
						<span style="font-family:仿宋_GB2312;font-size:14pt;">为更好的改进服务，了解广大供应商融资需求，烦请您抽出宝贵的时间填写调查问卷，并传真到</span><span style="font-size:14pt;"><span>66413630</span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">或电邮到</span><span style="font-size:14pt;"><span>&nbsp;<span><a href="mailto:zhangzhy@bj.icbc.com.cn"><span>zhangzhy@bj.icbc.com.cn</span></a></span></span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">或</span><span class="MsoHyperlink"><span style="font-size:14pt;"><u><span>maqm@bj.icbc.com.cn</span></u></span></span><span style="font-family:仿宋_GB2312;font-size:14pt;">，工行工作人员将及时与您联系，面对面解决您的融资问题。我行将于近期举办“政采通”融资服务座谈会，邀请反馈调查问卷的供应商客户参加，同时邀请市财政局等相关政府主管部门领导出席座谈会，我们热切地盼望您的光临！</span><span style="font-size:14pt;"></span> 
					</p>
<br />
					<p align="center" class="MsoNormal" style="text-align:center;text-indent:28pt;">
						<span style="font-family:黑体;font-size:16pt;">工</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">商</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">银</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">行</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">中</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">小</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">企</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">业</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">“政</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">采</span><span style="font-size:16pt;"><span>&nbsp;</span></span><span style="font-family:黑体;font-size:16pt;">通”</span><span style="font-size:16pt;"></span> 
					</p>
					<p align="center" class="MsoNormal" style="text-align:center;">
						<span style="font-family:黑体;font-size:16pt;">调</span><span style="font-size:16pt;"><span><span>&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:16pt;">查</span><span style="font-size:16pt;"><span><span>&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:16pt;">问</span><span style="font-size:16pt;"><span><span>&nbsp;&nbsp;</span></span></span><span style="font-family:黑体;font-size:16pt;">卷</span><span style="font-size:16pt;"></span> 
					</p>
					<p class="MsoNormal">
						<span><span>&nbsp;</span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">尊敬的客户：</span><span></span></span> 
					</p>
					<p class="MsoNormal" style="text-indent:21pt;">
						<span><span style="font-family:宋体;">为了更好地向广大政府采购供应商提供高效、便捷的融资服务，特制作以下调查问卷。工行将对取得的各类信息严格保密，谢谢您的支持！</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span><span>1</span></span></b><b><span style="font-family:宋体;">、企业基本信息</span></b><b><span></span></b></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">企业名称</span></b><span style="font-family:宋体;">：</span><span><u><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></u><b><span><span>&nbsp;</span></span></b></span><b><span style="font-family:宋体;">注册资本</span></b><span style="font-family:宋体;">：</span><span><u><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></u><span></span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">所有制类别</span></b><span style="font-family:宋体;">：</span><span><span>□&nbsp;</span></span><span style="font-family:宋体;">国有企业</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">外商投资企业</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">民营企业</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">其他</span><u><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></u></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">企业地址</span></b><span style="font-family:宋体;">：</span><u><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></u></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">您的姓名及联系方式</span></b><span style="font-family:宋体;">：</span><u><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></span></u></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>(1)&nbsp;</span></span><span style="font-family:宋体;">所属城区：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A.</span></span><span style="font-family:宋体;">东城区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>B.</span></span><span style="font-family:宋体;">西城区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C.</span></span><span style="font-family:宋体;">崇文区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>D.</span></span><span style="font-family:宋体;">宣武区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>E.</span></span><span style="font-family:宋体;">朝阳区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>F.</span></span><span style="font-family:宋体;">海淀区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>G.</span></span><span style="font-family:宋体;">丰台区</span><span><span><span>&nbsp;&nbsp;&nbsp;</span>H.</span></span><span style="font-family:宋体;">石景山区</span><span><span><span>&nbsp;&nbsp;&nbsp;</span>I.</span></span><span style="font-family:宋体;">门头沟区</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>J.</span></span><span style="font-family:宋体;">房山区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>K.</span></span><span style="font-family:宋体;">通州区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>L.</span></span><span style="font-family:宋体;">顺义区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>M.</span></span><span style="font-family:宋体;">大兴区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>N.</span></span><span style="font-family:宋体;">昌平区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>O.</span></span><span style="font-family:宋体;">平谷区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>P.</span></span><span style="font-family:宋体;">怀柔区</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>Q.</span></span><span style="font-family:宋体;">密云县</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>R.</span></span><span style="font-family:宋体;">延庆县</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>(2)&nbsp;</span></span><span style="font-family:宋体;">企业成立时间：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．</span><span><span>1</span></span><span style="font-family:宋体;">年以内</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．</span><span><span>1</span></span><span style="font-family:宋体;">至</span><span><span>3</span></span><span style="font-family:宋体;">年</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．</span><span><span>3</span></span><span style="font-family:宋体;">年以上</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>(3)&nbsp;</span></span><span style="font-family:宋体;">职工人数：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．</span><span><span>100</span></span><span style="font-family:宋体;">人以内</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．</span><span><span>100</span></span><span style="font-family:宋体;">至</span><span><span>300</span></span><span style="font-family:宋体;">人</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．</span><span><span>300</span></span><span style="font-family:宋体;">人以上</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>(4)&nbsp;</span></span><span style="font-family:宋体;">资产总额：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．</span><span><span>500</span></span><span style="font-family:宋体;">万元以下</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．</span><span><span>500</span></span><span style="font-family:宋体;">万元</span><span><span>-1000</span></span><span style="font-family:宋体;">万元</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．</span><span><span>1000</span></span><span style="font-family:宋体;">万元</span><span><span>-4000</span></span><span style="font-family:宋体;">万元</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>D</span></span><span style="font-family:宋体;">．</span><span><span>4000</span></span><span style="font-family:宋体;">万元以上</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span><span>2</span></span></b><b><span style="font-family:宋体;">、从事政府采购领域</span></b><span style="font-family:宋体;">：</span><span><span>□</span></span><span style="font-family:宋体;">货物类</span><span><span><span>&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">工程类</span><span><span>&nbsp;□</span></span><span style="font-family:宋体;">服务类</span><span><span></span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span><span>3</span></span></b><b><span style="font-family:宋体;">、企业金融服务需求情况</span></b><b><span></span></b></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">（</span><span><span>1</span></span><span style="font-family:宋体;">）目前经营中所需金融服务（可多选）：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．贷款</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．结算</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．投行</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>D</span></span><span style="font-family:宋体;">．电子银行</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>E&nbsp;</span></span><span style="font-family:宋体;">其他（请填写其他金融需求）</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">（</span><span><span>2</span></span><span style="font-family:宋体;">）目前是否已有银行融资：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．是</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．否</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">（</span><span><span>3</span></span><span style="font-family:宋体;">）下一步贷款需求：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．</span><span><span>500</span></span><span style="font-family:宋体;">万元以下</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．</span><span><span>500</span></span><span style="font-family:宋体;">万元</span><span><span>-1000</span></span><span style="font-family:宋体;">万元</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．</span><span><span>1000</span></span><span style="font-family:宋体;">万元</span><span><span>-3000</span></span><span style="font-family:宋体;">万元以上</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>D</span></span><span style="font-family:宋体;">．</span><span><span>3000</span></span><span style="font-family:宋体;">万元以上</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>E</span></span><span style="font-family:宋体;">．暂无</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">（</span><span><span>4</span></span><span style="font-family:宋体;">）可能提供的担保方式（可多选）：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>A</span></span><span style="font-family:宋体;">．固定资产抵押</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>B</span></span><span style="font-family:宋体;">．专业担保公司</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>C</span></span><span style="font-family:宋体;">．与其他大企业的订单</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>D</span></span><span style="font-family:宋体;">．与其他大企业的应收账款</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>E</span></span><span style="font-family:宋体;">．知识产权质押</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>F</span></span><span style="font-family:宋体;">．其他（请填写其他担保方式）</span><span><u><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></u><span></span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">（</span></b><b><span><span>5</span></span></b><b><span style="font-family:宋体;">）对工行哪项融资产品感兴趣：</span></b><b><span></span></b></span> 
					</p>
					<p class="MsoNormal">
						<span><span><span>□</span></span><span style="font-family:宋体;">订单融资</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">应收款融资</span><span><span><span>&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">信用贷款</span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span>□</span></span><span style="font-family:宋体;">担保融资</span><span><span><span>&nbsp;&nbsp;&nbsp;</span>□</span></span><span style="font-family:宋体;">各类保函</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><b><span style="font-family:宋体;">（</span></b><b><span><span>6</span></span></b><b><span style="font-family:宋体;">）对工行融资产品有何建议：</span></b><b><span></span></b></span> 
					</p>
					<p class="MsoNormal">
						<u><span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span></u> 
					</p>
					<p class="MsoNormal">
						<u><span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span></u> 
					</p>
					<p class="MsoNormal">
						<u><span><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span></u> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">工商银行联系人：</span><span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">工行北京分行</span><span><span>&nbsp;</span></span><span style="font-family:宋体;">马千脉</span><span><span>&nbsp;66411719<span>&nbsp;&nbsp;&nbsp;</span></span></span><span style="font-family:宋体;">张振宇</span><span><span>&nbsp;66410055-11387</span></span><span style="font-family:宋体;">、</span><span><span>13811456601</span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span style="font-family:宋体;">工行朝阳支行</span><span><span>&nbsp;</span></span><span style="font-family:宋体;">韩</span><span><span><span>&nbsp;&nbsp;</span></span></span><span style="font-family:宋体;">燕</span><span><span>&nbsp;13501129197</span></span></span> 
					</p>
					<p class="MsoNormal">
						<span><span>&nbsp;</span></span> 
					</p>
					<p>
						<span></span> 
					</p>
					<p align="right" class="MsoNormal" style="text-align:right;">
						<span style="font-family:仿宋_GB2312;font-size:14pt;">中国工商银行北京市分行<span></span></span> 
					</p>
					<p align="right" class="MsoNormal">
						<span style="font-family:仿宋_GB2312;font-size:14pt;">二<span><span><span>O</span></span>一二年十月</span></span> 
					</p>
					<p>
						&nbsp;
					</p>
				</div>
				<div style="margin:10px 0px 0px;padding:0px;border:0px;color:#333333;">
				</div>
				<h4 style="font-weight:normal;color:#666666;">
					<span>上一篇：<a>第一页</a></span><span>下一篇：<a>最后一页</a></span> 
				</h4>
			</div>
		</div>
	</div>
	<div class="clear" style="margin:0px;padding:0px;border:0px;">
	</div>
</div>
<div class="footer" style="margin:0px;padding:0px;border:0px;background:#D7D7D7;color:#707070;font-family:微软雅黑, &quot;">
	<div class="w1200" style="margin:auto;padding:0px;border:0px;">
	</div>
</div>', 99, 4, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:35:29.000' AS DateTime), CAST(N'2017-10-13 10:37:15.597' AS DateTime))
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (113, 13, 65, N'', N'总经理致辞', N'', N'', N'', N'', N'', NULL, N'回首往昔，一切来之不易，凝聚着全体员工的心血与汗水，源于各界朋友的鼎力相助，北京汇诚金桥国际招标有限公司顺利成长起来。       近几年来，中国经济快速增长，政府出台各项法规与国际接轨。《招投标法》《政府采购法》的相继出台，保障了中国经济的稳定运行，同时也带给这…', N'<span style="font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp; 回首往昔，一切来之不易，凝聚着全体员工的心血与汗水，源于各界朋友的鼎力相助，北京汇诚金桥国际招标有限公司顺利成长起来。</span><br />
<span style="font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 近几年来，中国经济快速增长，政府出台各项法规与国际接轨。《招投标法》《政府采购法》的相继出台，保障了中国经济的稳定运行，同时也带给这个新兴行业更多的机遇和挑战。北京汇诚金桥国际招标有限公司依时组建，应运而生。我们遵循着“汇千家诚信，架万家金桥”的服务理念，架起了招投标方沟通的桥梁。依靠政府监管部门的指导，公司全体员工的辛勤努力以及广大客户、社会各界人士的大力支持，公司不断做大、做优、做强，服务于和谐社会是我们的理想与目标。</span><br />
<span style="font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在此，我谨代表汇诚金桥公司向长期以来一直给予我们关心和支持的社会各界朋友，表示诚挚的感谢。我们一定会再创佳绩，为社会献出一份满意的“感恩回报” ！</span>', 99, 0, 0, 0, 0, 1, 0, 0, 1, N'admin', CAST(N'2017-10-13 10:45:59.043' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (114, 13, 66, N'', N'公司简介', N'', N'', N'', N'', N'', NULL, N'北京汇诚金桥国际招标有限公司（原“北京汇诚金桥招投标代理有限公司”）筹备于2005年，成立于2006年，注册资本金3000万元，是一家从事各类项目招投标代理业务的专业代理公司，现具备政府采购代理机构甲级资格、工程招标代理机构乙级资格、中央投资项目招标代理机构乙级资格以…', N'<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;北京汇诚金桥国际招标有限公司（原“北京汇诚金桥招投标代理有限公司”）筹备于2005年，成立于2006年，注册资本金3000万元，是一家从事各类项目招投标代理业务的专业代理公司，现具备政府采购代理机构甲级资格、工程招标代理机构乙级资格、中央投资项目招标代理机构乙级资格以及机电产品国际招标机构资格，建有完善的组织机构和严格的规章管理制度，更重要的是我们拥有一支年轻热情、高效且具有丰富招标采购业务经验的高素质工作团队。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 随着业务量的不断增加，同时为适应国内外招标业务的发展，方便客户，我公司建立了自己的专业网站，点击率近200万次，是我公司对外宣传和办公的窗口，为各投标人查询招标信息提供方便。我公司办公地址位于朝阳门CBD商圈，邻近地铁，交通便捷，为采购人、评标专家和各投标商往来沟通与开标提供了便利。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;公司自成立至今已代理了几万例招标项目，为北京市市委、北京奥组委、北京冬奥组委、首都60周年大庆指挥部、公安部警卫局、北京市公安局、北京市警卫局、北京市公安局消防局、北京市公安局公安交通管理局、北京市民政局、北京市高级人民法院、北京市国土资源局、北京市地方税务局、北京市人力资源和社会保障局、北京市新闻出版局、北京市商务委员会、北京市旅游委员会、北京市教育委员会、北京市工商行政管理局、北京市建委、中国保监会、北京市红十字会等上百个委托单位提供招标代理服务，取得了良好的社会效益，并以良好的企业形象赢得了客户的赞誉，赢得了各委托单位的一致好评，且始终保持有效投诉为零的记录，在业界享有盛誉。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在我公司承接的众多招标代理项目中，不乏意义重大、影响深远的项目。在2006年—2008年先后承接了大量的奥运项目招标。在60年大庆期间，受国家60周年大庆指挥部委托，高质量、高效率的完成了60周年系列采购项目。2014年我公司受北京冬奥会申办委员会的委托为其提供招标代理服务。另外，我公司还承接了许多政府办实事项目，例如为北京市住建委及规委的600亿北京老旧住宅抗震加固项目中20亿的设计招标；为北京市老龄协会配备购置“小帮手”电子服务器、北京市残疾人联合会为无业重残人配备“小帮手”电子服务器政府采购项目以及连续三年承接“京交会”系列项目的招标。这些项目委托单位高度重视，社会舆论影响重大，我公司均顺利完成了招标代理工作。</span><br />
<span style="color:#333333;font-family:微软雅黑, &quot;background-color:#F2F2F2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;我公司连续多年在北京市财政局政府采购代理机构评选中取得了优秀的好成绩。2015年在中国政府采购奖评选中荣获“优秀代理机构奖”，并在2016年被中国招标投标协会评定为AAA级信用企业。</span>', 99, 0, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:46:24.390' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (115, 13, 67, N'', N'组织机构', N'', N'', N'', N'', N'', NULL, N'', N'<img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033534713.jpg" style="width:822px;height:596px;" />', 99, 0, 0, 0, 0, 0, 0, 0, 1, N'admin', CAST(N'2017-10-13 10:47:10.283' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (116, 13, 68, N'', N'企业资质', N'', N'', N'', N'', N'', NULL, N'企业营业执照副本政府采购招标代理甲级证书工程招标乙级证书中央投资项目招标代理乙级证书机电产品国际招标预乙级证书质量管理认证证书环境管理认证证书职业健康安全管理体系认证证书招标投标协会会员单位证书诚信招标机构证书AAA级信用企业企业信用等级证书', N'<div class="wrap1" style="margin:0px;padding:0px;border:0px;background:#F2F2F2;font-family:微软雅黑, &quot;">
	<div class="w1200" style="margin:auto;padding:0px;border:0px;">
		<div class="productr" style="margin:50px 0px 0px;padding:0px;border:0px;">
			<div class="world" style="margin:20px auto 50px;padding:0px;border:0px;">
				<div style="margin:10px 0px 0px;padding:0px;border:0px;color:#333333;">
					<div style="margin:0px;padding:0px;border:0px;text-align:center;">
						<strong><span><span class="15" style="font-size:16pt;font-family:仿宋;">企业营业执照副本<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033746125.jpg" style="height:1200px;width:849px;" /><br />
<strong><strong><span><span class="15" style="font-size:16pt;">政府采购招标代理甲级证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033806441.jpg" style="height:392px;width:570px;" /></span></span></strong></strong></span></span></strong>
					</div>
					<div style="margin:0px;padding:0px;border:0px;text-align:center;">
						<strong><span><span class="15" style="font-size:16pt;font-family:仿宋;">工程招标乙级证书</span></span></strong>
					</div>
					<div style="margin:0px;padding:0px;border:0px;text-align:center;">
						<strong><span><span class="15" style="font-size:16pt;font-family:仿宋;"><strong><strong><span><span class="15" style="font-size:16pt;"><strong><span><span class="15" style="font-size:16pt;"><img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033828298.jpg" style="height:565px;width:800px;" /><br />
<strong><span class="15" style="font-size:16pt;">中央投资项目招标代理乙级证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033900578.jpg" style="height:403px;width:570px;" /><br />
<strong><span><strong><span><span class="15" style="font-size:16pt;">机电产品国际招标预乙级证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1112/20161112033926729.jpg" style="height:570px;width:409px;" /><br />
质量管理认证证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511023538631.jpg" style="height:574px;width:400px;" /><br />
环境管理认证证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511023625253.jpg" style="height:575px;width:400px;" /><br />
职业健康安全管理体系认证证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511023706809.jpg" style="height:576px;width:400px;" /><br />
招标投标协会会员单位证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511024252198.jpg" style="height:410px;width:580px;" /><br />
诚信招标机构证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511024347904.jpg" style="height:404px;width:580px;" /><br />
AAA级信用企业<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511025049471.jpg" style="height:394px;width:580px;" /><br />
企业信用等级证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511025655795.jpg" style="width:580px;" /></span></span></strong></span></strong></span></strong></span></span></strong></span></span></strong></strong></span></span></strong><br />
&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear" style="margin:0px;padding:0px;border:0px;">
	</div>
</div>
<div class="footer" style="margin:0px;padding:0px;border:0px;background:#D7D7D7;color:#707070;font-family:微软雅黑, &quot;">
	<div class="w1200" style="margin:auto;padding:0px;border:0px;">
	</div>
</div>', 99, 0, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:48:01.893' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (117, 13, 69, N'', N'荣誉证书', N'', N'', N'', N'', N'', NULL, N'高等教育学会赞助项目荣誉证书地址矿产开发局招投标荣誉证书北京市筹备委员会招投标荣誉证书北京市国土局招投标荣誉证书北京房屋建筑节能招标代理荣誉证书西城区政府残委就业诚信单位北京市公安局警卫局招投标荣誉证书共青团市委招投标荣誉证书北京商委招投标荣誉证书1北京商委…', N'<div class="wrap1" style="margin:0px;padding:0px;border:0px;background:#F2F2F2;font-family:微软雅黑, &quot;">
	<div class="w1200" style="margin:auto;padding:0px;border:0px;">
		<div class="productr" style="margin:50px 0px 0px;padding:0px;border:0px;">
			<div class="world" style="margin:20px auto 50px;padding:0px;border:0px;">
				<div style="margin:10px 0px 0px;padding:0px;border:0px;color:#333333;">
					<div style="margin:0px;padding:0px;border:0px;text-align:center;">
						<strong><span><span class="15" style="font-size:16pt;font-family:仿宋;"><strong><strong><span><span class="15" style="font-size:16pt;"><strong><span><span class="15" style="font-size:16pt;"><strong><span class="15" style="font-size:16pt;"><strong><span><strong><span><span class="15" style="font-size:16pt;">高等教育学会赞助项目荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511032127535.jpg" style="height:395px;width:570px;" /><br />
地址矿产开发局招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511032549913.jpg" style="height:380px;width:580px;" /><br />
北京市筹备委员会招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511032746704.jpg" style="height:416px;width:580px;" /><br />
北京市国土局招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511032829376.jpg" style="height:417px;width:580px;" /><br />
北京房屋建筑节能招标代理荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511032932420.jpg" style="height:410px;width:580px;" /><br />
西城区政府残委就业诚信单位<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511033519507.jpg" style="height:401px;width:580px;" /><br />
北京市公安局警卫局招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511033626307.jpg" style="height:404px;width:580px;" /><br />
共青团市委招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053134485.jpg" style="height:396px;width:570px;" /><br />
北京商委招投标荣誉证书1<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053250632.jpg" style="height:393px;width:570px;" /><br />
北京商委招投标荣誉证书2<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053350421.jpg" style="height:394px;width:570px;" /><br />
北京商委招投标荣誉证书3<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053427184.jpg" style="height:397px;width:570px;" /><br />
北京市建设工程安全质量监督总站招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053506527.jpg" style="height:398px;width:570px;" /><br />
昌平国土招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053540191.jpg" style="height:399px;width:570px;" /><br />
国际影视交流促进中心招投标荣誉证书<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511053639137.jpg" style="height:396px;width:570px;" /><br />
第一届京交会感谢信<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511061252685.jpg" style="height:705px;width:570px;" /><br />
第二届京交会感谢信<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511061405711.jpg" style="height:814px;width:570px;" /><br />
第三届京交会感谢信<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511061442669.jpg" style="height:784px;width:570px;" /><br />
2015年新闻出版广电局感谢信<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511061601227.jpg" style="height:815px;width:570px;" /><br />
<br />
2016年新闻出版广电局感谢信<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0511/20170511061652898.jpg" style="height:815px;width:570px;" /></span></span></strong></span></strong></span></strong></span></span></strong></span></span></strong></strong></span></span></strong><br />
<span><strong>中国政府采购奖项</strong></span><br />
<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2017/0516/20170516030933871.jpg" style="height:368px;width:570px;" /><br />
<br />
&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear" style="margin:0px;padding:0px;border:0px;">
	</div>
</div>
<div class="footer" style="margin:0px;padding:0px;border:0px;background:#D7D7D7;color:#707070;font-family:微软雅黑, &quot;">
	<div class="w1200" style="margin:auto;padding:0px;border:0px;">
	</div>
</div>', 99, 0, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 10:48:38.443' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (118, 13, 70, N'', N'办公环境', N'', N'', N'', N'', N'', NULL, N'公司前台业务部办公区后勤部办公区财务部办公区楼道环境休息区第一会议室第二会议室第三会议室第四会议室第五会议室', N'<strong>公司前台<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070506480.jpg" style="width:850px;height:680px;" /><br />
业务部办公区<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070544342.jpg" style="width:850px;height:680px;" /><br />
后勤部办公区<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070623452.jpg" style="width:850px;height:680px;" /><br />
财务部办公区<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070657492.jpg" style="width:850px;height:680px;" /><br />
楼道环境<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070728607.jpg" style="width:850px;height:680px;" /><br />
休息区<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070800350.jpg" style="width:850px;height:680px;" /><br />
<strong><strong><strong><strong><strong><strong>第一会议室<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070825910.jpg" style="width:850px;height:680px;" /><br />
<strong><strong><strong><strong><strong><strong>第二会议室<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070850721.jpg" style="width:850px;height:680px;" /><br />
<strong><strong><strong><strong><strong><strong>第三会议室<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070917746.jpg" style="width:850px;height:680px;" /></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong><br />
<strong><strong><strong><strong><strong><strong>第四会议室<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114070943369.jpg" style="width:850px;height:680px;" /></strong></strong></strong></strong></strong></strong><br />
<strong><strong><strong><strong><strong><strong>第五会议室<br />
<img alt="" src="http://www.hcjq.net/uploadfile/2016/1114/20161114071010303.jpg" style="width:850px;height:680px;" /></strong></strong></strong></strong></strong></strong>', 99, 0, 0, 0, 0, 0, 0, 0, 1, N'admin', CAST(N'2017-10-13 10:49:21.443' AS DateTime), NULL)
INSERT [dbo].[dt_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [user_name], [add_time], [update_time]) VALUES (119, 14, 52, N'', N'啊啊啊', N'', N'', N'', N'', N'', NULL, N'aa啊啊啊啊啊', N'aa啊啊啊啊啊', 99, 2, 0, 0, 0, 0, 1, 0, 1, N'admin', CAST(N'2017-10-13 14:08:06.140' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[dt_article] OFF
SET IDENTITY_INSERT [dbo].[dt_article_attribute_field] ON 

INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (2, N'sub_title', N'副标题', N'single-text', N'nvarchar(255)', 255, 0, N'', N'', 0, 0, 0, 0, N'可为空，最多255个字符', N'', N's0-255', 99, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (3, N'source', N'信息来源', N'single-text', N'nvarchar(100)', 100, 0, N'', N'本站', 0, 0, 0, 0, N'非必填，最多50个字符', N'', N's0-50', 100, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (4, N'author', N'文章作者', N'single-text', N'nvarchar(50)', 50, 0, N'', N'', 0, 0, 0, 0, N'非必填，最多50个字符', N'', N's0-50', 101, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (5, N'goods_no', N'商品货号', N'single-text', N'nvarchar(100)', 100, 0, N'', N'', 0, 0, 0, 0, N'允许字母、下划线，100个字符内', N'', N's0-100', 102, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (6, N'stock_quantity', N'库存数量', N'number', N'int', 0, 0, N'', N'0', 0, 0, 0, 0, N'库存数量为0时显示缺货状态', N'', N'n', 103, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (7, N'market_price', N'市场价格', N'number', N'decimal(9,2)', 0, 2, N'', N'0', 0, 0, 0, 0, N'市场的参与价格，不参与计算', N'', N'/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/', 104, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (8, N'sell_price', N'销售价格', N'number', N'decimal(9,2)', 0, 2, N'', N'0', 1, 0, 0, 0, N'*出售的实际交易价格', N'', N'/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/', 105, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (9, N'point', N'交易积分', N'number', N'int', 0, 0, N'', N'0', 0, 0, 0, 0, N'*正为返还，负为消费积分', N'', N'n', 106, 1)
INSERT [dbo].[dt_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (12, N'video_src', N'视频上传', N'video', N'nvarchar(255)', 0, 0, N'', N'', 0, 0, 0, 0, N'', N'', N'', 99, 0)
SET IDENTITY_INSERT [dbo].[dt_article_attribute_field] OFF
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (103, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (104, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (105, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (106, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (107, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (108, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (109, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (110, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (111, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (112, N'工商银行中小企业“政采通”产品介绍及 客户调查问卷', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (113, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (114, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (115, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (116, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (117, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (118, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
INSERT [dbo].[dt_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [video_src]) VALUES (119, N'', N'本站', N'', NULL, 0, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 0, N'')
SET IDENTITY_INSERT [dbo].[dt_article_category] ON 

INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (52, 14, N'新闻中心', N'newscenter', 0, N',52,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (53, 18, N'招标采购公告', N'tender', 0, N',53,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (54, 18, N'结果公告', N'result', 0, N',54,', 1, 2, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (55, 18, N'变更公告', N'change', 0, N',55,', 1, 3, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (57, 17, N'企业文化', N'companyculture', 0, N',57,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (58, 17, N'爱生活·爱旅游', N'shenglv', 0, N',58,', 1, 2, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (59, 15, N'成功案例', N'case', 0, N',59,', 1, 2, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (60, 15, N'业绩说明', N'achieve_shuo', 0, N',60,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (61, 16, N'业务委托流程', N'process_wei', 0, N',61,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (62, 16, N'在线解答', N'question', 0, N',62,', 1, 2, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (63, 16, N'联系我们', N'contact', 0, N',63,', 1, 3, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (64, 16, N'关联业务', N'realation', 0, N',64,', 1, 4, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (65, 13, N'总经理致辞', N'zhici', 0, N',65,', 1, 1, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (66, 13, N'公司简介', N'jianjie', 0, N',66,', 1, 2, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (67, 13, N'组织机构', N'orangize', 0, N',67,', 1, 3, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (68, 13, N'企业资质', N'zizhi', 0, N',68,', 1, 4, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (69, 13, N'荣誉证书', N'rongyu', 0, N',69,', 1, 5, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[dt_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description]) VALUES (70, 13, N'办公环境', N'huanjing', 0, N',70,', 1, 6, N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[dt_article_category] OFF
SET IDENTITY_INSERT [dbo].[dt_channel] ON 

INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (12, 6, N'index', N'首页', 1, 1, 0, 1)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (13, 6, N'about', N'公司概况', 1, 1, 0, 2)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (14, 6, N'newscenter', N'新闻中心', 1, 1, 0, 3)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (15, 6, N'achieve', N'经典业绩', 1, 1, 0, 5)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (16, 6, N'server', N'客户服务', 1, 1, 0, 7)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (17, 6, N'culture', N'企业文化', 1, 1, 0, 6)
INSERT [dbo].[dt_channel] ([id], [site_id], [name], [title], [is_albums], [is_attach], [is_spec], [sort_id]) VALUES (18, 6, N'mes', N'招标信息', 1, 1, 0, 4)
SET IDENTITY_INSERT [dbo].[dt_channel] OFF
SET IDENTITY_INSERT [dbo].[dt_channel_field] ON 

INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (36, 12, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (37, 12, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (38, 12, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (39, 12, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (40, 13, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (41, 13, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (42, 13, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (43, 13, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (44, 14, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (45, 14, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (46, 14, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (47, 14, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (48, 15, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (49, 15, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (50, 15, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (51, 15, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (52, 16, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (53, 16, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (54, 16, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (55, 16, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (56, 17, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (57, 17, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (58, 17, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (59, 17, 4)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (60, 18, 12)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (61, 18, 2)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (62, 18, 3)
INSERT [dbo].[dt_channel_field] ([id], [channel_id], [field_id]) VALUES (63, 18, 4)
SET IDENTITY_INSERT [dbo].[dt_channel_field] OFF
SET IDENTITY_INSERT [dbo].[dt_channel_site] ON 

INSERT [dbo].[dt_channel_site] ([id], [title], [build_path], [templet_path], [domain], [name], [logo], [company], [address], [tel], [fax], [email], [crod], [copyright], [seo_title], [seo_keyword], [seo_description], [is_default], [sort_id]) VALUES (5, N'手机网站', N'mobile', N'mobile', N'm.dtcms.net', N'DTcms内容管理系统', N'', N'深圳市动力启航软件有限公司', N'深圳市宝安区西乡街道铁岗村一巷二号', N'13695245546', N'', N'info@dtcms.net', N'粤ICP备11064298号', N'版权所有 深圳市动力启航软件有限公司 @ Copyright 2009 - 2015. dtcms.net. All Rights Reserved.', N'DTcms网站管理系统 - 动力启航_开源cms_NET开源_cms建站', N'动力启航,DTCMS系统,ASP.NET开源,开源CMS,网站管理系统,互联网开发', N'让更多的人分享互联网开发技术', 0, 100)
INSERT [dbo].[dt_channel_site] ([id], [title], [build_path], [templet_path], [domain], [name], [logo], [company], [address], [tel], [fax], [email], [crod], [copyright], [seo_title], [seo_keyword], [seo_description], [is_default], [sort_id]) VALUES (6, N'招标', N'main', N'main', N'', N'北京中天铭泽招标代理有限公司', N'', N'北京中天铭泽招标代理有限公司', N'', N'', N'', N'', N'', N'', N'北京中天铭泽招标代理有限公司', N'北京中天铭泽招标代理有限公司', N'北京中天铭泽招标代理有限公司', 1, 98)
SET IDENTITY_INSERT [dbo].[dt_channel_site] OFF
SET IDENTITY_INSERT [dbo].[dt_express] ON 

INSERT [dbo].[dt_express] ([id], [title], [express_code], [express_fee], [website], [remark], [sort_id], [is_lock]) VALUES (1, N'顺丰快递', N'shunfeng', CAST(24.00 AS Decimal(9, 2)), N'http://www.sf-express.com', N'国内最好的物流公司', 99, 0)
SET IDENTITY_INSERT [dbo].[dt_express] OFF
SET IDENTITY_INSERT [dbo].[dt_link] ON 

INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (1, N'main', N'动软中国', N'', N'', N'', N'http://www.maticsoft.com', N'http://www.maticsoft.com/images/logo/logo12.gif', 1, 99, 1, 0, CAST(N'2015-05-03 01:19:23.000' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (2, N'main', N'读科技', N'', N'', N'', N'http://www.dukeji.com', N'http://www.dukeji.com/Content/themes/base/CMS/images/logo.jpg', 1, 99, 1, 0, CAST(N'2015-05-03 01:43:35.127' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (3, N'main', N'中国站长网', N'', N'', N'', N'http://www.chinaz.com', N'http://www.chinaz.com/images/chinaz.gif', 1, 99, 1, 0, CAST(N'2015-05-03 01:44:22.447' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (4, N'main', N'我要源码站', N'', N'', N'', N'http://www.51aspx.com', N'http://img.51aspx.com/p/images/logo_88x31.gif', 1, 99, 1, 0, CAST(N'2015-05-03 01:50:40.537' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (5, N'main', N'懒人图库', N'', N'', N'', N'http://www.lanrentuku.com', N'http://img.lanrentuku.com/img/images/logo88x31.gif', 1, 99, 1, 0, CAST(N'2015-05-03 02:01:44.613' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (6, N'main', N'深圳体验设计专业委员会', N'', N'', N'', N'http://www.uxdc.org', N'http://www.uxdc.org/logo/uxdc_logo.gif', 1, 99, 1, 0, CAST(N'2015-05-03 02:05:43.000' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (7, N'main', N'腾讯CDC', N'', N'', N'', N'http://cdc.tencent.com', N'http://cdc.tencent.com/wp-content/uploads/cdc_logo.gif', 1, 99, 1, 0, CAST(N'2015-05-03 02:06:27.487' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (8, N'main', N'视觉同盟', N'', N'', N'', N'http://www.visionunion.com', N'http://www.visionunion.com/help/images/vu_logo.gif', 1, 99, 1, 0, CAST(N'2015-05-03 02:07:23.057' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (9, N'main', N'百度搜索用户体验中心', N'', N'', N'', N'http://ued.baidu.com', N'http://cdc.tencent.com/wp-content/uploads/2015/02/ued.baidu_.com_.jpg', 1, 99, 1, 0, CAST(N'2015-05-03 02:11:04.830' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (10, N'main', N'蓝色理想', N'', N'', N'', N'http://www.blueidea.com', N'http://www.blueidea.com/logo.gif', 1, 99, 1, 0, CAST(N'2015-05-03 02:13:22.797' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (11, N'main', N'盒子UI设计', N'', N'', N'', N'http://www.boxui.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:15:54.793' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (12, N'main', N'图标下载', N'', N'', N'', N'http://www.easyicon.net/', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:16:35.423' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (13, N'main', N'素材天下', N'', N'', N'', N'http://www.sucaitianxia.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:17:25.960' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (14, N'main', N'设计联盟', N'', N'', N'', N'http://www.cndu.cn', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:17:57.773' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (15, N'main', N'插画中国', N'', N'', N'', N'http://www.chahua.org', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:18:41.883' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (16, N'main', N'设计路上', N'', N'', N'', N'http://www.sj63.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:19:24.680' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (17, N'main', N'UI制造者', N'', N'', N'', N'http://www.uimaker.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:20:02.523' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (18, N'main', N'视觉中国', N'', N'', N'', N'http://www.shijue.me', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:21:17.967' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (19, N'main', N'美图看看', N'', N'', N'', N'http://kankan.meitu.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:21:54.430' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (20, N'main', N'包装设计网', N'', N'', N'', N'http://www.chndesign.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:22:39.617' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (21, N'main', N'火星网', N'', N'', N'', N'http://www.hxsd.com.cn', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:24:30.393' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (22, N'main', N'桌面城市', N'', N'', N'', N'http://www.deskcity.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:25:02.773' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (23, N'main', N'天堂图片', N'', N'', N'', N'http://www.ivsky.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:25:45.973' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (24, N'main', N'游艺网', N'', N'', N'', N'http://www.game798.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:26:19.637' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (25, N'main', N'JQuery', N'', N'', N'', N'http://www.jquery.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:27:24.040' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (26, N'main', N'dowebok', N'', N'', N'', N'http://www.dowebok.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:28:59.150' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (27, N'main', N'前端开发仓库', N'', N'', N'', N'http://code.ciaoca.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:29:44.320' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (28, N'main', N'Discuz社区', N'', N'', N'', N'http://www.discuz.net', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:31:27.440' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (29, N'main', N'IT之家', N'', N'', N'', N'http://www.ithome.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:32:04.087' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (30, N'main', N'中国IT实验室', N'', N'', N'', N'http://www.chinaitlab.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:33:13.417' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (31, N'main', N'驱动之家', N'', N'', N'', N'http://www.mydrivers.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:33:56.213' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (32, N'main', N'雷锋网', N'', N'', N'', N'http://www.leiphone.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:34:32.033' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (33, N'main', N'ckplayer视频播放器', N'', N'', N'', N'http://www.ckplayer.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:35:04.947' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (34, N'main', N'快递查询', N'', N'', N'', N'http://www.kuaidi100.com', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:36:14.630' AS DateTime))
INSERT [dbo].[dt_link] ([id], [site_path], [title], [user_name], [user_tel], [email], [site_url], [img_url], [is_image], [sort_id], [is_red], [is_lock], [add_time]) VALUES (35, N'main', N'动力启航', N'', N'', N'', N'http://www.dtsoft.net', N'', 0, 99, 1, 0, CAST(N'2015-05-03 02:36:41.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[dt_link] OFF
SET IDENTITY_INSERT [dbo].[dt_mail_template] ON 

INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (2, N'注册激活账户邮件', N'regverify', N'激活注册账户(请勿回复此邮件)', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp; 欢迎您成为{webname}会员用户，请点击如下的网址进行激活您的会员账户：
</p>
<p>
	&nbsp;&nbsp;&nbsp; <a href="{linkurl}" target="_blank">{linkurl}</a> 
</p>
<hr />
<p>
	此链接有效期为{valid}天，请在{valid}天内点击链接进行注册；如果您从未注册过本站会员，请忽略本邮件；此邮件为系统自动发出，请勿回复。<br />
任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (3, N'用户取回密码', N'getpassword', N'找回密码提示(请勿回复此邮件)', N'<strong>{username}，您好：</strong><br />
<p>
	您在<span style="color:#FF0000;">{webname}</span>点击了“忘记密码”找回申请，故系统自动为您发送了这封邮件。您可以点击以下链接修改您的密码：<br />
<a href="{linkurl}" target="_blank">{linkurl}</a> 
</p>
<hr />
<p>
	此链接有效期为{valid}天，请在{valid}天内点击链接进行修改。如果您不需要修改密码，或者您从未点击过“忘记密码”按钮，请忽略本邮件。<br />
任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (4, N'欢迎新用户邮件', N'welcomemsg', N'欢迎新用户(请勿回复此邮件)', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp; 您已成功注册并正式成为{webname}会员用户，请您注意保管好个人账户信息，防止丢失或泄漏。
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (5, N'订单确认通知', N'order_confirm', N'订单确认通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单已确认，订单号为：{orderno}，共计{amount}元，我们会尽快安排发货，请您耐心等待，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (6, N'订单发货通知', N'order_express', N'订单发货通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单已经发货，订单号为：{orderno}，共计{amount}元，请您注意查收，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[dt_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (7, N'订单完成通知', N'order_complete', N'订单完成通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单交易完成，订单号为：{orderno}，共计{amount}元，期待您下次光临，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
SET IDENTITY_INSERT [dbo].[dt_mail_template] OFF
SET IDENTITY_INSERT [dbo].[dt_manager] ON 

INSERT [dbo].[dt_manager] ([id], [role_id], [role_type], [user_name], [password], [salt], [real_name], [telephone], [email], [is_lock], [add_time]) VALUES (1, 1, 1, N'admin', N'87FA6AD6CBFDF3108E4DD6F47F5D04A4', N'24V0XZ', N'超级管理员', N'', N'', 0, CAST(N'2015-03-13 13:41:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[dt_manager] OFF
SET IDENTITY_INSERT [dbo].[dt_manager_log] ON 

INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (596, 1, N'admin', N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2017-10-12 09:56:20.373' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (597, 1, N'admin', N'Add', N'添加频道企业文化', N'127.0.0.1', CAST(N'2017-10-12 10:15:16.860' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (598, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:15:25.123' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (599, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:18:45.557' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (600, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:19:43.117' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (601, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:22:11.340' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (602, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:30:21.750' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (603, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:35:07.537' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (604, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:38:10.063' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (605, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:50:10.733' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (606, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 10:54:17.397' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (607, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 11:26:02.247' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (608, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 11:28:08.483' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (609, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 11:28:50.617' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (610, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 11:29:51.687' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (611, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 13:41:41.697' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (612, 1, N'admin', N'Add', N'添加newscenter频道栏目分类:新闻中心', N'127.0.0.1', CAST(N'2017-10-12 13:46:50.707' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (613, 1, N'admin', N'Add', N'添加newscenter频道内容:汇诚金桥公司严正声明', N'127.0.0.1', CAST(N'2017-10-12 13:57:47.903' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (614, 1, N'admin', N'Add', N'添加newscenter频道内容:汇诚金桥十一周岁生日快乐！', N'127.0.0.1', CAST(N'2017-10-12 14:00:12.003' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (615, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:09:26.070' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (616, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:10:13.520' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (617, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:12:06.163' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (618, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:14:09.140' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (619, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:15:13.870' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (620, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:17:26.527' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (621, 1, N'admin', N'Add', N'添加频道招标信息', N'127.0.0.1', CAST(N'2017-10-12 14:18:56.273' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (622, 1, N'admin', N'Add', N'添加mes频道栏目分类:招标采购公告', N'127.0.0.1', CAST(N'2017-10-12 14:19:45.753' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (623, 1, N'admin', N'Add', N'添加mes频道栏目分类:结果公告', N'127.0.0.1', CAST(N'2017-10-12 14:20:13.690' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (624, 1, N'admin', N'Add', N'添加mes频道栏目分类:变更公告', N'127.0.0.1', CAST(N'2017-10-12 14:20:37.047' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (625, 1, N'admin', N'Add', N'添加mes频道内容:队史馆及影院装修工程招标公告', N'127.0.0.1', CAST(N'2017-10-12 14:21:16.947' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (626, 1, N'admin', N'Add', N'添加mes频道内容:流浪未成年人救助管理专业服务岗位项目成交结果公告', N'127.0.0.1', CAST(N'2017-10-12 14:21:56.543' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (627, 1, N'admin', N'Add', N'添加mes频道内容:首都精神文明建设委员会办公室“2017北京榜样”大型主题活动宣传品项目更正公告（二次）', N'127.0.0.1', CAST(N'2017-10-12 14:22:28.987' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (628, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:28:39.653' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (629, 1, N'admin', N'Edit', N'修改mes频道栏目分类:招标采购公告', N'127.0.0.1', CAST(N'2017-10-12 14:29:31.847' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (630, 1, N'admin', N'Edit', N'修改mes频道栏目分类:结果公告', N'127.0.0.1', CAST(N'2017-10-12 14:29:37.797' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (631, 1, N'admin', N'Edit', N'修改mes频道栏目分类:变更公告', N'127.0.0.1', CAST(N'2017-10-12 14:29:43.947' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (632, 1, N'admin', N'Add', N'添加newscenter频道栏目分类:公司新闻', N'127.0.0.1', CAST(N'2017-10-12 14:35:05.867' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (633, 1, N'admin', N'Edit', N'修改newscenter频道内容:汇诚金桥十一周岁生日快乐！', N'127.0.0.1', CAST(N'2017-10-12 14:35:36.963' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (634, 1, N'admin', N'Edit', N'修改newscenter频道内容:汇诚金桥公司严正声明', N'127.0.0.1', CAST(N'2017-10-12 14:35:41.760' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (635, 1, N'admin', N'Edit', N'修改newscenter频道内容:汇诚金桥十一周岁生日快乐！', N'127.0.0.1', CAST(N'2017-10-12 14:36:08.043' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (636, 1, N'admin', N'Edit', N'修改newscenter频道内容:汇诚金桥公司严正声明', N'127.0.0.1', CAST(N'2017-10-12 14:36:12.747' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (637, 1, N'admin', N'Edit', N'删除newscenter频道栏目分类数据', N'127.0.0.1', CAST(N'2017-10-12 14:36:50.393' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (638, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:40:02.623' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (639, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:44:01.413' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (640, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:44:50.940' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (641, 1, N'admin', N'Add', N'添加culture频道栏目分类:企业文化', N'127.0.0.1', CAST(N'2017-10-12 14:46:26.880' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (642, 1, N'admin', N'Add', N'添加culture频道栏目分类:爱生活·爱旅游', N'127.0.0.1', CAST(N'2017-10-12 14:46:53.917' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (643, 1, N'admin', N'Add', N'添加culture频道内容:骑行游记', N'127.0.0.1', CAST(N'2017-10-12 14:47:20.327' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (644, 1, N'admin', N'Add', N'添加achieve频道栏目分类:成功案例', N'127.0.0.1', CAST(N'2017-10-12 14:48:20.250' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (645, 1, N'admin', N'Add', N'添加achieve频道内容:第三届中国（北京）国际服务贸易交易会系列项目招标', N'127.0.0.1', CAST(N'2017-10-12 14:48:50.557' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (646, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 14:48:56.367' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (647, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 15:35:47.787' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (648, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 15:36:11.563' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (649, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 15:41:06.680' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (650, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 15:41:12.433' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (651, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 15:42:56.113' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (652, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 15:43:34.610' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (653, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 15:47:24.247' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (654, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 15:55:26.843' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (655, 1, N'admin', N'Build', N'生成模板:main1', N'127.0.0.1', CAST(N'2017-10-12 16:03:23.597' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (656, 1, N'admin', N'Edit', N'修改站点:招标', N'127.0.0.1', CAST(N'2017-10-12 16:03:48.443' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (657, 1, N'admin', N'Edit', N'修改站点:默认站点', N'127.0.0.1', CAST(N'2017-10-12 16:03:52.473' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (658, 1, N'admin', N'Build', N'生成模板:main1', N'127.0.0.1', CAST(N'2017-10-12 16:04:42.443' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (659, 1, N'admin', N'Edit', N'修改站点:默认站点', N'127.0.0.1', CAST(N'2017-10-12 16:08:09.803' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (660, 1, N'admin', N'Edit', N'修改站点:招标', N'127.0.0.1', CAST(N'2017-10-12 16:08:13.747' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (661, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:23:45.363' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (662, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:24:51.550' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (663, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:27:10.053' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (664, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:28:35.787' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (665, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:30:01.287' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (666, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:32:11.967' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (667, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:36:12.880' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (668, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 16:39:32.313' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (669, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:39:51.887' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (670, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 16:42:41.720' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (671, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 16:42:50.353' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (672, 1, N'admin', N'Login', N'用户登录', N'127.0.0.1', CAST(N'2017-10-12 17:06:59.967' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (673, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 17:08:04.693' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (674, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:09:35.057' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (675, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:11:01.873' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (676, 1, N'admin', N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2017-10-12 17:11:59.547' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (677, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:12:08.840' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (678, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:13:35.233' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (679, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:14:30.603' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (680, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:15:02.187' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (681, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:16:43.043' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (682, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 17:19:11.080' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (683, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:19:17.420' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (684, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:20:34.680' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (685, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:25:01.937' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (686, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:26:03.390' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (687, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:26:23.330' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (688, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:27:08.020' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (689, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:28:48.583' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (690, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:29:07.990' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (691, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:29:24.563' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (692, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:29:56.530' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (693, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:34:19.517' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (694, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:35:45.913' AS DateTime))
GO
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (695, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:36:45.037' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (696, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:37:02.643' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (697, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:37:54.123' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (698, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:38:27.170' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (699, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:38:44.707' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (700, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:39:05.087' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (701, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:44:22.827' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (702, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:50:29.370' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (703, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 17:53:10.913' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (704, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:53:17.707' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (705, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:55:25.290' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (706, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 17:57:17.463' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (707, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 17:57:27.953' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (708, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 17:59:17.287' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (709, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:00:08.767' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (710, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:12:31.780' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (711, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 18:13:34.947' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (712, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:13:39.733' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (713, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:14:49.557' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (714, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 18:15:29.670' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (715, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:15:42.173' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (716, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:16:14.493' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (717, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 18:18:25.257' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (718, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:18:31.317' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (719, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 18:19:32.840' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (720, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:19:40.283' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (721, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-12 18:21:12.657' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (722, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:21:17.303' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (723, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:21:37.053' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (724, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-12 18:22:14.710' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (725, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:03:04.690' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (726, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:03:34.307' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (727, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:04:00.623' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (728, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:04:41.377' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (729, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:04:46.110' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (730, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:06:49.410' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (731, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:06:54.167' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (732, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:08:25.367' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (733, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:09:07.453' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (734, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:10:21.507' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (735, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:14:13.110' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (736, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:15:12.797' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (737, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:15:18.913' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (738, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:16:01.153' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (739, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:17:36.677' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (740, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:19:16.667' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (741, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:20:02.480' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (742, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:22:15.540' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (743, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:23:08.473' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (744, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:24:25.780' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (745, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:26:48.583' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (746, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:27:31.887' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (747, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:27:51.303' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (748, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:29:00.703' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (749, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:29:39.777' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (750, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:30:50.723' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (751, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:34:20.643' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (752, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:35:01.387' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (753, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:35:55.083' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (754, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:36:36.733' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (755, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 09:39:11.027' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (756, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:39:16.620' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (757, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:40:28.147' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (758, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 09:48:24.060' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (759, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:48:30.060' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (760, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 09:56:19.677' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (761, 1, N'admin', N'Add', N'添加achieve频道栏目分类:业绩说明', N'127.0.0.1', CAST(N'2017-10-13 09:59:36.607' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (762, 1, N'admin', N'Add', N'添加achieve频道内容:业绩说明', N'127.0.0.1', CAST(N'2017-10-13 10:00:21.737' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (763, 1, N'admin', N'Edit', N'修改频道经典业绩', N'127.0.0.1', CAST(N'2017-10-13 10:08:24.017' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (764, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:09:53.707' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (765, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:11:00.917' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (766, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:11:39.633' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (767, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:12:36.807' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (768, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:13:30.223' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (769, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:14:26.020' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (770, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 10:21:26.020' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (771, 1, N'admin', N'Add', N'添加server频道栏目分类:业务委托流程', N'127.0.0.1', CAST(N'2017-10-13 10:22:34.470' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (772, 1, N'admin', N'Add', N'添加server频道栏目分类:在线解答', N'127.0.0.1', CAST(N'2017-10-13 10:22:50.127' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (773, 1, N'admin', N'Add', N'添加server频道栏目分类:联系我们', N'127.0.0.1', CAST(N'2017-10-13 10:23:07.660' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (774, 1, N'admin', N'Add', N'添加server频道栏目分类:关联业务', N'127.0.0.1', CAST(N'2017-10-13 10:24:05.220' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (775, 1, N'admin', N'Edit', N'修改server频道栏目分类:业务委托流程', N'127.0.0.1', CAST(N'2017-10-13 10:24:17.510' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (776, 1, N'admin', N'Edit', N'修改server频道栏目分类:在线解答', N'127.0.0.1', CAST(N'2017-10-13 10:24:32.697' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (777, 1, N'admin', N'Edit', N'修改server频道栏目分类:联系我们', N'127.0.0.1', CAST(N'2017-10-13 10:24:41.293' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (778, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:25:15.627' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (779, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:27:55.780' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (780, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:28:28.200' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (781, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:29:22.817' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (782, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:31:01.750' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (783, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:32:21.847' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (784, 1, N'admin', N'Add', N'添加server频道内容:2016年公司新员工年度入职培训', N'127.0.0.1', CAST(N'2017-10-13 10:33:45.240' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (785, 1, N'admin', N'Add', N'添加server频道内容:业务委托流程', N'127.0.0.1', CAST(N'2017-10-13 10:34:13.203' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (786, 1, N'admin', N'Add', N'添加server频道内容:工商银行中小企业“政采通”产品介绍及客户调查问卷', N'127.0.0.1', CAST(N'2017-10-13 10:35:29.433' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (787, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:35:40.143' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (788, 1, N'admin', N'Edit', N'修改server频道内容:工商银行中小企业“政采通”产品介绍及客户调查问卷', N'127.0.0.1', CAST(N'2017-10-13 10:37:15.630' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (789, 1, N'admin', N'Add', N'添加about频道栏目分类:总经理致辞', N'127.0.0.1', CAST(N'2017-10-13 10:41:36.357' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (790, 1, N'admin', N'Add', N'添加about频道栏目分类:公司简介', N'127.0.0.1', CAST(N'2017-10-13 10:41:50.670' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (791, 1, N'admin', N'Edit', N'修改about频道栏目分类:总经理致辞', N'127.0.0.1', CAST(N'2017-10-13 10:41:55.443' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (792, 1, N'admin', N'Add', N'添加about频道栏目分类:组织机构', N'127.0.0.1', CAST(N'2017-10-13 10:42:13.987' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (793, 1, N'admin', N'Edit', N'修改about频道栏目分类:组织机构', N'127.0.0.1', CAST(N'2017-10-13 10:42:20.467' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (794, 1, N'admin', N'Add', N'添加about频道栏目分类:企业资质', N'127.0.0.1', CAST(N'2017-10-13 10:42:51.957' AS DateTime))
GO
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (795, 1, N'admin', N'Edit', N'修改about频道栏目分类:企业资质', N'127.0.0.1', CAST(N'2017-10-13 10:42:56.960' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (796, 1, N'admin', N'Add', N'添加about频道栏目分类:荣誉证书', N'127.0.0.1', CAST(N'2017-10-13 10:43:53.423' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (797, 1, N'admin', N'Edit', N'修改about频道栏目分类:荣誉证书', N'127.0.0.1', CAST(N'2017-10-13 10:44:00.123' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (798, 1, N'admin', N'Add', N'添加about频道栏目分类:办公环境', N'127.0.0.1', CAST(N'2017-10-13 10:44:13.110' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (799, 1, N'admin', N'Add', N'添加about频道内容:总经理致辞', N'127.0.0.1', CAST(N'2017-10-13 10:45:59.077' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (800, 1, N'admin', N'Add', N'添加about频道内容:公司简介', N'127.0.0.1', CAST(N'2017-10-13 10:46:24.393' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (801, 1, N'admin', N'Add', N'添加about频道内容:组织机构', N'127.0.0.1', CAST(N'2017-10-13 10:47:10.293' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (802, 1, N'admin', N'Add', N'添加about频道内容:企业资质', N'127.0.0.1', CAST(N'2017-10-13 10:48:01.913' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (803, 1, N'admin', N'Add', N'添加about频道内容:荣誉证书', N'127.0.0.1', CAST(N'2017-10-13 10:48:38.453' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (804, 1, N'admin', N'Add', N'添加about频道内容:办公环境', N'127.0.0.1', CAST(N'2017-10-13 10:49:21.453' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (805, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:49:28.790' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (806, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:50:10.460' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (807, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 10:53:11.143' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (808, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:53:15.967' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (809, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:56:51.750' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (810, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:57:11.590' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (811, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 10:59:46.213' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (812, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:00:37.443' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (813, 1, N'admin', N'Edit', N'修改频道招标信息', N'127.0.0.1', CAST(N'2017-10-13 11:08:06.803' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (814, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:08:11.813' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (815, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:09:35.507' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (816, 1, N'admin', N'Edit', N'修改culture频道栏目分类:企业文化', N'127.0.0.1', CAST(N'2017-10-13 11:10:13.110' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (817, 1, N'admin', N'Edit', N'修改culture频道栏目分类:爱生活·爱旅游', N'127.0.0.1', CAST(N'2017-10-13 11:10:18.227' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (818, 1, N'admin', N'Edit', N'修改achieve频道栏目分类:业绩说明', N'127.0.0.1', CAST(N'2017-10-13 11:10:29.400' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (819, 1, N'admin', N'Edit', N'修改achieve频道栏目分类:成功案例', N'127.0.0.1', CAST(N'2017-10-13 11:10:33.517' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (820, 1, N'admin', N'Edit', N'修改newscenter频道栏目分类:新闻中心', N'127.0.0.1', CAST(N'2017-10-13 11:10:40.170' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (821, 1, N'admin', N'Edit', N'修改about频道栏目分类:办公环境', N'127.0.0.1', CAST(N'2017-10-13 11:10:49.647' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (822, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:11:10.170' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (823, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:12:32.623' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (824, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:13:32.327' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (825, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:14:54.827' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (826, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:17:28.570' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (827, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 11:19:01.223' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (828, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:20:05.893' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (829, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:22:10.823' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (830, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 11:23:57.607' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (831, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 11:24:24.603' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (832, 1, N'admin', N'Edit', N'修改频道招标信息', N'127.0.0.1', CAST(N'2017-10-13 11:25:01.760' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (833, 1, N'admin', N'Edit', N'修改频道经典业绩', N'127.0.0.1', CAST(N'2017-10-13 11:26:27.510' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (834, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 11:27:05.770' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (835, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 11:27:56.040' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (836, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:30:37.907' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (837, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:32:31.813' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (838, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 11:34:57.773' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (839, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:42:31.233' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (840, 1, N'admin', N'Delete', N'删除频道成功3条，失败0条', N'127.0.0.1', CAST(N'2017-10-13 12:43:02.493' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (841, 1, N'admin', N'Delete', N'删除频道成功2条，失败0条', N'127.0.0.1', CAST(N'2017-10-13 12:43:09.150' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (842, 1, N'admin', N'Delete', N'删除站点成功0条，失败1条', N'127.0.0.1', CAST(N'2017-10-13 12:43:14.327' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (843, 1, N'admin', N'Delete', N'删除频道成功1条，失败0条', N'127.0.0.1', CAST(N'2017-10-13 12:43:59.633' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (844, 1, N'admin', N'Delete', N'删除站点成功1条，失败0条', N'127.0.0.1', CAST(N'2017-10-13 12:44:05.880' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (845, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:44:38.607' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (846, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:45:50.077' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (847, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:52:10.697' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (848, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:53:34.500' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (849, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:55:01.187' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (850, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 12:59:26.710' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (851, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 12:59:34.390' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (852, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 13:00:29.727' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (853, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:00:37.880' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (854, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:01:47.310' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (855, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 13:03:25.973' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (856, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:03:30.327' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (857, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:08:45.233' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (858, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:24:54.937' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (859, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:25:34.123' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (860, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:26:48.523' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (861, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:28:33.320' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (862, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:30:11.487' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (863, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:31:21.770' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (864, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 13:31:56.597' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (865, 1, N'admin', N'Audit', N'审核newscenter频道内容信息', N'127.0.0.1', CAST(N'2017-10-13 14:06:56.477' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (866, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:07:02.623' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (867, 1, N'admin', N'Edit', N'删除newscenter频道内容成功1条，失败0条', N'127.0.0.1', CAST(N'2017-10-13 14:07:22.450' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (868, 1, N'admin', N'Add', N'添加newscenter频道内容:啊啊啊', N'127.0.0.1', CAST(N'2017-10-13 14:08:06.187' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (869, 1, N'admin', N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2017-10-13 14:11:16.160' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (870, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:12:58.330' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (871, 1, N'admin', N'Edit', N'修改站点:招标', N'127.0.0.1', CAST(N'2017-10-13 14:13:50.670' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (872, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:13:57.193' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (873, 1, N'admin', N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2017-10-13 14:14:03.357' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (874, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:14:09.993' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (875, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:19:59.803' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (876, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:21:11.310' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (877, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:33:34.087' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (878, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:34:06.927' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (879, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:35:33.620' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (880, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:35:38.753' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (881, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:35:54.557' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (882, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:36:41.387' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (883, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:36:54.857' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (884, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:40:48.050' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (885, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:41:53.073' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (886, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 14:41:58.483' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (887, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:51:29.647' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (888, 1, N'admin', N'Edit', N'修改频道首页', N'127.0.0.1', CAST(N'2017-10-13 14:51:42.233' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (889, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 14:51:53.267' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (890, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 14:52:07.067' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (891, 1, N'admin', N'Edit', N'修改频道招标信息', N'127.0.0.1', CAST(N'2017-10-13 14:52:17.987' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (892, 1, N'admin', N'Edit', N'修改频道经典业绩', N'127.0.0.1', CAST(N'2017-10-13 14:52:35.643' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (893, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 14:52:44.300' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (894, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:52:50.987' AS DateTime))
GO
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (895, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:53:29.800' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (896, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 14:54:13.393' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (897, 1, N'admin', N'Edit', N'修改频道经典业绩', N'127.0.0.1', CAST(N'2017-10-13 14:54:51.380' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (898, 1, N'admin', N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2017-10-13 14:55:26.117' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (899, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 14:56:13.593' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (900, 1, N'admin', N'Edit', N'修改频道企业文化', N'127.0.0.1', CAST(N'2017-10-13 14:56:55.007' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (901, 1, N'admin', N'Edit', N'修改频道经典业绩', N'127.0.0.1', CAST(N'2017-10-13 14:57:39.357' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (902, 1, N'admin', N'Edit', N'修改频道招标信息', N'127.0.0.1', CAST(N'2017-10-13 14:58:05.447' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (903, 1, N'admin', N'Edit', N'修改频道新闻中心', N'127.0.0.1', CAST(N'2017-10-13 14:58:28.143' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (904, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 14:58:48.430' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (905, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 15:01:19.453' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (906, 1, N'admin', N'Edit', N'修改频道公司概况', N'127.0.0.1', CAST(N'2017-10-13 15:01:37.073' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (907, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 15:02:25.203' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (908, 1, N'admin', N'Edit', N'修改频道客户服务', N'127.0.0.1', CAST(N'2017-10-13 15:04:32.650' AS DateTime))
INSERT [dbo].[dt_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (909, 1, N'admin', N'Build', N'生成模板:main', N'127.0.0.1', CAST(N'2017-10-13 15:04:37.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[dt_manager_log] OFF
SET IDENTITY_INSERT [dbo].[dt_manager_role] ON 

INSERT [dbo].[dt_manager_role] ([id], [role_name], [role_type], [is_sys]) VALUES (1, N'超级管理组', 1, 1)
SET IDENTITY_INSERT [dbo].[dt_manager_role] OFF
SET IDENTITY_INSERT [dbo].[dt_navigation] ON 

INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (1, 0, 0, N'System', N'sys_contents', N'站点管理', N'站点', N'/admin/skin/default/nav/home.png', N'', 99, 0, N'系统默认导航，不可更改导航ID', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (2, 0, 0, N'System', N'sys_application', N'应用管理', N'应用', N'/admin/skin/default/nav/pus.png', N'', 100, 0, N'系统默认导航，不可更改导航ID', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (3, 0, 0, N'System', N'sys_users', N'会员管理', N'会员', N'/admin/skin/default/nav/user.png', N'', 101, 0, N'系统默认导航，不可更改导航ID', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (4, 0, 0, N'System', N'sys_controller', N'控制面板', N'控制面板', N'/admin/skin/default/nav/sys.png', N'', 103, 0, N'系统默认导航，不可更改导航ID', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (7, 4, 0, N'System', N'sys_manager', N'系统用户', N'', N'', N'', 103, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (8, 7, 0, N'System', N'manager_list', N'管理员管理', N'', N'', N'manager/manager_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (9, 7, 0, N'System', N'manager_role', N'角色管理', N'', N'', N'manager/role_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (10, 7, 0, N'System', N'manager_log', N'管理日志', N'', N'', N'manager/manager_log.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (11, 4, 0, N'System', N'sys_settings', N'系统管理', N'', N'', N'', 99, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (12, 11, 0, N'System', N'sys_config', N'系统设置', N'', N'', N'settings/sys_config.aspx', 99, 0, N'', N'Show,View,Edit', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (13, 11, 0, N'System', N'sys_plugin_config', N'插件设置', N'', N'', N'settings/plugin_list.aspx', 100, 0, N'', N'Show,View,Build,Instal,Unload', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (14, 11, 0, N'System', N'sys_url_rewrite', N'URL配置', N'', N'', N'settings/url_rewrite_list.aspx', 102, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (15, 4, 0, N'System', N'sys_site_settings', N'站点设置', N'', N'', N'', 100, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (16, 15, 0, N'System', N'sys_site_manage', N'站点管理', N'', N'', N'channel/site_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (17, 15, 0, N'System', N'sys_channel_manage', N'频道管理', N'', N'', N'channel/channel_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (18, 15, 0, N'System', N'sys_channel_field', N'扩展字段', N'', N'', N'channel/attribute_field_list.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (19, 4, 0, N'System', N'sys_design', N'界面管理', N'', N'', N'', 102, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (20, 19, 0, N'System', N'sys_site_templet', N'站点模板管理', N'', N'', N'settings/templet_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Build', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (21, 19, 0, N'System', N'sys_builder_html', N'生成静态管理', N'', N'', N'settings/builder_html.aspx', 100, 0, N'', N'Show,View,Build', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (22, 19, 0, N'System', N'sys_navigation', N'后台导航管理', N'', N'', N'settings/nav_list.aspx', 102, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (23, 0, 0, N'System', N'sys_orders', N'订单管理', N'订单', N'/admin/skin/default/nav/order.png', N'', 102, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (26, 2, 0, N'System', N'sys_plugin_manage', N'插件管理', N'', N'', N'', 99, 0, N'', N'Show,View', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (35, 23, 0, N'System', N'order_manage', N'订单管理', N'', N'', N'', 99, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (36, 23, 0, N'System', N'order_settings', N'订单设置', N'', N'', N'', 100, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (37, 36, 0, N'System', N'order_config', N'订单参数设置', N'', N'', N'order/order_config.aspx', 99, 0, N'', N'Show,View,Edit', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (38, 36, 0, N'System', N'order_payment', N'支付方式设置', N'', N'', N'order/payment_list.aspx', 100, 0, N'', N'Show,View,Edit', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (39, 36, 0, N'System', N'order_express', N'配送方式设置', N'', N'', N'order/express_list.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (41, 35, 0, N'System', N'order_confirm', N'待确认订单', N'', N'', N'order/order_confirm.aspx', 99, 0, N'', N'Show,View,Confirm', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (42, 35, 0, N'System', N'order_list', N'全部订单', N'', N'', N'order/order_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete,Confirm,Cancel,Invalid', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (43, 3, 0, N'System', N'user_manage', N'会员管理', N'', N'', N'', 99, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (44, 43, 0, N'System', N'user_audit', N'审核会员', N'', N'', N'users/user_audit.aspx', 99, 0, N'', N'Show,View,Audit', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (45, 43, 0, N'System', N'user_list', N'所有会员', N'', N'', N'users/user_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (46, 43, 0, N'System', N'user_group', N'会员组别', N'', N'', N'users/group_list.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (47, 3, 0, N'System', N'user_log', N'会员日志', N'', N'', N'', 100, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (48, 47, 0, N'System', N'user_sms', N'发送短信', N'', N'', N'users/user_sms.aspx', 99, 0, N'', N'Show,View,Add', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (49, 47, 0, N'System', N'user_message', N'站内消息', N'', N'', N'users/message_list.aspx', 100, 0, N'', N'Show,View,Add,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (50, 47, 0, N'System', N'user_recharge_log', N'充值记录', N'', N'', N'users/recharge_list.aspx', 101, 0, N'', N'Show,View,Add,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (51, 47, 0, N'System', N'user_amount_log', N'消费记录', N'', N'', N'users/amount_log.aspx', 102, 0, N'', N'Show,View,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (52, 47, 0, N'System', N'user_point_log', N'积分记录', N'', N'', N'users/point_log.aspx', 103, 0, N'', N'Show,View,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (53, 3, 0, N'System', N'user_settings', N'会员设置', N'', N'', N'', 101, 0, N'', N'Show', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (54, 53, 0, N'System', N'user_config', N'参数设置', N'', N'', N'users/user_config.aspx', 99, 0, N'', N'Show,View,Edit', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (55, 53, 0, N'System', N'user_sms_template', N'短信模板', N'', N'', N'users/sms_template_list.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (56, 53, 0, N'System', N'user_mail_template', N'邮件模板', N'', N'', N'users/mail_template_list.aspx', 102, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (57, 53, 0, N'System', N'user_oauth', N'OAuth设置', N'', N'', N'users/oauth_app_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 0)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (80, 26, 0, N'System', N'plugin_feedback', N'留言管理', N'', NULL, N'/plugins/feedback/admin/index.aspx', 0, 0, N'', N'Show,View,Delete,Audit,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (81, 26, 0, N'System', N'plugin_link', N'链接管理', N'', NULL, N'/plugins/link/admin/index.aspx', 0, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (95, 1, 0, N'System', N'channel_main', N'招标', N'', NULL, N'', 98, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (96, 95, 12, N'System', N'channel_index', N'首页', N'', NULL, N'', 1, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (97, 96, 12, N'System', N'channel_index_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (98, 96, 12, N'System', N'channel_index_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (99, 96, 12, N'System', N'channel_index_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (100, 95, 13, N'System', N'channel_about', N'公司概况', N'', NULL, N'', 2, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (101, 100, 13, N'System', N'channel_about_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (102, 100, 13, N'System', N'channel_about_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (103, 100, 13, N'System', N'channel_about_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (104, 95, 14, N'System', N'channel_newscenter', N'新闻中心', N'', NULL, N'', 3, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (105, 104, 14, N'System', N'channel_newscenter_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (106, 104, 14, N'System', N'channel_newscenter_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (107, 104, 14, N'System', N'channel_newscenter_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (108, 95, 15, N'System', N'channel_achieve', N'经典业绩', N'', NULL, N'', 5, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (109, 108, 15, N'System', N'channel_achieve_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (110, 108, 15, N'System', N'channel_achieve_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (111, 108, 15, N'System', N'channel_achieve_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (112, 95, 16, N'System', N'channel_server', N'客户服务', N'', NULL, N'', 7, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (113, 112, 16, N'System', N'channel_server_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (114, 112, 16, N'System', N'channel_server_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (115, 112, 16, N'System', N'channel_server_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (116, 95, 17, N'System', N'channel_culture', N'企业文化', N'', NULL, N'', 6, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (117, 116, 17, N'System', N'channel_culture_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (118, 116, 17, N'System', N'channel_culture_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (119, 116, 17, N'System', N'channel_culture_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (120, 95, 18, N'System', N'channel_mes', N'招标信息', N'', NULL, N'', 4, 0, N'', N'Show', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (121, 120, 18, N'System', N'channel_mes_list', N'内容管理', N'', NULL, N'article/article_list.aspx', 99, 0, N'', N'Show,View,Add,Edit,Delete,Audit', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (122, 120, 18, N'System', N'channel_mes_category', N'栏目类别', N'', NULL, N'article/category_list.aspx', 100, 0, N'', N'Show,View,Add,Edit,Delete', 1)
INSERT [dbo].[dt_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys]) VALUES (123, 120, 18, N'System', N'channel_mes_comment', N'评论管理', N'', NULL, N'article/comment_list.aspx', 101, 0, N'', N'Show,View,Delete,Reply', 1)
SET IDENTITY_INSERT [dbo].[dt_navigation] OFF
SET IDENTITY_INSERT [dbo].[dt_payment] ON 

INSERT [dbo].[dt_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_lock], [api_path]) VALUES (1, N'货到付款', N'', N'收到商品后进行支付，支持现金和刷卡服务。', 2, 2, CAST(0.00 AS Decimal(9, 2)), 99, 0, N'')
INSERT [dbo].[dt_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_lock], [api_path]) VALUES (2, N'账户余额', N'', N'账户余额是客户在您网站上的账户虚拟资金', 1, 2, CAST(0.00 AS Decimal(9, 2)), 100, 0, N'balance')
INSERT [dbo].[dt_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_lock], [api_path]) VALUES (3, N'支付宝', N'', N'付款后立即到账，无预付/年费，单笔费率阶梯最低0.7%，无流量限制。<a href="https://www.alipay.com/himalayas/practicality_customer.htm?customer_external_id=C433530444855584111X&market_type=from_agent_contract&pro_codes=61F99645EC0DC4380ADE569DD132AD7A" target="_blank">立即申请</a>', 1, 2, CAST(0.00 AS Decimal(9, 2)), 101, 0, N'alipaypc')
INSERT [dbo].[dt_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_lock], [api_path]) VALUES (4, N'财付通', N'', N'费率最低至<span style="color:#FF0000;font-weight: bold;">0.61%</span>，并赠送价值千元企业QQ。<a href="http://union.tenpay.com/mch/mch_register.shtml?sp_suggestuser=1202822001" target="_blank">中小商家签约入口</a>', 1, 2, CAST(0.00 AS Decimal(9, 2)), 102, 0, N'tenpaypc')
SET IDENTITY_INSERT [dbo].[dt_payment] OFF
SET IDENTITY_INSERT [dbo].[dt_sms_template] ON 

INSERT [dbo].[dt_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (1, N'会员验证码短信', N'usercode', N'您的验证码为：{code}，{valid}分钟内有效。', 1)
INSERT [dbo].[dt_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (2, N'欢迎新用户短信', N'welcomemsg', N'欢迎成为{webname}会员，你的用户名为：{username}，注意保管好您的账户信息。', 1)
INSERT [dbo].[dt_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (3, N'订单确认通知', N'order_confirm', N'尊敬的{username}，您在{webname}的订单已确认，订单号为：{orderno}，共计{amount}元，我们会尽快安排发货。', 1)
INSERT [dbo].[dt_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (4, N'订单发货通知', N'order_express', N'尊敬的{username}，您在{webname}的订单已发货，订单号为：{orderno}，请注意查收。', 1)
INSERT [dbo].[dt_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (5, N'订单完成通知', N'order_complete', N'尊敬的{username}，您在{webname}的一笔订单交易完成，订单号为：{orderno}，期待下次光临，祝您购物愉快。', 1)
SET IDENTITY_INSERT [dbo].[dt_sms_template] OFF
SET IDENTITY_INSERT [dbo].[dt_user_groups] ON 

INSERT [dbo].[dt_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (1, N'注册会员', 1, 0, CAST(0.00 AS Decimal(9, 2)), 0, 100, 1, 0, 0)
INSERT [dbo].[dt_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (2, N'高级会员', 2, 1000, CAST(0.00 AS Decimal(9, 2)), 0, 99, 0, 1, 0)
INSERT [dbo].[dt_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (3, N'中级会员', 3, 2000, CAST(1.00 AS Decimal(9, 2)), 10, 98, 0, 1, 0)
INSERT [dbo].[dt_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (4, N'钻石会员', 4, 3000, CAST(2.00 AS Decimal(9, 2)), 20, 95, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[dt_user_groups] OFF
SET IDENTITY_INSERT [dbo].[dt_user_oauth_app] ON 

INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (1, N'用QQ帐号登录', N'/images/oauth/qq.png', N'API Key', N'Secret Key', N'QQ互联开放平台', 99, 0, N'qq')
INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (2, N'用新浪微博登录', N'/images/oauth/weibo.png', N'API Key', N'Secret Key', N'新浪微博开放平台', 100, 0, N'sina')
INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (3, N'用淘宝账号登录', N'/images/oauth/taobao.png', N'API Key', N'Secret Key', N'淘宝开放平台', 101, 0, N'taobao')
INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (4, N'用开心网帐号登录', N'/images/oauth/kaixin.png', N'API Key', N'Secret Key', N'开心网开放平台', 102, 0, N'kaixin')
INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (5, N'用人人网帐号登录', N'/images/oauth/renren.png', N'API Key', N'Secret Key', N'人人网开放平台', 103, 0, N'renren')
INSERT [dbo].[dt_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_lock], [api_path]) VALUES (6, N'用飞信账号登录', N'/images/oauth/feixin.png', N'API Key', N'Secret Key', N'中国移动飞信开放平台', 104, 0, N'feixin')
SET IDENTITY_INSERT [dbo].[dt_user_oauth_app] OFF
SET IDENTITY_INSERT [dbo].[dt_users] ON 

INSERT [dbo].[dt_users] ([id], [group_id], [user_name], [salt], [password], [mobile], [email], [avatar], [nick_name], [sex], [birthday], [telphone], [area], [address], [qq], [msn], [amount], [point], [exp], [status], [reg_time], [reg_ip]) VALUES (1, 1, N'test', N'4B2H04', N'ED60EDEC7283B95C', N'13800138000', N'test@dtcms.net', N'', N'测试', N'保密', NULL, N'', N'', N'', N'', N'', CAST(230.00 AS Decimal(9, 2)), 10, 20, 0, CAST(N'2015-03-30 19:43:42.000' AS DateTime), N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[dt_users] OFF
ALTER TABLE [dbo].[dt_article_albums] ADD  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [dbo].[dt_article_albums] ADD  DEFAULT ('') FOR [thumb_path]
GO
ALTER TABLE [dbo].[dt_article_albums] ADD  DEFAULT ('') FOR [original_path]
GO
ALTER TABLE [dbo].[dt_article_albums] ADD  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[dt_article_albums] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ('') FOR [file_name]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ('') FOR [file_path]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ((0)) FOR [file_size]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ('') FOR [file_ext]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ((0)) FOR [down_num]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[dt_article_attach] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [channel_id]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [user_id]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ('') FOR [user_name]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [is_lock]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_article_comment] ADD  DEFAULT ((0)) FOR [is_reply]
GO
ALTER TABLE [dbo].[dt_feedback] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_feedback] ADD  DEFAULT ('') FOR [reply_content]
GO
ALTER TABLE [dbo].[dt_feedback] ADD  DEFAULT ((0)) FOR [is_lock]
GO
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___goods__5A3A55A2]  DEFAULT ((0)) FOR [goods_price]
GO
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___real___5B2E79DB]  DEFAULT ((0)) FOR [real_price]
GO
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___quant__5C229E14]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___point__5D16C24D]  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__order__5FF32EF8]  DEFAULT ('') FOR [order_no]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__trade__60E75331]  DEFAULT ('') FOR [trade_no]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__user___61DB776A]  DEFAULT ((0)) FOR [user_id]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__user___62CF9BA3]  DEFAULT ('') FOR [user_name]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__63C3BFDC]  DEFAULT ((0)) FOR [payment_id]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__64B7E415]  DEFAULT ((0)) FOR [payment_fee]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__65AC084E]  DEFAULT ((0)) FOR [payment_status]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__66A02C87]  DEFAULT ((0)) FOR [express_id]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__679450C0]  DEFAULT ('') FOR [express_no]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__688874F9]  DEFAULT ((0)) FOR [express_fee]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__697C9932]  DEFAULT ((0)) FOR [express_status]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__accep__6A70BD6B]  DEFAULT ('') FOR [accept_name]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__post___6B64E1A4]  DEFAULT ('') FOR [post_code]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__telph__6C5905DD]  DEFAULT ('') FOR [telphone]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__mobil__6D4D2A16]  DEFAULT ('') FOR [mobile]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF_dt_orders_email]  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__area__6E414E4F]  DEFAULT ('') FOR [area]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__addre__6F357288]  DEFAULT ('') FOR [address]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__messa__702996C1]  DEFAULT ('') FOR [message]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__remar__711DBAFA]  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__is_in__7211DF33]  DEFAULT ((0)) FOR [is_invoice]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__invoi__7306036C]  DEFAULT ((0)) FOR [invoice_taxes]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payab__73FA27A5]  DEFAULT ((0)) FOR [payable_amount]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__real___74EE4BDE]  DEFAULT ((0)) FOR [real_amount]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__order__75E27017]  DEFAULT ((0)) FOR [order_amount]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__point__76D69450]  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__statu__77CAB889]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__add_t__78BEDCC2]  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_amount_log] ADD  DEFAULT ((0)) FOR [payment_id]
GO
ALTER TABLE [dbo].[dt_user_amount_log] ADD  DEFAULT ((0)) FOR [value]
GO
ALTER TABLE [dbo].[dt_user_amount_log] ADD  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[dt_user_amount_log] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_attach_log] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_code] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[dt_user_code] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[dt_user_code] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_group_price] ADD  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [dbo].[dt_user_group_price] ADD  DEFAULT ((0)) FOR [group_id]
GO
ALTER TABLE [dbo].[dt_user_group_price] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[dt_user_login_log] ADD  DEFAULT ('') FOR [user_name]
GO
ALTER TABLE [dbo].[dt_user_login_log] ADD  DEFAULT ('') FOR [remark]
GO
ALTER TABLE [dbo].[dt_user_login_log] ADD  DEFAULT (getdate()) FOR [login_time]
GO
ALTER TABLE [dbo].[dt_user_login_log] ADD  DEFAULT ('') FOR [login_ip]
GO
ALTER TABLE [dbo].[dt_user_message] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[dt_user_message] ADD  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [dbo].[dt_user_message] ADD  DEFAULT (getdate()) FOR [post_time]
GO
ALTER TABLE [dbo].[dt_user_oauth] ADD  DEFAULT ('0') FOR [oauth_name]
GO
ALTER TABLE [dbo].[dt_user_oauth] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_point_log] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_user_recharge] ADD  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[dt_user_recharge] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[dt_user_recharge] ADD  DEFAULT (getdate()) FOR [add_time]
GO
ALTER TABLE [dbo].[dt_article_attribute_value]  WITH CHECK ADD  CONSTRAINT [FK_DT_ARTIC_REFERENCE_DT_ARTIC] FOREIGN KEY([article_id])
REFERENCES [dbo].[dt_article] ([id])
GO
ALTER TABLE [dbo].[dt_article_attribute_value] CHECK CONSTRAINT [FK_DT_ARTIC_REFERENCE_DT_ARTIC]
GO
ALTER TABLE [dbo].[dt_channel]  WITH CHECK ADD  CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN] FOREIGN KEY([site_id])
REFERENCES [dbo].[dt_channel_site] ([id])
GO
ALTER TABLE [dbo].[dt_channel] CHECK CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN]
GO
ALTER TABLE [dbo].[dt_channel_field]  WITH CHECK ADD  CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_ARTIC] FOREIGN KEY([field_id])
REFERENCES [dbo].[dt_article_attribute_field] ([id])
GO
ALTER TABLE [dbo].[dt_channel_field] CHECK CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_ARTIC]
GO
ALTER TABLE [dbo].[dt_channel_field]  WITH CHECK ADD  CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN_FIELD] FOREIGN KEY([channel_id])
REFERENCES [dbo].[dt_channel] ([id])
GO
ALTER TABLE [dbo].[dt_channel_field] CHECK CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN_FIELD]
GO
ALTER TABLE [dbo].[dt_manager]  WITH CHECK ADD  CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG] FOREIGN KEY([role_id])
REFERENCES [dbo].[dt_manager_role] ([id])
GO
ALTER TABLE [dbo].[dt_manager] CHECK CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG]
GO
ALTER TABLE [dbo].[dt_manager_role_value]  WITH CHECK ADD  CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG_ROLE_VALUE] FOREIGN KEY([role_id])
REFERENCES [dbo].[dt_manager_role] ([id])
GO
ALTER TABLE [dbo].[dt_manager_role_value] CHECK CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG_ROLE_VALUE]
GO
ALTER TABLE [dbo].[dt_order_goods]  WITH CHECK ADD  CONSTRAINT [FK_DT_ORDER_REFERENCE_DT_ORDER] FOREIGN KEY([order_id])
REFERENCES [dbo].[dt_orders] ([id])
GO
ALTER TABLE [dbo].[dt_order_goods] CHECK CONSTRAINT [FK_DT_ORDER_REFERENCE_DT_ORDER]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TAG标签逗号分隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'zhaiyao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'click'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0正常1未审核2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_top'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_red'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_hot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否幻灯片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_slide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否管理员发布0不是1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'update_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'thumb_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'original_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片相册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小(字节)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件扩展名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_ext'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'down_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分(正赠送负消费)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'control_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小数点位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'item_option'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'default_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必填0非必填1必填' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_required'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否密码框' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许HTML' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑器类型0标准型1简洁型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'editor_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_tip_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证失败提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_error_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证正则表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_value', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID列表(逗号分隔开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'class_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'class_layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父评论ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发表时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已答复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'is_reply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'reply_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'reply_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'site_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启相册功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_albums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启附件功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_attach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_spec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统频道表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'field_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成目录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'build_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板目录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'templet_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定域名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'domain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站LOGO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'logo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通讯地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传真号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备案号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'crod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版权信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'copyright'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'seo_keyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_site'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'express_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'express_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'website'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否不显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流快递' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'maill_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员类型1超管2系管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'real_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认0否1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'nav_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属父导航ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'nav_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'sub_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'icon_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏0显示1隐藏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统导航菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'order_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品货号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'spec_text'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'real_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订购数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分,正数赠送|负数消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单商品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易号担保支付用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'trade_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付手续费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付状态1未支付2已支付' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发货状态1未发货2已发货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发货时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'accept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮政编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'post_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'telphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属省市区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否索要发票' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'is_invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发票抬头' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'invoice_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'税金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'invoice_taxes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应付商品总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payable_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实付商品总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'real_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'order_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分,正数赠送|负数消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态1生成订单,2确认订单,3完成订单,4取消订单,5作废订单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下单时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'confirm_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'complete_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型1线上2线下' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手续费类型1百分比2固定金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'poundage_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手续费金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'poundage_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API目录名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'api_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机短信模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增减值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员金额日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'attach_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户下载记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_attach_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成码类别 password取回密码,register邀请注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'str_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0未使用1已使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'eff_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户随机码表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员组价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'upgrade_exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认预存款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购物折扣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否注册用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_upgrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员组别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'login_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员登录日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息类型0系统消息1收件箱2发件箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发件人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'post_user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收件人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'accept_user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否查看0未阅1已阅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'is_read'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'post_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'read_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员短消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放平台名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'access_token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_access_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_openid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OAuth授权用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'app_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppKey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'app_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'api_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OAuth应用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增减积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员积分日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'recharge_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0未完成1已完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge', @level2type=N'COLUMN',@level2name=N'complete_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户充值表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_recharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'nick_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'telphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属地区逗号分隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'qq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MSN号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'msn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户余额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户状态,0正常,1待验证,2待审核,3锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'reg_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'reg_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users'
GO
USE [master]
GO
ALTER DATABASE [TenderPortal] SET  READ_WRITE 
GO
