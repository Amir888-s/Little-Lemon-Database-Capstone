USE LittleLemonDB;
DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity //
CREATE PROCEDURE GetMaxQuantity() BEGIN SELECT MAX(Quantity) AS MaxQuantity FROM OrderItems; END //
DROP PROCEDURE IF EXISTS ManageBooking //
CREATE PROCEDURE ManageBooking(IN booking_date DATE, IN table_number INT) BEGIN IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate=booking_date AND TableNumber=table_number) THEN SELECT CONCAT('Table ',table_number,' is already booked') AS BookingStatus; ELSE SELECT CONCAT('Table ',table_number,' is available') AS BookingStatus; END IF; END //
DROP PROCEDURE IF EXISTS AddBooking //
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id VARCHAR(30), IN booking_date DATE, IN table_number INT) BEGIN INSERT INTO Bookings(BookingID,CustomerID,BookingDate,TableNumber) VALUES(booking_id,customer_id,booking_date,table_number); SELECT 'New booking added' AS Confirmation; END //
DROP PROCEDURE IF EXISTS UpdateBooking //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE) BEGIN UPDATE Bookings SET BookingDate=booking_date WHERE BookingID=booking_id; SELECT CONCAT('Booking ',booking_id,' updated') AS Confirmation; END //
DROP PROCEDURE IF EXISTS CancelBooking //
CREATE PROCEDURE CancelBooking(IN booking_id INT) BEGIN DELETE FROM Bookings WHERE BookingID=booking_id; SELECT CONCAT('Booking ',booking_id,' cancelled') AS Confirmation; END //
DELIMITER ;
