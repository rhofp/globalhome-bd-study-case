--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de entidades

create table usuario(
  usuario_id number(10,0) not null,
  correo_electronico varchar2(30) not null,
  nombre_usuario varchar2(30) not null,
  nombre varchar2(20) nor null,
  apellido_paterno varchar2(15) not null,
  apellido_materno varchar2(15) null,
  tipo char(1) not null,
  contrasena varchar2(20) not null
);

create table servicio(
  servicio_id number(10,0) not null,
  nombre varchar2(20) not null,
  descripcion varchar2(200) not null,
  icono blob(40) not null
);

create table servicio_vivienda(
  servicio_vivienda_id number(10,0) not null,
  servicio_id number(10,0) not null,
  servicio_id number(10,0) not null,
  vivienda_id number(10,0) not null
);

create table mensaje(
  mensaje_id number(10,0) not null,
  leido number(1,0) not null,
  mensaje varchar2(2500) not null,
  cliente_id number(10,0) not null,
  duenio_id number(10,0) not null,
  vivienda_interes_id number(10,0) not null,
  respuesta_id varchar2(2500) null
);

create table status_vivienda(
  status_vivienda_id number(10,0) not null,
  clave varchar2(40) not null,
  descripcion varchar2(40) not null
);

create table historico_status_vivienda(
  historico_status_vivienda_id  number(10,0),
  status_vivienda_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  fecha_status date not null
);

create table tarjeta(
  tarjeta_id number(10,0) not null,
  clabe number(10,0) not null,
  cliente_id number(10,0) not null,
  expiracion_mm varchar2(10) not null,
  expiracion_aa varchar2(10) not null
);

create table vivienda(
  vivienda_id number(10,0) not null,
  ubicacion_longitud number(10,7) not null,
  ubicacion_latitud number(10,7) not null,
  direccion varchar2(250) not null,
  capacidad_personas_max number(2,0) not null,
  descripcion varchar2(2500) not null,
  status_vivienda_id number(2,0) not null,
  fecha_status date not null
);

create table vivienda_renta(
  vivienda_id number(10,0) not null,
  renta_mensual number(10,2) not null,
  fecha_deposito date not null,
  clave_deposito_id number(10,0) not null
);

create table vivienda_vacacional(
  vivienda_id number(10,0),
  fecha_inicio date not null,
  dias_renta number(3,0) not null
);


create table vivienda_venta(
  vivienda_id number(10,0) not null,
  num_catastral number(4,0) not null,
  folio_escritura varchar2(40) not null,
  avaluo_pdf blob(18) not null,
  precio_venta_inicial number(10,2) not null,
  comision_publicidad number(10,0) not null,
  usuario_comprador_id number(10,0) not null,
  clave_deposito_id number(10,0)
);

create table imagen(
  imagen_id number(10,0),
  num_imagen number(2,0),
  vivienda_id number(10,0) not null,
  imagen blob(500) not null
);


create table clave_deposito(
  clave_deposito_id number(10,0) not null,
  clabe varchar2(18) not null
);


create table contrato(
  contrato_id number(10,0) not null,
  folio varchar2(40) not null,
  fecha_contrato varchar2(40) not null,
  doc_pdf blob(500) not null,
  vivienda_id number(10,0) not null,
  usuario_id number(10,0) not null,
);

create table alquiler(
  alquiler_id number(10,0) not null,
  folio_alquiler varchar2(20) not null,
  vivienda_id number(10,0) not null,
  usuario_id number(10,0) not null
);

create table interesado_vivienda_vac(
  interesado_vivienda_vac_id number(10,0) not null,
  usuario_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  num_celular number(12,0) not null,
  notificacion_enviado number(1,0) not null
);

create table pago_vivienda(
  pago_vivienda_id number(10,0) not null,
  num_pago number(4,0) not null,
  importe_pago number(10,2) not null,
  fecha_pago date not null,
  deposito_realizado_pdf blob(1000) not null
);