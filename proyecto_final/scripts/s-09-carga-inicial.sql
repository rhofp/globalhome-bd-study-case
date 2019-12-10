--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Cargando inciales

prompt Cargando datos iniciales

set define off

prompt descargando archivos de carga inicial
@s-09-descarga-archivos-carga-inicial.sql

prompt Deshabilitando constraints de entidades blob
@s-09-deshabilitar-contraints.sql

-- cargador 1
prompt Cargando datos de vivienda
@carga-inicial/s-09-vivienda.sql
-- cargador 2
--@carga-inicial/s-09-vivienda_renta.sql
-- cargador 3
--@carga-inicial/s-09-vivienda_vacacional.sql
-- cargador 4
prompt Cargando datos de status vivienda
@carga-inicial/s-09-status_vivienda.sql
-- cargador 5
prompt Cargando datos de historico status vivienda
@carga-inicial/s-09-historico_status_vivienda.sql
-- cargador 6
prompt Cargando datos de imagen
@carga-inicial/s-09-imagen.sql
-- cargador 7
prompt Cargando datos de servicio
@carga-inicial/s-09-servicio.sql
-- cargador 8
--@carga-inicial/s-09-servicio_vivienda.sql -- PROBLEMAS CON UNIQUE
-- cargador 9
prompt Cargando datos de usuario
@carga-inicial/s-09-usuario.sql
-- cargador 10
prompt Cargando datos de tarjeta
@carga-inicial/s-09-tarjeta.sql
-- cargador 11
prompt Cargando datos de mensaje
@carga-inicial/s-09-mensaje.sql
-- cargador 12
prompt Cargando datos de clave de deposito
@carga-inicial/s-09-clave_deposito.sql
-- cargador 13
prompt Cargando datos de vivienda renta clave deposito
@carga-inicial/s-09-vivienda_renta_clave_dep.sql
-- cargador 14
prompt Cargando datos de vivienda venta
@carga-inicial/s-09-vivienda_venta.sql
-- cargador 15
prompt Cargando datos de pago vivienda
--@carga-inicial/s-09-pago_vivienda.sql --PROBLEMAS CON UNIQUE
-- cargador 16
prompt Cargando datos de alquiler
@carga-inicial/s-09-alquiler.sql
-- cargador 17
prompt Cargando datos de contrato
@carga-inicial/s-09-contrato.sql
-- cargador 18
prompt Cargando datos de intersado vivienda vac
@carga-inicial/s-09-interesado_vivienda_vac.sql

set define on

-- ANTES DE HABILITAR LOS CONTRAINTS DEBEMOS CARGAR TODOS LOS
-- ARCHIVOS BLOB

prompt Habilitando constraints de entidades blob
@s-09-habilitar-contraints.sql

--Prompt confirmando cambios
--commit;