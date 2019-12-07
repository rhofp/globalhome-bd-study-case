--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de vistas

--Vista para los usuarios [08,1]
create or replace view v_usuario(
 usuario_id,correo_electronico,nombre_usuario,nombre,
 apellido_paterno,apellido_materno,tipo
) as select usuario_id,orreo_electronico,nombre_usuario,
nombre,apellido_paterno,
apellido_materno,tipo from usuario;

--Vista para viviendas en venta
create or replace view v_viviendas_venta(
 vivienda_id,ubicacion_latitud,ubicacion_longitud,direccion,
 capacidad_personas_max,descripción,status_vivienda_id,
 fecha_status,tipo,num_catastral,precio_venta_inicial)
as select vivienda_id,ubicacion_latitud,ubicacion_longitud,direccion,
 capacidad_personas_max,descripción,status_vivienda_id,
 fecha_status,tipo,num_catastral,precio_venta_inicial
from vivienda v, vivienda_venta vv
where v.vivienda_id=vv.vivienda_id;