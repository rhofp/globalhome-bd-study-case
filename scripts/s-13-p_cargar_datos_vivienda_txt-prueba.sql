--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Programa que PRUEBA la carga datos de una tabla 
--externa a la jerarquia de vivienda

select v.vivienda_id,
renta_mensual,dia_deposito,
fecha_inicio, dias_renta 
from vivienda v
left join vivienda_renta vr
on v.vivienda_id = vr.vivienda_id
left join vivienda_vacacional vv
on v.vivienda_id = vv.vivienda_id;


prompt Numero de viviendas antes de ejecutar script
select count(*) from vivienda;

prompt Ejecutando script con datos en la tabla externa
exec p_cargar_datos_vivienda_txt;

select v.vivienda_id,
renta_mensual,dia_deposito,
fecha_inicio, dias_renta 
from vivienda v
left join vivienda_renta vr
on v.vivienda_id = vr.vivienda_id
left join vivienda_vacacional vv
on v.vivienda_id = vv.vivienda_id;

prompt Numero de viviendas despues de ejecutar script
select count(*) from vivienda;