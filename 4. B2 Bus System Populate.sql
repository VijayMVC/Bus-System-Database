/* 
Create Database Query for Emerging Database Technologies CIS3007-N Module ICA Task B
NAME: SI THU ZAW 	NRIC:	Teesside ID: T7177793	Batch Code: BTID11701A	Lecturer Name: Ms. Manian Latha
Management Development Institute of Singapore / Teesside University UK
*/

USE [Uni_Bus]; -- Selects the data to execute queries in
GO

-- Insert statements to populate the database

INSERT INTO Bus([B_License], [B_Model], [B_Manufacturer], [B_DateofPurchase], [B_CapacitySitting], [B_CapacityStanding])
VALUES
('QE736521','Citaro','Mercedes-Benz','2018-12-03', 31, 75),
('QO985478','Citaro','Mercedes-Benz','2018-07-16', 31, 75),
('DJ190505','Citaro','Mercedes-Benz','2019-02-21', 31, 75),
('KQ802011','Citaro','Mercedes-Benz','2018-11-18', 31, 75),
('IU905118','Citaro','Mercedes-Benz','2019-04-28', 31, 75),
('IU849712','Citaro','Mercedes-Benz','2018-09-17', 31, 75),
('FP891947','Citaro','Mercedes-Benz','2018-10-02', 31, 75),
('IF443388','Citaro','Mercedes-Benz','2018-11-20', 31, 75),
('UQ033844','Citaro','Mercedes-Benz','2018-10-22', 31, 75),
('KB273004','Citaro','Mercedes-Benz','2018-10-13', 31, 75),
('OM218520','Citaro','Mercedes-Benz','2019-04-21', 31, 75),
('ZO764051','Fuso Rosa','Mitsubishi Motors','2018-08-05', 18, 0),
('BP933666','Fuso Rosa','Mitsubishi Motors','2018-08-24', 18, 0),
('CT233332','ZK6122HD9','Yutong','2018-06-27', 46, 0),
('FB582285','ZK6122HD9','Yutong','2018-11-07', 46, 0)
;
GO

INSERT INTO Advertiser([Ad_Name])
VALUES
('Febreeze'),
('Coca Cola'),
('Pringles'),
('Circles.Life'),
('Universal Studios')
;
GO

INSERT INTO PromoType([PT_Name], [PT_Description])
VALUES
('Paper Hangers', 'A series of paper hangers placed on the top handrails of the bus that the passengers can take'),
('Small Interior Ad', 'Advertisments that can be placed along the top of side walls of bus. Has space for 4 per bus'),
('Large Interior Ad', 'Advertisments that can be placed on the large, visible side panel of wall. Has space for 1 per bus'),
('Typical Exterior Ad', 'Full vinyl coverage advertisments that can be applied to the exterior of a bus'),
('Atypical Exterior Ad', 'Similar to other exterior advertisments but with extensions such as 3 dimensional models that can be placed on bus roof. Limited to 1 meter in height')
;
GO

INSERT INTO Promotion([Promotion_Ad], [Promotion_Type], [Promotion_Name])
VALUES
(1, 1, 'Summer Promotion'),
(2, 2, 'Because you cannot think of anything else to drink'),
(3, 3, 'Once you pop, you cant stop'),
(4, 4, '20GB Mobile data for $20'),
(5, 5, 'Better with Friends')
;
GO

INSERT INTO Promo_Bus([Promo_Promotion], [Promo_Bus], [Promo_From], [Promo_To])
VALUES
(3,10,'2018-08-22','2018-07-05'),
(4,10,'2019-03-06','2020-04-09'),
(4,4,'2019-04-01','2018-12-07'),
(4,14,'2019-10-16','2020-07-18'),
(1,7,'2018-03-28','2019-04-15'),
(2,12,'2019-11-15','2020-06-16'),
(1,1,'2019-06-22','2020-03-16'),
(5,5,'2020-06-22','2019-08-10'),
(1,6,'2018-05-19','2020-08-01'),
(2,8,'2019-05-07','2019-08-07'),
(3,15,'2020-01-22','2019-10-17'),
(2,11,'2019-01-14','2019-01-05'),
(3,8,'2019-09-14','2019-08-11'),
(3,5,'2019-12-21','2018-11-11'),
(3,6,'2018-03-22','2019-11-21'),
(2,2,'2019-02-19','2019-05-24'),
(1,2,'2019-08-27','2018-07-09'),
(5,10,'2019-06-15','2020-11-12'),
(5,12,'2019-11-13','2020-01-20'),
(5,9,'2018-03-13','2020-04-29')
;
GO


-- Calls the 'newstop' procedure to insert bus stop locations into supertype and subtype tables

EXEC dbo.newstop
		@description			='Building 1',
		@road					='Tempor Road',
		@X_Coord				='-4.452',
		@Y_Coord				='-73.11045'
GO

EXEC dbo.newstop
		@description			='Building 2',
		@road					='Mus. Street',
		@X_Coord				='-18.30663',
		@Y_Coord				='55.2141'
GO

EXEC dbo.newstop
		@description			='Building 3',
		@road					='At St.',
		@X_Coord				='-33.70525',
		@Y_Coord				='-88.56533'
GO

EXEC dbo.newstop
		@description			='Building 4',
		@road					='Suspendisse Rd.',
		@X_Coord				='109.06053',
		@Y_Coord				='49.47992'
GO

EXEC dbo.newstop
		@description			='Building 5',
		@road					='A St.',
		@X_Coord				='49.60432',
		@Y_Coord				='22.26814'
GO

EXEC dbo.newstop
		@description			='Building 6',
		@road					='Eleifend, Avenue',
		@X_Coord				='-54.89987',
		@Y_Coord				='-21.08217'
GO

EXEC dbo.newstop
		@description			='Building 7',
		@road					='Nec, Av.',
		@X_Coord				='60.77428',
		@Y_Coord				='22.22452'
GO

EXEC dbo.newstop
		@description			='Building 8',
		@road					='Justo Street',
		@X_Coord				='-113.58967',
		@Y_Coord				='55.92479'
GO

EXEC dbo.newstop
		@description			='Building 9',
		@road					='Nunc Street',
		@X_Coord				='-84.9297',
		@Y_Coord				='-13.2545'
GO

EXEC dbo.newstop
		@description			='Building 10',
		@road					='Eget Rd.',
		@X_Coord				='65.09241',
		@Y_Coord				='-89.42535'
GO


-- Calls the 'newdepot' procedure to insert depot locations into supertype and subtype tables

EXEC dbo.newdepot
		@description			='Northeast Depot',
		@address				='445-1672 Ut Road'
GO

EXEC dbo.newdepot
		@description			='Downtown Depot',
		@address				='#126-1766 Ut Street'
GO
EXEC dbo.newdepot
		@description			='West Depot',
		@address				='689-8346 Ligula Av'
GO



INSERT INTO Maintainence([M_Bus], [M_Date], [M_Depot], [M_Comment])
VALUES
(15,'2019-05-30',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(13,'2019-08-21',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu'),
(10,'2018-10-25',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(13,'2019-09-02',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.'),
(11,'2019-09-06',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu'),
(1,'2020-03-27',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer'),
(14,'2019-09-14',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam'),
(3,'2018-02-26',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing'),
(9,'2019-10-12',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.'),
(14,'2019-04-25',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer'),
(3,'2019-03-29',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(14,'2020-04-08',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.'),
(4,'2020-03-18',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam'),
(12,'2020-03-15',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(13,'2019-10-29',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(8,'2019-09-08',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et'),
(12,'2019-09-28',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing'),
(15,'2019-03-29',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(11,'2019-12-15',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.'),
(14,'2018-01-09',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(1,'2018-09-02',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu'),
(11,'2019-09-09',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(15,'2019-10-04',13,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(7,'2020-02-06',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(13,'2018-07-08',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(14,'2019-11-03',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(12,'2020-04-25',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(11,'2019-07-04',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(14,'2019-07-21',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam'),
(4,'2019-09-12',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.')
;
GO

INSERT INTO Route([R_Code], [R_Direction], [R_StartTime], [R_EndTime])
VALUES
('A101', 0, '06:30:00', '21:00:00'),
('A101', 1, '06:30:00', '21:00:00'),
('B132', 0, '11:30:00', '21:00:00'),
('B132', 1, '11:30:00', '21:00:00'),
('C101', 0, '06:30:00', '18:00:00'),
('C101', 1, '06:30:00', '18:00:00')
;
GO

INSERT INTO Route_Stop([RS_Sequence], [RS_Route], [RS_Stop], [RS_Distance])
VALUES
(1, 1, 1, '0.0'),
(2, 1, 2, '0.7'),
(3, 1, 4, '1.2'),
(4, 1, 5, '2.1'),
(5, 1, 6, '2.9'),
(6, 1, 8, '3.3'),
(7, 1, 10, '4.3'),
(1, 2, 10, '0.0'),
(2, 2, 8, '1.3'),
(3, 2, 6, '1.7'),
(4, 2, 5, '2.5'),
(5, 2, 4, '3.4'),
(6, 2, 2, '3.9'),
(7, 2, 1, '0.0'),
(1, 3, 2, '0.8'),
(2, 3, 3, '1.7'),
(3, 3, 4, '2.5'),
(4, 3, 5, '2.8'),
(5, 3, 9, '3.2'),
(6, 3, 10,'4.0'),
(1, 4, 10, '0.0'),
(2, 4, 9, '0.8'),
(3, 4, 5, '1.2'),
(4, 4, 4, '1.5'),
(5, 4, 3, '2.3'),
(6, 4, 2, '3.2'),
(1, 5, 1, '0.0'),
(2, 5, 2, '0.4'),
(3, 5, 6, '0.8'),
(4, 5, 10, '1.2'),
(5, 5, 7, '1.6'),
(6, 5, 5, '2.0'),
(7, 5, 3, '2.4'),
(1, 6, 3, '0.0'),
(2, 6, 5, '0.4'),
(3, 6, 7, '0.8'),
(4, 6, 10, '1.2'),
(5, 6, 6, '1.6'),
(6, 6, 2, '2.0'),
(7, 6, 1, '2.4')
;
GO

INSERT INTO Service([SV_ActiveDate], [SV_Bus], [SV_Route])
VALUES
('2018-05-18',9,1),
('2018-12-10',9,2),
('2020-09-30',14,3),
('2019-02-20',3,4),
('2020-08-09',6,5),
('2019-11-08',1,6),
('2018-12-16',8,4),
('2019-11-08',13,6),
('2019-05-01',11,6),
('2020-07-31',5,3),
('2019-06-05',12,6),
('2018-12-08',9,2),
('2020-02-11',3,1),
('2019-03-02',12,1),
('2019-11-05',10,6),
('2018-10-18',6,5),
('2019-05-17',9,5),
('2019-10-20',12,5),
('2019-09-14',14,6),
('2020-08-28',1,4),
('2018-01-11',3,1),
('2019-08-31',1,2),
('2018-03-14',14,4),
('2018-10-30',6,6),
('2020-04-29',9,3),
('2018-01-06',15,5),
('2020-12-31',2,5),
('2020-02-24',9,3),
('2019-01-30',5,6),
('2020-07-26',3,4)
;
GO

INSERT INTO Department([Department_Name])
VALUES
('Drivers'),
('Human Resource'),
('Finance'),
('Reservations'),
('Maintainence')
;
GO

INSERT INTO Staff([Staff_Name_First],[Staff_Name_Last],[Staff_DOB],[Staff_Gender],[Staff_Phone_Home],[Staff_Phone_Mobile],[Staff_Email],[Staff_Address],[Staff_Hire_Date],[Staff_Department],[Staff_Status]) 
VALUES
('Allegra','Bennett','1987-11-13',0,'68525828','94955172','ipsum@afeugiat.co.uk','659-167 Nulla St.','2017-12-03',4,1),
('Maxwell','Reed','1984-07-26',0,'69497153','85652903','metus.Aenean.sed@eudolor.edu','124-2324 Lacus, St.','2015-07-13',5,1),
('Germane','Bishop','1992-04-18',1,'69427522','92512517','tellus.Phasellus.elit@aaliquet.org','332 Enim St.','2016-08-23',4,1),
('Lois','Evans','1996-01-22',1,'63730640','94336906','elit.Aliquam.auctor@miDuis.edu','P.O. Box 633, 5478 Sed Street','2016-06-14',3,1),
('Jesse','Perkins','1982-11-14',0,'61331510','88464863','ut.nisi.a@porttitorerosnec.co.uk','Ap #587-5915 Tortor, Rd.','2015-09-05',4,1),
('Desirae','Paul','1981-07-21',1,'64380942','80363612','ac.arcu.Nunc@liberoInteger.co.uk','P.O. Box 264, 7790 Feugiat Ave','2017-05-15',1,1),
('Peter','England','1980-06-28',0,'67705927','84082079','ut.molestie@cursus.com','738-2363 Et Rd.','2017-05-29',3,1),
('Cyrus','Dalton','1981-03-21',0,'65697597','90908487','non@acmattis.com','230-3294 Justo Avenue','2017-06-11',4,1),
('Elliott','Garner','1980-06-19',1,'64613522','99919858','tempor.bibendum@sedliberoProin.co.uk','Ap #309-139 Amet Rd.','2015-08-08',3,1),
('Vera','Klein','1994-10-29',0,'67105309','93576764','pede.ac.urna@ami.net','Ap #782-8011 Vitae, Ave','2015-04-04',1,1),
('Magee','Sellers','1991-04-12',0,'68653539','83141042','pede.ac.urna@risusDonecegestas.org','4691 Ut Rd.','2018-05-09',2,1),
('Inez','Gallegos','1983-06-30',0,'64348216','92382775','Quisque@ultricesposuere.ca','569-7070 Etiam Road','2018-07-23',2,1),
('Walker','Simon','1999-02-07',0,'68086137','92563440','magnis.dis@scelerisqueduiSuspendisse.edu','Ap #757-1269 Pellentesque Rd.','2018-06-20',3,1),
('Rosalyn','Chen','1985-03-04',1,'64056815','86769169','magnis.dis.parturient@sedorci.edu','Ap #598-9845 Etiam St.','2016-09-26',1,1),
('Pearl','Cantrell','1992-08-31',0,'62318896','99857076','Praesent@tristiqueneque.co.uk','Ap #615-8048 In Road','2018-10-20',3,1),
('Lavinia','Rutledge','1991-10-27',1,'62544997','96593586','at@nisl.edu','P.O. Box 887, 4854 Fermentum St.','2015-03-25',2,1),
('Rhona','James','1987-07-04',0,'68710049','84439000','penatibus.et@mi.ca','Ap #155-9867 Libero Ave','2018-03-03',2,1),
('Brenda','Chavez','1985-08-30',0,'66005643','99364432','ornare.placerat@lacus.net','8390 Donec Street','2016-06-15',1,1),
('Cynthia','Gonzales','1996-01-08',0,'66954739','85802047','natoque.penatibus@duiCum.net','Ap #311-6095 Mi Street','2016-02-24',2,1),
('Gloria','Mcguire','1988-07-28',1,'65557892','96123727','vulputate.ullamcorper@et.net','2946 Orci Avenue','2015-06-23',4,1),
('Abra','Mann','1992-10-20',0,'68400506','93099108','diam@orcisem.net','Ap #808-7316 Metus Avenue','2015-12-07',3,1),
('Marcia','Hansen','1985-11-27',1,'67958212','95344025','odio.sagittis@risusDonec.org','7018 Id Rd.','2016-11-30',4,1),
('Nerea','Hood','1998-08-17',1,'61287036','80223010','convallis.dolor@quam.org','P.O. Box 531, 3760 At, St.','2018-10-06',3,1),
('Callum','Hayden','1991-05-03',1,'68683252','91205434','molestie@diamSeddiam.net','P.O. Box 541, 2808 Rutrum Av.','2015-08-16',5,1),
('Elaine','Hodges','1981-02-18',1,'60998380','99174780','dictum.eleifend@Donectempus.net','Ap #612-1135 Maecenas Rd.','2016-05-21',3,1),
('Brent','Morgan','1985-12-21',0,'63460653','91974148','lorem.eu.metus@tristique.org','9903 Imperdiet Rd.','2015-07-23',5,1),
('Dakota','Wooten','1993-12-09',1,'61065302','93340378','dui@adipiscingnonluctus.org','4211 Elit. Avenue','2015-09-25',3,1),
('Brett','Murray','1981-03-04',1,'63623702','88895443','accumsan.interdum@Nuncquis.org','7323 Posuere Rd.','2018-08-25',4,1),
('Acton','Alvarado','1981-01-16',1,'64741338','89852186','Morbi.vehicula@ipsumcursusvestibulum.org','Ap #669-6197 Netus Rd.','2015-09-29',5,1),
('Melanie','Jones','1993-02-18',1,'66428255','90130483','Etiam@gravida.edu','224-5427 Nulla Street','2016-02-09',1,1),
('Noble','Joyner','1982-08-11',1,'62236205','85954835','semper.rutrum@enimcondimentumeget.org','P.O. Box 697, 2673 Risus. St.','2017-01-18',5,1),
('Dennis','Buck','1998-05-26',0,'66340037','94568722','nulla.In@velitegetlaoreet.org','P.O. Box 976, 4580 Fusce Av.','2017-01-18',5,1),
('Lacy','Love','1999-11-26',0,'66947993','85209443','eu.odio.tristique@Pellentesquehabitantmorbi.com','Ap #546-9505 Fames Avenue','2018-07-24',5,1),
('Anjolie','Summers','1982-08-05',1,'64141927','95953992','Suspendisse.aliquet@scelerisquedui.org','Ap #762-761 Est, Street','2015-02-25',4,1),
('Leandra','Warren','1983-02-12',1,'69275037','94640932','elementum.sem@Integerurna.co.uk','5043 Tincidunt. Ave','2017-10-19',5,1),
('Diana','Dickson','1994-12-21',0,'61880553','90023183','faucibus.leo@molestiesodalesMauris.edu','185-945 Eu, Rd.','2018-10-08',5,1),
('Kirestin','Hendrix','1997-11-10',1,'63537164','90618967','dui.Fusce@ornaresagittisfelis.org','1114 Donec St.','2016-03-18',2,1),
('Branden','Harding','1994-08-24',0,'66019202','85048897','nec.tempus.mauris@Curabiturvellectus.com','Ap #893-2460 Donec Rd.','2015-10-19',2,1),
('Emmanuel','Kramer','1994-12-31',1,'60005644','96566315','non.lobortis.quis@nec.org','P.O. Box 875, 8965 Risus, Avenue','2017-03-31',2,1),
('Jordan','Fletcher','1993-06-22',0,'67191732','99147647','sodales.at@etarcu.edu','P.O. Box 485, 6723 Accumsan Rd.','2015-03-31',3,1),
('Rahim','Logan','1982-11-19',1,'64949539','85760231','Sed.diam@liberoDonecconsectetuer.co.uk','701-2475 Proin Street','2017-10-01',2,1),
('Ayanna','Velez','1992-05-07',0,'61112732','92151728','pharetra.Nam@risusa.ca','Ap #312-8861 Curae; St.','2018-10-29',3,1),
('Riley','Murphy','1996-05-27',0,'69149678','82275500','pretium@Aenean.org','P.O. Box 321, 4692 Blandit Ave','2016-04-24',5,1),
('Victor','Baker','1989-12-22',1,'63495185','94549286','fringilla@sagittisfelisDonec.edu','521-8239 Quisque St.','2015-07-12',5,1),
('Lamar','Ramirez','1999-09-24',1,'61383278','80604177','erat.vel@idante.net','631-6408 Libero. St.','2015-01-29',4,1),
('Wyatt','Hoffman','1989-03-24',0,'63772355','94790697','fermentum.arcu.Vestibulum@vitaevelitegestas.com','199-8718 Interdum. Street','2017-10-16',4,1),
('Lane','Hamilton','1999-07-09',0,'61664715','92513107','Curae@luctusetultrices.net','1728 Sed St.','2016-09-06',5,1),
('Odysseus','Guerra','1982-03-26',0,'69897160','80958173','tortor.dictum@erat.com','P.O. Box 635, 2317 Egestas. Ave','2015-12-19',3,1),
('Portia','Simon','1988-12-02',0,'65077676','94120984','dui@enimCurabitur.ca','P.O. Box 682, 1610 Augue Rd.','2017-08-09',4,1),
('Linda','Clemons','1984-07-15',0,'60794524','96337647','magna.sed.dui@fermentumvelmauris.net','8083 Massa. Street','2017-07-18',4,1)
;
GO

INSERT INTO Staff_Leave([Leave_Staff],[Leave_From],[Leave_Days],[Leave_Reason]) 
VALUES
(23,'2018-04-22',7,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(34,'2017-12-30',14,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer'),
(12,'2015-06-23',6,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(5,'2018-08-07',10,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(41,'2016-07-19',2,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing'),
(17,'2016-03-09',9,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.'),
(22,'2016-12-30',1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et'),
(34,'2018-10-16',11,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(3,'2018-04-08',1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed'),
(16,'2018-09-08',9,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam'),
(10,'2016-09-01',4,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing'),
(17,'2015-08-21',14,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu'),
(17,'2015-09-10',14,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et'),
(14,'2016-04-02',6,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut'),
(47,'2016-06-27',12,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec'),
(43,'2016-01-08',1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.'),
(37,'2017-09-27',1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu'),
(1,'2018-06-02',4,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et'),
(14,'2016-09-05',5,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et'),
(41,'2017-01-19',14,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et')
;
GO

INSERT INTO Staff_Salary([Salary_Staff],[Salary_SGD],[Salary_From],[Salary_To]) VALUES
(1,3574,'2020-01-31','2018-12-07'),
(2,7407,'2020-04-24','2019-01-19'),
(3,7014,'2019-05-23','2018-07-04'),
(4,6888,'2018-11-04','2019-02-27'),
(5,7576,'2018-06-10','2019-06-17'),
(6,6314,'2018-11-09','2018-08-20'),
(7,4466,'2018-08-10','2019-11-11'),
(8,7008,'2019-10-16','2018-09-09'),
(9,3062,'2019-07-18','2019-05-20'),
(10,7767,'2019-05-28','2018-09-24'),
(11,5067,'2018-07-31','2019-11-01'),
(12,4428,'2019-07-17','2020-02-16'),
(13,3907,'2019-12-27','2019-02-21'),
(14,7383,'2019-08-30','2020-03-16'),
(15,5464,'2018-11-08','2019-03-22'),
(16,7092,'2018-11-18','2019-01-30'),
(17,3337,'2019-12-07','2018-12-17'),
(18,7213,'2019-11-15','2020-04-10'),
(19,6533,'2019-03-23','2020-01-29'),
(20,3341,'2020-01-05','2019-03-08'),
(21,4681,'2018-09-25','2018-05-02'),
(22,6122,'2019-01-09','2019-08-18'),
(23,3262,'2019-09-16','2019-06-13'),
(24,7686,'2019-08-15','2020-02-29'),
(25,7658,'2020-03-24','2019-01-24'),
(26,3386,'2020-04-23','2020-01-06'),
(27,6390,'2018-07-12','2018-07-30'),
(28,2290,'2019-02-18','2018-05-23'),
(29,5996,'2018-07-13','2019-04-16'),
(30,3336,'2018-07-27','2019-10-17'),
(31,4884,'2018-10-04','2020-03-22'),
(32,7498,'2019-09-05','2018-10-06'),
(33,4287,'2018-10-14','2020-03-27'),
(34,7967,'2019-12-29','2019-01-28'),
(35,6847,'2018-11-01','2019-08-28'),
(36,7264,'2020-03-02','2018-05-26'),
(37,6930,'2018-09-11','2019-10-18'),
(38,2746,'2018-11-16','2020-01-08'),
(39,6624,'2019-02-13','2020-02-19'),
(40,6846,'2018-11-17','2018-07-09'),
(41,3443,'2019-07-15','2018-11-08'),
(42,4481,'2019-02-26','2020-01-01'),
(43,7367,'2019-11-16','2019-07-11'),
(44,6536,'2020-02-18','2018-10-31'),
(45,3565,'2019-06-21','2020-02-27'),
(46,3040,'2019-07-15','2018-10-01'),
(47,5053,'2019-08-21','2019-05-10'),
(48,4098,'2020-04-10','2020-02-10'),
(49,4762,'2019-03-13','2019-04-07'),
(50,6342,'2019-06-07','2020-04-15')
;
GO

INSERT INTO Ref_JobTitle([JT_Description])
VALUES
('Drivers'),
('Accountant'),
('Mechanic'),
('Receptionist'),
('Supervisor'),
('Route Manager'),
('Scheduler')
;
GO

INSERT INTO Staff_JobTitle ([SJT_Staff], [SJT_Title], [SJT_From], [SJT_To])
VALUES
(1,3,'2019-03-08','2020-02-20'),
(2,1,'2019-04-22','2019-04-27'),
(3,4,'2020-04-16','2020-04-20'),
(4,1,'2019-01-21','2018-05-07'),
(5,7,'2019-09-14','2018-12-19'),
(6,2,'2019-01-22','2019-04-13'),
(7,1,'2019-04-24','2019-08-19'),
(8,2,'2019-05-23','2018-09-24'),
(9,4,'2019-07-23','2019-05-07'),
(10,6,'2019-11-26','2019-08-29'),
(11,1,'2019-05-11','2019-09-17'),
(12,4,'2018-04-05','2018-07-28'),
(13,2,'2018-09-25','2018-05-11'),
(14,3,'2018-01-02','2019-08-04'),
(15,4,'2020-02-28','2020-04-20'),
(16,5,'2018-06-12','2019-05-17'),
(17,7,'2020-04-22','2019-01-15'),
(18,6,'2019-06-09','2019-09-05'),
(19,4,'2018-11-15','2019-05-29'),
(20,7,'2019-09-06','2019-02-24'),
(21,4,'2018-07-02','2020-03-26'),
(22,4,'2020-02-29','2019-09-26'),
(23,1,'2019-07-12','2019-09-23'),
(24,5,'2019-03-19','2020-02-03'),
(25,5,'2019-05-26','2018-12-24'),
(26,3,'2019-06-03','2018-07-01'),
(27,2,'2018-01-23','2019-03-11'),
(28,5,'2018-09-15','2019-11-30'),
(29,2,'2019-10-09','2020-01-28'),
(30,4,'2020-04-13','2019-07-09'),
(31,1,'2019-03-14','2020-03-13'),
(32,7,'2019-07-25','2019-08-19'),
(33,3,'2019-10-13','2019-08-30'),
(34,1,'2020-02-13','2019-08-16'),
(35,3,'2019-04-02','2018-05-18'),
(36,7,'2018-04-13','2018-10-31'),
(37,7,'2018-04-22','2019-07-13'),
(38,4,'2019-09-24','2018-09-22'),
(39,7,'2018-02-16','2019-09-05'),
(40,1,'2018-04-05','2018-05-25'),
(41,4,'2019-10-29','2019-08-07'),
(42,3,'2018-01-24','2019-06-20'),
(43,6,'2020-04-30','2019-02-26'),
(44,3,'2018-12-25','2019-05-29'),
(45,2,'2018-09-28','2018-06-09'),
(46,4,'2019-04-14','2018-05-24'),
(47,6,'2019-03-25','2019-09-17'),
(48,3,'2020-04-11','2019-04-04'),
(49,5,'2018-10-19','2020-04-22'),
(50,1,'2019-11-26','2018-07-30')
;
GO

INSERT INTO Ref_Qualification([Q_Name], [Q_Description])
VALUES
('Class 3 Driving License', ''),
('Class 4 Driving License', 'License for heavy motor vehicles of unladen weight exceeding 2500 kg which are constructed to carry load or passengers'),
('Class 4A Driving License', 'License specific for passenger buses. Persons must be working for a public bus company as a Bus Captain. Licence will be revoked once he/she leaves the company.'),
('Accounting Degree', 'For accounting positions'),
('Automotive Engineering Diploma', 'For vehicle maintainence positoins'),
('Management Qualifications', 'For management positions')
;
GO

INSERT INTO Staff_Qualification([Staff_ID],[Qualification_ID],[Date_Obtained]) 
VALUES
(1,3,'2016-07-10'),
(2,1,'2014-10-12'),
(3,4,'2015-10-06'),
(4,2,'2013-09-05'),
(5,5,'2015-07-02'),
(6,4,'2013-06-20'),
(7,6,'2013-04-11'),
(8,2,'2016-12-12'),
(9,3,'2016-06-23'),
(10,3,'2014-06-07'),
(11,5,'2016-11-27'),
(12,2,'2015-04-20'),
(13,6,'2017-03-12'),
(14,5,'2016-09-21'),
(15,4,'2014-07-24'),
(16,6,'2013-04-03'),
(17,5,'2016-11-18'),
(18,6,'2014-08-17'),
(19,2,'2014-10-07'),
(20,1,'2016-11-08'),
(21,2,'2017-02-28'),
(22,4,'2013-05-26'),
(23,3,'2015-04-13'),
(24,4,'2014-11-27'),
(25,2,'2016-10-21'),
(26,2,'2015-02-10'),
(27,5,'2013-11-30'),
(28,5,'2013-04-25'),
(29,3,'2013-11-12'),
(30,5,'2017-03-07'),
(31,1,'2017-04-13'),
(32,4,'2013-06-02'),
(33,5,'2015-07-01'),
(34,1,'2013-09-09'),
(35,5,'2014-12-18'),
(36,2,'2013-09-09'),
(37,5,'2015-01-19'),
(38,6,'2015-12-15'),
(39,2,'2014-03-15'),
(40,6,'2016-04-20'),
(41,1,'2016-06-23'),
(42,4,'2014-05-20'),
(43,3,'2017-04-12'),
(44,6,'2016-11-09'),
(45,3,'2013-05-13'),
(46,2,'2014-08-15'),
(47,5,'2015-09-18'),
(48,3,'2015-09-23'),
(49,1,'2015-07-19'),
(50,6,'2014-02-15')
;
GO

INSERT INTO Reporting ([R_Staff], [R_Location], [R_From], [R_To])
VALUES
(1,13,'2018-01-11','2020-02-13'),
(2,12,'2019-07-07','2020-01-27'),
(3,13,'2018-10-14','2019-09-05'),
(4,13,'2019-05-14','2019-04-09'),
(5,13,'2018-04-02','2018-10-07'),
(6,11,'2018-05-09','2019-11-22'),
(7,13,'2019-09-29','2018-05-26'),
(8,12,'2019-01-04','2019-09-23'),
(9,13,'2019-07-18','2020-01-16'),
(10,12,'2018-01-03','2018-10-20'),
(11,11,'2019-09-08','2020-02-13'),
(12,12,'2019-03-21','2020-01-14'),
(13,13,'2020-04-13','2019-08-08'),
(14,13,'2019-03-26','2018-12-26'),
(15,13,'2019-01-20','2020-04-12'),
(16,11,'2018-04-02','2020-02-02'),
(17,12,'2018-07-13','2020-04-21'),
(18,13,'2019-03-24','2018-12-21'),
(19,12,'2019-08-10','2019-03-31'),
(20,13,'2019-07-27','2019-03-13'),
(21,11,'2019-09-23','2020-02-21'),
(22,11,'2018-11-09','2019-04-29'),
(23,11,'2019-11-05','2019-09-03'),
(24,11,'2019-02-09','2019-02-03'),
(25,11,'2018-04-08','2019-02-10'),
(26,13,'2020-04-25','2018-06-06'),
(27,11,'2019-08-28','2019-02-09'),
(28,11,'2020-03-17','2019-12-27'),
(29,11,'2019-08-13','2019-05-09'),
(30,12,'2018-04-14','2018-10-16'),
(31,12,'2018-06-14','2019-02-18'),
(32,13,'2018-07-22','2018-11-17'),
(33,12,'2019-09-27','2019-10-11'),
(34,11,'2019-08-01','2018-05-30'),
(35,12,'2019-02-15','2019-04-03'),
(36,13,'2019-08-07','2019-05-02'),
(37,12,'2018-11-10','2019-02-11'),
(38,11,'2019-11-11','2019-04-04'),
(39,12,'2019-12-16','2020-02-29'),
(40,11,'2019-02-25','2018-07-03'),
(41,11,'2018-01-09','2019-11-08'),
(42,13,'2018-03-10','2019-06-10'),
(43,11,'2018-01-20','2019-01-07'),
(44,13,'2020-03-05','2019-03-07'),
(45,13,'2018-02-11','2019-11-21'),
(46,13,'2020-02-08','2019-09-26'),
(47,13,'2018-04-10','2020-04-16'),
(48,13,'2018-05-01','2019-01-23'),
(49,11,'2018-05-06','2018-09-28'),
(50,13,'2018-03-10','2018-08-04')
;
GO

INSERT INTO Schedule ([S_Depature], [S_Service], [S_Depot], [S_Driver])
VALUES
('2018-06-10',17,13,18),
('2019-07-30',14,11,50),
('2018-06-30',8,12,27),
('2018-07-25',25,13,39),
('2019-06-02',7,12,2),
('2018-05-29',12,12,22),
('2018-11-17',10,11,27),
('2019-06-23',5,11,11),
('2019-11-05',4,11,46),
('2018-10-18',5,11,25),
('2019-02-05',27,11,17),
('2020-02-08',18,13,41),
('2018-12-09',11,12,41),
('2019-05-22',14,11,24),
('2020-02-02',29,12,15),
('2020-02-04',2,11,44),
('2019-07-19',13,12,7),
('2018-07-15',12,13,4),
('2019-06-05',26,13,10),
('2020-03-29',6,12,13),
('2018-12-14',18,11,5),
('2020-02-27',20,11,34),
('2019-02-03',30,13,2),
('2018-07-12',14,11,22),
('2018-10-03',12,11,46),
('2018-12-04',14,11,34),
('2020-02-04',13,13,2),
('2019-02-08',5,12,1),
('2018-11-05',27,13,31),
('2018-09-11',7,13,39)
;
GO

INSERT INTO Charter([C_DateTime],[C_To],[C_From],[C_Client],[C_Remarks],[C_Bus],[C_Driver]) 
VALUES
('2019-06-16','4579 Phasellus St.','Ap #445-7330 Sit Av.','Nulla Inc.','Lorem ipsum dolor sit amet,',5,6),
('2019-09-18','5475 In Ave','Ap #373-2307 At, Rd.','Dis Parturient Montes Industries','Lorem ipsum dolor sit amet, consectetuer adipiscing',8,49),
('2019-05-06','Ap #975-9639 Porttitor Av.','P.O. Box 888, 1436 Sem Road','Purus Limited','Lorem ipsum dolor sit',13,48),
('2018-05-17','1955 Suspendisse Street','614-8474 Scelerisque, Av.','Nec Leo Corporation','Lorem ipsum dolor sit amet, consectetuer',10,23),
('2018-07-18','370-6362 Odio. Rd.','Ap #259-9157 Tellus St.','Nec Diam LLC','Lorem ipsum dolor sit amet, consectetuer',3,26),
('2020-02-01','2601 Duis St.','P.O. Box 786, 2236 Non, Av.','Convallis Ante PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',4,8),
('2019-02-10','P.O. Box 909, 4338 Fringilla St.','P.O. Box 949, 797 Egestas. St.','Dolor Quam Elementum Institute','Lorem ipsum dolor sit',3,36),
('2020-03-13','P.O. Box 966, 8531 Nunc Rd.','2566 Sed Rd.','Id Erat Etiam LLC','Lorem ipsum dolor sit',14,23),
('2018-02-08','P.O. Box 231, 2013 Non, St.','Ap #604-8488 In St.','Semper Pretium Neque Corporation','Lorem ipsum dolor',9,28),
('2020-02-15','2268 Sociis Av.','8372 Varius St.','Elit Dictum LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',11,6),
('2019-12-18','Ap #371-9832 Sollicitudin Road','P.O. Box 553, 9623 Auctor St.','Ut LLC','Lorem ipsum dolor sit amet, consectetuer',11,26),
('2018-01-06','6807 Vestibulum Rd.','5410 Euismod St.','Commodo Ltd','Lorem ipsum dolor',14,31),
('2018-11-12','889-8715 Felis St.','761 Felis St.','Orci Lacus Vestibulum Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing',14,28),
('2018-03-21','Ap #397-3200 Tellus. Av.','P.O. Box 200, 8391 Leo, St.','Vehicula Et Rutrum Foundation','Lorem',13,13),
('2018-01-11','Ap #979-9876 Pellentesque Rd.','7567 Cras Road','Lorem Auctor Inc.','Lorem',8,33),
('2019-02-01','P.O. Box 345, 5061 Cras Rd.','6892 Cursus Road','Hendrerit Id Ante Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',14,14),
('2018-08-14','4192 Euismod Ave','Ap #103-1923 Vel, Road','Dui Nec Company','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',6,32),
('2019-04-10','Ap #236-9253 Nisi Rd.','388-4729 Tortor. Rd.','Ultrices Consulting','Lorem',8,22),
('2019-12-06','6977 Imperdiet Rd.','630-3475 Et Avenue','Pede Ac Industries','Lorem ipsum dolor sit amet,',3,25),
('2019-07-15','265-9266 Cursus Ave','P.O. Box 344, 7546 Cursus Ave','Porttitor Vulputate Company','Lorem ipsum dolor sit amet, consectetuer',13,27),
('2020-04-04','P.O. Box 351, 5603 Nam Av.','5016 Magna. St.','Aliquam Enim Corporation','Lorem ipsum dolor sit amet,',10,6),
('2019-01-23','P.O. Box 867, 6851 Tempus Rd.','483-2890 At Road','Mauris Vestibulum Neque LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',2,9),
('2019-10-30','Ap #556-9818 Ullamcorper, St.','9973 Cursus Av.','Egestas Incorporated','Lorem ipsum dolor',7,37),
('2018-02-09','1554 Fermentum Road','2494 Neque Rd.','Imperdiet Erat Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',7,30),
('2018-06-10','900-9693 Ante Road','779-6668 Sit Road','Nibh Company','Lorem',12,14),
('2018-05-02','9473 Ipsum. Rd.','328-1912 Egestas St.','Ornare Egestas Ligula Industries','Lorem ipsum',7,36),
('2018-05-10','Ap #858-438 Dolor, Rd.','625-8261 Tempor St.','Quisque Porttitor Eros Inc.','Lorem ipsum',15,23),
('2018-05-24','293-6697 Mauris Rd.','P.O. Box 106, 2004 In Rd.','Massa Rutrum Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',9,11),
('2019-08-11','808-1802 Suspendisse Av.','P.O. Box 838, 1274 Quis Road','Eget Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',14,4),
('2019-04-22','991-1651 Vulputate Rd.','547-506 Metus. Rd.','Etiam Laoreet Libero Ltd','Lorem',1,4)
;
GO
		

