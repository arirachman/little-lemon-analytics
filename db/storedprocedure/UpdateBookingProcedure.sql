DELIMITER //
CREATE PROCEDURE UpdateBooking(bid int, bdt DATE)
BEGIN
UPDATE Booking
SET BookingDate = bdt WHERE BookingID = bid;
SELECT CONCAT('Booking ',bid,' updated') AS Confirmation;
END//
DELIMITER ;