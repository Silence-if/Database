SELECT OID,D1,PreDate,ROUND(JulianDay(D1)-JulianDay(PreDate),2)FROM
	(SELECT DISTINCT OID,date1 AS D1, 
	CASE
		WHEN (OID=MID) THEN Date1
		WHEN (OID=OID_1) THEN Date2
	END AS PreDATE
	FROM
	(SELECT id AS MID,MIN(Orderdate) AS MOD FROM "Order" WHERE CustomerId="BLONP"),
	(SELECT id AS OID ,Orderdate AS date1 FROM "Order" WHERE CustomerId="BLONP" Order BY date1 asc),
	(SELECT O1.id AS OID_1,MAX(O2.orderdate) AS Date2 
	FROM "Order"O1,"Order"O2 WHERE O1.Customerid ="BLONP" AND O2.Customerid ="BLONP" AND O2.orderdate<O1.orderdate
	GROUP BY O1.id
	Order By O1.orderdate asc)
	WHERE OID=MID OR OID=OID_1
	Order By date1 asc
	LIMIT 10 OFFSET 0);
	 