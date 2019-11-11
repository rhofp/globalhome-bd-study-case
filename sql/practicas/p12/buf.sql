--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de validar e insertar pagos

select i.inmueble_id,tipo_inmueble,plazo,
num_pago,fecha_pago,importe
from inmueble i, compra_inmueble ci,pago_inmueble pi
where i.inmueble_id=ci.inmueble_id 
and i.inmueble_id=pi.inmueble_id
and tipo_inmueble='C' and status_inmueble_id=5
and i.inmueble_id = 201;

select count(num_pago)
from inmueble i, compra_inmueble ci,pago_inmueble pi
where i.inmueble_id=ci.inmueble_id 
and i.inmueble_id=pi.inmueble_id
and tipo_inmueble='C' and status_inmueble_id=5
and i.inmueble_id = 201;