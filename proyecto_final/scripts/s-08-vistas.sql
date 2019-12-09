--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de vistas

Prompt Conectando para crear vistas como usuario FF_PROY_ADMIN
connect FF_PROY_ADMIN

--Vista para los usuarios [08,1]
create or replace view v_usuario(
 usuario_id,correo_electronico,nombre_usuario,nombre,
 apellido_paterno,apellido_materno,tipo
) as select usuario_id,orreo_electronico,nombre_usuario,
nombre,apellido_paterno,
apellido_materno,tipo from usuario;

--Vista para viviendas en venta [08,2]
create or replace view v_viviendas_venta(
 vivienda_id,ubicacion_latitud,ubicacion_longitud,direccion,
 capacidad_personas_max,descripcion,status_vivienda_id,
 fecha_status,tipo,num_catastral,precio_venta_inicial)
as select vivienda_id,ubicacion_latitud,ubicacion_longitud,direccion,
 capacidad_personas_max,descripcion,status_vivienda_id,
 fecha_status,tipo,num_catastral,precio_venta_inicial
from vivienda v, vivienda_venta vv
where v.vivienda_id=vv.vivienda_id;

--Vivienda en venta y renta con al menos 5 servicios [08,3]

create or replace view v_vivienda_servicios(
 vivienda_id,ubicacion_latitud,ubicacion_longitud,direccion,
 capacidad_personas_max,descripcion,status_vivienda_id,
 fecha_status,tipo,num_servicios,
 contrato_id,folio,fecha_contrato,alquiler_id,folio_alquiler
)as select v.vivienda_id,v.ubicacion_latitud,v.ubicacion_longitud,
v.direccion,v.capacidad_personas_max,v.descripcion,v.status_vivienda_id,
v.fecha_status,v.tipo, count(servicio_vivienda_id) as num_servicios,
c.contrato_id,c.folio,c.fecha_contrato,a.alquiler_id,a.folio_alquiler
from vivienda v
join servicio_vivienda sv
on v.vivienda_id = sv.vivienda_id
left join  contrato c
on  v.vivienda_id=c.vivienda_id
left join alquiler a
on v.vivienda_id=a.vivienda_id
group by v.vivienda_id, v.ubicacion_latitud,v.ubicacion_longitud,
v.direccion,v.capacidad_personas_max,v.descripcion,v.status_vivienda_id,
v.fecha_status,v.tipo,c.contrato_id,c.folio,c.fecha_contrato,
a.alquiler_id,a.folio_alquiler
having count(servicio_vivienda_id) >= 5 and (tipo='v' or tipo='r');

