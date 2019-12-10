--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Consultas

--Mostrar los datos del servicio más común en las viviendas anunciadas. (Uso de join, funciones de agregación, subconsulta).
select servicio_id,nombre,descripción,max(total_viviendas)
from select servicio_id,count(vivienda_id) as total_viviendas
  from servicio_vivienda
  group by servicio_id
 group by servicio_id,nombre,descripción
 having max(total_viviendas);



select max(total_viviendas)from(
select s.servicio_id,count(sv.vivienda_id) as total_viviendas
from servicio s
join servicio_vivienda sv
on s.servicio_id = sv.servicio_id
group by s.servicio_id);