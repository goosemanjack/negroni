USE [Gadgets]
GO
/****** Object:  Table [dbo].[App]    Script Date: 12/22/2010 23:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App](
	[AppId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SourceUrl] [nvarchar](500) NULL,
	[ManifestUrl] [nvarchar](500) NULL,
	[LatestGadgetID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_App] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gadget]    Script Date: 12/22/2010 23:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gadget](
	[GadgetID] [int] IDENTITY(1,1) NOT NULL,
	[AppID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[TitleUrl] [nvarchar](255) NULL,
	[SourceUrl] [nvarchar](500) NULL,
	[IsLatest] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Gadget] PRIMARY KEY CLUSTERED 
(
	[GadgetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manifest]    Script Date: 12/22/2010 23:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manifest](
	[AppID] [int] NOT NULL,
	[GadgetID] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Manifest] PRIMARY KEY CLUSTERED 
(
	[AppID] ASC,
	[GadgetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordType]    Script Date: 12/22/2010 23:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordType](
	[RecordTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_RecordType] PRIMARY KEY CLUSTERED 
(
	[RecordTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GadgetContent]    Script Date: 12/22/2010 23:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GadgetContent](
	[GadgetContentID] [int] IDENTITY(1,1) NOT NULL,
	[GadgetID] [int] NOT NULL,
	[RecordTypeID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GadgetContent] PRIMARY KEY CLUSTERED 
(
	[GadgetContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_App_CreateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[App] ADD  CONSTRAINT [DF_App_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_App_UpdateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[App] ADD  CONSTRAINT [DF_App_UpdateDate]  DEFAULT (getutcdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_Gadget_IsLatest]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Gadget] ADD  CONSTRAINT [DF_Gadget_IsLatest]  DEFAULT ((1)) FOR [IsLatest]
GO
/****** Object:  Default [DF_Gadget_CreateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Gadget] ADD  CONSTRAINT [DF_Gadget_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_Gadget_UpdateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Gadget] ADD  CONSTRAINT [DF_Gadget_UpdateDate]  DEFAULT (getutcdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_GadgetContent_RecordTypeID]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[GadgetContent] ADD  CONSTRAINT [DF_GadgetContent_RecordTypeID]  DEFAULT ((1)) FOR [RecordTypeID]
GO
/****** Object:  Default [DF_GadgetContent_CreateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[GadgetContent] ADD  CONSTRAINT [DF_GadgetContent_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_GadgetContent_UpdateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[GadgetContent] ADD  CONSTRAINT [DF_GadgetContent_UpdateDate]  DEFAULT (getutcdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_Manifest_CreateDate]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Manifest] ADD  CONSTRAINT [DF_Manifest_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
/****** Object:  ForeignKey [FK_App_Gadget]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[App]  WITH CHECK ADD  CONSTRAINT [FK_App_Gadget] FOREIGN KEY([LatestGadgetID])
REFERENCES [dbo].[Gadget] ([GadgetID])
GO
ALTER TABLE [dbo].[App] CHECK CONSTRAINT [FK_App_Gadget]
GO
/****** Object:  ForeignKey [FK_Gadget_App]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Gadget]  WITH NOCHECK ADD  CONSTRAINT [FK_Gadget_App] FOREIGN KEY([AppID])
REFERENCES [dbo].[App] ([AppId])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Gadget] CHECK CONSTRAINT [FK_Gadget_App]
GO
/****** Object:  ForeignKey [FK_GadgetContent_Gadget]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[GadgetContent]  WITH CHECK ADD  CONSTRAINT [FK_GadgetContent_Gadget] FOREIGN KEY([GadgetID])
REFERENCES [dbo].[Gadget] ([GadgetID])
GO
ALTER TABLE [dbo].[GadgetContent] CHECK CONSTRAINT [FK_GadgetContent_Gadget]
GO
/****** Object:  ForeignKey [FK_GadgetContent_RecordType]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[GadgetContent]  WITH CHECK ADD  CONSTRAINT [FK_GadgetContent_RecordType] FOREIGN KEY([RecordTypeID])
REFERENCES [dbo].[RecordType] ([RecordTypeID])
GO
ALTER TABLE [dbo].[GadgetContent] CHECK CONSTRAINT [FK_GadgetContent_RecordType]
GO
/****** Object:  ForeignKey [FK_Manifest_App]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Manifest]  WITH CHECK ADD  CONSTRAINT [FK_Manifest_App] FOREIGN KEY([AppID])
REFERENCES [dbo].[App] ([AppId])
GO
ALTER TABLE [dbo].[Manifest] CHECK CONSTRAINT [FK_Manifest_App]
GO
/****** Object:  ForeignKey [FK_Manifest_Gadget]    Script Date: 12/22/2010 23:56:32 ******/
ALTER TABLE [dbo].[Manifest]  WITH CHECK ADD  CONSTRAINT [FK_Manifest_Gadget] FOREIGN KEY([GadgetID])
REFERENCES [dbo].[Gadget] ([GadgetID])
GO
ALTER TABLE [dbo].[Manifest] CHECK CONSTRAINT [FK_Manifest_Gadget]
GO
