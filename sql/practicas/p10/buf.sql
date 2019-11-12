--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

col nombre format a8
--col clave format a10
--col descripcion format a20
col apellido_paterno format a10
col apellido_materno format a10
-- col tipo_tarjeta format a10
-- col email format a10
-- col ocupacion format a10

--CONSULTA 10
--Suponga que se desea generar un reporte a detalle de 
--todos los artículos que fueron comprados y pagados con la tarjeta de crédito
--5681375824866375.Los datos que el reporte debe mostrar son los siguientes:
-- a. Fecha de la factura
-- b. Numero de la tarjeta
-- c. Nombre y apellidos del cliente
-- d. Precio de venta de cada articulo
-- e. Precio de compra de cada articulo
-- f. Diferencia entre el precio de compra y el de venta
-- g. Nombre y clave del artículo
-- h. Tipo de artículo
-- i. Nombre completo del famoso al que perteneció el articulo (
---en caso de ser articulo perteneciente a un famoso)
-- j. Año de hallazgo, en caso de que el artículo sea arqueológico.
-- k. Clave del país, en caso de que el articulo haya sido donado por dicho país.

select fc.fecha_factura,tc.numero_tarjeta,
c.nombre,c.apellido_paterno,c.apellido_materno
--sv.precio_venta, a.precio_inicial
--(a.precio_inicial-sv.precio_venta) as diferencia
--a.nombre,a.clave_articulo,a.tipo_articulo
--af.nombre_completo
--aa.anio_hallazgo
--p.clave
from factura_cliente fc
natural join tarjeta_cliente tc
natural join cliente c
natural join subasta_venta sv
join articulo  a using(articulo_id)
--left join articulo_famoso af
--on af.articulo_id=a.articulo_id
where tc.numero_tarjeta = '5681375824866375';

