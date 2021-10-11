SELECT Cname,CID,EXP FROM
	(SELECT NTILE(4)OVER(Order BY EXP ASC) AS GROUPID ,Cname,CID,EXP FROM 
	(SELECT CompanyName AS Cname,Customer.id AS CID , ROUND(SUM(UnitPrice*Quantity),2) AS EXP
	FROM OrderDetail, "Order",Customer 
	WHERE Customer.id="Order".CustomerId AND "Order".id=OrderDetail.OrderId
	Group By Customer.id
	Order By Customer.id))
	WHERE GROUPID=1;