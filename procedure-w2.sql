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




