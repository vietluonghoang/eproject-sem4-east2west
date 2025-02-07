USE [master]
GO
CREATE DATABASE [E2W]
go
USE [E2W]
GO
CREATE TABLE [dbo].[CancelOrderTour](
	[cancelOrderTourID] [int] IDENTITY(1,1) NOT NULL,
	[orderTourID] [int] NULL,
	[cancelTourDate] [datetime] NULL,
	[refund] [varchar](10) NULL,
 CONSTRAINT [pk_cancelOrderTourID] PRIMARY KEY NONCLUSTERED 
(
	[cancelOrderTourID] ASC
)
)
GO
CREATE TABLE [dbo].[city](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [varchar](50) NOT NULL,
	[cityImage] [varchar](500) NOT NULL,
	[cityDescription] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
))
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
	[phone] [varchar](20) NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY NONCLUSTERED 
(
	[userID] ASC
))
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
))
GO
CREATE TABLE [dbo].[OrderTour](
	[orderTourID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[orderDate] [datetime] NULL,
	[totalPrice] [varchar](20) NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [pk_orderTourID] PRIMARY KEY NONCLUSTERED 
(
	[orderTourID] ASC
))
GO
CREATE TABLE [dbo].[OrderTourDetail](
	[orderTourDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderTourID] [int] NULL,
	[tourID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [pk_orderTourDetailID] PRIMARY KEY NONCLUSTERED 
(
	[orderTourDetailID] ASC
))
GO
CREATE TABLE [dbo].[ScheduleTour](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[tourID] [int] NULL,
	[imageSchedule] [varchar](max) NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [pk_scheduleID] PRIMARY KEY NONCLUSTERED 
(
	[scheduleID] ASC
))
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
	[descripton] [varchar](max) NULL,
 CONSTRAINT [pk_tourID] PRIMARY KEY NONCLUSTERED 
(
	[tourID] ASC
))
GO
ALTER TABLE [dbo].[CancelOrderTour] ADD  DEFAULT (getdate()) FOR [cancelTourDate]
GO
ALTER TABLE [dbo].[OrderTour] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[CancelOrderTour]  WITH CHECK ADD  CONSTRAINT [FK_CancelOrderTour_OrderTour] FOREIGN KEY([orderTourID])
REFERENCES [dbo].[OrderTour] ([orderTourID])
GO
ALTER TABLE [dbo].[CancelOrderTour] CHECK CONSTRAINT [FK_CancelOrderTour_OrderTour]
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





CREATE TABLE [dbo].[Hotel](
	[hotelID] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [varchar](50) NOT NULL,
	[hotelStar] [int] NOT NULL,
	[hotelStreet] [varchar](100) NOT NULL,
	hotelImage varchar(50) not null,
	[hotelDescription] [varchar](1000) NOT NULL,
	[hotelPrice] [int] NOT NULL,
	isDeleted bit default 0 not null,
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
))
GO
CREATE TABLE [dbo].[Car](
	[carID] [int] identity(1,1) primary key,
	[model] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[seat] [int] NOT NULL,
	[airConditioner] [bit] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[image] [varchar](50) NOT NULL,
	[quantityStock] [int] NOT NULL,
	price int not null,
	[isDeleted] [bit] default 0 NOT NULL
)
GO
CREATE TABLE [dbo].[CarOrder](
	[carOrderID] [int] IDENTITY(1,1) primary key,
	[createDate] [datetime] NOT NULL,
	endDate datetime null,
	[status] [varchar](50) NOT NULL,
	[userID] [int] not NULL foreign key references Customer(userID),
	orderCost int not null,
	refund int null
)
GO
create table dbo.CarOrderDetail(
	carOrderDetailID int IDENTITY(1,1) primary key,
	carOrderID int not null foreign key references dbo.carOrder(carOrderID),
	[carID] [int] not null foreign key references dbo.car(carID),
	[quantity] [int] NOT NULL,
	[driver] [bit] NOT NULL,
	[pickup] [datetime] NOT NULL,
	[dropoff] [datetime] NOT NULL,
	totalCost int not null,
	orderDate [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL
)

use e2w
create table dbo.admin(
	adminID int IDENTITY(1,1) primary key,
	username varchar(20) not null,
	[password] varchar(20) not null
)
insert into dbo.admin values('admin','admin')
insert into dbo.admin values('mod','mod')

use e2w
insert into Customer values('acacacac','123456','anonymous','male','badboy0123@gmail.com','vietnamese','lac long quan',01204799496)

use e2w
insert into car values('Toyota Innova','SUV',7,1,'The Toyota Innova is a Toyota-designed Compact MPV i.e. being less than 4,600 mm (181.1 in) in length as per the European system of size classification, produced in Indonesia under supervision by Toyota Astra Motor since 2003. As with Toyota Kijang, which it replaced, the Toyota Innova is produced and first marketed in 2004 in Indonesia. Toyota Innova is part of Toyotas IMV program together with the Hilux Vigo pickup truck and the Fortuner SUV. Its official name in Indonesia is Toyota Kijang Innova, while for other countries it is Innova.','car/new-toyota-innova.jpg',2,40,0)
insert into car values('Toyota Vios','Sedan',4,1,'Introduced in 2002, the Vios serves as a replacement of the Toyota Tercel (called the Toyota Soluna in Thailand and Indonesia), which filled the Asian subcompact market for a 1.5 litre, below the Toyota Corolla and Toyota Camry, both of which are also marketed in the region. The Vios is marketed alongside the Toyota Yaris in most countries in South East Asia, which offered another option for a hatchback, when it officially entered the regions market in 2005. In the United States, the second generation Vios is known as the Toyota Yaris sedan.','car/Toyota_Vios.jpg',4,25,0)
insert into car values('KIA Morning','Sedan',4,1,'The Morning is based on a shortened platform of the Hyundai Getz. It is available with either 1.0 or 1.1 L petrol engines. A 3-cylinder diesel engine (based on the Kia Ceratos 1.5 CRD four-cylinder unit), with direct injection and a variable geometry turbocharger, has been available in the European market since Spring 04, with power reaching 75 PS (55 kW). The Picanto is 3,495 mm (137.6 in) long with a five-door hatchback body. Automatic gearboxes are optional in the petrol units. Also sold in some countries with a 1.2 L engine found in the Hyundai i10.','car/kia-morning.jpg',4,20,0)
insert into car values('Audi R8','Coupe',2,1,'The Audi R8 (Typ 42) is a mid-engine, 2-seater sports car, which uses Audis trademark quattro permanent all-wheel drive system. It was introduced by the German automaker Audi AG in 2006. The car was exclusively designed, developed, and manufactured by Audi AGs high performance private subsidiary company, quattro GmbH, and is based on the Lamborghini Gallardo platform. The fundamental construction of the R8 is based on the Audi Space Frame, and uses an aluminium monocoque which is built around space frame principles. The car is built by quattro GmbH in a newly renovated factory at Audis aluminium site at Neckarsulm in Germany.','car/audi-r8.jpg',1,200,0)
insert into car values('BMW 3 series','Sedan',4,1,'The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975. Successor to the BMW New Class, it has been produced in six different generations and in five different body styles. It is BMWs best-selling model, accounting for around 30% of the BMW brands annual total sales (excluding motorbikes). The BMW 3 Series has won numerous awards throughout its history.','car/bmw3.jpg',2,80,0)
insert into car values('Mercedes C250','Sedan',4,1,'The Mercedes-Benz C-Class is a compact executive car produced by Mercedes-Benz. Introduced in 1993 as a replacement for the 190 (W201) range, the C-Class was the smallest model in the marques lineup until the arrival of the A-Class in 1997. The C-Class is built at Mercedes-Benz factories in Sindelfingen and Bremen, Germany as well as numerous satellite factories in other countries. The very first C-Class (W202) sedan was produced on 1 June 1993, and the first second generation (W203) rolled off the assembly line on July 18, 2000. The most recent third generation (W204) launched in 2007.','car/Mercedes-C250.JPG',1,80,0)
insert into car values('Ford Escape','SUV',7,1,'The Ford Escape is a compact crossover sold by Ford Motor Company introduced in 2000 as a 2001 model year and priced below the Ford Explorer. Although it is technically a crossover vehicle, it is marketed by Ford as part of its traditional SUV lineup (Escape, Explorer, Expedition) rather than its separate crossover lineup (Edge, Flex). The Escape was sold in Europe as the Ford Maverick. It was jointly developed with Mazda, in which Ford owned a controlling interest, and was released simultaneously with the Mazda Tribute. In the United States, Fords Mercury division released a luxury version called the Mariner starting with the 2005 model year, but ended production in October 2010 as Ford ended the Mercury brand.','car/FordEscape.jpg',2,40,0)
insert into car values('VW Beetle','Sedan',4,1,'The Volkswagen Beetle, officially called the Volkswagen Type 1 (or informally the Volkswagen Bug), is an economy car produced by the German auto maker Volkswagen (VW) from 1938 until 2003. With over 21 million manufactured (21,529,464) in an air-cooled, rear-engined, rear-wheel drive configuration, the Beetle is the longest-running and most-manufactured car of a single design platform, worldwide.','car/beetle.jpg',4,20,0)
insert into car values('Koenigsegg Agera','Coupe',2,1,'The Koenigsegg Agera is a mid-engined sports car made by Scandinavian car manufacturer Koenigsegg as of 2011. It is a successor to the Koenigsegg CCX/CCXR. The name Agera comes from the Swedish verb "agera" which means "to act” or "to take action".','car/agera.jpg',1,4000,0)
insert into car values('Bugatti Veyron','Coupe',2,1,'The Bugatti Veyron EB 16.4 is a mid-engined grand touring car, designed and developed by the Volkswagen Group and manufactured in Molsheim, France by Bugatti Automobiles S.A.S. The Super Sport version of the Veyron is the fastest street-legal production car in the world, with a top speed of 431.072 km/h (267.856 mph).[4] The original version has a top speed of 408.47 km/h (253.81 mph). It was named Car of the Decade (2000–2009) by the BBC television programme Top Gear. The standard Veyron won Top Gear Best Car Driven All Year award in 2005.','car/veyron.jpg',1,4000,0)
insert into car values('Pagani Zonda','Coupe',2,1,'The Pagani Zonda is a sports car built by the Italian manufacturer Pagani. It debuted in 1999, and production ended in 2011, with three special edition cars, the Zonda 760RS, Zonda 760LH and the Zonda 764 Passione, being produced in 2012. By June 2009, 206 Zondas had been built, including test mules. Both 2-door coupe and roadster versions have been produced. Construction is mainly of carbon fiber.','car/zonda.jpg',1,4000,0)

use e2w
insert into carorder values('2013-04-26',null,'waiting',1003,10000,null)

use e2w
delete from carorderdetail
insert into carorderdetail values(1,1,90,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,2,80,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,3,70,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,4,65,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,5,60,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,6,55,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,7,50,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,8,45,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,9,40,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,10,39,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')
insert into carorderdetail values(1,11,95,0,'2013-04-26','2013-04-26',100,'2013-04-26','waiting')


use e2w
insert into hotel values('Grand Plaza',3,'300 Au Co street','hotel/hotel1.jpg','Grand Plaza I is a residential skyscraper in Chicago. The 57 story building was completed in 2003 at a height of 641 feet (195 m) when measured from its decorative spires. Grand Plaza I is one of the tallest all-residential buildings in Chicago and contains 481 luxury apartment units. It is also the tallest building in the Chicago zip code 60610, the zip code with the most high-rises in the city.',50,0)
insert into hotel values('The Manor',4,'200 Pastuer street','hotel/hotel2.jpg','Since 1956, The Manor has hosted more than 10,000 weddings and has been the dining destination for generations of customers in celebration of life’s most special occasions. Our experience and commitment to perfection is unparalleled in regard to both weddings and fine dining.',75,0)
insert into hotel values('The Flemington',5,'100 Ben Nghe street','hotel/hotel3.jpg','Featuring modern architecture, this hotel features panoramic views of Taiping Lake Gardens. Breathtaking views of natural landscapes can be enjoyed from the rooftop pool or any of its 3 dining options. Contemporary rooms at Flemington Hotel feature floor-to-ceiling windows and free internet access. They include a flat-screen TV and a modern bathroom. Tea/coffee making facilities and a personal safe are also provided.',100,0)
--
--use e2w
--select * from customer
--
--
--use e2w
--select * from CarOrder
--
--use e2w
--select * from dbo.CarOrderDetail
--
--use e2w
--select * from car
--
--use e2w
--select * from carorderdetail where pickup between 2013-04-01 and 2013-05-05 or dropoff between 2013-05-01 and 2013-05-05
--
--use e2w
--select * from carorderdetail where orderdate between 2013-04-26 and 2013-05-04
--
