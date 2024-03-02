CREATE PROC ProductDeleteById
@ProductId int
AS
	BEGIN
		DELETE FROM Product WHERE ProductId = @ProductId
	END