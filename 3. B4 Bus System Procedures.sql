/* 
Create Database Query for Emerging Database Technologies CIS3007-N Module ICA Task B
NAME: SI THU ZAW 	NRIC:	Teesside ID: T7177793	Batch Code: BTID11701A	Lecturer Name: Ms. Manian Latha
Management Development Institute of Singapore / Teesside University UK
*/

USE [Uni_Bus];		-- Select database
GO

CREATE PROCEDURE dbo.newstudentpass   --Creates new procedure
		@ownerID			nvarchar(20) = NULL,  -- creates enterable variables and datatypes
		@DATE				datetime = NULL,
		@EXPIRY				datetime = NULL,
		@ID					int = NULL
AS
BEGIN
BEGIN TRANSACTION   
	BEGIN TRY		
		SET NOCOUNT ON
		SET @DATE = GETDATE();     
		SET @EXPIRY = DATEADD(month, 3, @DATE)  --calculates a 3 month expiry date from creation date
		INSERT INTO dbo.Card   -- inserts record into Card, a supertype table
				(
				Card_Issue,
				Card_Expiry,
				Card_Type
			)
			VALUES
			(
				@DATE,
				@EXPIRY,
				1				
			);
		SET @ID = SCOPE_IDENTITY();  -- takes the ID value of last inserted record
		INSERT INTO dbo.StudentPass  -- inserts record into StudentPass, a subtype table with same primary key 
			(
				Card_ID,
				Pass_Owner
			)
			VALUES
			(
				@ID,
				@ownerID
			);
		COMMIT TRANSACTION  -- commits the transaction
	END TRY  
	BEGIN CATCH  -- begins if commit transaction fails
		SELECT ERROR_MESSAGE()'Error encountered. Transaction not committed';  --selects error message
		ROLLBACK TRANSACTION
	END CATCH
END
GO

--similar procedure to 'newstudentpass' except with different type value
CREATE PROCEDURE dbo.newpaycard
		@startingbalance	decimal = NULL,
		@DATE				datetime = NULL,
		@EXPIRY				datetime = NULL,
		@ID					int = NULL
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
		SET @DATE = GETDATE();
		SET @EXPIRY = DATEADD(month, 3, @DATE)
		INSERT INTO dbo.Card
			(
				Card_Issue,
				Card_Expiry,
				Card_Type
			)
			VALUES
			(
				@DATE,
				@EXPIRY,
				0
			);
		SET @ID = SCOPE_IDENTITY();
		INSERT INTO dbo.PayCard
			(
				Card_ID,
				PC_Balance
			)
			VALUES
			(
				@ID,
				@startingbalance
			);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()'Error encountered. Transaction not committed';
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE dbo.newstop
		@description			nvarchar(200) = NULL,
		@road					nvarchar(100) = NULL,
		@X_Coord				decimal (38, 5) = NULL,
		@Y_Coord				decimal (38, 5) = NULL,
		@DATE					datetime = NULL,
		@ID						int = NULL
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
		SET @DATE = GETDATE();
		INSERT INTO dbo.Location
			(
				L_Type,
				L_Description,
				L_Status,
				L_DateAdded
			)
			VALUES
			(
				'0',
				@description,
				'1',
				@DATE
			);
		SET @ID = SCOPE_IDENTITY();	
		INSERT INTO dbo.Stop
			(
				L_ID,
				LS_Road,
				LS_X,
				LS_Y
			)
			VALUES
			(
				@ID,
				@road,
				@X_Coord,
				@Y_Coord
			);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()'Error encountered. Transaction not committed';
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE dbo.newdepot
		@description			nvarchar(200) = NULL,
		@address				nvarchar(200) = NULL,
		@DATE					datetime = NULL,
		@ID						int = NULL
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
		SET @DATE = GETDATE();
		INSERT INTO dbo.Location
			(
				L_Type,
				L_Description,
				L_Status,
				L_DateAdded
			)
			VALUES
			(
				'1',
				@description,
				'1',
				@DATE
			);
		SET @ID = SCOPE_IDENTITY();	
		INSERT INTO dbo.depot
			(
				L_ID,
				LD_Address
			)
			VALUES
			(
				@ID,
				@address
			);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()'Error encountered. Transaction not committed';
		ROLLBACK TRANSACTION
	END CATCH
END
GO


CREATE PROCEDURE dbo.getfee   -- this procedure is called by 'tripregister' to calculate the fee for payment cards
		@routeF			int = NULL,
		@startF			int = NULL,
		@endF			int = NULL,
		@fee			decimal (38, 5) = NULL OUTPUT,
		@distA			decimal (38, 5) = NULL,
		@distB			decimal (38, 5) = NULL,
		@distance		decimal (38, 5) = NULL
AS
BEGIN
	SET @distA = (  --takes the distance value of embarking bus stop
		SELECT [RS_Distance] 
		FROM Route_Stop 
		WHERE 
		[RS_Route] = @routeF AND
		[RS_Stop] = @startF
		)
	SET @distB = (  -- takes the distance value of disembarking bus stop
		SELECT [RS_Distance] 
		FROM Route_Stop 
		WHERE 
		[RS_Route] = @routeF AND
		[RS_Stop] = @endF
		)
	SET @distance = (@distB - @distA);  -- calculates total distance travelled
	SET @fee = (SELECT ABS(0.2 + POWER(@distance, 0.25)))  -- calculates fare according to preset formula
	SELECT @fee AS 'Fare';  -- returns calculated fare
END
GO

CREATE PROCEDURE dbo.tripregister  --procedure is called when a user taps in a bus
		@card			int = NULL,
		@stop			int = NULL,
		@service		int = NULL,
		@start			int = NULL,
		@route			int = NULL,
		@datetime		datetime = NULL
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
		SET @datetime = GETDATE();
		
		IF EXISTS ( --check if last tap was on same the service from with the card and was a trip start
		SELECT TOP 1 * FROM Trip WHERE 
		(T_Card = @card) AND 
		(T_Service = @service) AND
		(T_EE = 1)
		ORDER BY T_Time DESC
		)
			BEGIN
				SET @start = (SELECT TOP 1 T_Stop FROM Trip WHERE --grabs embarking bus stop
				(T_Card = @card) AND 
				(T_Service = @service) AND
				(T_EE = 1)
				ORDER BY T_Time DESC)
				
				SET @route = (SELECT SV_Route FROM Service where SV_ID = @service) -- selects travelled route
				
				DECLARE @fee decimal (38,2) -- creates a fee variable
				
				IF ((SELECT Card_Type FROM Card WHERE Card_ID = @card) = 1) --checks if card is student card
				BEGIN
					
					SET @fee = 0 --if true, fare is set to 0
					
				END
				
				ELSE
				BEGIN
			
					EXEC dbo.getfee --if false, 'getfee' procedure is called to calculate fare
						@route,
						@start,
						@stop,
						@fee OUTPUT --stores output
					DECLARE @oldbalance decimal (38, 3) --creates an temporary balance variable
					SET @oldbalance = (SELECT [PC_Balance] FROM PayCard WHERE ([Card_ID] = @card)) --retrieves original balance of payment card
					DECLARE @newbalance decimal (38, 3) -- creates a new balance variable
					SET @newbalance = (@oldbalance - @fee)
					UPDATE PayCard SET [PC_Balance] = @newbalance WHERE Card_ID = @card;  --updates the balance of the payment card with new value
				END
				
				INSERT INTO dbo.Trip (  --inserts trip end record
					T_Card,
					T_Service,
					T_Stop,
					T_EE,
					T_Time,
					T_Fee
				)
				VALUES (
					@card,
					@service,
					@stop,
					0,
					@datetime,
					@fee
				);
			END
		ELSE
			BEGIN
				INSERT INTO dbo.Trip ( --if last tap was not a trip start record, creates a trip start record
					T_Card,
					T_Service,
					T_Stop,
					T_EE,
					T_Time
				)
				VALUES (
					@card,
					@service,
					@stop,
					1,
					@datetime
				);
			END
	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
	SELECT ERROR_MESSAGE()'Error Message';
	ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE dbo.getrecord  -- gets travel records of a particular card
		@card		int = NULL
AS
BEGIN
	SELECT 
	T_ID AS 'Trip ID',
	R_Code AS 'Route Code',
	CASE R_Direction WHEN 1 THEN 'Forward' WHEN 0 THEN 'Backwards' END AS 'Direction',
	T_Stop AS 'Logged Stop',
	CASE T_EE WHEN 1 THEN 'Entry' WHEN 0 THEN 'Exit' END AS 'Entry or Exit',
	T_Time AS 'Date and Time',
	T_Fee AS 'Billed'
	FROM ((Trip INNER JOIN Service ON T_Service = SV_ID) 
	INNER JOIN Route ON SV_Route = R_ID) WHERE [T_Card] = @card;
END
GO

CREATE PROCEDURE dbo.loganalytics  -- this procedure is called when onboard GPS detects that a bus has left a stop
		@service		int = NULL,
		@stop			int = NULL,
		@onboard		smallint = NULL,
		@embark			smallint = NULL,
		@disembark		smallint = NULL,
		@oldonboard		smallint = 0
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
		
		SET @embark = (SELECT COUNT (T_ID) FROM Trip 
		WHERE T_stop = @stop AND T_EE = 1 
		AND (DATEDIFF (n, T_Time, GETDATE()) <3)) 
		--calculates the number of embarking passengers
		
		SET @disembark = (SELECT COUNT (T_ID) FROM Trip 
		WHERE T_stop = @stop AND T_EE = 0 
		AND (DATEDIFF (n, T_Time, GETDATE()) <3))
		--calculates the number of disebarking passengers
		
			IF EXISTS (SELECT TOP 1 A_Onboard FROM Bus_Analytics 
			WHERE A_Service = @service 
			AND CONVERT(Date, A_Time) = CONVERT(Date, GETDATE()))
			--checks if the bus has previous analytics entry from same day
				
				BEGIN
					-- if true, take the last recorded passengers onboard number
					SET @oldonboard = (SELECT TOP 1 A_Onboard FROM Bus_Analytics 
					WHERE A_Service = @service 
					AND CONVERT(Date, A_Time) = CONVERT(Date, GETDATE()) ORDER BY A_Time DESC)
				END
				
			SET @onboard = (SELECT (@oldonboard + (@embark - @disembark)))
			-- calculates the new number of onboad passengers

		INSERT INTO dbo.Bus_Analytics --inputs a new analytics record
		(
			A_Service,
			A_Stop,
			A_Onboard,
			A_Embark,
			A_Disembark
		)
		VALUES
		(
			@service,
			@stop,
			@onboard,
			@embark,
			@disembark
		);
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE()'Error Message';
	ROLLBACK TRANSACTION
	END CATCH	
END
GO

	
	
	
	
	
	
	

