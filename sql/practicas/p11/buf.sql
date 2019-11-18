-- Tablas involucradas: subasta
col lugar format a10
col nombre_articulo format a15
col nombre format a15
col nombre_subasta format a15
col email format a10

connect flfr_p1101_subastas/david

--EJERCICIO 8
-- select q1.subasta_id, q1.nombre, fecha_inicio from
-- articulo a,(
-- 	select subasta_id, nombre, fecha_inicio
-- 	from subasta
-- 	where extract(year from fecha_inicio) = 2010
-- 	and extract(year from fecha_fin) = 2010
-- 	and to_char(fecha_inicio,'mm') = '01' 
-- 	or to_char(fecha_inicio,'mm') = '03' 
-- 	or to_char(fecha_inicio,'mm') = '06'
-- ) q1, status_articulo sa
-- where q1.subasta_id = a.subasta_id
-- and a.status_articulo_id = sa.status_articulo_id
-- and sa.clave ='VENDIDO'
-- or sa.clave = 'ENTREGADO';

select s.subasta_id,s.nombre,fecha_inicio,a.nombre,a.clave_articulo
from subasta s,articulo a
where s.subasta_id = a.subasta_id
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
order by s.subasta_id;