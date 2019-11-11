--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de validar e insertar pagos

set serveroutput on
create or replace procedure sp_corrige_pago_inmuebles(p_inmueble_id number,
p_actualiado out number) is

v_plazo compra_inmueble.plazo%type;
v_num_pagos_totales number;
v_num_pagos_contador number;
v_primer_fecha_pago date;
v_precio_venta compra_inmueble.precio_venta%type;
v_precio_importe pago_inmueble.importe%type;

begin
	
	--Select que cuenta el numero de pagos de determinado inmueble_id,
	-- almacenar en v_num_pagos_totales
	select count(num_pago) into v_num_pagos_totales
	from inmueble i, compra_inmueble ci,pago_inmueble pi
	where i.inmueble_id=ci.inmueble_id 
	and i.inmueble_id=pi.inmueble_id
	and tipo_inmueble='C' and status_inmueble_id=5
	and i.inmueble_id = p_inmueble_id;

	select plazo into v_plazo from compra_inmueble where inmueble_id=p_inmueble_id;

	if v_plazo <> v_num_pagos_totales then
		--logica para actualizar pagos.

		-- 1. Eliminar los pagos existentes del inmueble_id
		-- 2. Calcular la primera fecha de pago con 
		--		add_months(fecha_status,-1*(plazo-1))
		-- 3. Calcular el importe por mes
		-- 4. Iterar desde 1 hasta plazo y hacer los inserts necesarios.

		-- indicamos que si hubo actualizacion
		p_actualiado = 1;

	else
		-- si no entre al if entonce no se hacen actualizaciones, por lo tanto
		p_actualiado = 0;
	end if;

end;
/
show errors