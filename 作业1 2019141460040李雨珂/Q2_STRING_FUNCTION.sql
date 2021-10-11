SELECT DISTINCT ShipName,substr(ShipName,1,instr(ShipName,'-')-1) 
FROM "Order" WHERE ShipName Like "%-%" Order by shipName asc;