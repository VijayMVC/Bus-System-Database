/* 
Create Database Query for Emerging Database Technologies CIS3007-N Module ICA Task B
NAME: SI THU ZAW 	NRIC:	Teesside ID: T7177793	Batch Code: BTID11701A	Lecturer Name: Ms. Manian Latha
Management Development Institute of Singapore / Teesside University UK
*/

--Procedure executions for 'newstop' and 'newdepot' are in the file 'B2' as their records are necessary for other insert statements

-- Calls the 'newstudentpass' procedure to insert student bus passes to be used for trips

EXEC dbo.newstudentpass
		@ownerID				='ABC0001'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0002'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0003'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0004'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0005'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0006'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0007'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0008'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0009'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0010'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0011'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0012'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0013'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0014'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0015'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0016'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0017'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0018'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0019'
GO
EXEC dbo.newstudentpass
		@ownerID				='ABC0020'
GO


-- Calls the 'newpaycard' procedure to insert normal bus passes to be used for trips with their balance

EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
;
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='12.5'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO
EXEC dbo.newpaycard
		@startingbalance		='8.0'
GO


--Executes 'tripregister' and 'loganalytics' to simulate a few bus rides

EXEC dbo.tripregister
		@card			= 1,
		@stop			= 1,
		@service		= 1

EXEC dbo.tripregister
		@card			= 21,
		@stop			= 1,
		@service		= 1		

		
EXEC dbo.loganalytics
		@service		= 1,
		@stop			= 1
		
EXEC dbo.tripregister
		@card			= 21,
		@stop			= 6,
		@service		= 1
		
		
EXEC dbo.loganalytics
		@service		= 1,
		@stop			= 6
		
		
EXEC dbo.tripregister
		@card			= 1,
		@stop			= 8,
		@service		= 1

		
EXEC dbo.loganalytics
		@service		= 1,
		@stop			= 8
		
		
EXEC dbo.tripregister
		@card			= 5,
		@stop			= 4,
		@service		= 3

		
EXEC dbo.loganalytics
		@service		= 3,
		@stop			= 4
		
		
EXEC dbo.tripregister
		@card			= 25,
		@stop			= 5,
		@service		= 3

		
EXEC dbo.loganalytics
		@service		= 3,
		@stop			= 5
		
		
EXEC dbo.tripregister
		@card			= 5,
		@stop			= 9,
		@service		= 3

		
EXEC dbo.loganalytics
		@service		= 3,
		@stop			= 9
		
		
EXEC dbo.tripregister
		@card			= 25,
		@stop			= 10,
		@service		= 3

		
EXEC dbo.loganalytics
		@service		= 3,
		@stop			= 10
		
		
EXEC dbo.tripregister
		@card			= 31,
		@stop			= 3,
		@service		= 6

		
EXEC dbo.loganalytics
		@service		= 6,
		@stop			= 3
		
		
EXEC dbo.tripregister
		@card			= 31,
		@stop			= 7,
		@service		= 6

EXEC dbo.tripregister
		@card			= 1,
		@stop			= 7,
		@service		= 6

EXEC dbo.tripregister
		@card			= 2,
		@stop			= 7,
		@service		= 6

EXEC dbo.tripregister
		@card			= 23,
		@stop			= 7,
		@service		= 6

		
EXEC dbo.loganalytics
		@service		= 6,
		@stop			= 7
		
		
EXEC dbo.tripregister
		@card			= 1,
		@stop			= 2,
		@service		= 6

		
EXEC dbo.loganalytics
		@service		= 6,
		@stop			= 2
		
		
EXEC dbo.tripregister
		@card			= 2,
		@stop			= 1,
		@service		= 6

EXEC dbo.tripregister
		@card			= 23,
		@stop			= 1,
		@service		= 6
	
		
EXEC dbo.loganalytics
		@service		= 6,
		@stop			= 1
		
		
EXEC dbo.tripregister
		@card			= 7,
		@stop			= 9,
		@service		= 4

EXEC dbo.tripregister
		@card			= 24,
		@stop			= 9,
		@service		= 4

		
EXEC dbo.loganalytics
		@service		= 4,
		@stop			= 9
		
		
EXEC dbo.tripregister
		@card			= 7,
		@stop			= 3,
		@service		= 4
		
		
EXEC dbo.loganalytics
		@service		= 4,
		@stop			= 3
		
		
EXEC dbo.tripregister
		@card			= 24,
		@stop			= 2,
		@service		= 4
		