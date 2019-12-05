/* 
Create Database Query for Emerging Database Technologies CIS3007-N Module ICA Task B
NAME: SI THU ZAW 	NRIC:	Teesside ID: T7177793	Batch Code: BTID11701A	Lecturer Name: Ms. Manian Latha
Management Development Institute of Singapore / Teesside University UK
*/

CREATE DATABASE [Uni_Bus];   --Create database
GO
USE [Uni_Bus];		-- Select database
GO

CREATE TABLE Bus(		--Create table queries, specifies the columns, datatypes and other constraints
	[B_ID] int identity(1,1) NOT NULL,
	[B_License] nvarchar(20) NOT NULL,
	[B_Model] nvarchar(100) NOT NULL,
	[B_Manufacturer] nvarchar(100) NOT NULL,
	[B_DateofPurchase] date NOT NULL,
	[B_CapacitySitting] tinyint NOT NULL,
	[B_CapacityStanding] tinyint  NOT NULL,
	CONSTRAINT PK_Bus PRIMARY KEY (B_ID)
);
GO

CREATE TABLE Advertiser(
	[Ad_ID] int identity(1,1) NOT NULL,
	[Ad_Name] nvarchar(200) NOT NULL,
	CONSTRAINT PK_Advertiser PRIMARY KEY (Ad_ID)
);
GO

CREATE TABLE PromoType(
	[PT_ID] int identity(1,1) NOT NULL,
	[PT_Name] nvarchar(100) NOT NULL,
	[PT_Description] nvarchar(500) NOT NULL,
	CONSTRAINT PK_PromoType PRIMARY KEY (PT_ID)
);
GO

CREATE TABLE Promotion(
	[Promotion_ID] int identity(1,1) NOT NULL,
	[Promotion_Ad] int NOT NULL,
	[Promotion_Type] int NOT NULL,
	[Promotion_Name] nvarchar(100) NOT NULL,
	CONSTRAINT PK_Promotion PRIMARY KEY (Promotion_ID),
	CONSTRAINT FK_Promotion_Ad FOREIGN KEY (Promotion_Ad) REFERENCES Advertiser(Ad_ID),
	CONSTRAINT FK_Promotion_Type FOREIGN KEY (Promotion_Type) REFERENCES PromoType(PT_ID)
);
GO

CREATE TABLE Promo_Bus(
	[Promo_ID] int identity(1,1) NOT NULL,
	[Promo_Promotion] int NOT NULL,
	[Promo_Bus] int NOT NULL,
	[Promo_From] date NOT NULL,
	[Promo_To] date NOT NULL,
	CONSTRAINT PK_Promos PRIMARY KEY (Promo_ID),
	CONSTRAINT FK_Bus FOREIGN KEY (Promo_Bus) REFERENCES Bus(B_ID) ON DELETE CASCADE,
	CONSTRAINT FK_PromoBus_Promotion FOREIGN KEY (Promo_Promotion) REFERENCES Promotion(Promotion_ID)
);
GO

CREATE TABLE Location(
	[L_ID] int identity(1,1) NOT NULL,
	[L_Type] tinyint NOT NULL,
	[L_Description] nvarchar(200) NOT NULL,
	[L_Status] tinyint NOT NULL,
	[L_DateAdded] datetime NOT NULL,
	CONSTRAINT PK_Location Primary Key (L_ID)
);
GO

CREATE TABLE Stop(
	[L_ID] int NOT NULL,
	[LS_Road] nvarchar(100) NOT NULL,
	[LS_X] decimal (10,5) NOT NULL,
	[LS_Y] decimal (10,5) NOT NULL,
	CONSTRAINT PK_Stop PRIMARY KEY (L_ID),
	CONSTRAINT FK_Stop_Location FOREIGN KEY (L_ID) REFERENCES Location(L_ID)
);
GO

CREATE TABLE Depot(
	[L_ID] int NOT NULL,
	[LD_Address] nvarchar(200) NOT NULL,
	CONSTRAINT PK_Depot PRIMARY KEY (L_ID),
	CONSTRAINT FK_Depot_Location FOREIGN KEY (L_ID) REFERENCES Location(L_ID)
);
GO

CREATE TABLE Maintainence(
	[M_ID] int identity(1,1) NOT NULL,
	[M_Bus] int NOT NULL,
	[M_Date] date NOT NULL,
	[M_Depot] int NOT NULL,
	[M_Comment] nvarchar(1000) NOT NULL,
	CONSTRAINT PK_Maintain PRIMARY KEY (M_ID),
	CONSTRAINT FK_Bus_Maintain FOREIGN KEY (M_Bus) REFERENCES Bus(B_ID) ON DELETE CASCADE,
	CONSTRAINT FK_Bus_Depot FOREIGN KEY (M_Depot) REFERENCES Depot(L_ID)
);
GO

CREATE TABLE Route(
	[R_ID] int identity(1,1) NOT NULL,
	[R_Code] nvarchar(20) NOT NULL,
	[R_Direction] tinyint NOT NULL,
	[R_StartTime] time NOT NULL,
	[R_EndTime] time NOT NULL,
	CONSTRAINT PK_Route PRIMARY KEY (R_ID)
);
GO

CREATE TABLE Route_Stop(
	[RS_ID] int identity(1,1) NOT NULL,
	[RS_Sequence] tinyint NOT NULL,
	[RS_Route] int NOT NULL,
	[RS_Stop] int  NOT NULL,
	[RS_Distance] decimal (38,3) NOT NULL,
	CONSTRAINT PK_Route_Stop PRIMARY KEY (RS_ID),
	CONSTRAINT FK_RS_Route FOREIGN KEY (RS_Route) REFERENCES Route(R_ID),
	CONSTRAINT FK_RS_Stop FOREIGN KEY (RS_Stop) REFERENCES Stop(L_ID)
);
GO

CREATE TABLE Service(
	[SV_ID] int identity(1,1) NOT NULL,
	[SV_ActiveDate] date NOT NULL DEFAULT GETDATE(),
	[SV_Bus] int NOT NULL,
	[SV_Route] int NOT NULL,
	CONSTRAINT PK_Service PRIMARY KEY (SV_ID),
	CONSTRAINT FK_Service_Route FOREIGN KEY (SV_Route) REFERENCES Route(R_ID),
	CONSTRAINT FK_Service_Bus FOREIGN KEY (SV_Bus) REFERENCES Bus(B_ID)
);
GO

CREATE TABLE Card(
	[Card_ID] int identity(1,1) NOT NULL,
	[Card_Issue] date NOT NULL,
	[Card_Expiry] date NOT NULL,
	[Card_Type] bit NOT NULL,
	CONSTRAINT PK_Card PRIMARY KEY (Card_ID),
);
GO

CREATE TABLE StudentPass(
	[Card_ID] int NOT NULL,
	[Pass_Owner] nvarchar(100) NOT NULL,
	CONSTRAINT PK_Pass PRIMARY KEY (Card_ID),
	CONSTRAINT FK_Pass FOREIGN KEY (Card_ID) REFERENCES Card(Card_ID)
);
GO

CREATE TABLE PayCard(
	[Card_ID] int NOT NULL,
	[PC_Balance] decimal (38, 3) NOT NULL,
	CONSTRAINT PK_PayCard PRIMARY KEY (Card_ID),
	CONSTRAINT FK_PayCard FOREIGN KEY (Card_ID) REFERENCES Card(Card_ID)
);
GO

CREATE TABLE Department(
	[Department_ID] int identity(1,1) NOT NULL,
	[Department_Name] nvarchar(100) NOT NULL,
	CONSTRAINT PK_Department PRIMARY KEY (Department_ID)
);
GO

CREATE TABLE Staff(
	[Staff_ID] int identity(1,1) NOT NULL,
	[Staff_Name_First] nvarchar(30) NOT NULL,
	[Staff_Name_Last] nvarchar(30) NOT NULL,
	[Staff_DOB] date NOT NULL,
	[Staff_Gender] bit NOT NULL,
	[Staff_Phone_Home] nvarchar(50) NOT NULL,
	[Staff_Phone_Mobile] nvarchar(50) NOT NULL,
	[Staff_Email] nvarchar(50) NOT NULL,
	[Staff_Address] nvarchar(100) NOT NULL,
	[Staff_Hire_Date] date NOT NULL,
	[Staff_Department] int NOT NULL,
	[Staff_Status] tinyint NOT NULL,
	CONSTRAINT PK_Staff PRIMARY KEY (Staff_ID),
	CONSTRAINT FK_Staff_Department FOREIGN KEY (Staff_Department) REFERENCES Department(Department_ID)
);
GO

CREATE TABLE Staff_Leave(
	[Leave_ID] int identity(1,1) NOT NULL,
	[Leave_Staff] int NOT NULL,
	[Leave_From] date NOT NULL,
	[Leave_Days] tinyint NOT NULL,
	[Leave_Reason] nvarchar(500) NOT NULL,
	CONSTRAINT PK_Staff_Leave PRIMARY Key (Leave_ID),
	CONSTRAINT FK_Leave_Staff FOREIGN KEY (Leave_Staff) REFERENCES Staff(Staff_ID)
);
GO

CREATE TABLE Staff_Salary(
	[Salary_ID] int identity(1,1) NOT NULL,
	[Salary_Staff] int NOT NULL,
	[Salary_SGD] bigint NOT NULL,
	[Salary_From] date NOT NULL,
	[Salary_To] date,
	CONSTRAINT PK_Salary PRIMARY KEY (Salary_ID),
	CONSTRAINT FK_Salary_Staff FOREIGN KEY (Salary_Staff) REFERENCES Staff(Staff_ID)
);
GO

CREATE TABLE Ref_JobTitle(
	[JT_ID] int identity(1,1) NOT NULL,
	[JT_Description] nvarchar(500) NOT NULL,
	CONSTRAINT PK_Ref_JobTitle PRIMARY KEY (JT_ID)
);
GO

CREATE TABLE Staff_JobTitle(
	[SJT_ID] int identity(1,1) NOT NULL,
	[SJT_Staff] int NOT NULL,
	[SJT_Title] int NOT NULL,
	[SJT_From] date NOT NULL,
	[SJT_To] date NOT NULL,
	CONSTRAINT PK_JobTitle PRIMARY KEY (SJT_ID),
	CONSTRAINT FK_Jobtitle_Staff FOREIGN KEY (SJT_Staff) REFERENCES Staff(Staff_ID),
	CONSTRAINT FK_JobTitle_Ref FOREIGN KEY (SJT_Title) REFERENCES Ref_JobTitle(JT_ID)
);
GO

CREATE TABLE Ref_Qualification(
	[Q_ID] int identity(1,1) NOT NULL,
	[Q_Name] nvarchar(100) NOT NULL,
	[Q_Description] nvarchar(500) NOT NULL,
	CONSTRAINT PK_QREF PRIMARY KEY (Q_ID)
);
GO

CREATE TABLE Staff_Qualification(
	[Staff_ID] int NOT NULL,
	[Qualification_ID] int NOT NULL,
	[Date_Obtained] date NOT NULL,
	CONSTRAINT PK_Qualification PRIMARY KEY (Staff_ID, Qualification_ID),
	CONSTRAINT FK_Qualification_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
	CONSTRAINT FK_Qualification_Qualification FOREIGN KEY (Qualification_ID) REFERENCES Ref_Qualification(Q_ID)
);
GO

CREATE TABLE Reporting(
	[R_ID] int identity(1,1) NOT NULL,
	[R_Staff] int NOT NULL,
	[R_Location] int NOT NULL,
	[R_From] date NOT NULL,
	[R_To] date NOT NULL,
	CONSTRAINT PK_Reporting PRIMARY KEY (R_ID),
	CONSTRAINT FK_Reporting_Staff FOREIGN KEY (R_Staff) REFERENCES Staff(Staff_ID),
	CONSTRAINT FK_Reporting_Locaiton FOREIGN KEY (R_Location) REFERENCES Depot(L_ID),
);
GO

CREATE TABLE Schedule( 
	[S_ID] int identity(1,1) NOT NULL,
	[S_Depature] smalldatetime NOT NULL,
	[S_Service] int NOT NULL,
	[S_Depot] int NOT NULL,
	[S_Driver] int NOT NULL,
	CONSTRAINT PK_Schedule PRIMARY KEY (S_ID),
	CONSTRAINT FK_Schedule_Service FOREIGN KEY (S_Service) REFERENCES Service(SV_ID),
	CONSTRAINT FK_Schedule_Driver FOREIGN KEY (S_Driver) REFERENCES Staff(Staff_ID),
	CONSTRAINT FK_Schedule_Depot FOREIGN KEY (S_Depot) REFERENCES Depot(L_ID)
);
GO

CREATE TABLE Bus_Analytics(
	[A_ID] int identity(1,1) NOT NULL,
	[A_Time] datetime DEFAULT GETDATE(),
	[A_Service] int NOT NULL,
	[A_Stop] int NOT NULL,
	[A_Onboard] smallint,
	[A_Embark] smallint,
	[A_Disembark] smallint,
	CONSTRAINT PK_Analytics PRIMARY KEY (A_ID),
	CONSTRAINT FK_Analytics_Service FOREIGN KEY (A_Service) REFERENCES Service(SV_ID),
	CONSTRAINT FK_Analytics_Stop FOREIGN KEY (A_Stop) REFERENCES Stop(L_ID)
);
GO

CREATE TABLE Trip(
	[T_ID] int identity(1,1) NOT NULL,
	[T_Card] int NOT NULL,
	[T_Service] int NOT NULL,
	[T_Stop] int NOT NULL,
	[T_EE] bit NOT NULL,
	[T_Time] datetime DEFAULT GETDATE(),
	[T_Fee] decimal (38, 2) DEFAULT '0.00',
	CONSTRAINT PK_Trip PRIMARY KEY (T_ID), 
	CONSTRAINT FK_Trip_Card FOREIGN KEY (T_Card) REFERENCES Card(Card_ID),
	CONSTRAINT FK_Trip_Service FOREIGN KEY (T_Service) REFERENCES Service(SV_ID),
	CONSTRAINT FK_Trip_Stop FOREIGN KEY (T_Stop) REFERENCES Stop(L_ID)
);
GO

CREATE TABLE Charter(
	[C_ID] int identity(1,1) NOT NULL,
	[C_DateTime] datetime NOT NULL,
	[C_To] nvarchar(100) NOT NULL,
	[C_From] nvarchar(100) NOT NULL,
	[C_Client] nvarchar(100) NOT NULL,
	[C_Remarks] nvarchar(500) NOT NULL,
	[C_Bus] int NOT NULL,
	[C_Driver] int NOT NULL,
	CONSTRAINT PK_Charter PRIMARY KEY (C_ID),
	CONSTRAINT FK_Charter_Bus FOREIGN KEY (C_Bus) REFERENCES Bus(B_ID),
	CONSTRAINT FK_Charter_Driver FOREIGN KEY (C_Driver) REFERENCES Staff(Staff_ID)
);
GO

CREATE INDEX Index_Bus		-- Create Index queries, indexed columns select faster at the cost of slower inserts
ON Bus (B_ID, B_License, B_Model, B_Manufacturer, B_DateofPurchase, B_CapacitySitting, B_CapacityStanding)
;
CREATE INDEX Index_Advertiser
ON Advertiser (Ad_ID, Ad_Name)
;
CREATE INDEX Index_PromoType
ON PromoType (PT_ID, PT_Name, PT_Description)
;
CREATE INDEX Index_Promotion
ON Promotion (Promotion_ID, Promotion_Name, Promotion_Ad, Promotion_Type)
;
CREATE INDEX Index_Promo_Bus
ON Promo_Bus (Promo_ID, Promo_Bus, Promo_Promotion, Promo_To, Promo_From)
;
CREATE INDEX Index_Location
ON Location (L_ID, L_Description, L_Status, L_Type)
;
CREATE INDEX Index_Stop
ON Stop (L_ID, LS_Road, LS_X, LS_Y)
;
CREATE INDEX Index_Depot
ON Depot (L_ID, LD_Address)
;
CREATE INDEX Index_Maintainence
ON Maintainence (M_ID, M_Bus, M_Date, M_Depot)
;
CREATE INDEX Index_Route
ON Route (R_ID, R_Code, R_Direction)
;
CREATE INDEX Index_Route_Stop
ON Route_Stop (RS_ID, RS_Sequence, RS_Route, RS_Stop, RS_Distance)
;
CREATE INDEX Index_Service
ON Service (SV_ID, SV_ActiveDate, SV_Bus, SV_Route)
;
CREATE INDEX Index_Charter
ON Charter (C_ID, C_DateTime, C_To, C_From, C_Client, C_Bus, C_Driver)
;
CREATE INDEX Index_Schedule
ON Schedule (S_ID, S_Service, S_Depot, S_Depature, S_Driver)
;
CREATE INDEX Index_Card
ON Card (Card_ID, Card_Issue, Card_Expiry, Card_Type)
;
CREATE INDEX Index_StudentPass
ON StudentPass (Card_ID, Pass_Owner)
;
CREATE INDEX Index_PayCard
ON PayCard (Card_ID, PC_Balance)
;
CREATE INDEX Index_Department
ON Department (Department_ID, Department_Name)
;
CREATE INDEX Index_Staff
ON Staff (Staff_ID, Staff_Name_First, Staff_Name_Last, Staff_DOB, Staff_Gender, Staff_Phone_Home, Staff_Phone_Mobile, Staff_Email, Staff_Address, Staff_Hire_Date, Staff_Department, Staff_Status)
;
CREATE INDEX Index_Staff_Leave
ON Staff_Leave (Leave_ID, Leave_Staff, Leave_Reason, Leave_Days, Leave_From)
;
CREATE INDEX Index_Staff_Salary
ON Staff_Salary (Salary_ID, Salary_Staff, Salary_SGD, Salary_To, Salary_From)
;
CREATE INDEX Index_Ref_JobTitle
ON Ref_JobTitle (JT_ID, JT_Description)
;
CREATE INDEX Index_Staff_JobTitle
ON Staff_JobTitle (SJT_ID, SJT_Staff, SJT_Title, SJT_To, SJT_From)
;
CREATE INDEX Index_Ref_Qualification
ON Ref_Qualification (Q_ID, Q_Name, Q_Description)
;
CREATE INDEX Index_Staff_Qualification	
ON Staff_Qualification (Staff_ID, Qualification_ID, Date_Obtained)
;
CREATE INDEX Index_Reporting	
ON Reporting (R_ID, R_Staff, R_Location, R_From, R_To)
;
CREATE INDEX Index_Trip
ON Trip (T_ID, T_Card, T_Stop, T_EE, T_Time, T_Fee)
;
