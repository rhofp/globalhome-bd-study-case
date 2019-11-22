--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 19/11/2019
--@Descripcion: Subconsultas

--EJERCICIO 1
create table consulta_1 as (
	select count(*) num_articulos, sum(precio_venta) ingresos from (
		select precio_venta
		from subasta s
		join articulo a
		on  s.subasta_id = a.subasta_id
		left join subasta_venta sv
		on sv.articulo_id = a.articulo_id
		where to_char(fecha_inicio,'yyyy') = '2010'
		and to_char(fecha_fin,'yyyy') = '2010'
	)
);

--Ejercicio 2
create table consulta_2 as(
	select count(*) total_vendidos from( 
		select *
		from subasta s
		join articulo a
		on s.subasta_id=a.subasta_id
		join status_articulo st
		on a.status_articulo_id=st.status_articulo_id
		where to_char(fecha_inicio,'yyyy') = '2010'
		and to_char(fecha_fin,'yyyy') = '2010' 
		and a.status_articulo_id != 3
		and a.status_articulo_id !=4
	)
); 

--EJERCICIO 3
create table consulta_3 as ( 
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
	)
);

--EJERCICIO 4
create table consulta_4 as (
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
	and c.cliente_id = q1.cliente_id
);

--ejercicio 5
create table consulta_5 as(
	select count(a.articulo_id) as num_articulos,
	a.tipo_articulo as T, st.clave
	from status_articulo st
	join articulo a
	on a.status_articulo_id=st.status_articulo_id
	join subasta s
	on a.subasta_id=s.subasta_id
	where a.status_articulo_id=3 
	or a.status_articulo_id=4
	group by a.tipo_articulo, st.status_articulo_id, st.clave
);
--EJERCICIO 6
create table consulta_6 as
	select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo, 
	sum(sv.precio_venta) as total_venta
	from subasta_venta sv
	join articulo a
	on sv.articulo_id = a.articulo_id
	join subasta s
	on s.subasta_id = a.subasta_id
	where to_char(s.fecha_inicio, 'YYYY') = '2009'and 
	      to_char(s.fecha_fin, 'YYYY') = '2009'
	group by s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo
	order by total_venta desc;

--EJERCICIO 7
create table consulta_7 as(
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
	    select cliente_id,count(articulo_id) as num_articulos, 
	    sum(precio_venta) as total
	    from subasta_venta
	    group by cliente_id
	    having count(articulo_id) > 5 or sum(precio_venta) > 3000000
	) q2
	on q1.cliente_id = q2.cliente_id
	join cliente c
	on c.cliente_id = q1.cliente_id
);

--EJERCICIO 8 (ya no la pude optimizar más :( )
create table consulta_8 as
	select q1.subasta_id,q1.nombre_subasta,fecha_inicio,
	a.nombre nombre_articulo,a.clave_articulo,q1.mas_caro
	from (
		select s.subasta_id,max(precio_venta) mas_caro,
		fecha_inicio,fecha_fin,	s.nombre nombre_subasta
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

--EJERCICIO 9


--EJERCICIO 10
create table consulta_10 as(
	select s.subasta_id,s.nombre,count(sv.articulo_id)
	as vendidos
	from subasta_venta sv
	join articulo a
	on sv.articulo_id=a.articulo_id
	join subasta s
	on s.subasta_id=a.subasta_id
	where to_char(s.fecha_inicio,'YYYY')='2010'
	and to_char(s.fecha_fin,'YYYY')='2010'
	group by s.subasta_id,s.nombre
	having count(sv.articulo_id) > 3
);

--EJERCICIO 11
create table consulta_11 as (
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
	or status_articulo_id = 4)
);

--EJERCICIO 12
create table consulta_12 as(
	select pais_id,clave,descripcion from(
		select p.pais_id,p.clave, p.descripcion,
		count(a.articulo_id)
		from articulo a
		join articulo_donado ad
		on a.articulo_id=ad.articulo_id
		join pais p
		on ad.pais_id=p.pais_id
		where a.precio_inicial>300000
		group by p.pais_id,p.clave,p.descripcion
		having count(a.articulo_id)>=3
	)
);
--EJERCICIO 13
create table consulta_13 as(
	select s.subasta_id,s.nombre,s.fecha_inicio,
	sum(sv.precio_venta) total_ventas
	from subasta s, articulo a, subasta_venta sv
	where s.subasta_id = a.subasta_id
	and a.articulo_id = sv.articulo_id
	and extract(year from fecha_inicio) = 2010
	and extract(year from fecha_fin) = 2010
	group by s.subasta_id,s.nombre,s.fecha_inicio
	having sum(sv.precio_venta) >= 3000000
);

--EJERCICIO 14
create table consulta_14 as(
	select c.nombre, c.apellido_paterno, c.apellido_materno,
	sum(sv.precio_venta) monto_total
	from cliente c
	join subasta_venta sv
	on c.cliente_id=sv.cliente_id
	join articulo a
	on a.articulo_id=sv.articulo_id
	where  factura_cliente_id is null
	group by c.nombre, c.apellido_paterno, c.apellido_materno
	having  sum(sv.precio_venta) >=1000000
);

--EJERCICIO 15
create table consulta_15 as (
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
	)
);
