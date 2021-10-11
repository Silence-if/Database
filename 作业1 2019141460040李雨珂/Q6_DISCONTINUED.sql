SELECT Pname,CompanyName,ContactName FROM 
	(SELECT ProductName AS Pname,MIN("Order".orderdate) AS EDate,"Order".CustomerId AS CID 
	FROM Product,OrderDetail,"Order"
	WHERE Discontinued=1 AND Product.Id=OrderDetail.ProductId AND OrderDetail.Orderid="Order".Id
	GROUP BY ProductName),Customer
	WHERE Customer.id=CID
	Order BY Pname;
