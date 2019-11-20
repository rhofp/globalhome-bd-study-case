-- col lugar format a10
col nombre_articulo format a10
col nombre format a10
-- col nombre_subasta format a10
-- col email format a10

connect flfr_p1101_subastas/david

--consulta 13
select s.subasta_id,s.nombre,s.fecha_inicio,sum(sv.precio_venta) total_ventas
from subasta s, articulo a, subasta_venta sv
where s.subasta_id = a.subasta_id
and a.articulo_id = sv.articulo_id
and extract(year from fecha_inicio) = 2010
and extract(year from fecha_fin) = 2010
group by s.subasta_id,s.nombre,s.fecha_inicio
having sum(sv.precio_venta) >= 3000000
order by s.subasta_id;