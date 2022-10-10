--Guardar consultas específicas que se almacenan en la base de datos, útil en consultas grande


CREATE VIEW PacientesTurnosPendientes AS

SELECT P.idPaciente,P.nombre, P.apellido, T.idTurno, T.estado FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente=P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno=TP.idTurno
WHERE isnull(T.estado,0)=0

--Ejecutar:

SELECT * FROM PacientesTurnosPendientes