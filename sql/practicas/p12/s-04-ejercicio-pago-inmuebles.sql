--@Autor: Flores Garcia Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de validar e insertar pagos

connect fgfp_p1203_inmuebles/practica12

set serveroutput on
create or replace procedure sp_corrige_pago_inmuebles(p_inmueble_id number,
p_actualiado out number) is

v_plazo number;
v_num_pagos_totales number;
v_num_pagos_contador number;
v_primer_fecha_pago date;
v_precio_venta compra_inmueble.precio_venta%type;
v_precio_importe pago_inmueble.importe%type;
v_fecha_status date;

begin
	-- Inicializando v_fecha_status CREO AQUI HAY ERROR
	select sysdate into v_fecha_status from dual;
	-- Asignando v_plazo
	select avg(plazo) into v_plazo from compra_inmueble 
	where inmueble_id=p_inmueble_id; -- para ejemplo retorna 163
	--Select que cuenta el numero de pagos de determinado inmueble_id,
	-- almacenar en v_num_pagos_totales
	select count(*) into v_num_pagos_totales from pago_inmueble
	where inmueble_id = p_inmueble_id;

	select precio_venta into v_precio_venta from compra_inmueble
	where inmueble_id = p_inmueble_id;

	if v_plazo != v_num_pagos_totales then
		--Logica para actualizar pagos.
		-- 1. Eliminar los pagos existentes del inmueble_id
		delete from pago_inmueble 
		where inmueble_id = p_inmueble_id;
		-- 2. Calcular la primera fecha de pago con 
		--	  add_months(fecha_status,-1*(plazo-1))
		v_primer_fecha_pago := add_months(v_fecha_status,-1*(v_plazo-1));
		-- 3. Calcular el importe por mes
		v_precio_importe := trunc(v_precio_venta/v_plazo,2);
		-- 4. Iterar desde 1 hasta plazo y hacer los inserts necesarios.
		for v_num_pagos_contador in 1 .. v_plazo loop

			if v_num_pagos_contador = v_plazo then
				v_precio_importe := round(v_precio_importe 
				+ (v_precio_venta-v_precio_importe*v_plazo),2);
			end if;

			insert into pago_inmueble(inmueble_id,num_pago,fecha_pago,importe)
			values(p_inmueble_id,v_num_pagos_contador,v_primer_fecha_pago,v_precio_importe);

			v_primer_fecha_pago := add_months(v_primer_fecha_pago,1);
		end loop;
		p_actualiado := 1;

	else
		-- si no entre al if entonce no se hacen actualizaciones, por lo tanto
		p_actualiado := 0;
	end if;

end;
/
show errors