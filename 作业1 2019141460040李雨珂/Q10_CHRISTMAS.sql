SELECT group_concat(PN) FROM(SELECT ProductName AS PN FROM Product,
	(SELECT DISTINCT ProductId AS PID FROM OrderDetail WHERE orderId IN
	(SELECT id AS OID FROM "Order"
	WHERE CustomerId IN (SELECT id FROM Customer WHERE CompanyName="Queen Cozinha") 
	AND Orderdate>="2014-12-25 00:00:00" AND Orderdate<"2014-12-26 00:00:00" 
		)
		)
	WHERE PID=Product.id
	Order By PID asc);