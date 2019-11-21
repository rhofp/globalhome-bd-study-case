--col lugar format a5
--col nombre_articulo format a10
col nombre format a10
col apellido_paterno format a10
col apellido_materno format a10
-- col email format a10

connect flfr_p1101_subastas/david

--consulta 9
-- select sum(precio_venta) total,factura_cliente_id
-- from subasta_venta
-- where cliente_id = (
-- 	select cliente_id
-- 	from cliente
-- 	where nombre = 'GALILEA'
-- 	and apellido_paterno = 'GOMEZ'
-- 	and apellido_materno = 'GONZALEZ'
-- )
-- group by factura_cliente_id
-- and factura_cliente_id = (
-- 	select factura_cliente_id
-- 	from factura_cliente
-- 	where fecha_factura = (
-- 		select max(fecha_factura)
-- 		from factura_cliente
-- 	)
-- );
select sum(precio_venta) total
from factura_cliente fc, subasta_venta sv, cliente c
where fc.factura_cliente_id = sv.factura_cliente_id
and c.cliente_id = sv.cliente_id
and c.nombre = 'GALILEA'
and c.apellido_paterno = 'GOMEZ'
and c.apellido_materno = 'GONZALEZ'
and fecha_factura =(
	select max(fecha_factura) max_fecha
	from factura_cliente fc, subasta_venta sv, cliente c
	where fc.factura_cliente_id = sv.factura_cliente_id
	and c.cliente_id = sv.cliente_id
	and c.nombre = 'GALILEA'
	and c.apellido_paterno = 'GOMEZ'
	and c.apellido_materno = 'GONZALEZ'
)
group by fecha_factura,sv.cliente_id;


