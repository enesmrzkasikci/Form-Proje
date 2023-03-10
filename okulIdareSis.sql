USE [okulIdareSis]
GO
/****** Object:  Table [dbo].[ois_ders]    Script Date: 7.12.2022 23:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ois_ders](
	[ders_id] [smallint] IDENTITY(1,1) NOT NULL,
	[ders_ad] [varchar](50) NULL,
	[ders_kredi] [varchar](50) NULL,
	[ders_okulyonetimid] [smallint] NULL,
 CONSTRAINT [PK_ois_ders] PRIMARY KEY CLUSTERED 
(
	[ders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ois_ogrenci]    Script Date: 7.12.2022 23:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ois_ogrenci](
	[ogrenci_id] [smallint] IDENTITY(1,1) NOT NULL,
	[ogrenci_fullname] [varchar](50) NULL,
	[ogrenci_recorddate] [datetime] NULL,
	[ogrenci_birthdate] [datetime] NULL,
	[ogrenci_bolum] [varchar](50) NULL,
	[ogrenci_no] [varchar](11) NULL,
 CONSTRAINT [PK_ois_ogrenci] PRIMARY KEY CLUSTERED 
(
	[ogrenci_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ois_ogrenciders]    Script Date: 7.12.2022 23:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ois_ogrenciders](
	[ogrenciders_id] [smallint] IDENTITY(1,1) NOT NULL,
	[ogrenciders_dersid] [smallint] NULL,
	[ogrenciders_ogrenciid] [smallint] NULL,
 CONSTRAINT [PK_ois_ogrenciders] PRIMARY KEY CLUSTERED 
(
	[ogrenciders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ois_okulyonetim]    Script Date: 7.12.2022 23:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ois_okulyonetim](
	[yonetim_id] [smallint] IDENTITY(1,1) NOT NULL,
	[yonetim_adsoyad] [varchar](50) NULL,
	[yonetim_gorev] [varchar](50) NULL,
	[yonetim_tip] [nchar](10) NULL,
 CONSTRAINT [PK_ois_okulyonetim] PRIMARY KEY CLUSTERED 
(
	[yonetim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ois_okulyonetim] ON 

INSERT [dbo].[ois_okulyonetim] ([yonetim_id], [yonetim_adsoyad], [yonetim_gorev], [yonetim_tip]) VALUES (1, N'ff', N'rektör', N'11        ')
SET IDENTITY_INSERT [dbo].[ois_okulyonetim] OFF
GO
ALTER TABLE [dbo].[ois_ders]  WITH CHECK ADD  CONSTRAINT [FK_ois_ders_ois_ogrenciders] FOREIGN KEY([ders_id])
REFERENCES [dbo].[ois_ogrenciders] ([ogrenciders_id])
GO
ALTER TABLE [dbo].[ois_ders] CHECK CONSTRAINT [FK_ois_ders_ois_ogrenciders]
GO
ALTER TABLE [dbo].[ois_ders]  WITH CHECK ADD  CONSTRAINT [FK_ois_ders_ois_okulyonetim] FOREIGN KEY([ders_okulyonetimid])
REFERENCES [dbo].[ois_okulyonetim] ([yonetim_id])
GO
ALTER TABLE [dbo].[ois_ders] CHECK CONSTRAINT [FK_ois_ders_ois_okulyonetim]
GO
ALTER TABLE [dbo].[ois_ogrenciders]  WITH CHECK ADD  CONSTRAINT [FK_ois_ogrenciders_ois_ogrenci] FOREIGN KEY([ogrenciders_ogrenciid])
REFERENCES [dbo].[ois_ogrenci] ([ogrenci_id])
GO
ALTER TABLE [dbo].[ois_ogrenciders] CHECK CONSTRAINT [FK_ois_ogrenciders_ois_ogrenci]
GO
