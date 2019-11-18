-- Tablas involucradas: subasta
col lugar format a10
col nombre format a10
col email format a10

connect flfr_p1101_subastas/david

select q1.cliente_id,email,numero_tarjeta from (
	select c.cliente_id
	from cliente c,tarjeta_cliente tc
	where c.cliente_id = tc.cliente_id
	and extract(year from fecha_nacimiento) >=1970
	and extract(year from fecha_nacimiento) <= 1975
	minus
	select sv.cliente_id from subasta_venta sv
) q1, tarjeta_cliente tc,cliente c
where q1.cliente_id = tc.cliente_id
and c.cliente_id = q1.cliente_id;