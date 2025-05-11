-- INSERCION DE DATOS


-- Obra social
INSERT INTO Obra_Social (Nombre) VALUES
			('OSCHOCA '),
			('OSPRERA '),
			('OSPE '),   
			('UNION PERSONAL'),
			('FEMEBA'),
			('OSMEDICA '),
			('OSPIN '),
			('IOSE ');

-- Especialidad
INSERT INTO Especialidad (Nombre) VALUES 
			 ('Vascular'),
			 ('Urólogo'),
			 ('pediátrica'),
			 ('ortopédico'),
			 ('Oftalmólogo'),
			 ('Obstetricia'),
			 ('maxilofacial'),
			 ('Neurocirujano');

-- Genero
INSERT INTO Genero (Nombre) VALUES ('Femenino'),
				   ('Masculino');

	
-- Pacientes
insert into Pacientes (Nombre, Apellido, Direccion, Provincia, Codigo_Postal, Telefono, Fecha_nacimiento,idGenero, idobrasocial) values
		      ('Allard', 'Hellicar', '9290 Hazelcrest Alley', 'Pontevedra', '5281', '5633872557', '2021-12-31',2,4),
		      ('Miller', 'Hayball', '5 Prairie Rose Road', 'Gjirokastër', '1592', '8389368498', '2018-07-01',2,7), 
		      ('Aurore', 'Coultass', '38 Nancy Drive', 'Shaowu', '2360', '2146588518', '2005-01-06',2,3),
		      ('Jemimah', 'Gantzer', '72263 Carioca Trail', 'Staraya Stanitsa', '3379', '7283445980', '2005-04-18',1,1),  
		      ('Rae', 'Valett', '88965 Duke Way', 'Hilversum', '1333', '7511182863', '2015-05-28',2,5),
		      ('Filippo', 'Ceillier', '660 Roxbury Lane', 'Huangqiao', '8318', '7088415498', '2000-12-04',2,2),
		      ('Maryjo', 'Bannister', '4 Mallard Hill', 'Watari', '1255', '6629767647', '2012-01-01',2,6),
		      ('Avrit', 'Mangon', '76846 Lerdahl Alley', 'Seremban', '5670', '7132449344', '2000-11-07',1,8),
		      ('Holly', 'Langridge', '13136 Holmberg Plaza', 'Stockholm', '1633', '2416029084', '2018-09-05',1,5),
		      ('Martie', 'Vasin', '1 Holy Cross Pass', 'Škofljica', '5301', '4408057775', '2004-07-29',2,1);

-- Medicos
insert into Medicos (Nombre, Apellido, Telefono,idGenero, idEspecialidad) values 
		    ('Zorah', 'Bilovus', '7159243441',2 ,7),
		    ('Pierson', 'Russell', '6598393853',2 ,2),
		    ('Hector', 'Bythell', '9369596910',2 ,5),
		    ('Tully', 'Dymick', '2486773549',1 ,8),
		    ('Arlene', 'Ionn', '3266475272',1 ,4),
		    ('Haslett', 'Tilzey', '9606598339',1 ,6),
		    ('Valentino', 'Piggott', '3416384248',2 ,1),
 		    ('Anestassia', 'Grebner', '9621302839',1 ,3);

-- Internaciones

INSERT INTO Internaciones (habitacion, cama, fecha, Diagnostico_preliminar, idPaciente, idMedico) VALUES 
			  ('A2','09','2025-01-02','Accidente de moto',2,4),
			  ('C6','12','2025-08-29','abertura entre la boca y la nariz',9,1),
			  ('A8','17','2025-03-10','No puede ver, vista nublado',5,5),  
			  ('B1','06','2025-10-24','No puede respirar',7,8),
			  ('B9','15','2025-05-30','Dolor abdominal',10,2),
			  ('C7','01','2025-02-18','llagas en la boca',8,6);

-- Egresos
INSERT INTO Egresos (Fecha, Diagnostico, idPaciente, idMedico) VALUES 
		    ('2025-04-10','Operacion ocular cataratas',5,5),
		    ('2025-03-01','infección neonatal virus herpes simple',8,6),
		    ('2025-02-20','Cirugía fractura de columna',2,4), 
		    ('2025-11-30','Concentraciones bajas de oxígeno en sangre y concentraciones elevadas de dióxido de carbono',7,8), 
		    ('2025-06-27','Cirugía extraccion de glándulas suprarrenal',10,2), 
		    ('2025-09-22','Cirugía cavidal bocal fisura palatina',9,1);
