USE AdventureWorks2019
GO

declare @n int
set @n = 10


CREATE PROCEDURE Fibo @n INT
AS
DECLARE @X INT
DECLARE @Y INT
DECLARE @FIB INT
DECLARE @i INT
SET @X = 1
SET @Y = 1
SET @FIB = 0
SET @i = 0
IF (@n = 1)
BEGIN
	PRINT @X
END
ELSE
BEGIN
		PRINT @X
		PRINT @Y
	WHILE @i < @n -2
	BEGIN
		SET @FIB = @X + @Y
		PRINT @FIB
		SET @X = @Y
		SET @Y = @FIB
		SET @i = @i +1
	END
END

EXEC Fibo @n  =20








CREATE TRIGGER tr_Person_ForInsert
	ON Person.Person
	AFTER INSERT
	AS
		BEGIN
			UPDATE Person.Person
			SET LastName = UPPER(LastName)
			WHERE Person.BusinessEntityID IN (SELECT BusinessEntityID FROM inserted);
		END

		
INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, LastName) VALUES(20779, 'IN', 'Jan', 'Kowalski')
SELECT * FROM Person.Person

INSERT INTO Person.BusinessEntity(rowguid) VALUES(NewID()) 
SELECT * FROM Person.BusinessEntity



CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate
	INSTEAD OF UPDATE
	AS
	DECLARE @NewTaxR int, @TaxR int
	SELECT @NewTaxR = TaxRate FROM inserted
	SELECT @TaxR = TaxRate FROM deleted
		IF (@NewTaxR > 1.3*@TaxR)
			BEGIN
				raiserror('Zbyt duzy wzrost TaxRate',16, 1)
				rollback tran
			END
		ELSE
			BEGIN
				UPDATE Sales.SalesTaxRate
				SET TaxRate = (SELECT TaxRate FROM inserted)
				WHERE SalesTaxRateID = (SELECT SalesTaxRateID FROM inserted)
			END


	select * from Sales.SalesTaxRate

	UPDATE Sales.SalesTaxRate
	SET TaxRate = 14
	WHERE SalesTaxRateID = 6;

	select * from Sales.SalesTaxRate

	UPDATE Sales.SalesTaxRate
	SET TaxRate = 9
	WHERE SalesTaxRateID = 6;