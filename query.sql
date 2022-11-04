USE ClientesDB;

Create Table Clientes (
	IdCliente int IDENTITY(1,1) PRIMARY KEY,
	Nome varchar(50) NOT NULL,
	Cpf char(11) NOT NULL,
	DataNascimento Datetime NOT NULL)
	
CREATE PROCEDURE EditarCliente(@idCliente int, @Nome varchar(50), @Cpf char(11), @DataNascimento Datetime) AS
	UPDATE Clientes SET 
	Nome = @Nome, 
	Cpf = @Cpf, 
	@DataNascimento = DataNascimento
WHERE IdCliente = @IdCliente

CREATE PROCEDURE InserirCliente(@Nome varchar(50), @Cpf char(11), @DataNascimento Datetime) AS
	INSERT INTO Clientes VALUES
	(@Nome, @Cpf, @DataNascimento)

CREATE PROCEDURE ExcluirCliente(@IdCliente int) AS
	DELETE FROM Clientes
	WHERE IdCliente = @IdCliente

CREATE VIEW ListarCliente AS
	SELECT IdCliente, 
		   Nome, 
		   Cpf, 
		   CONVERT(varchar, DataNascimento, 3) 
		   AS 'Data de Nascimento - [DD/MM/YY]' 
	FROM Clientes

EXEC InserirCliente 'Emanuel','99999999999', '2019-11-04'
EXEC EditarCliente 2, 'Emanuel', '44444444444', '2019-11-04'
EXEC ExcluirCliente 1
SELECT * FROM ListarCliente