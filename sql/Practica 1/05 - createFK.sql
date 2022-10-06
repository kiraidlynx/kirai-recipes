--foreign key

ALTER TABLE Paciente
	ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)

ALTER TABLE HistoriaPaciente
	ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
	-- las FK solo pueden ser referenciadas a una tabla con una UNICA PK