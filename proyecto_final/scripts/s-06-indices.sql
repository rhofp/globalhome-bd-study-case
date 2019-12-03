--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de indices

-- SECUENCIAS DE LLAVES FORANEAS

create index vivienda_status_viv_id_ix
on vivienda(status_vivienda_id);

create index historico_status_viv_status_viv_id_ix
on historico_status_vivienda(status_vivienda_id);

create index historico_status_vivienda_id_ix
on historico_status_vivienda(vivienda_id);

create index imagen_vivienda_id_ix 
on imagen(vivienda_id);

create unique index servicio_vivienda_iuk
on servicio_vivienda(servicio_id,vivienda_id);

create index tarjeta_cliente_id_ix
on tarjeta(cliente_id);

create index mensaje_cliente_id_ix
on mensaje(cliente_id);

create index mensaje_duenio_id_ix
on mensaje(duenio_id);

create index mensaje_vivienda_interes_id_ix
on mensaje(duenio_id);

-- No se considero necesario indexar respuesta

create index viv_renta_clave_dep_clave_dep_id_ix
on vivienda_renta_clave_dep(clave_deposito_id);

create index viv_renta_clave_dep_vivienda_id_ix
on vivienda_renta_clave_dep(vivienda_id);

create index vivienda_venta_usu_comprador_id_ix
on vivienda_venta(usuario_comprador_id);

create index vivienda_venta_clave_dep_id_ix
on vivienda_venta(clave_deposito_id);

create index pago_viv_vivienda_id_ix 
on pago_vivienda(vivienda_id);

create index alquiler_viv_id_ix
on alquiler(vivienda_id);

create index alquiler_usu_id_ix
on alquiler(usuario_id);

create index contrato_viv_id_ix
on contrato(vivienda_id);

create index contrato_usu_id_ix
on contrato(usuario_id);

create index interesado_viv_vac_viv_id_ix
on interesado_vivienda_vac(vivienda_id);

create index interesado_viv_vac_usu_id_ix
on interesado_vivienda_vac(usuario_id);

-- SECUENCIA DE CAMPOS QUE SE ACCEDEN CON FRECUENCIA

create unique index usuario_correo_elec_iuk
on usuario(correo_electronico)

create index usuario_nom_usu_ix
on usuario(lower(nombre_usuario));