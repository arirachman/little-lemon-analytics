PREPARE GetOrderDetail 
FROM 'SELECT d.OrderID, d.Quantity, o.TotalCost 
FROM Orders o INNER JOIN OrderDetail d ON d.OrderID = o.OrderID 
WHERE o.OrderID=?'