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

select to_char(fc.fecha_factura,'dd/mm/yyyy') "FECHA_FACTURA",tc.numero_tarjeta,
c.nombre "NOMBRE_CLIENTE",c.apellido_paterno,c.apellido_materno,
sv.precio_venta, a.precio_inicial,
(sv.precio_venta-a.precio_inicial) as diferencia,
a.nombre "NOMBRE_ARTICULO",a.clave_articulo,a.tipo_articulo,
af.nombre_completo,
aa.anio_hallazgo,
p.clave
from factura_cliente fc,
tarjeta_cliente tc,
cliente c,
subasta_venta sv,
articulo a, 
articulo_famoso af,
articulo_arqueologico aa,
articulo_donado ad,
pais p
where fc.tarjeta_cliente_id=tc.tarjeta_cliente_id
and tc.cliente_id = c.cliente_id
and c.cliente_id = sv.cliente_id
and sv.articulo_id = a.articulo_id
-- outer join
and a.articulo_id = af.articulo_id (+)
and a.articulo_id = aa.articulo_id (+)
and a.articulo_id = ad.articulo_id (+)
and ad.pais_id = p.pais_id (+)
and tc.numero_tarjeta = '5681375824866375';

