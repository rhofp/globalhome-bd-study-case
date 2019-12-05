--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de entidades

-- Entidad 1
create table vivienda(
  vivienda_id number(10,0) not null,
  ubicacion_longitud number(10,7) not null,
  ubicacion_latitud number(10,7) not null,
  direccion varchar2(250) not null,
  capacidad_personas_max number(2,0) not null,
  descripcion varchar2(2500) not null,
  status_vivienda_id number(2,0) not null,
  fecha_status date default sysdate not null,
  tipo char not null,
  constraint vivienda_pk primary key(vivienda_id)
);

-- Entidad 2
create table vivienda_renta(
  vivienda_id number(10,0) not null,
  renta_mensual number(10,2) not null,
  dia_deposito number(2,0) not null,
  constraint vivienda_renta_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint vivienda_renta_pk primary key(vivienda_id)
);

-- Entidad 3
create table vivienda_vacacional(
  vivienda_id number(10,0),
  fecha_inicio date not null,
  dias_renta number(3,0) not null,
  constraint vivienda_vacacional_vivienda_id_fk foreign key (vivienda_id)
  references vivienda(vivienda_id),
  constraint vivienda_vacacional_pk primary key(vivienda_id)
);

-- Entidad 4
create table status_vivienda(
  status_vivienda_id number(10,0) not null,
  clave varchar2(40) not null,
  descripcion varchar2(40) not null,
  constraint status_vivienda_pk primary key(status_vivienda_id)
);

-- Entidad 5
create table historico_status_vivienda(
  historico_status_vivienda_id  number(10,0),
  status_vivienda_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  fecha_status date not null,
  constraint historico_status_vivienda_pk primary key(historico_status_vivienda_id),
  constraint hist_status_status_vivienda_id_fk foreign key(status_vivienda_id)
  references status_vivienda(status_vivienda_id),
  constraint hist_status_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id)
);

-- Entidad 6
create table imagen(
  imagen_id number(10,0),
  num_imagen number(2,0),
  vivienda_id number(10,0) not null,
  imagen blob not null,
  constraint imagen_pk primary key(imagen_id),
  constraint imagen_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint imagen_vivienda_id_num_imagen_uk unique(vivienda_id,num_imagen)
);

-- Entidad 7
create table servicio(
  servicio_id number(10,0) not null,
  nombre varchar2(30) not null,
  descripcion varchar2(2000) not null,
  icono blob not null,
  constraint servicio_pk primary key(servicio_id)
);

-- Entidad 8
create table servicio_vivienda(
  servicio_vivienda_id number(10,0) not null,
  servicio_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  constraint servicio_vivienda_servicio_id_fk foreign key(servicio_id)
  references servicio(servicio_id),
  constraint servicio_vivienda_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id)
);

-- Entidad 9
create table usuario(
  usuario_id number(10,0) not null,
  correo_electronico varchar2(60) not null,
  nombre_usuario varchar2(30) not null,
  nombre varchar2(30) not null,
  apellido_paterno varchar2(30) not null,
  apellido_materno varchar2(30) null,
  contrasena varchar2(20) not null,
  tipo char not null,
  constraint usuario_pk primary key(usuario_id),
  constraint usuario_correo_electronico_uk unique(correo_electronico)
);

-- Entidad 10
create table tarjeta(
  tarjeta_id number(10,0) not null,
  clabe number(10,0) not null,
  cliente_id number(10,0) not null,
  expiracion_mm varchar2(2) not null,
  expiracion_aa varchar2(4) not null,
  constraint tarjeta_pk primary key(tarjeta_id),
  constraint tarjeta_cliente_id_fk foreign key(cliente_id)
  references usuario(usuario_id),
  constraint tarjeta_expiracion_mm_chk check(
    expiracion_mm in ('01','02','03','04','05','06','07','08','09','10','11','12')
  )
);

-- Entidad 11
create table mensaje(
  mensaje_id number(10,0) not null,
  leido number(1,0) default 0 not null,
  mensaje varchar2(2500) not null,
  cliente_id number(10,0) not null,
  duenio_id number(10,0) not null,
  vivienda_interes_id number(10,0) not null,
  respuesta_id number(10,0) not null,
  constraint mensaje_pk primary key(mensaje_id),
  constraint mensaje_cliente_id_fk foreign key(cliente_id)
  references usuario(usuario_id),
  constraint mensaje_duenio_id_fk foreign key(duenio_id)
  references usuario(usuario_id),
  constraint mensaje_vivienda_interes_id_fk foreign key(vivienda_interes_id)
  references vivienda(vivienda_id),
  constraint mensaje_respuesta_id_fk foreign key(respuesta_id)
  references mensaje(mensaje_id)
);

-- Entidad 12
create table clave_deposito(
  clave_deposito_id number(10,0) not null,
  clabe varchar2(18) not null,
  constraint clave_deposito_pk primary key(clave_deposito_id)
);

-- Entidad 13
create table vivienda_renta_clave_dep(
  vivienda_renta_clave_dep_id number(10,0) not null,
  clave_deposito_id number(10,0) not null,
  vivienda_id number(10,0) null,
  constraint vivienda_renta_clave_dep_pk primary key(vivienda_renta_clave_dep_id),
  constraint viv_renta_clave_dep_clave_dep_id_fk foreign key(clave_deposito_id)
  references clave_deposito(clave_deposito_id),
  constraint viv_renta_clave_dep_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id) 
);

-- Entidad 14
create table vivienda_venta(
  vivienda_id number(10,0) not null,
  num_catastral varchar2(20) not null,
  folio_escritura varchar2(40) not null,
  avaluo_pdf blob not null,
  precio_venta_inicial number(10,2) not null,
  comision_publicidad number(10,0) not null,
  usuario_comprador_id number(10,0) not null,
  clave_deposito_id number(10,0),
  constraint vivienda_venta_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint vivienda_venta_pk primary key(vivienda_id),
  constraint vivienda_renta_usu_comprador_id_fk foreign key(usuario_comprador_id)
  references usuario(usuario_id),
  constraint vivienda_venta_clave_dep_id_fk foreign key(clave_deposito_id)
  references clave_deposito(clave_deposito_id)
);

-- Entidad 15
create table pago_vivienda(
  pago_vivienda_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  num_pago number(4,0) not null,
  importe_pago number(10,2) not null,
  fecha_pago date not null,
  deposito_realizado_pdf blob not null,
  constraint pago_vivienda_pk primary key(pago_vivienda_id),
  constraint pago_vivienda_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint pago_vivienda_viv_id_num_pago_uk unique(num_pago,vivienda_id)
);

-- Entidad 16
create table alquiler(
  alquiler_id number(10,0) not null,
  folio_alquiler varchar2(20) not null,
  vivienda_id number(10,0) not null,
  usuario_id number(10,0) not null,
  constraint alquiler_pk primary key(alquiler_id),
  constraint alquiler_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint alquiler_usuario_id_fk foreign key(usuario_id)
  references usuario(usuario_id)
);

-- Entidad 17
create table contrato(
  contrato_id number(10,0) not null,
  folio varchar2(40) not null,
  fecha_contrato varchar2(40) default sysdate not null,
  doc_pdf blob not null,
  vivienda_id number(10,0) not null,
  usuario_id number(10,0) not null,
  constraint contrato_pk primary key(contrato_id),
  constraint contrato_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint contrato_usuario_id_fk foreign key(usuario_id)
  references usuario(usuario_id)
);

-- Entidad 18
create table interesado_vivienda_vac(
  interesado_vivienda_vac_id number(10,0) not null,
  usuario_id number(10,0) not null,
  vivienda_id number(10,0) not null,
  num_celular number(12,0) not null,
  notificacion_enviado number(1,0) default 0 not null,
  constraint interesado_vivienda_vac_pk primary key(interesado_vivienda_vac_id),
  constraint inter_viv_vac_vivienda_id_fk foreign key(vivienda_id)
  references vivienda(vivienda_id),
  constraint inter_viv_vac_usuario_id_fk foreign key(usuario_id)
  references usuario(usuario_id)
);

