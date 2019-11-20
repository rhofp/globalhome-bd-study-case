col lugar format a5
col nombre_articulo format a10
col nombre format a5
-- col nombre_subasta format a10
-- col email format a10

connect flfr_p1101_subastas/david

--consulta 15
select  s.*
from subasta s
join articulo a
on s.SUBASTA_ID = a.subasta_id
join  subasta_venta sv
on sv.articulo_id = a.articulo_id
group by s.SUBASTA_ID,s.nombre,s.fecha_inicio,
s.fecha_fin,s.lugar,s.cupo
having  count(*)  =  (
	select max(num_articulos)
	from(
		select count(*)  as num_articulos
		from subasta s, articulo a, subasta_venta sv
		where s.SUBASTA_ID = a.SUBASTA_ID
		and  a.ARTICULO_ID = sv.ARTICULO_ID
		group by  s.SUBASTA_ID
	)
);