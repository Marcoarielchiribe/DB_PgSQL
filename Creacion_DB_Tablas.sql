-- Proyecto DB ControlIternacion

CREATE DATABASE Control_Internacion;

-- Creacion Tablas 

CREATE TABLE Obra_Social(
idObrasocial SERIAL NOT NULL,
Nombre VARCHAR(30),
CONSTRAINT idObrasocial_pkey
PRIMARY KEY (idObrasocial)
);

CREATE TABLE Especialidad(
idEspecialidad SERIAL NOT NULL,
Nombre VARCHAR(30),	
CONSTRAINT idEspecialidad_pkey
PRIMARY KEY (idEspecialidad)
);

CREATE TABLE Genero (
idGenero SERIAL NOT NULL,
Nombre VARCHAR(10),
CONSTRAINT idGenero_pkey
PRIMARY KEY (idGenero)
);


CREATE TABLE Pacientes(
idPaciente SERIAL NOT NULL,
Nombre VARCHAR(30),	
Apellido VARCHAR(30),
Direccion VARCHAR(30) NOT NULL,
Provincia VARCHAR(20),
Codigo_postal INTEGER NOT NULL,
Telefono CHAR(11),
Fecha_nacimiento DATE NOT NULL,
idGenero INTEGER NOT NULL,
idObrasocial INTEGER NOT NULL,
CONSTRAINT idPaciente_pkey
PRIMARY KEY (idPaciente),
CONSTRAINT idObrasocial_foreign
FOREIGN KEY (idObrasocial) REFERENCES Obra_Social(idObrasocial),
CONSTRAINT idGenero_foreign
FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)
);


CREATE TABLE Medicos(
idMedico SERIAL NOT NULL,
Nombre VARCHAR(30),	
Apellido VARCHAR(30),
Telefono CHAR(11) NOT NULL,
idGenero INTEGER NOT NULL,
idEspecialidad INTEGER NOT NULL,
CONSTRAINT idMedico_pkey
PRIMARY KEY (idMedico),
CONSTRAINT idGenero_foreign
FOREIGN KEY (idGenero) REFERENCES Genero(idGenero),
CONSTRAINT idEspecialidad_foreign
FOREIGN KEY (idEspecialidad) REFERENCES Especialidad(idEspecialidad)
);

CREATE TABLE Internaciones(
idInternacion SERIAL NOT NULL,
Habitacion CHAR(2),	
cama CHAR(2),
Fecha DATE NOT NULL,
Diagnostico_preliminar VARCHAR(100),
idPaciente INTEGER NOT NULL,
idMedico INTEGER NOT NULL,
CONSTRAINT idInternacion_pkey
PRIMARY KEY (idInternacion),
CONSTRAINT idPaciente_foreign
FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
CONSTRAINT idMedico_foreign
FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

CREATE TABLE Egresos(
idEgreso SERIAL NOT NULL,
Fecha DATE NOT NULL,
Diagnostico VARCHAR(100),
idPaciente INTEGER NOT NULL,
idMedico INTEGER NOT NULL,
CONSTRAINT idEgreso_pkey
PRIMARY KEY (idEgreso),
CONSTRAINT idPaciente_foreign
FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
CONSTRAINT idMedico_foreign
FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

-- creacion tabla log pacientes
CREATE TABLE IF NOT EXISTS log_pacientes(
id SERIAL,
id_Paciente INTEGER,
nombre VARCHAR(30),
apellido VARCHAR(30),
usuario VARCHAR(20),
fecha TIMESTAMP,
operacion VARCHAR(30)
);

