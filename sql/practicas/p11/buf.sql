-- col lugar format a10
col nombre_articulo format a10
-- col nombre format a10
-- col nombre_subasta format a10
-- col email format a10

connect flfr_p1101_subastas/david

--tablas involucradas: subasta,articulo
select s.subasta_id,fecha_inicio,articulo_id,a.nombre nombre_articulo,
precio_inicial,(
	select avg(precio_inicial) 
	from articulo a
	join subasta s
	on s.subasta_id = a.subasta_id
	where lower(a.nombre) like '%motocicleta%'
	and extract(year from fecha_inicio) = 2010
	and extract(year from fecha_fin) = 2010
) promedio
from subasta s, articulo a
where s.subasta_id = a.subasta_id
and extract(year from fecha_inicio) = 2010
and extract(year from fecha_fin) = 2010
and extract(month from fecha_inicio) = 7
and lower(a.nombre) like '%motocicleta%'
and (status_articulo_id = 3
or status_articulo_id = 4);