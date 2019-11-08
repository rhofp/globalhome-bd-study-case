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