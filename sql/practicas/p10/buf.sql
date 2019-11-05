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

col nombre format a20
col clave_articulo format a20
col clave format a20

select a.nombre, a.clave_articulo, sa.clave
from articulo a 
join status_articulo sa
on a.status_articulo_id = sa.status_articulo_id;
where 