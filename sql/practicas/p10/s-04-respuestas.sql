--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

-- CONSULTA 1
-- Genere un reporte que muestre 
--		nombre del artículo, clave, clave del status 
--		de todos los artículos donados por el artista ‘William Harvey’. 
--	Emplear sintaxis estándar.
create table consulta_1 as (
	select a.nombre, a.clave_articulo,sa.clave
	from articulo a 
	join articulo_famoso af
	on a.articulo_id = af.articulo_id 
	join status_articulo sa
	on a.status_articulo_id=sa.status_articulo_id
	where af.nombre_completo='William Harvey'
);

-- CONSULTA 2
create table consulta_2 as(
	select articulo_id,nombre,clave_articulo
	from articulo a
	join articulo_donado ad using (articulo_id)
	join status_articulo sa using (status_articulo_id)
	join pais p using (pais_id)
	where sa.clave='ENTREGADO' and p.descripcion='BELGICA'
);

-- CONSULTA 3
--Empleando natural join, generar un reporte que muestre el 
--id, nombre, precio inicial, precio de venta y tipo de artículo, 
--así como el nombre y fecha inicio de la subasta 
--de todos los artículos que compró el 
--cliente MARICELA PAEZ MARTINEZ durante 
--las subastas realizadas en el 2010. 
--Nota: Un artículo se considera comprado cuando se registra el cliente
--que lo adquirió y se registra el precio de venta.

create table consulta_3 as(
	select a.articulo_id, a.nombre, a.precio_inicial,sv.precio_venta,
	a.tipo_articulo,s.nombre "SUBASTA_NOMBRE",
	to_char(s.fecha_inicio,'yyyy/mm/dd hh:mi:ss AM') "FECHA_INICIO"
	from articulo a,subasta_venta sv,subasta s,cliente c
	where a.articulo_id=sv.articulo_id
	and a.subasta_id=s.subasta_id
	and c.cliente_id=sv.cliente_id
	and c.nombre='MARICELA' 
	and c.apellido_paterno='PAEZ' 
	and c.apellido_materno='MARTINEZ'
	and to_char(s.fecha_inicio,'yyyy')='2010'
);