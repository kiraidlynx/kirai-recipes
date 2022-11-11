-- ALTA TURNO
-- Primero necesitamos una validación para no duplicar turnos

--SELECT * FROM Turno
--SELECT * FROM TurnoPaciente

--CAMBIAR CREATE POR ALTER PARA MODIFICAR

ALTER PROCEDURE  ALTA_Turno(
					@fecha char(14),
					@idpaciente paciente,
					@idmedico medico,
					@observacion observacion=''
					)
AS
--estado=0: pendiente
--estado=1: realizado
--estado=2: cancelado

set nocount on
IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno(fechaTurno, estado, observacion)
	VALUES (@fecha, 0, @observacion)
	DECLARE @aux_idturno turno
	SET @aux_idturno=@@IDENTITY --variable del sistema: obtiene el último valor insertado con el campo identity ON

	INSERT INTO TurnoPaciente(idTurno, idPaciente, idMedico)
	VALUES (@aux_idturno, @idpaciente, @idmedico)

	PRINT ('CONFIRMADO')
	RETURN
END

ELSE
BEGIN
	PRINT('ERROR')
	RETURN
END


exec ALTA_turno '20220420 08:15',2,4,''

--insert into medico values (1, 'Raul', 'Hernandez')
--insert into medico values (2, 'Maria', 'Lopez')
--insert into medico values (3, 'Juan', 'Perez')
--insert into medico values (4, 'Pepe', 'Gonzales')
--insert into medico values (5, 'David', 'Suarez')
--select * from turno