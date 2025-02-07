USE [master]
GO
/****** Object:  Database [E2W]    Script Date: 5/10/2013 4:49:34 PM ******/
CREATE DATABASE [E2W]  
GO

USE [E2W]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 5/10/2013 4:49:34 PM ******/

CREATE TABLE [dbo].[admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CancelOrderTour]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CancelOrderTour](
	[cancelOrderTourID] [int] IDENTITY(1,1) NOT NULL,
	[orderTourID] [int] NULL,
	[cancelTourDate] [datetime] NULL,
	[refund] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[carID] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[seat] [int] NOT NULL,
	[airConditioner] [bit] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[image] [varchar](50) NOT NULL,
	[quantityStock] [int] NOT NULL,
	[price] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarOrder]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarOrder](
	[carOrderID] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[status] [varchar](50) NOT NULL,
	[userID] [int] NOT NULL,
	[orderCost] [int] NOT NULL,
	[refund] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[carOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarOrderDetail]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarOrderDetail](
	[carOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[carOrderID] [int] NOT NULL,
	[carID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[driver] [bit] NOT NULL,
	[pickup] [datetime] NOT NULL,
	[dropoff] [datetime] NOT NULL,
	[totalCost] [int] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[carOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [varchar](50) NOT NULL,
	[cityImage] [varchar](500) NOT NULL,
	[cityDescription] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [varchar](50) NULL,
	[gender] [varchar](6) NULL,
	[email] [varchar](50) NOT NULL,
	[Nationality] [varchar](20) NULL,
	[address] [varchar](max) NULL,
	[phone] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[flightID] [int] IDENTITY(1,1) NOT NULL,
	[flightBranch] [nvarchar](50) NULL,
	[availableDate] [datetime] NULL,
	[expiredDate] [datetime] NULL,
	[takingOfAirP] [nvarchar](20) NULL,
	[landingAirP] [nvarchar](20) NULL,
	[takingOfTime] [nvarchar](10) NULL,
	[landingTime] [nvarchar](10) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[flightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotelID] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [varchar](50) NOT NULL,
	[hotelStar] [int] NOT NULL,
	[hotelStreet] [varchar](100) NOT NULL,
	[hotelImage] [varchar](50) NOT NULL,
	[hotelDescription] [varchar](1000) NOT NULL,
	[hotelPrice] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTour]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTour](
	[orderTourID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[orderDate] [datetime] NULL,
	[totalPrice] [varchar](20) NULL,
	[status] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTourDetail]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTourDetail](
	[orderTourDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderTourID] [int] NULL,
	[tourID] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleTour]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleTour](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[tourID] [int] NULL,
	[imageSchedule] [varchar](max) NULL,
	[description] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 5/10/2013 4:49:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[tourID] [int] IDENTITY(1,1) NOT NULL,
	[tourName] [varchar](50) NULL,
	[imageTour] [varchar](max) NULL,
	[startDate] [varchar](50) NULL,
	[endDate] [varchar](50) NULL,
	[startLocation] [varchar](50) NULL,
	[endLocation] [varchar](50) NULL,
	[quantityMin] [int] NULL,
	[quantityMax] [int] NULL,
	[price] [int] NULL,
	[status] [varchar](50) NULL,
	[quantityCurrent] [int] NULL,
	[description] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (2, N'mod', N'mod')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[CancelOrderTour] ON 

INSERT [dbo].[CancelOrderTour] ([cancelOrderTourID], [orderTourID], [cancelTourDate], [refund]) VALUES (1, 2, CAST(0x0000A1B3015C85BF AS DateTime), N'732')
INSERT [dbo].[CancelOrderTour] ([cancelOrderTourID], [orderTourID], [cancelTourDate], [refund]) VALUES (2, 1003, CAST(0x0000A1B600CEEBC0 AS DateTime), N'8883')
SET IDENTITY_INSERT [dbo].[CancelOrderTour] OFF
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (1, N'Toyota Innova', N'SUV', 7, 1, N'The Toyota Innova is a Toyota-designed Compact MPV i.e. being less than 4,600 mm (181.1 in) in length as per the European system of size classification, produced in Indonesia under supervision by Toyota Astra Motor since 2003. As with Toyota Kijang, which it replaced, the Toyota Innova is produced and first marketed in 2004 in Indonesia. Toyota Innova is part of Toyotas IMV program together with the Hilux Vigo pickup truck and the Fortuner SUV. Its official name in Indonesia is Toyota Kijang Innova, while for other countries it is Innova.', N'car/new-toyota-innova.jpg', 2, 40, 0)
INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (2, N'Toyota Vios', N'Sedan', 4, 1, N'Introduced in 2002, the Vios serves as a replacement of the Toyota Tercel (called the Toyota Soluna in Thailand and Indonesia), which filled the Asian subcompact market for a 1.5 litre, below the Toyota Corolla and Toyota Camry, both of which are also marketed in the region. The Vios is marketed alongside the Toyota Yaris in most countries in South East Asia, which offered another option for a hatchback, when it officially entered the regions market in 2005. In the United States, the second generation Vios is known as the Toyota Yaris sedan.', N'car/Toyota_Vios.jpg', 2, 25, 0)
INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (3, N'KIA Morning', N'Sedan', 4, 1, N'The Morning is based on a shortened platform of the Hyundai Getz. It is available with either 1.0 or 1.1 L petrol engines. A 3-cylinder diesel engine (based on the Kia Ceratos 1.5 CRD four-cylinder unit), with direct injection and a variable geometry turbocharger, has been available in the European market since Spring 04, with power reaching 75 PS (55 kW). The Picanto is 3,495 mm (137.6 in) long with a five-door hatchback body. Automatic gearboxes are optional in the petrol units. Also sold in some countries with a 1.2 L engine found in the Hyundai i10.', N'car/kia-morning.jpg', 2, 20, 0)
INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (4, N'Audi R8', N'Coupe', 2, 1, N'The Audi R8 (Typ 42) is a mid-engine, 2-seater sports car, which uses Audis trademark quattro permanent all-wheel drive system. It was introduced by the German automaker Audi AG in 2006. The car was exclusively designed, developed, and manufactured by Audi AGs high performance private subsidiary company, quattro GmbH, and is based on the Lamborghini Gallardo platform. The fundamental construction of the R8 is based on the Audi Space Frame, and uses an aluminium monocoque which is built around space frame principles. The car is built by quattro GmbH in a newly renovated factory at Audis aluminium site at Neckarsulm in Germany.', N'car/audi-r8.jpg', 1, 200, 0)
INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (5, N'BMW 3 series', N'Sedan', 4, 1, N'The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975. Successor to the BMW New Class, it has been produced in six different generations and in five different body styles. It is BMWs best-selling model, accounting for around 30% of the BMW brands annual total sales (excluding motorbikes). The BMW 3 Series has won numerous awards throughout its history.', N'car/bmw3.jpg', 2, 80, 0)
INSERT [dbo].[Car] ([carID], [model], [type], [seat], [airConditioner], [description], [image], [quantityStock], [price], [isDeleted]) VALUES (6, N'Mercedes C250', N'Sedan', 4, 1, N'The Mercedes-Benz C-Class is a compact executive car produced by Mercedes-Benz. Introduced in 1993 as a replacement for the 190 (W201) range, the C-Class was the smallest model in the marques lineup until the arrival of the A-Class in 1997. The C-Class is built at Mercedes-Benz factories in Sindelfingen and Bremen, Germany as well as numerous satellite factories in other countries. The very first C-Class (W202) sedan was produced on 1 June 1993, and the first second generation (W203) rolled off the assembly line on July 18, 2000. The most recent third generation (W204) launched in 2007.', N'car/Mercedes-C250.JPG', 2, 80, 0)
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[CarOrder] ON 

INSERT [dbo].[CarOrder] ([carOrderID], [createDate], [endDate], [status], [userID], [orderCost], [refund]) VALUES (1, CAST(0x0000A1AC00000000 AS DateTime), NULL, N'canceled', 1003, 200, 180)
INSERT [dbo].[CarOrder] ([carOrderID], [createDate], [endDate], [status], [userID], [orderCost], [refund]) VALUES (2, CAST(0x0000A1AC00000000 AS DateTime), NULL, N'finished', 1003, 100, NULL)
SET IDENTITY_INSERT [dbo].[CarOrder] OFF
SET IDENTITY_INSERT [dbo].[CarOrderDetail] ON 

INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (1, 1, 1, 2, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'canceled')
INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (2, 1, 2, 3, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'canceled')
INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (3, 2, 3, 4, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'finished')
INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (4, 2, 4, 1, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'finished')
INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (5, 1, 5, 7, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'canceled')
INSERT [dbo].[CarOrderDetail] ([carOrderDetailID], [carOrderID], [carID], [quantity], [driver], [pickup], [dropoff], [totalCost], [orderDate], [status]) VALUES (6, 1, 6, 8, 0, CAST(0x0000A1AC00000000 AS DateTime), CAST(0x0000A1AC00000000 AS DateTime), 100, CAST(0x0000A1AC00000000 AS DateTime), N'finished')
SET IDENTITY_INSERT [dbo].[CarOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1003, N'user01', N'654321', N'user01', N'Male', N'user01@yahoo.com', N'vietnamese', N'01 BTX st,ward BT,dist 1', N'01227036700')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1004, N'user02', N'123456', N'user02', N'Male', N'user02@gmail.com', N'vietnamese', N'02 BTX st,ward BT,dist 1', N'0909020519')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1005, N'user03', N'123456', N'user03', N'Female', N'user03@gmail.com', N'vietnamese', N'03 BTX st,ward BT,dist 1', N'0903711165')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1006, N'user04', N'123456', N'user04', N'Female', N'user04@gmail.com', N'vietnamese', N'04 BTX st,ward BT,dist 1', N'01217800895')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1007, N'user05', N'123456', N'user05', N'Male', N'user05@gmail.com', N'vietnamese', N'05 BTX st,ward BT,dist 1', N'0936722844')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1008, N'user06', N'123456', N'user06', N'Male', N'user06@gmail.com', N'vietnamese', N'06 BTX st,ward BT,dist 1', N'01222222888')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1009, N'user07', N'123456', N'user07', N'Male', N'user07@gmail.com', N'vietnamese', N'07 BTX st,ward BT,dist 1', N'09090909090')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1010, N'user08', N'123456', N'user08', N'Female', N'user08@gmail.com', N'vietnamese', N'08 BTX st,ward BT,dist 1', N'01212121212')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1011, N'user09', N'123456', N'user09', N'Female', N'user09@gmail.com', N'vietnamese', N'09 BTX st,ward BT,dist 1', N'01616161616')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (1012, N'user10', N'123456', N'user10', N'Male', N'user10@gmail.com', N'vietnamese', N'10 BTX st,ward BT,dist 1', N'01617181910')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (2002, N'acacacac', N'123456', N'anonymous', N'male', N'badboy0123@gmail.com', N'vietnamese', N'lac long quan', N'1204799496')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (2003, N'user11', N'123456', N'user11', N'Male', N'user11@gmail.com', N'taiwanese', N'11 HDM st,ward 1,TKM dist', N'01234567891')
INSERT [dbo].[Customer] ([userID], [username], [password], [fullname], [gender], [email], [Nationality], [address], [phone]) VALUES (2004, N'acacacac', N'123456', N'anonymous', N'male', N'badboy0123@gmail.com', N'vietnamese', N'lac long quan', N'1204799496')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (1, N'American Airline', CAST(0x0000A19300000000 AS DateTime), CAST(0x0000A30200000000 AS DateTime), N'SGN', N'MBL', N'00:00', N'00:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (2, N'American Airline', CAST(0x0000A1B200000000 AS DateTime), CAST(0x0000A1B400000000 AS DateTime), N'FR', N'SGN', N'02:00', N'01:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (3, N'American Airline', CAST(0x0000A1D200000000 AS DateTime), CAST(0x0000A1D600000000 AS DateTime), N'TSN', N'NB', N'03:00', N'02:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (4, N'American Airline', CAST(0x0000A1F100000000 AS DateTime), CAST(0x0000A1F400000000 AS DateTime), N'NB', N'TSN', N'04:00', N'03:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (5, N'American Airline', CAST(0x0000A21100000000 AS DateTime), CAST(0x0000A33500000000 AS DateTime), N'TRS', N'MB', N'05:00', N'04:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (6, N'American Airline', CAST(0x0000A23100000000 AS DateTime), CAST(0x0000A23500000000 AS DateTime), N'ARS', N'CLI', N'06:00', N'05:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (7, N'American Airline', CAST(0x0000A25000000000 AS DateTime), CAST(0x0000A25300000000 AS DateTime), N'CLI', N'ARS', N'07:00', N'06:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (8, N'American Airline', CAST(0x0000A27000000000 AS DateTime), CAST(0x0000A27300000000 AS DateTime), N'WAS', N'MIM', N'08:00', N'07:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (9, N'American Airline', CAST(0x0000A28F00000000 AS DateTime), CAST(0x0000A29200000000 AS DateTime), N'MIM', N'WAS', N'09:00', N'08:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (10, N'American Airline', CAST(0x0000A2AF00000000 AS DateTime), CAST(0x0000A2B100000000 AS DateTime), N'WAS', N'MIM', N'10:00', N'09:00', 1000)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (11, N'Japan Airline', CAST(0x0000A19D00000000 AS DateTime), CAST(0x0000A1A000000000 AS DateTime), N'TKY', N'HN', N'11:00', N'10:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (12, N'Japan Airline', CAST(0x0000A1BC00000000 AS DateTime), CAST(0x0000A1BF00000000 AS DateTime), N'HN', N'TKY', N'12:00', N'11:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (13, N'Japan Airline', CAST(0x0000A1DC00000000 AS DateTime), CAST(0x0000A1DE00000000 AS DateTime), N'OSC', N'HCM', N'13:00', N'12:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (14, N'Japan Airline', CAST(0x0000A1FB00000000 AS DateTime), CAST(0x0000A1FE00000000 AS DateTime), N'HCM', N'OSC', N'14:00', N'13:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (15, N'Japan Airline', CAST(0x0000A21B00000000 AS DateTime), CAST(0x0000A21D00000000 AS DateTime), N'RTR', N'TRP', N'15:00', N'14:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (16, N'Japan Airline', CAST(0x0000A23B00000000 AS DateTime), CAST(0x0000A23D00000000 AS DateTime), N'TRP', N'RTR', N'16:00', N'15:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (17, N'Japan Airline', CAST(0x0000A23C00000000 AS DateTime), CAST(0x0000A23E00000000 AS DateTime), N'QRE', N'DFR', N'17:00', N'18:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (18, N'Japan Airline', CAST(0x0000A25B00000000 AS DateTime), CAST(0x0000A25D00000000 AS DateTime), N'DFR', N'QRE', N'18:00', N'19:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (19, N'Japan Airline', CAST(0x0000A27B00000000 AS DateTime), CAST(0x0000A27C00000000 AS DateTime), N'QRE', N'DFR', N'19:00', N'20:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (20, N'Japan Airline', CAST(0x0000A29A00000000 AS DateTime), CAST(0x0000A29B00000000 AS DateTime), N'PIL', N'KJL', N'20:00', N'21:00', 1200)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (21, N'Vietnam Airline', CAST(0x0000A14D00000000 AS DateTime), CAST(0x0000A14F00000000 AS DateTime), N'KJL', N'PIL', N'21:00', N'22:00', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (22, N'Vietnam Airline', CAST(0x0000A16D00000000 AS DateTime), CAST(0x0000A17000000000 AS DateTime), N'MBN', N'GCV', N'22:00', N'23:00', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (23, N'Vietnam Airline', CAST(0x0000A18A00000000 AS DateTime), CAST(0x0000A18D00000000 AS DateTime), N'GCV', N'MBN', N'23:00', N'00:00', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (24, N'Vietnam Airline', CAST(0x0000A1AA00000000 AS DateTime), CAST(0x0000A1AD00000000 AS DateTime), N'RFT', N'HUB', N'00:30', N'1:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (25, N'Vietnam Airline', CAST(0x0000A1C900000000 AS DateTime), CAST(0x0000A1CC00000000 AS DateTime), N'HUB', N'RFT', N'1:30', N'2:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (26, N'Vietname Airline', CAST(0x0000A1E900000000 AS DateTime), CAST(0x0000A2D600000000 AS DateTime), N'ITS', N'OPS', N'2:30', N'3:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (27, N'Vietnam Airline ', CAST(0x0000A20800000000 AS DateTime), CAST(0x0000A20B00000000 AS DateTime), N'OPS', N'ITS', N'3:30', N'4:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (28, N'Vietnam Airline', CAST(0x0000A22800000000 AS DateTime), CAST(0x0000A22A00000000 AS DateTime), N'UIO', N'PTS', N'4:30', N'5:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (29, N'Vietnam Airline', CAST(0x0000A24800000000 AS DateTime), CAST(0x0000A33100000000 AS DateTime), N'PTS', N'UIO', N'5:30', N'6:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (30, N'Vietnam Airline', CAST(0x0000A26700000000 AS DateTime), CAST(0x0000A26A00000000 AS DateTime), N'TGH', N'LKJ', N'6:30', N'7:30', 800)
INSERT [dbo].[Flight] ([flightID], [flightBranch], [availableDate], [expiredDate], [takingOfAirP], [landingAirP], [takingOfTime], [landingTime], [price]) VALUES (1002, N'Vietnam Airline', CAST(0x0000A1B100000000 AS DateTime), CAST(0x0000A1B400000000 AS DateTime), N'BNG', N'LGM', N'00:00', N'12:00', 800)
SET IDENTITY_INSERT [dbo].[Flight] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([hotelID], [hotelName], [hotelStar], [hotelStreet], [hotelImage], [hotelDescription], [hotelPrice], [isDeleted]) VALUES (1, N'Grand Plaza', 3, N'300 Au Co street', N'hotel/hotel1.jpg', N'Grand Plaza I is a residential skyscraper in Chicago. The 57 story building was completed in 2003 at a height of 641 feet (195 m) when measured from its decorative spires. Grand Plaza I is one of the tallest all-residential buildings in Chicago and contains 481 luxury apartment units. It is also the tallest building in the Chicago zip code 60610, the zip code with the most high-rises in the city.', 50, 0)
INSERT [dbo].[Hotel] ([hotelID], [hotelName], [hotelStar], [hotelStreet], [hotelImage], [hotelDescription], [hotelPrice], [isDeleted]) VALUES (2, N'The Manor', 4, N'200 Pastuer street', N'hotel/hotel2.jpg', N'Since 1956, The Manor has hosted more than 10,000 weddings and has been the dining destination for generations of customers in celebration of life’s most special occasions. Our experience and commitment to perfection is unparalleled in regard to both weddings and fine dining.', 75, 0)
INSERT [dbo].[Hotel] ([hotelID], [hotelName], [hotelStar], [hotelStreet], [hotelImage], [hotelDescription], [hotelPrice], [isDeleted]) VALUES (3, N'The Flemington', 5, N'100 Ben Nghe street', N'hotel/hotel3.jpg', N'Featuring modern architecture, this hotel features panoramic views of Taiping Lake Gardens. Breathtaking views of natural landscapes can be enjoyed from the rooftop pool or any of its 3 dining options. Contemporary rooms at Flemington Hotel feature floor-to-ceiling windows and free internet access. They include a flat-screen TV and a modern bathroom. Tea/coffee making facilities and a personal safe are also provided.', 100, 0)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[OrderTour] ON 

INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (1, 1003, CAST(0x0000A1B30108AE39 AS DateTime), N'1650', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2, 1003, CAST(0x0000A1B30109B5CE AS DateTime), N'770', N'Canceled')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (3, 1004, CAST(0x0000A1B40180A906 AS DateTime), N'7480', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (1003, 2003, CAST(0x0000A1B600CEC608 AS DateTime), N'9350', N'Canceled')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (1004, 1005, CAST(0x0000A1B600E54E1F AS DateTime), N'1870', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2003, 1003, CAST(0x0000A1B900C3F02B AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2004, 1003, CAST(0x0000A1B900C3FDAA AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2005, 1003, CAST(0x0000A1B900C40A46 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2006, 1003, CAST(0x0000A1B900C41339 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2007, 1003, CAST(0x0000A1B900C42BA7 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2008, 1003, CAST(0x0000A1B900C43926 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2009, 1003, CAST(0x0000A1B900C446A7 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2010, 1003, CAST(0x0000A1B900C56BAF AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2011, 1003, CAST(0x0000A1B900C57CF4 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2012, 1003, CAST(0x0000A1B900C7C1C3 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2013, 1004, CAST(0x0000A1B900C86664 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2028, 1006, CAST(0x0000A1B900F0A468 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2029, 1006, CAST(0x0000A1B900F0AC4C AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2030, 1006, CAST(0x0000A1B900F0B46B AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2031, 1006, CAST(0x0000A1B900F0BB64 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2032, 1006, CAST(0x0000A1B900F0C274 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2033, 1006, CAST(0x0000A1B900F0CADD AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2034, 1006, CAST(0x0000A1B900F0D2DD AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2035, 1006, CAST(0x0000A1B900F0DB10 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2036, 1006, CAST(0x0000A1B900F23534 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2037, 1006, CAST(0x0000A1B900F23EC2 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2038, 1007, CAST(0x0000A1B900F266B7 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2039, 1007, CAST(0x0000A1B900F26D4E AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2040, 1007, CAST(0x0000A1B900F27690 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2041, 1007, CAST(0x0000A1B900F280F1 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2042, 1007, CAST(0x0000A1B900F28840 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2043, 1007, CAST(0x0000A1B900F29443 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2044, 1007, CAST(0x0000A1B900F2A7C0 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2045, 1007, CAST(0x0000A1B900F2B033 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2046, 1007, CAST(0x0000A1B900F2B858 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2049, 1007, CAST(0x0000A1B900F4B0AA AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2050, 1007, CAST(0x0000A1B900F4B6DE AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2051, 1007, CAST(0x0000A1B900F4BE18 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2052, 1008, CAST(0x0000A1B900F6F42F AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2053, 1008, CAST(0x0000A1B900F6FF8D AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2054, 1008, CAST(0x0000A1B900FB450A AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2014, 1004, CAST(0x0000A1B900C870A4 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2015, 1004, CAST(0x0000A1B900C879A1 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2016, 1004, CAST(0x0000A1B900C8801B AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2017, 1004, CAST(0x0000A1B900C8C93C AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2018, 1004, CAST(0x0000A1B900C8D3CC AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2019, 1004, CAST(0x0000A1B900C8DD39 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2020, 1004, CAST(0x0000A1B900C8E75B AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2021, 1005, CAST(0x0000A1B900EF5BA7 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2022, 1005, CAST(0x0000A1B900EF65B5 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2023, 1005, CAST(0x0000A1B900EF71D3 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2024, 1005, CAST(0x0000A1B900EF7CF8 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2025, 1005, CAST(0x0000A1B900EF85C4 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2026, 1005, CAST(0x0000A1B900EF8E05 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2027, 1005, CAST(0x0000A1B900EF9A54 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2058, 1010, CAST(0x0000A1B90101898A AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2059, 1010, CAST(0x0000A1B901019536 AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2060, 1010, CAST(0x0000A1B90101A698 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2065, 1011, CAST(0x0000A1B901078EFC AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2066, 1011, CAST(0x0000A1B9010794AB AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2067, 1011, CAST(0x0000A1B901079CF0 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2068, 1011, CAST(0x0000A1B90107B4C5 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2069, 1011, CAST(0x0000A1B90107BC3F AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2070, 1011, CAST(0x0000A1B90107C9B3 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2071, 1011, CAST(0x0000A1B90107D674 AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2047, 1007, CAST(0x0000A1B900F346AB AS DateTime), N'1100', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2048, 1007, CAST(0x0000A1B900F34D49 AS DateTime), N'880', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2055, 1009, CAST(0x0000A1B900FBEC4F AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2056, 1009, CAST(0x0000A1B900FBF74D AS DateTime), N'550', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2057, 1009, CAST(0x0000A1B900FC04F9 AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2061, 1010, CAST(0x0000A1B90101D5CD AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2062, 1010, CAST(0x0000A1B90101DD4B AS DateTime), N'770', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2063, 1010, CAST(0x0000A1B90101E859 AS DateTime), N'1320', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2064, 1010, CAST(0x0000A1B9010241D0 AS DateTime), N'3300', N'Depending')
INSERT [dbo].[OrderTour] ([orderTourID], [userID], [orderDate], [totalPrice], [status]) VALUES (2072, 1012, CAST(0x0000A1B901881593 AS DateTime), N'2420', N'Depending')
SET IDENTITY_INSERT [dbo].[OrderTour] OFF
SET IDENTITY_INSERT [dbo].[OrderTourDetail] ON 

INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (1, 1, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2, 1, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (3, 2, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (4, 3, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (5, 3, 6, 2)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (1004, 1003, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (1005, 1003, 3, 10)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (1006, 1004, 1, 2)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (1007, 1004, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2004, 2003, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2005, 2004, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2006, 2004, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2007, 2005, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2008, 2, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2009, 2006, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2010, 2007, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2011, 2008, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2012, 2008, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2013, 2009, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2014, 2008, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2015, 2009, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2016, 2010, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2017, 2, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2018, 2006, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2019, 2011, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2020, 2003, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2021, 2012, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2041, 2028, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2042, 2029, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2043, 2030, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2044, 2031, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2045, 2030, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2046, 2032, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2047, 2033, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2048, 2028, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2049, 2034, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2050, 2035, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2051, 2031, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2052, 2036, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2053, 2033, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2054, 2037, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2055, 2038, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2056, 2039, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2057, 2040, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2058, 2041, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2059, 2039, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2060, 2042, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2061, 2043, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2062, 2038, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2063, 2044, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2064, 2043, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2065, 2045, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2066, 2046, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2071, 2039, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2072, 2042, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2073, 2049, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2074, 2038, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2075, 2044, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2076, 2050, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2077, 2038, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2078, 2044, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2079, 2050, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2080, 2051, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2081, 2052, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2082, 2053, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2083, 2053, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2084, 2054, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2085, 2054, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2086, 2054, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2022, 2013, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2023, 2014, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2024, 2015, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2025, 2016, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2026, 2017, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2027, 2017, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2028, 2018, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2029, 2016, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2030, 2019, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2031, 2014, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2032, 2020, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2033, 2021, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2034, 2022, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2035, 2023, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2036, 2021, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2037, 2024, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2038, 2025, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2039, 2026, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2040, 2027, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2093, 2058, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2094, 2059, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2095, 2060, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2100, 2065, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2101, 2066, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2102, 2067, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2103, 2068, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2104, 2069, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2105, 2070, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2106, 2071, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2067, 2046, 5, 1)
GO
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2068, 2047, 5, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2069, 2040, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2070, 2048, 3, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2087, 2055, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2088, 2056, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2089, 2056, 1, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2090, 2057, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2091, 2057, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2092, 2057, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2096, 2061, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2097, 2062, 2, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2098, 2063, 4, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2099, 2064, 6, 1)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2107, 2072, 2, 2)
INSERT [dbo].[OrderTourDetail] ([orderTourDetailID], [orderTourID], [tourID], [quantity]) VALUES (2108, 2072, 3, 1)
SET IDENTITY_INSERT [dbo].[OrderTourDetail] OFF
SET IDENTITY_INSERT [dbo].[ScheduleTour] ON 

INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (1, 1, N'hn.jpg', N'A variety of options for entertainment in Hanoi can be found throughout the city. Modern and traditional theaters, cinemas, karaoke bars, dance clubs, bowling alleys, and an abundance of opportunities for shopping provide leisure activity for both locals and tourists. Hanoi has been named as one of the top 10 cities for shopping in Asia by Smart Travel Asia.[17] The number of art galleries exhibiting Vietnamese art has dramatically increased in recent years, including galleries such as "Nhat Huy" of Huynh Thong Nhat.

A popular traditional form of entertainment is water puppetry, which is shown for example at the Thang Long Water Puppet Theatre.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (2, 1, N'hn.jpg', N'With its rapid growth and extremely high population density, several modern shopping centers have been built in Hanoi. Major malls include:

    Trang Tien Plaza, Trang Tien street, Hoan Kiem District
    Vincom Center, Ba Trieu Street, Hai Ba Trung District
    Parkson Department Store, Tây Son Street, Viet Tower, Dong Da District; Landmark Parkson Department Store at Vietnam''s tallest building, Hanoi Landmark Tower (Pham Hung Road)
    The Garden Shopping Center, Me Tri - My Dinh, Tu Liem District
    Pico Mall, MIPEC Tower, Tay Son Street, Dong Da District
    Indochina Plaza, Xuan Thuy street, Cau Giay District
    Royal City Megamall, Nguyen Trai street, Thanh Xuan District (to be opened in July 2013)
')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (3, 1, N'hcm.jpg', N'The city has various museums, such as the Ho Chi Minh City Museum, Museum of Vietnamese History, the Revolutionary Museum, the Museum of Southeastern Armed Forces, the War Remnants Museum, the Museum of Southern Women, the Museum of Fine Art, the Nha Rong Memorial House, and the Ben Duoc Relic of Underground Tunnels. The C? Chi tunnels are northwest of the city in C? Chi district. The Saigon Zoo and Botanical Gardens, in District 1, dates from 1865. Aside from the Municipal Theatre, there are other places of entertainment such as: the B?n Thành and Hòa Bình theatres and the Lan Anh Music Stage. The Ð?m Sen Tourist and Cultural Park, Su?i Tiên Amusement and Culture Park, and C?n Gi?''s Eco beach resort are three recreational sites inside the city which are popular with tourists. Ho Chi Minh City is home to hundreds of cinemas and theatres, with cinema and dramatic ticketing revenue accounting for 60–70% of Vietnam''s total revenue in this industry.[citation needed]

Unlike other dramatic teams in Vietnam''s provinces and municipalities, residents of Ho Chi Minh City keep their theaters active without being subsidized by the Vietnamese government. The city is home to most of the private movie companies in Vietnam. Like many of Vietnam''s smaller cities, the city boasts a multitude of restaurants serving typical Vietnamese dishes such as ph? or rice vermicelli. Backpacking travelers most often frequent the "Western Quarter" on Ph?m Ngu Lão Street, District 1, Ho Chi Minh City.[citation needed]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (4, 2, N'hcm.jpg', N'The city has various museums, such as the Ho Chi Minh City Museum, Museum of Vietnamese History, the Revolutionary Museum, the Museum of Southeastern Armed Forces, the War Remnants Museum, the Museum of Southern Women, the Museum of Fine Art, the Nha Rong Memorial House, and the Ben Duoc Relic of Underground Tunnels. The C? Chi tunnels are northwest of the city in C? Chi district. The Saigon Zoo and Botanical Gardens, in District 1, dates from 1865. Aside from the Municipal Theatre, there are other places of entertainment such as: the B?n Thành and Hòa Bình theatres and the Lan Anh Music Stage. The Ð?m Sen Tourist and Cultural Park, Su?i Tiên Amusement and Culture Park, and C?n Gi?''s Eco beach resort are three recreational sites inside the city which are popular with tourists. Ho Chi Minh City is home to hundreds of cinemas and theatres, with cinema and dramatic ticketing revenue accounting for 60–70% of Vietnam''s total revenue in this industry.[citation needed]

Unlike other dramatic teams in Vietnam''s provinces and municipalities, residents of Ho Chi Minh City keep their theaters active without being subsidized by the Vietnamese government. The city is home to most of the private movie companies in Vietnam. Like many of Vietnam''s smaller cities, the city boasts a multitude of restaurants serving typical Vietnamese dishes such as ph? or rice vermicelli. Backpacking travelers most often frequent the "Western Quarter" on Ph?m Ngu Lão Street, District 1, Ho Chi Minh City.[citation needed]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (5, 2, N'halong.jpg', N'The bay consists of a dense cluster of over 3,000[citation needed] limestone monolithic islands each topped with thick jungle vegetation, rising spectacularly from the ocean. Several of the islands are hollow, with enormous caves. Hang Ð?u G? (Wooden stakes cave) is the largest grotto in the H? Long area. French tourists visited in the late 19th century, and named the cave Grotte des Merveilles. Its three large chambers contain large numerous stalactites and stalagmites (as well as 19th century French graffiti). There are two bigger islands, Tu?n Châu and Cat Ba, that have permanent inhabitants, as well as tourist facilities including hotels and beaches. There are a number of beautiful beaches on the smaller islands.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (6, 2, N'hcm.jpg', N'The city''s media are the most developed in the country. At present, there are seven daily newspapers: Sai Gon Giai Phong (Liberated Saigon), and its Vietnamese, investment and finance, sports, evening and weekly editions; Tuoi Tre (Youth), the highest circulation newspaper in Vietnam; Thanh Nien (Young Men), the second largest circulation in the south of Vietnam; Nguoi Lao Dong (Labourer); The Thao (Sports); Phap Luat (Law) and the Saigon Times Daily, the English-language newspaper as well as more than 30 other newspapers and magazines. The city has hundreds of printing and publishing houses, many bookstores and a widespread network of public and school libraries; the city''s General Library houses over 1.5 mìllion books. Locally-based Ho Chi Minh City Television (HTV) is the second largest television network in the nation, just behind the national Vietnam Television (VTV), broadcasting 24/7 on 7 different channels (using analog and digital technology). Many major international TV channels are provided through two cable networks (SCTV and HTVC), with over one million subscribers. The Voice of Ho Chi Minh City is the largest radio station in southern Vietnam.[citation needed')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (7, 3, N'halong.jpg', N'A community of around 1,600 people live on H? Long Bay in four fishing villages: C?a V?n, Ba Hang, C?ng Tàu and Vông Viêng in Hùng Th?ng commune, H? Long city. They live on floating houses and are sustained through fishing and marine aquaculture (cultivating marine biota), plying the shallow waters for 200 species of fish and 450 different kinds of mollusks. Many of the islands have acquired their names as a result of interpretation of their unusual shapes. Such names include Voi Islet (elephant), Ga Choi Islet (fighting cock), and Mai Nha Islet (roof). 989 of the islands have been given names. Birds and animals including bantams, antelopes, monkeys, and lizards also live on some of the islands.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (15, 5, N'hn.jpg', N'With its rapid growth and extremely high population density, several modern shopping centers have been built in Hanoi. Major malls include:

    Trang Tien Plaza, Trang Tien street, Hoan Kiem District
    Vincom Center, Ba Trieu Street, Hai Ba Trung District
    Parkson Department Store, Tây Son Street, Viet Tower, Dong Da District; Landmark Parkson Department Store at Vietnam''s tallest building, Hanoi Landmark Tower (Pham Hung Road)
    The Garden Shopping Center, Me Tri - My Dinh, Tu Liem District
    Pico Mall, MIPEC Tower, Tay Son Street, Dong Da District
    Indochina Plaza, Xuan Thuy street, Cau Giay District
    Royal City Megamall, Nguyen Trai street, Thanh Xuan District (to be opened in July 2013)
')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (8, 3, N'nhatrang.jpg', N'Nha Trang is one of the most important tourist hubs of Vietnam, thanks to its beautiful beaches with fine and clean sand and the clear ocean water with mild temperatures all year round. There are several resorts - such as Vinpearl, Diamond Bay and Ana Mandara - and amusement and water parks, both in the city and on islands off the coast. The possibly most beautiful street of Nha Trang is Tran Phu Street along the seaside, sometimes referred to as the Pacific Coast Highway of Vietnam.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (9, 3, N'nhatrang.jpg', N'Nha Trang is a stopover for annual yacht races starting in Hong Kong. In recent years, the city has welcomed many five-star sea cruises. In addition to sail boat racing, Nha Trang provides a rich variety of tourist activities for visitors. Island hopping, scuba diving, water sports and other sporting activities can be enjoyed in the city. The Nha Trang Tourist Information Center (a non-governmental organisation), located near the Cho Dam Market has been set up to provide information for visitors.[7]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (10, 4, N'thailand.jpg', N'Thai culture has been shaped by many influences, including Indian, Lao, Burmese, Cambodian, and Chinese.

Its traditions incorporate a great deal of influence from India, China, Cambodia, and the rest of Southeast Asia. Thailand''s national religion Theravada Buddhism is important to modern Thai identity. Thai Buddhism has evolved over time to include many regional beliefs originating from Hinduism, animism as well as ancestor worship. The official calendar in Thailand is based on the Eastern version of the Buddhist Era, which is 543 years ahead of the Gregorian (western) calendar. For example, the year AD 2012 is 2555 BE in Thailand.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (11, 4, N'thailand.jpg', N'Several different ethnic groups, many of which are marginalized, populate Thailand. Some of these groups overlap into Burma, Laos, Cambodia, and Malaysia and have mediated change between their traditional local culture, national Thai and global cultural influences. Overseas Chinese also form a significant part of Thai society, particularly in and around Bangkok. Their successful integration into Thai society has allowed for this group to hold positions of economic and political power.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (12, 4, N'sydney', N'As a dynamic cultural hub, Sydney has many fine and internationally known museums and galleries, such as the Art Gallery of New South Wales, the Museum of Contemporary Art, the White Rabbit Gallery, Brett Whiteley Studio, Museum of Sydney and the Powerhouse Museum, in addition to a thriving commercial gallery scene of contemporary art, mainly in the inner-city areas of Waterloo, Surry Hills, Darlinghurst, Paddington, Chippendale, Newtown and Woollahra.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (13, 5, N'paris.jpg', N'The largest opera houses of Paris are the 19th century Opéra Garnier (historical Paris Opéra) and modern Opéra Bastille; the former tends towards the more classic ballets and operas, and the latter provides a mixed repertoire of classic and modern. In middle of 19th century, there were two other active and competing opera houses: Opéra-Comique (which still exists to this day) and Théâtre Lyrique (which in modern times changed its profile and name to Théâtre de la Ville).')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (14, 5, N'paris.jpg', N'Theatre traditionally has occupied a large place in Parisian culture. This still holds true today, and many of its most popular actors today are also stars of French television. Some of Paris'' major theatres include Bobino, Théâtre Mogador, and the Théâtre de la Gaîté-Montparnasse. Some Parisian theatres have also doubled as concert halls. Many of France''s greatest musical legends, such as Édith Piaf, Maurice Chevalier, Georges Brassens, and Charles Aznavour, found their fame in Parisian concert halls: Legendary yet still-showing examples of these are Le Lido, Bobino, l''Olympia and le Splendid.')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (16, 6, N'england.jpg', N'Many ancient standing stone monuments were erected during the prehistoric period, amongst the best known are Stonehenge, Devil''s Arrows, Rudston Monolith and Castlerigg.[229] With the introduction of Ancient Roman architecture there was a development of basilicas, baths, amphitheaters, triumphal arches, villas, Roman temples, Roman roads, Roman forts, stockades and aqueducts.[230] It was the Romans who founded the first cities and towns such as London, Bath, York, Chester and St Albans. Perhaps the best known example is Hadrian''s Wall stretching right across northern England.[230] Another well preserved example is the Roman Baths at Bath, Somerset.[230]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (17, 6, N'england_02.jpg', N'Early Medieval architecture''s secular buildings were simple constructions mainly using timber with thatch for roofing. Ecclesiastical architecture ranged from a synthesis of Hiberno—Saxon monasticism,[231][232] to Early Christian basilica and architecture characterised by pilaster-strips, blank arcading, baluster shafts and triangular headed openings. After the Norman conquest in 1066 various Castles in England were created so law lords could uphold their authority and in the north to protect from invasion. Some of the best known medieval castles include the Tower of London, Warwick Castle, Durham Castle and Windsor Castle amongst others.[233]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (18, 6, N'england_03.jpg', N'NULLThroughout the Plantagenet era an English Gothic architecture flourished—the medieval cathedrals such as Canterbury Cathedral, Westminster Abbey and York Minster are prime examples.[233] Expanding on the Norman base there was also castles, palaces, great houses, universities and parish churches. Medieval architecture was completed with the 16th century Tudor style; the four-centred arch, now known as the Tudor arch, was a defining feature as were wattle and daub houses domestically. In the aftermath of the Renaissance a form of architecture echoing classical antiquity, synthesised with Christianity appeared—the English Baroque style, architect Christopher Wren was particularly championed.[234]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (19, 6, N'usa.jpg', N'The United States is a multicultural nation, home to a wide variety of ethnic groups, traditions, and values.[12][348] Aside from the now small Native American and Native Hawaiian populations, nearly all Americans or their ancestors immigrated within the past five centuries.[349] Mainstream American culture is a Western culture largely derived from the traditions of European immigrants with influences from many other sources, such as traditions brought by slaves from Africa.[12][350] More recent immigration from Asia and especially Latin America has added to a cultural mix that has been described as both a homogenizing melting pot, and a heterogeneous salad bowl in which immigrants and their descendants retain distinctive cultural characteristics.[12]')
INSERT [dbo].[ScheduleTour] ([scheduleID], [tourID], [imageSchedule], [description]) VALUES (20, 6, N'usa_02.jpg', N'NULLThe world''s first commercial motion picture exhibition was given in New York City in 1894, using Thomas Edison''s Kinetoscope. The next year saw the first commercial screening of a projected film, also in New York, and the United States was in the forefront of sound film''s development in the following decades. Since the early 20th century, the U.S. film industry has largely been based in and around Hollywood, California.

Director D. W. Griffith was central to the development of film grammar and Orson Welles''s Citizen Kane (1941) is frequently cited as the greatest film of all time.[358] American screen actors like John Wayne and Marilyn Monroe have become iconic figures, while producer/entrepreneur Walt Disney was a leader in both animated film and movie merchandising. Hollywood is also one of the leaders in motion picture production.[359]')
SET IDENTITY_INSERT [dbo].[ScheduleTour] OFF
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (1, N'Hanoi - Ho Chi Minh', N'hn.jpg', N'2013-07-01 16:47:08.128', N'2013-07-04 16:47:08.128', N'Hanoi', N'Ho Chi Minh', 20, 50, 500, N'available', 33, N'2013-Today, the city''s core is still adorned with wide elegant boulevards and historic French colonial buildings. Majority of these tourist spots are in District 1 and are a short leisurely distance away from each other. The most prominent structures in the city center are Reunification Palace (Dinh Th?ng Nh?t), City Hall (?y ban nhân dân Thành ph?), the Municipal Theatre (Nhà hát thành ph?, also known as the Opera House), City Post Office (Buu di?n thành ph?), State Bank Office (Ngân hàng nhà nu?c), City People''s Court (Tòa án nhân dân thành ph?) and Notre-Dame Cathedral (Nhà th? Ð?c Bà). Some of the historic hotels are the Hotel Majestic, dating from the French colonial era, and the Rex and Caravelle hotels are former hangouts for American officers and war correspondents in the 1960s/70s. It was approximated 4.3 millions tourist visited Vietnam in 2007, and 70 percent, about 3 millions came to visit Ho Chi Minh city.[53] In 2007, the number of tourists that came to the city increased up to 12 percent compared to 2006, and the tourism industry revenue increased to 19,500 billion VND, up 20 percent.[53]')
INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (2, N'Ho Chi Minh - Ha Long Bay', N'hcm.jpg', N'2013-08-01 16:47:08.128', N'2013-08-04 16:47:08.128', N'Ho Chi Minh', N'Ha Long ', 30, 60, 700, N'available', 43, N'In 1962, the Vietnam Ministry of Culture, Sport and Tourism designated H? Long Bay a ''Renowned National Landscape Monument''.

H? Long Bay was first listed as a UNESCO World Heritage Site in 1994,[13] in recognition of its outstanding, universal aesthetic value. In 2000 the World Heritage Committee additionally recognised H? Long Bay for its outstanding geological and geomorphological value,[14] and its World Heritage Listing was updated.[15]

In October 2011, World Monuments Fund included the bay on the 2012 World Monuments Watch, citing tourism pressures and associated development as threats to the site that must be addressed. The goal of Watch-listing is to promote strategies of responsible heritage-driven development for a sustainable future.

In 2009, the New 7 Wonders Foundation, which runs the New Seven Wonders of the World program, included Halong Bay on its list of nominations as one the World''s New7Wonders of Nature. In 2012, the New 7 Wonders Foundation officially named Halong Bay as one of new seven natural wonders of the world.

H? Long Bay is also a member of the Club of the Most Beautiful Bays of the World.')
INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (3, N'Ha Long Bay - Nha Trang', N'nhatrang.jpg', N'2013-06-27 16:47:08.128', N'2013-06-30 16:47:08.128', N'Ha Long ', N'Nha Trang', 25, 40, 800, N'available', 26, N'Nha Trang is one of the most important tourist hubs of Vietnam, thanks to its beautiful beaches with fine and clean sand and the clear ocean water with mild temperatures all year round. There are several resorts - such as Vinpearl, Diamond Bay and Ana Mandara - and amusement and water parks, both in the city and on islands off the coast. The possibly most beautiful street of Nha Trang is Tran Phu Street along the seaside, sometimes referred to as the Pacific Coast Highway of Vietnam.

Lying off Nha Trang is the Hon Tre Island (Bamboo Island), with a major resort operated by the Vinpearl Group. The Vinpearl Cable Car, a gondola lift system, links the mainland to the five-star resort and theme park on Hon Tre Island.

Nha Trang is a stopover for annual yacht races starting in Hong Kong. In recent years, the city has welcomed many five-star sea cruises. In addition to sail boat racing, Nha Trang provides a rich variety of tourist activities for visitors. Island hopping, scuba diving, water sports and other sporting activities can be enjoyed in the city. The Nha Trang Tourist Information Center (a non-governmental organisation), located near the Cho Dam Market has been set up to provide information for visitors.[7]

The local cuisine is most famous for fresh seafoods and barbecued pork rolled in rice paper. The area''s Bird''s nest soup is deemed one of the best in Vietnam. Bird''s nests are collected in the wild, on bird farms on the islands off the coast and even in some houses in the inner city. The farmed bird in question belongs to the swiftlet group, popularly referred to as y?n hàng (Aerodramus fuciphagus germani).

Long Son Pagoda is prominent for its statue of Gautama Buddha.')
INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (4, N'Thailand - Sydney', N'thailand.jpg', N'2013-07-20 16:47:08.128', N'2013-07-23 16:47:08.128', N'Thailand', N'Sydney', 15, 45, 1200, N'available', 38, N'The Andaman Sea is regarded as Thailand''s most precious natural resource as it hosts the most popular and luxurious resorts in Asia. Phuket, Krabi, Ranong, Phang Nga and Trang and their lush islands all lay along the coasts of the Andaman Sea and despite the 2004 Tsunami, they continue to be and ever more so, the playground of the rich and elite of Asia and the world.

Plans have resurfaced of a logistical connection of the two bodies of water which would be coined the Thai Canal, analogous to the Suez and the Panama Canal. Such an idea has been greeted with positive accounts by Thai politicians as it would cut fees charged by the Ports of Singapore, improve ties with China and India, lower shipping times and increase ship safety owing to pirate fears in the Strait of Melaka and, support the Thai government''s policy of being the logistical hub for Southeast Asia.

The ports would improve economic conditions in the south of Thailand, which relies heavily on tourism income, and it would also change the structure of the Thai economy moving it closer to a services centre of Asia. The canal would be a major engineering project and has expected costs of 20–30 billion dollars.

The local climate is tropical and characterized by monsoons. There is a rainy, warm, and cloudy southwest monsoon from mid-May to September, as well as a dry, cool northeast monsoon from November to mid-March. The southern isthmus is always hot and humid.[citation needed]')
INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (5, N'Paris - Hanoi', N'paris.jpg', N'2013-07-28 16:47:08.128', N'2013-07-31 16:47:08.128', N'Paris', N'Hanoi', 10, 25, 1000, N'available', 16, N'The largest opera houses of Paris are the 19th century Opéra Garnier (historical Paris Opéra) and modern Opéra Bastille; the former tends towards the more classic ballets and operas, and the latter provides a mixed repertoire of classic and modern. In middle of 19th century, there were two other active and competing opera houses: Opéra-Comique (which still exists to this day) and Théâtre Lyrique (which in modern times changed its profile and name to Théâtre de la Ville).

Theatre traditionally has occupied a large place in Parisian culture. This still holds true today, and many of its most popular actors today are also stars of French television. Some of Paris'' major theatres include Bobino, Théâtre Mogador, and the Théâtre de la Gaîté-Montparnasse. Some Parisian theatres have also doubled as concert halls. Many of France''s greatest musical legends, such as Édith Piaf, Maurice Chevalier, Georges Brassens, and Charles Aznavour, found their fame in Parisian concert halls: Legendary yet still-showing examples of these are Le Lido, Bobino, l''Olympia and le Splendid.

The Élysées-Montmartre, much reduced from its original size, is a concert hall today. The New Morning is one of few Parisian clubs still holding jazz concerts, but the same also specialises in "indie" music. In more recent times, the Le Zénith hall in the La Villette district of Paris and a "parc-omnisports" stadium in Bercy serve as large-scale rock concert halls.')
INSERT [dbo].[Tour] ([tourID], [tourName], [imageTour], [startDate], [endDate], [startLocation], [endLocation], [quantityMin], [quantityMax], [price], [status], [quantityCurrent], [descripton]) VALUES (6, N'England - United State of America', N'england.jpg', N'2013-08-10 16:47:08.128', N'2013-08-15 16:47:08.128', N'London', N'California', 20, 50, 3000, N'available', 36, N'Geographically England includes the central and southern two-thirds of the island of Great Britain, plus such offshore islands as the Isle of Wight and the Isles of Scilly. It is bordered by two other countries of the United Kingdom—to the north by Scotland and to the west by Wales. England is closer to the European continent than any other part of mainland Britain. It is separated from France by a 34-kilometre (21 mi)[116] sea gap, though the two countries are connected by the Channel Tunnel near Folkestone.[117] England also has shores on the Irish Sea, North Sea and Atlantic Ocean.

The ports of London, Liverpool, and Newcastle lie on the tidal rivers Thames, Mersey and Tyne respectively. At 354 kilometres (220 mi), the Severn is the longest river flowing through England.[118] It empties into the Bristol Channel and is notable for its Severn Bore tidal waves, which can reach 2 metres (6.6 ft) in height.[119] However, the longest river entirely in England is the Thames, which is 346 kilometres (215 mi) in length.[120] There are many lakes in England; the largest is Windermere, within the aptly named Lake District.[121]')
SET IDENTITY_INSERT [dbo].[Tour] OFF
/****** Object:  Index [pk_cancelOrderTourID]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[CancelOrderTour] ADD  CONSTRAINT [pk_cancelOrderTourID] PRIMARY KEY NONCLUSTERED 
(
	[cancelOrderTourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_customer]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [pk_customer] PRIMARY KEY NONCLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_orderTourID]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[OrderTour] ADD  CONSTRAINT [pk_orderTourID] PRIMARY KEY NONCLUSTERED 
(
	[orderTourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_orderTourDetailID]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[OrderTourDetail] ADD  CONSTRAINT [pk_orderTourDetailID] PRIMARY KEY NONCLUSTERED 
(
	[orderTourDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_scheduleID]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[ScheduleTour] ADD  CONSTRAINT [pk_scheduleID] PRIMARY KEY NONCLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_tourID]    Script Date: 5/10/2013 4:49:34 PM ******/
ALTER TABLE [dbo].[Tour] ADD  CONSTRAINT [pk_tourID] PRIMARY KEY NONCLUSTERED 
(
	[tourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CancelOrderTour] ADD  DEFAULT (getdate()) FOR [cancelTourDate]
GO
ALTER TABLE [dbo].[Car] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Hotel] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[OrderTour] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[CancelOrderTour]  WITH CHECK ADD  CONSTRAINT [FK_CancelOrderTour_OrderTour] FOREIGN KEY([orderTourID])
REFERENCES [dbo].[OrderTour] ([orderTourID])
GO
ALTER TABLE [dbo].[CancelOrderTour] CHECK CONSTRAINT [FK_CancelOrderTour_OrderTour]
GO
ALTER TABLE [dbo].[CarOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Customer] ([userID])
GO
ALTER TABLE [dbo].[CarOrderDetail]  WITH CHECK ADD FOREIGN KEY([carID])
REFERENCES [dbo].[Car] ([carID])
GO
ALTER TABLE [dbo].[CarOrderDetail]  WITH CHECK ADD FOREIGN KEY([carOrderID])
REFERENCES [dbo].[CarOrder] ([carOrderID])
GO
ALTER TABLE [dbo].[OrderTour]  WITH CHECK ADD  CONSTRAINT [FK_OrderTour_Customer] FOREIGN KEY([userID])
REFERENCES [dbo].[Customer] ([userID])
GO
ALTER TABLE [dbo].[OrderTour] CHECK CONSTRAINT [FK_OrderTour_Customer]
GO
ALTER TABLE [dbo].[OrderTourDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderTourDetail_OrderTour] FOREIGN KEY([orderTourID])
REFERENCES [dbo].[OrderTour] ([orderTourID])
GO
ALTER TABLE [dbo].[OrderTourDetail] CHECK CONSTRAINT [FK_OrderTourDetail_OrderTour]
GO
ALTER TABLE [dbo].[ScheduleTour]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleTour_Tour1] FOREIGN KEY([tourID])
REFERENCES [dbo].[Tour] ([tourID])
GO
ALTER TABLE [dbo].[ScheduleTour] CHECK CONSTRAINT [FK_ScheduleTour_Tour1]
GO
USE [master]
GO
ALTER DATABASE [E2W] SET  READ_WRITE 
GO
