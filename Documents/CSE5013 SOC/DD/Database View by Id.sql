CREATE PROC ProductViewById
@ProductId int
AS
	BEGIN
		SELECT * FROM Product WHERE ProductId = @ProductId
	END