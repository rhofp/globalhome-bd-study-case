/*
Cuando una vivienda para vacacionar este disponible, 
se enviarará un mensaje a todos los usuarios interesados.
*/
create or replace trigger vivienda_vacacional_disponible 
	after update on status_vivienda
	for each row
declare
 v_conteo_interesados NUMERIC(3,0);
begin 
	if :NEW.clave = 'DISPONIBLE' then	
		select count(interesado_vivienda_vac_id) into v_conteo_interesados from interesado_vivienda_vac;
		for i in 1..v_conteo_interesados
		loop
			update interesado_vivienda_vac set notificacion_enviado = '1';
		end loop;
	end if;
end;
/
show errors