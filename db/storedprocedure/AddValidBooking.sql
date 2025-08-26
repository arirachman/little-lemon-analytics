DELIMITER //
CREATE PROCEDURE `AddValidBooking`(IN d DATE,IN t INT)
BEGIN
START TRANSACTION;
INSERT INTO Booking(BookingDate,TableNo) VALUES (d,t) ;
SELECT COUNT(TableNo) INTO @v FROM Booking 
WHERE BookingDate = @v1 AND TableNo = @v2;
IF @v > 1 THEN
     ROLLBACK;
     SELECT CONCAT('Table ', t, ' is already booked - booking cancelled') AS 'Booking Status';
	
ELSE 
    BEGIN
         COMMIT;
         SELECT CONCAT ('Table ', t, ' is available - booking confirmed') AS 'Booking Status';
	END;
END IF;
END//
DELIMITER ;