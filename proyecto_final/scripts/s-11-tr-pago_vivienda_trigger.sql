--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para cantidad de pagos

--Ya deberia funcionar
create or replace trigger pago_vivienda_trigger
	before insert on pago_vivienda
declare
 v_contador numeric(2,0);
begin
	select count(pago_vivienda_id) into v_contador from pago_vivienda;
	if v_contador > 240 then
		raise_application_error(-20600, 'Ya no se admiten registros');
	end if;
end;
/
show errors