
ALTER PROC SELECT_TurnoPaciente(
			@idpaciente paciente
)

AS
set nocount on

IF EXISTS (SELECT * FROM Paciente P
		INNER JOIN TurnoPaciente TP
		ON TP.idPaciente=P.idPaciente
		INNER JOIN Turno T
		ON T.idTurno=TP.idTurno
		INNER JOIN MedicoEspecialidad M
		ON M.idMedico=TP.idMedico
		WHERE P.idPaciente=@idpaciente)

BEGIN
	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente=P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno=TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico=TP.idMedico
	WHERE P.idPaciente=@idpaciente
END

ELSE
	PRINT 'ERROR'
