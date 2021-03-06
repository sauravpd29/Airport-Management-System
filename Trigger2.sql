USE AIRPORT

/*CREATE TABLE DELAYED_FLIGHTS
(FLIGHT_CODE VARCHAR(10),
DESTINATION VARCHAR(3),
SOURCE VARCHAR(3),
AIRLINEID VARCHAR(3));
*/

CREATE TRIGGER DELAYEDFLIGHTS ON FLIGHT AFTER INSERT
AS
DECLARE @STATUS VARCHAR(20);
DECLARE @FLIGHT_CODE VARCHAR(20);
DECLARE @SOURCE VARCHAR(20);
DECLARE @DESTINATION VARCHAR(20);
DECLARE @AIRLINEID VARCHAR(20);
SELECT @STATUS= i.STATUS FROM inserted i;
SELECT @FLIGHT_CODE= i.FLIGHT_CODE FROM inserted i;
SELECT @SOURCE= i.SOURCE FROM inserted i;
SELECT @DESTINATION= i.DESTINATION FROM inserted i;
SELECT @AIRLINEID= i.AIRLINEID FROM inserted i;
BEGIN
IF (@STATUS='DELAYED')
BEGIN
	INSERT INTO DFLIGHTS (FLIGHT_CODE, SOURCE, DESTINATION , AIRLINEID )
	VALUES(@FLIGHT_CODE,@SOURCE,@DESTINATION,@AIRLINEID);
	COMMIT; 
END
END
GO 

/*INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION,
FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('QR199','BOM','DFW','02:10','03:15','Delayed','24hr','Connecting',3,1,'AI');
*/

/*
 SELECT * FROM DFLIGHTS  
 SELECT * FROM FLIGHT
 */