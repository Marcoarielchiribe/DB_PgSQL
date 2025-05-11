-- creacion de una funcion que retorne como tabla, mostrando las obras sociales que tengan mas de un paciente

CREATE OR REPLACE FUNCTION FC_obrasociales_mas_pacientes()
RETURNS TABLE(ObraSocial VARCHAR, Pasientes BIGINT) AS 
$$
BEGIN
	
	RETURN QUERY -- al ser la funcion de tipo tabla,retorna la consulta
		SELECT o.nombre AS "Obra Social",COUNT(ps.nombre) AS "Pacientes" FROM pacientes ps
		INNER JOIN obra_social o USING(idobrasocial)
		GROUP BY o.nombre
		HAVING COUNT(ps.nombre) > 1;

END;
$$ LANGUAGE 'plpgsql';

-- formas de llamar a la funcion
SELECT FC_obrasociales_mas_pacientes(); -- muestra la informacion como una tupla
SELECT (FC_obrasociales_mas_pacientes()).*; -- muestra todos los campos
SELECT * FROM FC_obrasociales_mas_pacientes(); -- como una tabla


-- procedimiento pl/pgsql mostrando el nombre de los medicos en el log
DO 
$$
	DECLARE 
		nom record;
		contador integer := 0;
	BEGIN 
		FOR nom IN SELECT nombre FROM medicos LOOP 
		RAISE NOTICE 'Nombre medico: %', nom.nombre;
		contador := contador + 1;
		END LOOP;
		RAISE NOTICE 'contador: %', contador;
	END
$$

-- Combinando pl/pgsql que retorna la cantidad de registros que hay en medicos y muestra en el log los nombres
CREATE FUNCTION f_consulta_nombres_medicos()
RETURNS INTEGER
LANGUAGE 'plpgsql'
AS $$
	DECLARE 
		recur1 record;
		contador INTEGER := 0;
	BEGIN
		FOR recur1 IN SELECT * FROM medicos LOOP
		RAISE NOTICE 'Nombre medico: %', recur1.nombre;
		contador := contador + 1;
		END LOOP;
		RETURN contador;
	END;
$$

-- formas de llamar a la funcion
SELECT * FROM f_consulta_nombres_medicos();
SELECT f_consulta_nombres_medicos();

-- Creacion de una funcion que muestre cuantas internaciones hubo en un determinado mes en formato string
CREATE OR REPLACE FUNCTION f_internacionesxmes(
	IN p_mes VARCHAR
) RETURNS TABLE(Mes_Internacion TEXT, Internaciones BIGINT)
AS $$
	DECLARE
		consl VARCHAR := (SELECT (to_char(fecha,'tmmonth')) AS "Mes Internacion"
							FROM internaciones
							GROUP BY (to_char(fecha,'tmmonth'))
							HAVING (to_char(fecha,'tmmonth')) = p_mes);
	BEGIN
		IF consl = p_mes THEN
			RETURN QUERY 
					SELECT (to_char(fecha,'tmmonth')) AS "Mes Internacion",
							COUNT(idInternacion) AS "Total internaciones"
					FROM internaciones
					GROUP BY (to_char(fecha,'tmmonth'))
					HAVING (to_char(fecha,'tmmonth')) = p_mes;
		ELSE 
			RAISE NOTICE 'No hay internaciones en el mes ingresado !!!';
		END IF;
	END;
$$LANGUAGE 'plpgsql';

SELECT (f_internacionesxmes('agosto')).*;
