ALTER PROCEDURE  ALTA_Medico(
					@nombre varchar(50),
					@apellido varchar(50),
					@idespecialidad int,
					@descripcion varchar(50)
					)
AS


set nocount on
IF NOT EXISTS(SELECT TOP 1 idMedico FROM Medico WHERE nombre=@nombre AND apellido=@apellido)
BEGIN
	INSERT INTO Medico(nombre, apellido)
	VALUES (@nombre, @apellido)

	DECLARE @aux_medico int
	SET @aux_medico=@@IDENTITY --variable del sistema: obtiene el último valor insertado con el campo identity ON

	INSERT INTO MedicoEspecialidad (idMedico, idEspecialidad, descripcion)
	VALUES (@aux_medico, @idespecialidad, @descripcion)

	PRINT ('CONFIRMADO')
	RETURN
END

ELSE
BEGIN
	PRINT('ERROR')
	RETURN
END

EXEC ALTA_medico 'Gerardo', 'Martinez', 2, 'Residente'

select * from Medico
select * from MedicoEspecialidad