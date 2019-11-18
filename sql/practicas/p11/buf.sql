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

	select min(precio_inicial) mas_barato_compra, 
	max(precio_inicial) mas_caro_compra, 
	min(precio_venta) mas_barato_venta,
	max(precio_venta) mas_caro_venta 
	from (
		select sv.precio_venta, a.precio_inicial
		from subasta s
		join articulo a
		on s.subasta_id = a.subasta_id
		join subasta_venta sv
		on sv.articulo_id = a. articulo_id
		where s.nombre = 'EXPO-MAZATLAN' 
	);