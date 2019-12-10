--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Programa que corrije los folios de contrato y alquiler

--connect ff_proy_admin/proyectof

Prompt creando bloque pl/sql para ejecutar Procedimiento p_corrige_banderas

-- El programa debe verificar que el folio tenga en formato adecuado, en caso de no tenerlo
-- usar la funcion p_corrige_folio

create or replace procedure p_corrige_banderas is

cursor cur_vivienda is
select * from vivienda;

v_vivienda_renta_flag number(1,0) := 0;
v_vivienda_vacacional_flag number(1,0) := 0;
v_vivienda_venta_flag number(1,0) := 0;
v_vivienda_temp_status number;

begin

	for p in cur_vivienda loop
		select count(vivienda_id) into v_vivienda_temp_status
		from vivienda_renta
		where vivienda_id = p.vivienda_id;

		if v_vivienda_temp_status = 1 then 
			v_vivienda_renta_flag := 1;
		end if;

		select count(vivienda_id) into v_vivienda_temp_status
		from vivienda_vacacional
		where vivienda_id = p.vivienda_id;

		if v_vivienda_temp_status = 1 then 
			v_vivienda_vacacional_flag := 1;
		end if;

		select count(vivienda_id) into v_vivienda_temp_status
		from vivienda_venta
		where vivienda_id = p.vivienda_id;

		if v_vivienda_temp_status = 1 then 
			v_vivienda_venta_flag := 1;
		end if;


		if v_vivienda_renta_flag = 1 then
			update vivienda set es_renta = 1
			where vivienda_id = p.vivienda_id;
		end if;

		if v_vivienda_vacacional_flag = 1 then
			update vivienda set es_vacacional = 1
			where vivienda_id = p.vivienda_id;
		end if;

		if 	v_vivienda_vacacional_flag = 1 and 
			v_vivienda_vacacional_flag = 0 and 
			v_vivienda_renta_flag = 0 then

			update vivienda set es_venta = 1
			where vivienda_id = p.vivienda_id;
		end if;

	end loop;

end;
/
show errors