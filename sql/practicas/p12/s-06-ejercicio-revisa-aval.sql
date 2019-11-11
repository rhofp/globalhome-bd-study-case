--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de crear trigger

set serveroutput on

create or replace trigger revision_avales
	-- el triger se activa en insercion o actualizacion de cliente_id y status_inm...
before insert or update of cliente,status_inmueble_id on inmueble
--declare
	v_aval_cliente_id cliente.cliente_id%type;
	v_status_inmueble_id inmueble.status_inmueble_id%type;
begin
	
	if :new.cliente_id is null
	and :new.status_inmueble_id <> 1 then
		raise_application_error(-20010,
		'El inmueble debería estar disponible dado que el cliente es nulo');
	end if;	

	if :new.cliente_id is not null
	and :new.status_inmueble_id = 1 then
		raise_application_error(-20010,
		'El inmueble no debería estar disponible dado que el cliente no es nulo');
	end if;	

	if :new.cliente_id is not null
	and  :new.status_inmueble_id <>1 
	and :new.tatus_inmueble_id <> 5 then
		-- checar que el nuevo cliente cuente con aval asignado.
		select aval_cliente_id into v_aval_cliente_id
		from cliente where cliente_id = :new.cliente_id;

		-- si hay aval, debe contar con al menos un inmueble pagado
		if v_aval_cliente_id is not null then
			select status_inmueble_id into v_status_inmueble_id from inmueble
			where status_inmueble_id = 5 and cliente_id = v_aval_cliente_id;

			if v_status_inmueble_id is null then
				insert into asignacion_pendiente(asignacion_pendiente_id,
				descripcion,fecha_registro,inmueble_id,cliente_sin_aval_id)
				values();
			end if;

		-- en caso contrario, registrar al cliente en asignacion_pendiente y posteriomente lanzar
		-- error
		end if;

end;