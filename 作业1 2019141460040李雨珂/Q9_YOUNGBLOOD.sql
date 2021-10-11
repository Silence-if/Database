SELECT ReD AS ReDes,Employee.firstName,Employee.LastName,Employee.BirthDate FROM 
	(SELECT ReD,MAX(Employee.BirthDate), EID,RID_1 FROM 
	(SELECT DISTINCT RD AS ReD,Employee.ID AS EID,RID AS RID_1 FROM
	(SELECT RegionDescription AS RD,Territory.ID AS TID,Region.id AS RID  FROM Region,Territory WHERE Region.id= Territory.RegionId),EmployeeTerritory,Employee
	WHERE TID=EmployeeTerritory.TerritoryId AND Employee.id=EmployeeTerritory.EmployeeId),Employee
	WHERE EID=Employee.id  
	GROUP BY ReD),Employee
	WHERE Employee.id=EID 
	Order BY RID_1;