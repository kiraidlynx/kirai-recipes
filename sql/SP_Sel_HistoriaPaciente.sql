ALTER PROC SEL_HistoriaPaciente(
			@idpaciente paciente
			)
AS
set nocount on
IF EXISTS (SELECT * FROM Paciente P
		INNER JOIN HistoriaPaciente HP
		ON HP.idPaciente=P.idPaciente
		INNER JOIN Historia H
		ON H.idHistoria=HP.idHistoria
		INNER JOIN MedicoEspecialidad ME
		ON ME.idMedico=HP.idMedico
		INNER JOIN Medico M
		ON M.idMedico=ME.idMedico
		WHERE P.idPaciente=@idpaciente)

BEGIN
	SELECT * FROM Paciente P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente=P.idPaciente
	INNER JOIN Historia H
	ON H.idHistoria=HP.idHistoria
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico=HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico=ME.idMedico
	WHERE P.idPaciente=@idpaciente
END

ELSE 
	PRINT 'ERROR'



