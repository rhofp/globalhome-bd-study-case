--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para generar solicitar tarjeta
create or replace trigger vacaciones_alquiler_trigger
after insert on ALQUILER
FOR EACH ROW
DECLARE
	v_tarjeta tarjeta.tarjeta_id%type;
BEGIN
	SELECT tarjeta_id into v_tarjeta FROM TARJETA WHERE cliente_id = :new.usuario_id; 
	IF v_tarjeta is null then
		DBMS_OUTPUT.PUT_LINE('Por favor agrega una forma de pago antes de continuar navegando.');
	END IF;
END;
/
show errors