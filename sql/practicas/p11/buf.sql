-- Tablas involucradas: subasta
col lugar format a10
col nombre_articulo format a10
col nombre format a10
col nombre_subasta format a10
col email format a10

connect flfr_p1101_subastas/david

-- select q1.subasta_id, s.nombre nombre_subasta,s.fecha_inicio,
-- a.nombre nombre_articulo,a.clave_articulo,
-- max(q1.precio_venta) mas_caro from (
-- 	select s.subasta_id,sv.precio_venta,a.nombre nombre_articulo
-- 	from subasta s,articulo a, subasta_venta sv
-- 	where s.subasta_id = a.subasta_id 
-- 	and sv.articulo_id = a.articulo_id
-- 	and (
-- 		extract(year from fecha_inicio) = 2010
-- 		and extract(year from fecha_fin) = 2010
-- 	) and (
-- 		extract(month from fecha_inicio) = 1
-- 		or extract(month from fecha_inicio) = 3
-- 		or extract(month from fecha_inicio) = 6
-- 	) and (
-- 		a.status_articulo_id = 3 
-- 		or a.status_articulo_id = 4
-- 	)
-- ) q1
-- join subasta s
-- on q1.subasta_id = s.subasta_id
-- join articulo a
-- on a.subasta_id = q1.subasta_id
-- join subasta_venta sv
-- on sv.articulo_id = a.articulo_id
-- where q1.nombre_articulo = a.nombre
-- group by  q1.subasta_id, s.nombre,s.fecha_inicio,sv.precio_venta,
-- a.nombre,a.clave_articulo
-- having max(q1.precio_venta) = sv.precio_venta
-- order by q1.subasta_id;

select q1.subasta_id,q1.nombre_subasta,fecha_inicio,a.nombre nombre_articulo,
a.clave_articulo,q1.mas_caro
from (
	select s.subasta_id,max(precio_venta) mas_caro,fecha_inicio,fecha_fin,
	s.nombre nombre_subasta
	from subasta s,articulo a, subasta_venta sv
	where s.subasta_id = a.subasta_id 
	and sv.articulo_id = a.articulo_id
	group by s.subasta_id,fecha_inicio,fecha_fin,s.nombre
) q1,articulo a, subasta_venta sv
where q1.subasta_id = a.subasta_id 
and sv.articulo_id = a.articulo_id
and sv.precio_venta = q1.mas_caro
and (
	extract(year from fecha_inicio) = 2010
	and extract(year from fecha_fin) = 2010
) and (
	extract(month from fecha_inicio) = 1
	or extract(month from fecha_inicio) = 3
	or extract(month from fecha_inicio) = 6
) and (
	a.status_articulo_id = 3 
	or a.status_articulo_id = 4
)
order by subasta_id;