-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--SELECT * FROM Paciente

CREATE PROCEDURE  ALTA_Paciente(
					@dni varchar(20),
					@nombre varchar(50),
					@apellido varchar(50),
					@fnacimiento varchar(8),
					@domicilio varchar(50),
					@idpais char(3),
					@telefono varchar(20),
					@email varchar(30),
					@observacion varchar(1000)='' --valor por defecto
					)
AS


IF NOT EXISTS(SELECT * FROM Paciente WHERE dni=@dni)
BEGIN
	INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
	VALUES (@dni, @nombre, @apellido, @fnacimiento, @domicilio, @idpais, @telefono, @email, @observacion)
	PRINT ('CONFIRMADO')
	RETURN
END

ELSE
BEGIN
	PRINT('ERROR')
	RETURN
END

--------------------------------------------------------------------------------------

EXEC ALTA_Paciente '2837820', 'Cristian', 'Sastre', '19911025', 'calle flor', 'ESP', '','cristian@mail.com',''

SELECT * FROM Paciente