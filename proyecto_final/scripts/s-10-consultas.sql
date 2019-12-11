--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Consultas

--Mostrar los datos del servicio más común en las viviendas anunciadas. (Uso de join, funciones de agregación, subconsulta).
--FUNCIONA
select servicio_id,nombre,descripcion,total_viviendas
from (
select s.servicio_id,s.nombre,s.descripcion,count(sv.vivienda_id) as total_viviendas
from servicio s
join servicio_vivienda sv
on s.servicio_id = sv.servicio_id
group by s.servicio_id,s.nombre,s.descripcion
) where total_viviendas=(
select max(total_viviendas)from(
select s.servicio_id,count(sv.vivienda_id) as total_viviendas
from servicio s
join servicio_vivienda sv
on s.servicio_id = sv.servicio_id
group by s.servicio_id)
);

--Esta parte extrae el mayor nmero de viviendas para todos los servicios
--es decir cual es el servicio mas consumido
--select max(total_viviendas)from(
--select s.servicio_id,count(sv.vivienda_id) as total_viviendas
--from servicio s
--join servicio_vivienda sv
--on s.servicio_id = sv.servicio_id
--group by s.servicio_id);

--Esta parte hace el conteo de viviendas por servicio
--select s.servicio_id,s.nombre,count(sv.vivienda_id) "total_viviendas"
--from servicio s
--join servicio_vivienda sv
--on s.servicio_id = sv.servicio_id
--group by s.servicio_id,s.nombre;


--usuario que más contratos de renta haya tenido en los últimos 5 años.
--FUNCIONA

select * from v_usuario
where usuario_id = (
select usuario_id from(
select usuario_id,total_contratos
from(
select u.usuario_id,u.tipo,count(c.contrato_id) as total_contratos
from usuario u 
join contrato c
on u.usuario_id=c.usuario_id
group by u.usuario_id,u.tipo
having u.tipo='C')
where total_contratos = (
select max(total_contratos) from(
select u.usuario_id,u.tipo,count(c.contrato_id) as total_contratos
from usuario u 
join contrato c
on u.usuario_id=c.usuario_id
group by u.usuario_id,u.tipo
having u.tipo='C'))));




--Ganancias vendidas en los ultimos 3 años sin contar las ventas en los meses de diciembre
--FUNCIONA 
select sum(vv.comision_publicidad) as ganancias_totales from (
select vivienda_id,status_vivienda_id,fecha_status,es_venta
from vivienda
where es_venta=1 and status_vivienda_id=5 and fecha_status
between (sysdate-1095) and sysdate
minus
select vivienda_id,status_vivienda_id,fecha_status,es_venta
from vivienda
where extract(month from to_date(fecha_status,'dd/mm/yyyy'))=12
order by fecha_status
)q1
join vivienda_venta vv
on q1.vivienda_id = vv.vivienda_id;




