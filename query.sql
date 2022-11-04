USE ClienteDB;

Create Table Clientes (
	idCliente int IDENTITY(1,1) PRIMARY KEY,
	Nome varchar(50) NOT NULL,
	Cpf char(11) NOT NULL,
	DataNascimento Datetime NOT NULL)
	
CREATE PROCEDURE EditarCliente(@idCliente int, @Nome varchar(50), @Cpf char(11), @DataNascimento Datetime) AS
	UPDATE Clientes SET 
	Nome = @Nome, 
	Cpf = @Cpf, 
	@DataNascimento = DataNascimento
WHERE idCliente = @idCliente

CREATE PROCEDURE InserirCliente(@Nome varchar(50), @Cpf char(11), @DataNascimento Datetime) AS
	INSERT INTO Clientes VALUES
	(@Nome, @Cpf, @DataNascimento)

CREATE PROCEDURE ExcluirCliente(@idCliente int) AS
	DELETE FROM Clientes
	WHERE idCliente = @idCliente

CREATE VIEW ListarCliente AS
	SELECT idCliente, 
		   Nome, 
		   Cpf, 
		   CONVERT(varchar, DataNascimento, 3) 
		   AS 'Data de Nascimento - [DD/MM/YY]' 
	FROM Clientes

EXEC InserirCliente 'Emanuel','99999999999', '2019-11-04'
EXEC EditarCliente 1, 'Emanuel', '44444444444', '2019-11-04'
EXEC ExcluirCliente 1
SELECT * FROM ListarCliente