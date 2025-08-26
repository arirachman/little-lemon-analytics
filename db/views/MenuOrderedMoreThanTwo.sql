CREATE VIEW MenuOrderedMoreThanTwo AS SELECT MenuName 
FROM Menus m INNER JOIN OrderDetail d ON m.MenuID = d.OrderID
WHERE m.MenuID = ANY (SELECT MenuID
					  FROM OrderDetail
					  WHERE Quantity > 2) 