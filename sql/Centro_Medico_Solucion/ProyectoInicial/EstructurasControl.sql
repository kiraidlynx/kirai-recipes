
---------------------------------------------------------------------------------
-- IF
-- IF + BEGIN + condicion BOOL + sentencia a ejecutar + END
-- ELSE   + BEGIN + sentencia a ejecutar + END

declare @idpaciente int
set @idpaciente = 3

declare @idturno int


IF @idpaciente = 3
BEGIN
	set @idturno = 20
	select * from Paciente where idPaciente=@idpaciente
	print @idturno
END

ELSE
BEGIN
	print 'NA'
END

-------------------------------------------------------------------------------
-- EXIST: si existe un determinado numero de registros - CONDICIONAL

IF EXISTS(SELECT * FROM Paciente WHERE idPaciente=2)

-------------------------------------------------------------------------------
--WHILE
-- WHILE + condición + sentencias a ejecutar

DECLARE @contador int=0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador +1

END

-------------------------------------------------------------------------------
--CASE: decisiones en función del valor de una variable o campo
-- CASE + WHEN + condicion bool + THEN + valor devuelto + ELSE + valor_devuelto2 END

declare @valor int
declare @resultado char(10)=''
set @valor=20

set @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
					   WHEN @valor = 20 THEN 'VERDE'
					   WHEN @valor = 30 THEN 'AZUL'
				  END)
PRINT @resultado

SELECT *,(CASE WHEN estado=1 THEN 'VERDE') as colorTurno FROM Turno --as añade el nombre al campo, podemos usar ELSE si no se cumple condición
-------------------------------------------------------------------------------
--RETURN: salir del script forzosamente
-- RETURN dentro de loops
DECLARE @contador int=0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador +1
	if @contador=3
		RETURN
END

--BREAK: salir del bucle antes de que acabe pero sigue ejecutando las instrucciones siguientes
--
DECLARE @contador int=0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador +1
	if @contador=3
		BREAK
END

-----------------------------------------------------
--TRY CATCH: manejo de errores no controlados en tiempo de ejecución
-- 
DECLARE @contador int=0

BEGIN TRY
--EJECUTAR CÓDIGO. SI DA ERROR SE ENVÍA AL CATCH
SET @contador='TEXTO'
END TRY

BEGIN CATCH
	PRINT 'NO ES POSIBLE ASIGNAR UN STRING A UNA VARIABLE ENTERA'
END CATCH

-------------------------------------------------------------














