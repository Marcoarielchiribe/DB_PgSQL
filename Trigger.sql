
-- funcion que va a retornar un trigger(actualizacion,insercion)
CREATE OR REPLACE FUNCTION FC_TR_Insert_update_paciente()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
	IF TG_OP = 'INSERTS' THEN
		INSERT INTO log_pacientes (id_paciente, nombre,apellido,usuario,fecha,operacion) VALUES
				(NEW.idpaciente,NEW.Nombre,NEW.Apellido,USER,NOW(),'NUEVO REGISTRO');
	ELSEIF TG_OP = 'UPDATE' THEN
		INSERT INTO log_pacientes (id_paciente, nombre,apellido,usuario,fecha,operacion) VALUES
				(OLD.idpaciente,OLD.Nombre,OLD.Apellido,USER,NOW(),'REGISTRO ACTUALIZADO');
	END IF;
	RETURN NEW;
END $$;

-- creacion del trigger
CREATE TRIGGER tr_InsertUpdatePacientes 
BEFORE INSERT OR UPDATE
ON pacientes
FOR EACH ROW
EXECUTE PROCEDURE FC_TR_Insert_update_paciente();

SELECT * FROM pacientes;

INSERT INTO pacientes 
	(nombre, apellido, direccion, provincia, codigo_postal, telefono, fecha_nacimiento, idgenero, idobrasocial) VALUES
	('Jon','Walker','141 Sheneider','Brurin',5400,1598035244,'1996-05-06',2,1);