--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de secuencias

-- Secuencia 1
create sequence vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 2
create sequence status_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 3
create sequence historico_status_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 4
create sequence imagen_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 5
create sequence servicio_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 6
create sequence servicio_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 7
create sequence usuario_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 8
create sequence tarjeta_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 9
create sequence mensaje_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 10
create sequence clave_deposito_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 11
create sequence vivienda_renta_clave_dep_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 12
create sequence pago_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 13
create sequence alquiler_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 14
create sequence contrato_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 15
create sequence interesado_vivienda_vac_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;