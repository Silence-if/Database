	SELECT N2,ROUND(LATE*100.00/WHOLE*1.00,2) AS PERSENTAGE  FROM
	(SELECT CompanyName AS N2, COUNT(*) AS Late FROM "Order",Shipper
	WHERE ShippedDate>RequiredDate AND SHIPVia=Shipper.id
	GROUP BY Shipper.id),
	(SELECT CompanyName AS N1, COUNT(*) AS WHOLE FROM "Order",Shipper
	WHERE SHIPVia=Shipper.id
	GROUP BY Shipper.id)
	WHERE N1=N2
	Order By PERSENTAGE DESC；