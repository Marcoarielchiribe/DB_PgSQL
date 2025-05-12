
-- creacion indice pacientes
CREATE INDEX indx_nombre_paciente ON pacientes(nombre);

-- ver indices creados en la tabla pacientes
SELECT 	tablename,
		indexname, 
		indexdef -- definicion de como esta estructurado la creacion del indice
	FROM pg_indexes -- vista del sistema dando informacion sobre indices
WHERE tablename = 'pacientes'; 

-- borrar indice
DROP INDEX indx_nombre_paciente;


-- creacion indice medicos
CREATE INDEX indx_apellido_medico ON medicos(apellido);

-- ver los indices creados en la tabla medico
SELECT tablename, 
		indexname, 
		indexdef
FROM pg_indexes
WHERE tablename = 'medicos';

-- borrar indice 
DROP INDEX indx_apellido_medico;