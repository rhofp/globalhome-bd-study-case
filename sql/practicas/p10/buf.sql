--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

-- CONSULTA 3
--Empleando natural join, generar un reporte que muestre el 
--id, nombre, precio inicial, precio de venta y tipo de artículo, 
--así como el nombre y fecha inicio de la subasta 
--de todos los artículos que compró el 
--cliente MARICELA PAEZ MARTINEZ durante 
--las subastas realizadas en el 2010. 
--Nota: Un artículo se considera comprado cuando se registra el cliente
--que lo adquirió y se registra el precio de venta.

col nombre format a5
col SUBASTA_NOMBRE format a5

select articulo_id, a.nombre, a.precio_inicial,
precio_venta,a.tipo_articulo,s.nombre "SUBASTA_NOMBRE",
to_char(s.fecha_inicio,'yyyy/mm/dd hh:mi:ss AM') "FECHA_INICIO"
from cliente c natural join subasta_venta
join articulo a using(articulo_id)
join subasta s using(subasta_id)
where c.nombre='MARICELA' 
and c.apellido_paterno='PAEZ' 
and c.apellido_materno='MARTINEZ'
and to_char(s.fecha_inicio,'yyyy')='2010';

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
and to_char(s.fecha_inicio,'yyyy')='2010';