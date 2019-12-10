--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para cantidad de pagos

create or replace trigger pago_vivienda_trigger
before insert on pago_vivienda
for each row
declare
 v_contador numeric(2,0);
begin
	select count(pago_vivienda_id) into v_contador from pago_vivienda;
	if v_contador <= 240 then
		INSERT INTO pago_vivienda VALUES (:NEW.pago_vivienda_id, :NEW.num_pago, :NEW.vivienda_id, :NEW.importe_pago, :NEW.fecha_pago, :NEW.deposito_realizado_pdf);
	ELSE
		raiserror('Ya no se admiten registros');
		ROLLBACK TRANSACTION;
end;
/
show errors;