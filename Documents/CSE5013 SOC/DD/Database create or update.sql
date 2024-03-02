CREATE PROC ProductCreateOrUpdate
@ProductId int,
@ProductName varchar(50),
@ProductColor varchar(50),
@ProductPrice varchar(50),
@ProductQuantity varchar(50)
AS
BEGIN
IF(@ProductId=0)
	BEGIN
		INSERT INTO Product(ProductName, ProductColor, ProductPrice, ProductQuantity)
		VALUES(@ProductName,@ProductColor, @ProductPrice, @ProductQuantity)
	END
ELSE
	
	BEGIN
		UPDATE Product
		SET
			ProductName = @ProductName,
			ProductColor = @ProductColor,
			ProductPrice = @ProductPrice,
			ProductQuantity = @ProductQuantity
	END

END