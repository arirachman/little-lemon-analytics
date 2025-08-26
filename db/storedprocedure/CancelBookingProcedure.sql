DELIMITER //
CREATE PROCEDURE CancelBooking(bid int)
BEGIN
 DELETE FROM Booking
 WHERE BookingID = bid;
SELECT CONCAT('Booking ',bid,' cancelled') AS Confirmation;
END//
DELIMITER ;