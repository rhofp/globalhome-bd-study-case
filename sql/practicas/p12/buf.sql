--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de validar e insertar pagos

connect fgfp_p1203_inmuebles/practica12

--select i.inmueble_id,tipo_inmueble,plazo,
--num_pago,fecha_pago,importe,precio_venta
--from inmueble i, compra_inmueble ci,pago_inmueble pi
--where i.inmueble_id=ci.inmueble_id 
--and i.inmueble_id=pi.inmueble_id
--and tipo_inmueble='C' and status_inmueble_id=5;
--and i.inmueble_id = 202;

-- select count(num_pago)
-- from inmueble i, compra_inmueble ci,pago_inmueble pi
-- where i.inmueble_id=ci.inmueble_id 
-- and i.inmueble_id=pi.inmueble_id
-- and tipo_inmueble='C' and status_inmueble_id=5
-- and i.inmueble_id = 201;
--delete from pago_inmueble 
--where inmueble_id=201;

-- 3. Calcular el importe por mes
--select precio_venta/plazo from compra_inmueble;

--select fecha_status,plazo,add_months(fecha_status,-1*(plazo-1)) 
--from inmueble,compra_inmueble;

select i.inmueble_id,tipo_inmueble,i.cliente_id,i.status_inmueble_id,num_pago,importe,precio_venta
	from inmueble i, compra_inmueble ci,pago_inmueble pi
	where i.inmueble_id = ci.inmueble_id 
	and i.inmueble_id = pi.inmueble_id
	and tipo_inmueble='C' 
	and status_inmueble_id=5
	and pi.inmueble_id = 207;