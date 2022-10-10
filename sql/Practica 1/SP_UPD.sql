--ACTUALIZAR DATOS DE TURNO

ALTER PROC UPD_Turno(
						@idturno turno,
						@estado tinyint,
						@observacion observacion
)

AS 
set nocount on

IF EXISTS (SELECT * FROM TURNO WHERE idTurno=@idturno)

BEGIN
		UPDATE Turno SET estado = @estado,
						observacion=@observacion
		WHERE idTurno=@idturno --IMPORTANTE CLAUSULA WHERE EN UN UPDATE O EN CUALQUIER PROCESO
END

ELSE SELECT 0 AS resultado


--ACTUALIZAR UN PACIENTE

CREATE PROC UPD_Paciente(
				@idpaciente paciente,
				@nombre varchar(50),
				@apellido varchar(50),
				@domicilio varchar(50),
				@email varchar(30))

AS
set nocount on

if exists(SELECT * from Paciente
			WHERE idPaciente = @idpaciente)
	UPDATE Paciente SET nombre = @nombre,
					apellido = @apellido,
					domicilio = @domicilio,
					email = @email
	WHERE idpaciente = @idpaciente


ELSE
	SELECT 0 as resultado

