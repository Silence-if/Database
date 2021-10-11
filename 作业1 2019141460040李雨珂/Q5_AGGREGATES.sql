SELECT CNAME,CON,AVG,MINP,MAXP,BIGOrder FROM
	(SELECT CNAME,CON,ROUND(SUM(OrderDetail.Quantity*OrderDetail.unitprice)/SUM(OrderDetail.Quantity),2) AS AVG,MIN(OrderDetail.unitprice) AS MINP,MAX(OrderDetail.unitprice)AS MAXP,CID
	FROM(SELECT Category.id AS CID,CategoryName AS CNAME ,COUNT(*) AS CON FROM
	Category,Product
	WHERE Category.id=Product.categoryId GROUP BY Category.id),Product,OrderDetail 
	WHERE CID=Product.categoryid AND Product.id=OrderDetail.ProductId
	GROUP BY CNAME),
	(SELECT CategoryName AS CNAME_1,COUNT(*) AS BIGOrder
	FROM Category,Product,OrderDetail
	WHERE Category.id=Product.categoryId AND Product.id=OrderDetail.ProductId AND OrderDetail.quantity>10
	GROUP by CategoryName)
	WHERE CNAME=CNAME_1
	Order By cid；