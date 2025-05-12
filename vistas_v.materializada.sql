
-- vista mostrando a los medicos con sus especialidades
CREATE OR REPLACE VIEW vw_Medicos_Especialidad
AS 
SELECT md.idmedico, CONCAT(md.nombre,' ', md.apellido) AS "Medicos",
	e.nombre AS "Especialidad"
	FROM medicos md
INNER JOIN especialidad e USING(idespecialidad)
ORDER BY md.idmedico;

-- llamando a la vista
SELECT * FROM vw_Medicos_Especialidad;

/* -- vista materializada mostrando a los pacientes con su obra social 
 * la consulta se guarda en la vista creada y se guarda en memoria
 al ser invocada la vista devuelve la informacion que se guardo en la memoria, datos anteriores,
mucho cuidado!! hay que utilizar la sentencia REFRESH MATERIALIZED VIEW para obtener los datos actuales
y luego si llamar a la vista,no antes por que devolvera informacion desactualizada.
*/
CREATE MATERIALIZED VIEW vw_Pacientes_ObraSocial
AS 
SELECT  ps.Nombre, 
		ps.Apellido,
		ps.Provincia,
		ps.Telefono,
		o.nombre AS "Obra social"
	FROM pacientes ps
INNER JOIN obra_social o
	USING(idobrasocial);

-- Hacer un refresh a la vista materializada(guarda los datos de la vista con su informacion )
REFRESH MATERIALIZED VIEW vw_Pacientes_ObraSocial;

-- llamamos a la vista
SELECT * FROM vw_Pacientes_ObraSocial;