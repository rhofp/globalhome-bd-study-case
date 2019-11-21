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
-- select factura_cliente_id,max(fecha_factura) from (
-- 	select fc.factura_cliente_id,fecha_factura
-- 	from factura_cliente fc, subasta_venta sv, cliente c
-- 	where fc.factura_cliente_id = sv.factura_cliente_id
-- 	and c.cliente_id = sv.cliente_id
-- 	and c.nombre = 'GALILEA'
-- 	and c.apellido_paterno = 'GOMEZ'
-- 	and c.apellido_materno = 'GONZALEZ'
-- )
-- group by factura_cliente_id;

--consulta 7
select q1.cliente_id,nombre,apellido_paterno,apellido_materno,num_articulos,total
from (
    select cliente_id--, count(articulo_id)
    from subasta_venta
    group by cliente_id
    having count(articulo_id) > 5
    union
    select cliente_id--, sum(precio_venta)
    from subasta_venta
    group by cliente_id
    having sum(precio_venta) > 3000000
) q1
join (
    select cliente_id,count(articulo_id) as num_articulos, sum(precio_venta) as total
    from subasta_venta
    group by cliente_id
    having count(articulo_id) > 5 or sum(precio_venta) > 3000000
) q2
on q1.cliente_id = q2.cliente_id
join cliente c
on c.cliente_id = q1.cliente_id;