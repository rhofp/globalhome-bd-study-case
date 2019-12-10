--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Consultas

--Mostrar los datos del servicio más común en las viviendas anunciadas. (Uso de join, funciones de agregación, subconsulta).
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


