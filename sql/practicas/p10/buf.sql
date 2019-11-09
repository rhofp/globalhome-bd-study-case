--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

col nombre format a10
--col nombre format a10
-- col apellido_paterno format a10
-- col apellido_materno format a10
-- col tipo_tarjeta format a10

select a.articulo_id,a.nombre,a.clave_articulo,a.tipo_articulo,
aa.anio_hallazgo,a.precio_inicial,sv.precio_venta
from articulo a
join articulo_arqueologico aa
on a.articulo_id = aa.articulo_id
left join subasta_venta sv
on a.articulo_id = sv.articulo_id
where a.precio_inicial > 800000.00;
