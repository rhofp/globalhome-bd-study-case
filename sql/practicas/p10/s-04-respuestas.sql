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

--CONSULTA 4
--Generar un reporte que muestre los datos de los clientes 
--(id, nombre y apellidos) 
--y los datos de sus tarjetas 
--(número de tarjeta, tipo, año de vigencia,mes de vigencia) 
--que ya hayan expirado. Notas:
--a. para validar si ya la tarjeta expiró emplear el mes y año de vigencia.
--b. Considerar que la consulta se ejecuta en noviembre del 2011
--c. Si una tarjeta tiene momo año y mes de expiración los valores 11/11, 
--la tarjeta aún se considera como vigente.
--R: Se deben obtener 16 registros.

create table consulta_4 as (
	select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
	tc.numero_tarjeta,tc.tipo_tarjeta,tc.anio_vigencia,tc.mes_vigencia
	from cliente c, tarjeta_cliente tc
	where c.cliente_id = tc.cliente_id
	and to_number(tc.anio_vigencia) < 11
	union
	select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
	tc.numero_tarjeta,tc.tipo_tarjeta,tc.anio_vigencia,tc.mes_vigencia
	from cliente c, tarjeta_cliente tc
	where c.cliente_id = tc.cliente_id
	and to_number(tc.anio_vigencia) = 11
	and to_number(tc.mes_vigencia) < 11
);

-- CONSULTA 5
--Generar un reporte que muestre: 
--identificador del artículo, nombre, clave, tipo, 
--año de hallazgo precio inicial y 
--precio venta (para los que ya fueron vendidos o entregados) de todos los artículos 
--que sean de tipo arqueológico, 
--y que tengan un precio inicial mayor a $800,000.
-- Emplear notación SQL estándar.
--R: Se deben obtener 10 registros de los cuales 3 ya fueron vendidos.
create table consulta_5 as (
	select a.articulo_id,a.nombre,a.clave_articulo,a.tipo_articulo,
	aa.anio_hallazgo,a.precio_inicial,sv.precio_venta
	from articulo a
	join articulo_arqueologico aa
	on a.articulo_id = aa.articulo_id
	left join subasta_venta sv
	on a.articulo_id = sv.articulo_id
	where a.precio_inicial > 800000.00
);

--CONSULTA 6
--Generar un reporte que muestre 
--nombre, apellidos, email, de todos los clientes 
--cuya ocupación sea ABOGADO, 
--y en caso de tener registrado una omás tarjetas de crédito, 
--incluir el tipo de tarjeta. 
--Emplear notación SQL anterior compatible con Oracle.
--R: Se deben obtener 5 clientes, uno de ellos cuenta con 2 tarjetas.
create table consulta_6 as (
	select c.nombre,c.apellido_paterno,c.apellido_materno,c.email,c.ocupacion,
	tc.tipo_tarjeta from cliente c, tarjeta_cliente tc
	where c.cliente_id=tc.cliente_id(+)
	and c.ocupacion='ABOGADO'
);

--CONSULTA 7
--Suponga que se desea retirar del catálogo a 
--todos los artículos que tengan un precio inicial de más de 900,000, 
--siempre y cuando el artículo todavía no inicie el proceso de subasta, 
--es decir, el artículo no debe tener status EN SUBASTA, ENTREGADO O VENDIDO. 
--Empleando operadores del álgebra relacional 
--(operadores SET: union, intersection, minus), 
--determine el id, nombre, clave, precio inicial 
--y e identificador del status de los artículos que se deben retirar.
--R: Se deben obtener 6 artículos, verificar su precio.

create table consulta_7 as (
	select a.articulo_id,a.nombre,a.clave_articulo,a.precio_inicial,sa.status_articulo_id
	from articulo a, status_articulo sa
	where a.status_articulo_id=sa.status_articulo_id
	intersect
	select a.articulo_id,a.nombre,a.clave_articulo,a.precio_inicial,sa.status_articulo_id
	from articulo a, status_articulo sa
	where a.precio_inicial > 900000.00
	intersect
	select a.articulo_id,a.nombre,a.clave_articulo,a.precio_inicial,sa.status_articulo_id
	from articulo a, status_articulo sa
	where sa.clave <> 'EN SUBASTA'
	intersect
	select a.articulo_id,a.nombre,a.clave_articulo,a.precio_inicial,sa.status_articulo_id
	from articulo a, status_articulo sa
	where sa.clave <> 'ENTREGADO'
	intersect
	select a.articulo_id,a.nombre,a.clave_articulo,a.precio_inicial,sa.status_articulo_id
	from articulo a, status_articulo sa
	where sa.clave <> 'VENDIDO'
);

--CONSULTA 8
--SUBMEX ha decido incrementar en un 10% el precio inicial 
--de todos aquellos artículos arqueológicos que tengan más de 150 años de antigüedad 
--y que aún no se han incluido en un proceso de subasta, 
--es decir, solo se han registrado en la BD. 
--Determine id, clave, nombre, id de status, año dehallazgo, 
--y antigüedad en años de dichos artículos.
--R: Se deben obtener al menos 7 artículos.

create table consulta_8 as (
	select a.articulo_id,a.clave_articulo,a.nombre,
	sa.status_articulo_id,aa.anio_hallazgo, 
	to_number(to_char(sysdate,'yyyy'))-to_number(aa.anio_hallazgo) 
	antiguedad
	from articulo a,status_articulo sa, articulo_arqueologico aa
	where a.articulo_id=aa.articulo_id
	and a.status_articulo_id=sa.status_articulo_id
	and sa.clave='REGISTRADO'
	and to_number(to_char(sysdate,'yyyy'))-to_number(aa.anio_hallazgo)  > 150
);

--CONSULTA 9
--Suponga que un cliente decide realizar una consulta en el catálogo de artículos. 
--El cliente está interesado por todos aquellos artículos cuyo 
--nombre o descripción hagan referencia o hablen de la palabra “Colonial” 
--que no han sido aún vendidos, y que el articulo este en proceso de ser subastado.
--Generar la sentencia SQL que muestre el nombre 
--y tipo de todos los artículos que cumplan con los criterios de búsqueda.
--R: Se debe obtener 1 registro.

create table consulta_9 as (
	select a.nombre,a.tipo_articulo
	from articulo a, status_articulo sa
	where a.status_articulo_id=sa.status_articulo_id
	and sa.clave = 'EN SUBASTA'
	and a.nombre like '%Colonial%' 
	or a.descripcion like '%Colonial%'
);

create table consulta_10 as (
	select to_char(fc.fecha_factura,'dd/mm/yyyy') "FECHA_FACTURA",tc.numero_tarjeta,
	c.nombre "NOMBRE_CLIENTE",c.apellido_paterno,c.apellido_materno,
	sv.precio_venta, a.precio_inicial,
	(sv.precio_venta-a.precio_inicial) as diferencia,
	a.nombre "NOMBRE_ARTICULO",a.clave_articulo,a.tipo_articulo,
	af.nombre_completo,
	aa.anio_hallazgo,
	p.clave
	from factura_cliente fc
	natural join tarjeta_cliente tc
	natural join cliente c
	natural join subasta_venta sv
	--join articulo  a using(articulo_id)
	join articulo a 
	on a.articulo_id=sv.articulo_id
	left join articulo_famoso af
	on a.articulo_id=af.articulo_id
	left join articulo_arqueologico aa
	on a.articulo_id=aa.articulo_id
	left join articulo_donado ad
	on a.articulo_id=ad.articulo_id
	left join pais p
	on ad.pais_id=p.pais_id
	where tc.numero_tarjeta = '5681375824866375'
);

create table consulta_11 as (
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
and tc.numero_tarjeta = '5681375824866375'
);