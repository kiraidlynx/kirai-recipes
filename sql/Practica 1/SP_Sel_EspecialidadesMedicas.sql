CREATE PROC SEL_EspecialidadMedica
AS 
set nocount on

IF EXISTS (SELECT * FROM Especialidad E)
	SELECT * FROM Especialidad E
ELSE PRINT 'ERROR'

