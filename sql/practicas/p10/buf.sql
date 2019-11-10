--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

--col nombre format a8
--col clave format a10
col descripcion format a20
-- col apellido_paterno format a10
-- col apellido_materno format a10
-- col tipo_tarjeta format a10
-- col email format a10
-- col ocupacion format a10

--CONSULTA 9
--Suponga que un cliente decide realizar una consulta en el catálogo de artículos. 
--El cliente está interesado por todos aquellos artículos cuyo 
--nombre o descripción hagan referencia o hablen de la palabra “Colonial” 
--que no han sido aún vendidos, y que el articulo este en proceso de ser subastado.
--Generar la sentencia SQL que muestre el nombre 
--y tipo de todos los artículos que cumplan con los criterios de búsqueda.
--R: Se debe obtener 1 registro.

select a.nombre,a.tipo_articulo,a.descripcion
from articulo a, status_articulo sa
where a.status_articulo_id=sa.status_articulo_id
and sa.clave = 'EN SUBASTA'
and a.nombre like '%Colonial%' 
or a.descripcion like '%Colonial%';
