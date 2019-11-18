-- Tablas involucradas: subasta
col lugar format a10
col nombre_articulo format a10
col nombre format a10
col nombre_subasta format a10
col email format a10

connect flfr_p1101_subastas/david

--EJERCICIO 8
select q1.subasta_id, s.nombre,s.fecha_inicio,a.nombre,a.clave_articulo,
max(q1.precio_venta) mas_caro from (
	select s.subasta_id,sv.precio_venta
	from subasta s,articulo a, subasta_venta sv
	where s.subasta_id = a.subasta_id and sv.articulo_id = a.articulo_id
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
) q1
join subasta s
on q1.subasta_id = s.subasta_id
join articulo a
on a.articulo_id = s.subasta_id
group by  q1.subasta_id, s.nombre,s.fecha_inicio,a.nombre,a.clave_articulo
order by q1.subasta_id;
