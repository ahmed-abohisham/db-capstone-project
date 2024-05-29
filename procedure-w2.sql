create procedure GetMaxQuantity()
select max(Qauntity) as 'Max Q. in Order'
from orders;





prepare GetOrderDetail 
from 
   ' select OrderID, Qauntity, TotalCost as OrderCost from orders where CustmerID = ?';
set @CustmerID=1;
execute GetOrderDetail using @CustomerID;



DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = orderId;
END //

DELIMITER ;

INSERT INTO bookings (BoockingID, TableNumber, BookingSlot, 
CustomerID, StaffID)
VALUES
(1,5,'2022-10-10',1,1),
(2,3,'2022-11-12',3,3),
(3,2,'2022-10-11',2,4),
(4,2,'2022-10-13',4,2);


DELIMITER //

CREATE PROCEDURE CheckBooking(booking_date DATE, table_number INT)

BEGIN
 DECLARE bookedTable INT DEFAULT 0;
 SELECT COUNT(bookedTable)
    INTO bookedTable
    FROM bookings WHERE BookingSlot = booking_date and TableNumber = table_number;
    IF bookedTable > 0 THEN
      SELECT CONCAT( "Table", table_number, "is already booked") AS "Booking status";
      ELSE 
      SELECT CONCAT( "Table", table_number, "is not booked") AS "Booking status";
    END IF;
END //

DELIMITER ;

