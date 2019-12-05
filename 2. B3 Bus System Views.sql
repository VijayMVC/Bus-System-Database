/* 
Create Database Query for Emerging Database Technologies CIS3007-N Module ICA Task B
NAME: SI THU ZAW 	NRIC:	Teesside ID: T7177793	Batch Code: BTID11701A	Lecturer Name: Ms. Manian Latha
Management Development Institute of Singapore / Teesside University UK
*/

USE [Uni_Bus];		-- Select database
GO

CREATE VIEW [Bus Stops] AS  -- Creates a view that can be called similarly to a table
SELECT 
Location.L_ID AS 'Location ID',
L_Description AS 'Description',
CASE L_Status WHEN 1 THEN 'Active' WHEN 0 THEN 'Inactive' END AS 'Current Status',
L_DateAdded AS 'Date Added',
LS_Road AS 'Road',
LS_X AS 'Location X Coordinates',
LS_Y AS 'Location Y Coordinates'
FROM 
(Location INNER JOIN Stop ON Location.L_ID = Stop.L_ID)
GO

CREATE VIEW [Depots] AS 
SELECT 
Location.L_ID AS 'Location ID',
L_Description AS 'Description',
CASE L_Status WHEN 1 THEN 'Active' WHEN 0 THEN 'Inactive' END AS 'Current Status',
L_DateAdded AS 'Date Added',
LD_Address AS 'Location Address'
FROM 
(Location INNER JOIN Depot ON Location.L_ID = Depot.L_ID);
GO

CREATE VIEW [Current Promotions] AS
SELECT
Promotion_ID AS 'Promotion ID',
PT_Name AS 'Promotion Type',
Ad_Name AS 'Advertiser',
Promotion_Name AS 'Promotion Name'
FROM
((Promotion INNER JOIN PromoType ON Promotion_Type = PT_ID)
INNER JOIN Advertiser ON Promotion_Ad = Ad_ID);
GO

CREATE VIEW [Staff Details] AS
SELECT
Staff_Name_First AS 'First Name',
Staff_Name_Last AS 'Last Name',
Department_Name AS 'Department',
JT_Description AS 'Job Title',
Staff_DOB AS 'Date of Birth',
CASE Staff_Gender WHEN 1 THEN 'Male' WHEN 0 THEN 'Female' END AS 'Staff Gender',
Staff_Phone_Home AS 'Home Phone',
Staff_Phone_Mobile AS 'Mobile Phone',
Staff_Email AS 'Email Address',
Salary_SGD AS 'Salary'
FROM
((((Staff INNER JOIN Department ON Staff_Department = Department_ID) 
INNER JOIN Staff_JobTitle ON SJT_Staff = Staff_ID)
INNER JOIN Ref_JobTitle ON SJT_Title = JT_ID)
INNER JOIN Staff_Salary ON Staff_ID = Salary_Staff);