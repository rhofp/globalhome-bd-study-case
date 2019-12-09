--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para generar clabe
create or replace trigger vacaciones_alquiler_trigger
after insert on ALQUILER
FOR EACH ROW
DECLARE
	Vtarjeta tarjeta.tarjeta_id%ROWTYPE;
	VnuevaClabe tarjeta.CLABE%ROWTYPE;
	VnuevoMes tarjeta.mesExp%ROWTYPE;
	VnuevoAño tarjeta.añoExp%ROWTYPE;
BEGIN
	IF INSERTING THEN
		SELECT tarjeta_id into Vtarjeta FROM TARJETA WHERE cliente_id = :NEW.usuario_id; 
		IF Vtarjeta is not null then
			DBMS_OUTPUT.PUT_LINE('Por favor inserta tu CLABE' || VnuevaClabe);
			DBMS_OUTPUT.PUT_LINE('Por favor inserta el mes expiración' || VnuevoMes);
			DBMS_OUTPUT.PUT_LINE('Por favor inserta el año de expiración' || VnuevoAño);
			insert into ALQUILER VALUES (tarjeta_seq.NEXTVAL, VnuevaClabe, :NEW.usuario_id, VnuevoMes, VnuevoAño);
		END IF;
	END IF;
END;
/
show errors