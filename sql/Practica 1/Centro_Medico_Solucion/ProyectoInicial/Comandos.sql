print 'hola'

-- SELECT: seleccionar determinados registros de una tabla
-- SELECT+campos (* si son todos)+FROM+tabla

SELECT * FROM Paciente
--SELECT idPaciente, nombre, apellido FROM Paciente

-- INSERT: agregar registros
-- INSERT INTO + tabla + VALUES + (valores) // Identity se autorrellena
-- Especificar campos: después del nombre de tabla

INSERT INTO Paciente values ('Roberto','Perez','2014-03-20','piedra buena 21','ESP','','','')
INSERT INTO Paciente values ('Alberto','Perez','2004-05-21','buenavista 08','MEX','','','')
INSERT INTO Paciente values ('Roberto','Rodriguez','2009-12-01','cordoba 13','ESP','','','')

--INSERT INTO Paciente(nombre, apellido) values ('Roberto','Perez')

-- DELETE: eliminar uno o más registros
-- DELETE FROM + tabla + WHERE + condición (se busca el ID)

INSERT INTO Paciente values ('Luis','Robles','2014-03-20','piedra buena 21','ESP','','','')
select * from paciente where apellido='Robles'
DELETE FROM Paciente WHERE idPaciente=8

--UPDATE: actualizar uno o más campos de una tabla específica
-- UPDATE + tabla + SET + col=value
UPDATE Paciente SET idPais='PER'
UPDATE Paciente SET observacion='Pacientes creados desde UI'

-- WHERE: filtrar registros por una clausula específica (condición)
-- Para unir clausulas condicional: and
SELECT * FROM Paciente WHERE apellido='Perez'

--TOP: seleccionar máximo de registros de una tabla SELECT TOP n
-- se usa después del SELECT y los ordena por id
SELECT TOP 2 * FROM Paciente

--ORDER BY: se usa al final de la sentencia de select para ordenar DESCendente o ASCendente(por defecto)
-- ORDER BY + col + DESC/ASC
SELECT TOP 1 * FROM Turno ORDER BY fechaTurno DESC --sacar el último
SELECT * FROM Paciente ORDER BY fNacimiento ASC