SELECT * FROM adventureworks.product;
USE adventureworks;

-- Exercise 1: Subquery
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name
-- của ProductSubcategory là 'Saddles'.
-- Hướng dẫn:
-- Sử dụng Sub Query để lấy ra tất cả các ID của ProductSubcategory có name =
-- 'Saddles'.
-- Sau đó trong outer query, sử dụng kết quả từ Sub Query để lấy ra yêu cầu của đề bài.

SELECT 	* 
	FROM 		Product P
	Join 		`productsubcategory` PSC ON P.`ProductSubcategoryID` = PSC.`ProductSubcategoryID`
	WHERE 		PCS.Name = 'Saddles';

SELECT p.Name
	FROM product p
	where p.ProductSubcategoryID in( select psc.ProductSubcategoryID
	from productsubcategory psc
	where psc.Name = 'Saddles');

-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.

SELECT 		p.Name
	FROM 		product  p
	WHERE		p.ProductSubcategoryID IN(
	SELECT 		psc.ProductSubcategoryID
	FROM 		productsubcategory AS psc
	WHERE		psc.Name LIKE 'Bo%');


-- Question 3:
-- Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring
-- Bike (nghĩa là ProductSubcategoryID = 3)
-- Hướng dẫn: sử dụng hàm MIN() trong subquery để trả về ListPrice thấp nhất



SELECT 		p.Name
FROM 		product	 p
WHERE		p.ListPrice IN(
	SELECT 		MIN(p.ListPrice)
	FROM 		product AS p
	WHERE		p.ProductSubcategoryID IN(
		SELECT 		psc.ProductSubcategoryID
		FROM 		productsubcategory AS psc
		WHERE		psc.Name='Touring Bikes'));
        
-- Exercise 2: JOIN nhiều bảng
-- Question 1: Viết query lấy danh sách tên country và province được lưu 
-- trong AdventureWorks2008sample database.
   
SELECT		s.name AS provice , c.name AS country
FROM  		countryregion c
JOIN 		stateprovince S ON (c.CountryRegionCode = s.CountryRegionCode);

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada

SELECT		S.name AS provice,		c.name AS country
FROM  		countryregion c
JOIN 		stateprovince s ON (c.CountryRegionCode = s.CountryRegionCode)
WHERE  		C.name = 'Germany' OR C.name = 'Canada';

-- Question 3: 
-- SalesOrderID, OrderDate and SalesPersonID. Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales),
-- Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay) 
 
SELECT 			soh.SalesOrderID,soh.OrderDate,soh.SalesPersonID,sp.SalesPersonID AS BusinessEntityID,sp.Bonus,sp.SalesYTD
FROM 			salesorderheader AS soh
LEFT JOIN		salesperson AS sp ON sp.SalesPersonID=soh.SalesPersonID
INNER JOIN		employee AS e ON e.EmployeeID=soh.SalesPersonID
WHERE			soh.SalesPersonID=NULL AND soh.OnlineOrderFlag=1
UNION ALL
SELECT 			soh.SalesOrderID,soh.OrderDate,soh.SalesPersonID,sp.SalesPersonID AS BusinessEntityID,sp.Bonus,sp.SalesYTD
FROM 			salesorderheader AS soh
RIGHT JOIN		salesperson AS sp ON sp.SalesPersonID=soh.SalesPersonID;
 

