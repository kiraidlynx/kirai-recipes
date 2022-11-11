print 'hola'


------------------------------------------------------------------
--COMANDOS
-----------------------------------------------------------------

-- SELECT: seleccionar determinados registros de una tabla
-- SELECT+campos (* si son todos)+FROM+tabla

SELECT * FROM Paciente
--SELECT idPaciente, nombre, apellido FROM Paciente
-- podemos seleccionar varios campos entre paréntesis y separados por coma // devuelve una tabla con todas las columnas pedidas combinadas

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


-- DISTINCT: agrupar los registros por un campo en particular
--SELECT + DISTINCT + campo(columna) +	FROM + tabla 
--cuando es más de un campo va sin paréntesis

SELECT DISTINCT (apellido) FROM Paciente
SELECT DISTINCT idPaciente, apellido FROM Paciente


-- GROUP BY: igual que distinct pero permite utilizar funciones de agregado/ + RÁPIDO
-- SELECT+ campo + FROM + tabla + GROUP BY
-- -- SELECT+ campo + FROM + tabla + WHERE (cond)+ GROUP BY
SELECT apellido FROM Paciente GROUP BY apellido

-----------------------------------------------------------------
--FUNCIONES DE AGRUPACIÓN
-----------------------------------------------------------------

--MAX,MIN

SELECT MAX(idpaciente) FROM Paciente 

SELECT apellido, MIN(idPaciente) FROM Paciente GROUP BY apellido


--SUM, AVG, COUN
--se aplica sobre el campo numérico en relación a la cláusula GROUP BY
SELECT SUM(idPaciente) FROM Paciente 
SELECT SUM(idPaciente), apellido FROM Paciente GROUP BY apellido

SELECT AVG(idPaciente) FROM Paciente 
SELECT AVG(idPaciente), apellido FROM Paciente GROUP BY apellido

SELECT COUNT(*) FROM Paciente --FILAS DE LA TABLA
SELECT COUNT(idPaciente) FROM Paciente WHERE apellido='Perez'


--HAVING:
--WHERE aplica sobre un registro en partícular, HAVING filtra los registros por la condición sobre un conjunto de registros USAR CON GROUP BY
--SELECT + columna + FROM + tabla + columna + HAVING + condicion // las columnas deben ser iguales
SELECT estado FROM turno GROUP BY estado HAVING	estado=2
SELECT estado FROM turno GROUP BY estado HAVING	COUNT(estado)=2


----------------------------------------------------------------------------
--OPERADORES LOGICOS - DENTRO DE LA CLAUSULA WHERE
---------------------------------------------------------------------------

--AND,OR
--IN: CONJUNTO DE VALORES DEFINIDOS/DISCRETOS IN(2,5,8,9)
--LIKE (FILTRADO DE CARACTERES); no hay que dar el string entero, solo una parte seguida del símbolo %; ej: '%ober%' (encuentra Roberto y Roberto3)
--NOT (negar IN o LIKE)
--BETWEEN: RANGO DE VALORES/FECHAS (BETWEEN VALOR AND VALOR 2)


-------------------------------------------------------------------------


--ejecutar un SP
EXEC S_pacientes 2

-----------------------------------------------------------------------------
--SP_ HELP: ayuda y descripcion 
sp_help paciente
-- SP_HELPTEXT: te saca el texto del sp

------------------------------------------------------------------------------
-- SENTENCIAS SQL
-----------------------------------------------------------------------------
--CREATE: crear tablas, dato de usuario, funciones, type, sp...
CREATE FUNCTION nombrefun(@var int)
RETURNS INT

AS
BEGIN
	set @var=@var*5
	return @var
END

-------------------------------------------------------------------------------
--ALTER: después del comando CREATE, cambiar por ALTER para modificar.
--Cambiar estructura de una tabla

ALTER TABLE Paciente ADD estado smallint --añadir campo a una tabla creada
ALTER TABLE Paciente ALTER COLUMN estado bit --cambiar el tipo de dato
ALTER TABLE Paciente DROP COLUMN estado -- eliminar campo

---------------------------------------------------------------------------
--DROP: eliminar objeto por completo
--DROP + objeto + nombre objeto
DROP TABLE ejemplo

--------------------------------------------------------------------------
--TRUNCATE: eliminar por completo un registro  y su identity
-- TRUNCATE + tabla + nombre tabla

TRUNCATE TABLE ejemplo
---------------------------------------------------------------------------
--FUNCIONES DE CONVERSION
----------------------------------------------------------------------------
--CAST: convertir un tipo de dato en otro siendo del mismo género (numero a numero o char a char) a modo de visualización en el momento
--SELECT+CAST(variable+AS+tipo_dato_nuevo)+nombre_campo
SELECT CAST(@numero as INT) numero


--CONVERT: convertir con más detalle tipos de datos con parámetros adicionales
-- SELECT+CONVERT(tipo_dato_objetivo, variable o campo)
--Para fechas añadir un parámetro dentro del parámetro: ( char(8),@fecha , número de formato fecha) 112,104,etc..
SELECT CONVERT(INT,@numero)
SELECT CONVERT(char(20),@fecha,112)


------------------------------------------------------------------------------
--TRANSACCIONES: evaluar una porción de código en la que actualizamos o borramos datos
------------------------------------------------------------------------------

SELECT * FROM Paciente
BEGIN TRANSACTION 
	UPDATE Paciente SET telefono=444 WHERE idPaciente=8
IF @@ROWCOUNT =1
	COMMIT TRANSACTION --CONFIRMAR TRANSACCION
ELSE
	ROLLBACK TRANSACTION --CANCELAR TRANSACCION

---------------------------------------------------------------------------------
--JOINS AND UNIONS
------------------------------------------------------------------------------
--JOIN: hacer conexiones por las PK
--INNER JOIN:cruzar datos que coinciden de las tablas A y B
-- SELECT+*+ tabla_a+ alias_a + INNER JOIN + tabla_B + alias_b / ON tabla_b.var_b=tabla_a.var_a
SELECT * Paciente P 
INNER JOIN TurnoPaciente T
ON T.idPaciente=P.idPaciente --se aconseja utilizar la primra variable correspondiente a la de la tabla B (ON)

--LEFT/RIGHT JOIN: registros de la tabla izquierda/derecha (select) y solamente los que coinciden de la derecha/izquierda (ON)

SELECT * Paciente P 
LEFT JOIN TurnoPaciente T
ON T.idPaciente=P.idPaciente

SELECT * Paciente P 
RIGHT JOIN TurnoPaciente T
ON T.idPaciente=P.idPaciente


--UNION: unir dos resultados de dos consultas distintas/misma cantidad de campos
--Sirve para unir dos tablas con los mismos campos y mismo tipo de datos (ej: dos tablas de datos de distintos meses de la misma plataforma)
--
SELECT * FROM Turno WHERE estado=3
UNION --elimina repeticiones
SELECT * FROM Turno WHERE estado=1

SELECT * FROM Turno WHERE estado=3
UNION ALL --no elimina repeticiones
SELECT * FROM Turno WHERE estado=1
--------------------------------------------------------------------------------------

--FUNCIONES ESCALARES: CREATE FUNCTION (variables) RETURNS tipo_variable AS BEGIN (CUERPO FUNCION) RETURN variable
--FUNCIONES TABLA: CREATE FUNCTION (variables) RETURNS variable TABLE (campo1,campo2) AS BEGIN (CUERPO FUNCION) RETURN 
--------------------------------------------------------------------------------------

--TABLAS TEMPORALES

------------------------------------------------------------------------------------
--EN MEMORIA:
-- DECLARE + nombre_var + TABLE (variables tipo)
DECLARE @mitabla TABLE (id int IDENTITY(1,1), pais varchar(50))
-- Asignar registros a los campos
--Al ejecutarla se destruye inmediatamente de memoria

--EJEMPLO:
DECLARE @turnos TABLE(id INT IDENTITY(1,1), idturno turno, idpaciente paciente)
DECLARE @idpaciente paciente
set @idpaciente=8
INSERT INTO @turnos (idturno, idpaciente)
SELECT TP.idturno, P.idpaciente FROM Paciente P
		INNER JOIN TurnoPaciente TP
		ON TP.idPaciente=P.idPaciente

DECLARE @i INT, @total INT
SET @i =1
SET @total = (SELECT count(*) FROM @turnos)

WHILE @i<=@total
BEGIN
		IF(SELECT idpaciente FROM @turnos WHERE id=@i)<>8
			DELETE FROM @turnos WHERE id=@i

		SET @i=@i+1
END

SELECT * FROM Paciente P
	INNER JOIN @turnos T
	ON T.idpaciente=P.idPaciente


--TABLA TEMPORAL FISICA: existe hasta que reiniciemos el servicio de base de datos
--se crea igual que la tabla pero ocn el caracter # al inicio del nombre de la tabla
CREATE TABLE #mitabla(id int IDENTITY(1,1), pais varchar(50))
DROP TABLE #mitable --para borrarla
-----------------------------------------------------------------------------------
--TRIGGER: disparador de eventos (inser, update o delete)
-------------------------------------------------------------------------------
--GUARDAR UN LOG SI UN PACIENTE INGRESADO ES DE MEXICO
--CREATE TRIGGER + nombre_triger + ON + tabla sobre la que se realiza el trigger // AFTER INSERT/UPDATE/DELETE
--AFTER INSERT AS

CREATE TRIGGER PacientesCreados ON Paciente
AFTER INSERT
AS

IF (SELECT idpais FROM inserted)= 'MEX' -- inserted: --ultimo registro insertado-- 
	INSERT into PacienteLog (idpaciente, idpais, fechaAlta)
		SELECT i.idPaciente, i.idPais, getdate() FROM inserted i

EXEC ALTA_Paciente '7263748', 'Nicolas', 'Sanchez', '20221010', 'calle2', 'MEX', '','nicosan@mail','No hay observaciones'

SELECT * FROM PacienteLog

--------------------------------------------------------------------------------
--SCHEDULED JOB
--ADMINISTRACION DE USUARIOS, ROLES, SCHEMAS y PERMISOS
--SQ SERVER PROFILER
-------------------------------------------------------------------------------



