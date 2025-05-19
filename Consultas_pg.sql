
-- averiguar los pacientes que fueron internados con su doctor a cargo 

SELECT CONCAT(ps.nombre,' ', ps.apellido) AS "Paciente", 
       i.fecha, 
       i.diagnostico_preliminar,
       CONCAT(md.nombre,' ',md.apellido)  AS "Medico"  
  FROM internaciones i
INNER JOIN pacientes ps USING(idPaciente) 
INNER JOIN medicos md USING(idMedico);

-- consultando la ultima fecha de egreso 
SELECT e.idegreso, 
       MAX(e.fecha) AS "ultima fecha egreso", 
       CONCAT(ps.nombre,' ',ps.apellido) AS "Paciente"
   FROM egresos e
INNER JOIN pacientes ps USING(idpaciente)
GROUP BY ps.nombre,ps.apellido,e.idegreso
ORDER BY e.fecha DESC
LIMIT 1;

-- consultar los pacientes que no han sido internados

SELECT ps.idpaciente,
       ps.nombre, 
       ps.apellido
   FROM pacientes ps
LEFT JOIN internaciones i USING(idpaciente)
WHERE i.idinternacion IS NULL
ORDER BY ps.idpaciente

-- cuantas internaciones hubo en el mes de febrero 

SELECT COUNT(idinternacion) AS "Total Internaciones",
      (EXTRACT(MONTH FROM fecha)) AS "Mes"
   FROM internaciones
GROUP BY (EXTRACT(MONTH FROM fecha))
HAVING EXTRACT(MONTH FROM fecha) = 2;
	

-- Cuantos pacientes femenino/masculino hay en internacion

SELECT  COUNT(idpaciente) "Total pacientes", 
	gn.nombre AS "Genero"
  FROM pacientes ps
INNER JOIN genero gn USING(idgenero)
GROUP BY gn.nombre;


-- pacientes mayores de 18 

SELECT CONCAT(nombre,' ',apellido) AS "Paciente",
	CASE 
		WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento) >= 18 THEN
			'Es Mayor de 18 años'
		ELSE
			'Es Menor de 18 años'
	END AS "Pacientes mayor de edad"
FROM pacientes

-- cantidad de pacientes que hay internados mediante misma edad

SELECT COUNT(idPaciente) AS "Pacientes",
       (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento)) AS "Edad pacientes"
FROM pacientes
GROUP BY EXTRACT(YEAR FROM fecha_nacimiento);


-- medicos que no tienen internaciones

SELECT md.idmedico,
       md.nombre,
       md.apellido 
  FROM medicos md
LEFT JOIN internaciones i USING(idmedico)
WHERE i.idinternacion IS NULL;

-- buscar nombres de los pacientes que contengan el primer caracter a o h
SELECT idpaciente,
       nombre
  FROM pacientes
WHERE nombre ILIKE 'a%' OR nombre ILIKE 'h%';


-- consulta combinada mostrando nombres de los pacientes internados 
SELECT i.idinternacion,  
       i.habitacion, 
      (SELECT CONCAT(ps.nombre,' ',ps.apellido) AS "Pacientes"
	FROM pacientes ps 
	WHERE i.idpaciente = ps.idpaciente)
FROM internaciones i;


-- eliminar paciente con la obra social UNION PERSONAL
DELETE FROM pacientes
WHERE idpaciente = (SELECT idobrasocial FROM obra_social
		    WHERE nombre = 'UNION PERSONAL');




