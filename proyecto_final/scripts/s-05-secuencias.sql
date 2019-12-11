--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de secuencias

prompt CREANDO SECUENCIAS

-- Secuencia 1
prompt CREANDO SECUENCIA vivienda_seq
create sequence vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 2
prompt CREANDO SECUENCIA status_vivienda_seq
create sequence status_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 3
prompt CREANDO SECUENCIA historico_status_vivienda_seq
create sequence historico_status_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 4
prompt CREANDO SECUENCIA imagen_seq
create sequence imagen_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 5
prompt CREANDO SECUENCIA servicio_seq
create sequence servicio_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 6
prompt CREANDO SECUENCIA servicio_vivienda_seq
create sequence servicio_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 7
prompt CREANDO SECUENCIA usuario_seq
create sequence usuario_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 8
prompt CREANDO SECUENCIA tarjeta_seq
create sequence tarjeta_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 9
prompt CREANDO SECUENCIA mensaje_seq
create sequence mensaje_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 10
prompt CREANDO SECUENCIA clave_deposito_seq
create sequence clave_deposito_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 11
prompt CREANDO SECUENCIA vivienda_renta_clave_dep_seq
create sequence vivienda_renta_clave_dep_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 12
prompt CREANDO SECUENCIA pago_vivienda_seq
create sequence pago_vivienda_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 13
prompt CREANDO SECUENCIA alquiler_seq
create sequence alquiler_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 14
prompt CREANDO SECUENCIA contrato_seq
create sequence contrato_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;

-- Secuencia 15
prompt CREANDO SECUENCIA interesado_vivienda_vac_seq
create sequence interesado_vivienda_vac_seq
start with 1
increment by 1
nomaxvalue
nocycle
cache 9
order;