CREATE VIEW HighCostCustomers AS SELECT c.CustomerID, c.FullName, o.OrderID, o.TotalCost, m.MenuName, i.CourseName
FROM Customers c INNER JOIN Booking b ON c.CustomerID = b.CustomerID
INNER JOIN Orders o ON o.BookingID = b.BookingID
INNER JOIN OrderDetail d ON d.OrderID = o.OrderID
INNER JOIN Menus m ON m.MenuID = d.MenuID
INNER JOIN MenuItems i ON i.MenuItemsID = m.MenuItemsID
WHERE TotalCost > 150
ORDER BY TotalCost;