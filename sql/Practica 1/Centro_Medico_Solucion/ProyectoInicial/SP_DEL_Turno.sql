
ALTER PROC DEL_Turno(@idturno turno)

AS 
set nocount on

IF EXISTS (SELECT * FROM TURNO WHERE idTurno=@idturno)

BEGIN
			DELETE FROM Turno WHERE idTurno=@idturno
			DELETE FROM TurnoPaciente WHERE idTurno=@idturno

END

ELSE SELECT 0 AS resultado
