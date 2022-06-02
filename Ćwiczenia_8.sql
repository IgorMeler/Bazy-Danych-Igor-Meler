USE AdventureWorks2019
GO

WITH TempEmployeeInfo 
AS(
SELECT Person.*, Rate FROM (Person.Person
INNER JOIN HumanResources.EmployeePayHistory ON Person.BusinessEntityID = EmployeePayHistory.BusinessEntityID)
)

SELECT * FROM TempEmployeeInfo


USE AdventureWorksLT2019
GO

WITH zadanie_2
AS(
SELECT SalesOrderHeader.*, FirstName, LastName, CompanyName FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.Customer ON Customer.CustomerID = SalesOrderHeader.CustomerID
)
SELECT (CompanyName + ' (' + FirstName + ' ' + LastName + ')') AS CompanyContact, TotalDue AS Revenue FROM zadanie_2
ORDER BY CompanyContact


WITH zadanie_3
AS(
SELECT ProductCategory.ProductCategoryID, ProductCategory.Name, SalesLT.SalesOrderDetail.LineTotal FROM ((SalesLT.ProductCategory
INNER JOIN SalesLT.Product ON Product.ProductCategoryID = ProductCategory.ProductCategoryID)
INNER JOIN SalesLT.SalesOrderDetail ON  SalesLT.SalesOrderDetail.ProductID = Product.ProductID)
)
SELECT Name AS Category, CAST(ROUND(SUM(LineTotal),2) AS MONEY) AS SalesValue FROM zadanie_3
GROUP BY Name
ORDER BY Name
