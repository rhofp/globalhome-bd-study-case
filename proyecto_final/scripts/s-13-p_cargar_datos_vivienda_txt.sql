--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Programa que carga datos de una tabla 
--externa a la jerarquia de vivienda

connect ff_proy_admin/proyectof

Prompt creando bloque pl/sql para ejecutar Procedimiento p_cargar_datos_vivienda_txt

create or replace procedure p_cargar_datos_vivienda_txt is

cursor cur_viviendas is
select * from vivienda_ext;

--variables
v_vivienda_no_valida number(1,0) := 0;

begin

	for p in cur_viviendas loop
		-- Lo siguientes datos deben ser obligatorios, en caso de que 
		-- falle se reportaran el un tabla temporal.
		-- ubicacion_longitud
		-- ubicacion_latitud
		-- direccion
		-- capacidad_personas_max
		-- descripcion
		if 	p.ubicacion_longitud is null or 
			p.ubicacion_latitud is null or
			p.direccion is null or
			p.capacidad_personas_max is null or
			p.descripcion is null then

			insert into vivienda_invalida_temp(
				ubicacion_longitud,
				ubicacion_latitud,
				direccion,
				capacidad_personas_max,
				descripcion
			) values(
				p.ubicacion_longitud,
				p.ubicacion_latitud,
				p.direccion,
				p.capacidad_personas_max,
				p.descripcion
			);

			v_vivienda_no_valida := 1;

		end if;

		if v_vivienda_no_valida = 0 then
			if 	p.renta_mensual is not null and 
				p.dia_deposito is not null then
				-- Significa que se trata de una vivienda_renta, por lo tanto se hace insert

				insert into vivienda(
					vivienda_id,
					ubicacion_longitud,
					ubicacion_latitud,
					direccion,
					capacidad_personas_max,
					descripcion,
					tipo
				)values(
					vivienda_seq.nextval,
					p.ubicacion_longitud,
					p.ubicacion_latitud,
					p.direccion,
					p.capacidad_personas_max,
					p.descripcion,
					'R'
				);

				insert into vivienda_renta(
					vivienda_id,
					renta_mensual,
					dia_deposito
				)values(
					vivienda_seq.currval,
					p.renta_mensual,
					p.dia_deposito
				);
			elsif 	p.fecha_inicio is not null and
					p.dias_renta is not null then

				-- La vivienda es de tipo vacacional

				insert into vivienda(
					vivienda_id,
					ubicacion_longitud,
					ubicacion_latitud,
					direccion,
					capacidad_personas_max,
					descripcion,
					tipo
				)values(
					vivienda_seq.nextval,
					p.ubicacion_longitud,
					p.ubicacion_latitud,
					p.direccion,
					p.capacidad_personas_max,
					p.descripcion,
					'V'
				);

				insert into vivienda_vacacional (
					vivienda_id,
					fecha_inicio,
					dias_renta
				)values(
					vivienda_seq.currval,
					p.fecha_inicio,
					p.dias_renta
				);
			else 
				insert into vivienda_invalida_temp(
					ubicacion_longitud,
					ubicacion_latitud,
					direccion,
					capacidad_personas_max,
					descripcion
				) values(
					p.ubicacion_longitud,
					p.ubicacion_latitud,
					p.direccion,
					p.capacidad_personas_max,
					p.descripcion
				);

			end if;				

		end if;

	end loop;

end;
/
show errors
