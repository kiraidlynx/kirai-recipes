
--STORE PROCEDURE
/****** Object:  StoredProcedure [dbo].[S_pacientes]    Script Date: 07/10/2022 16:25:41 ******/
SET ANSI_NULLS ON --permite buscar valores nulos
GO
SET QUOTED_IDENTIFIER ON --permite quotear palabras reservadas
GO

CREATE PROC S_pacientes2 (
			@idpaciente INT 
)
AS

SELECT * ,
	(SELECT ps.pais FROM Pais ps WHERE ps.idPais=pa.idPais) descPais --devolver solo un valor: arreglar por un alias de tablas idpais=idpais y alias en select
FROM Paciente pa WHERE idPaciente = @idpaciente --pa es alias de tabla

GO

-----------------------------------------------------------------------

--VARIABLE
--DECLARE + @nombre_var + TIPO VAR + inicializar

DECLARE @ordenamiento CHAR(1) = 'A'
DECLARE @valorOrdenamiento CHAR(1)
SET @valorOrdenamiento=ISNULL(@ordenamiento,'A') --inicializar una variable
PRINT @valorOrdenamiento

------------------------------------------------------------------------

--Subconsultas y Alias
--SUBCONSULTA: select dentro de otro select

EXEC S_pacientes2 3






