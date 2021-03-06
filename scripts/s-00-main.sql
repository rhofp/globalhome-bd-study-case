--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación: 30/11/2019
--@Descripción: Archivo principal

--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback

@s-01-usuarios.sql

Prompt conectando como usuario ff_proy_admin
connect ff_proy_admin/proyectof 
-- QUITAR CONTRASEÑA AL FINALIZAR LAS PRUEBAS

@s-02-entidades.sql
@s-03-tablas-temporales.sql
@s-04-tablas-externas.sql
@s-05-secuencias.sql
@s-06-indices.sql
@s-07-sinonimos.sql 
@s-07-sinonimos_privados.sql 
@s-08-vistas.sql 

@s-09-carga-inicial.sql

@s-11-tr-pago_vivienda_trigger.sql
@s-11-tr-vacaciones_alquiler_trigger.sql
@s-11-tr-vivienda_venta_trigger.sql

@s-13-p_cargar_datos_vivienda_txt.sql
@s-13-p_corrige_banderas.sql	
@s-15-f_genera_folio.sql
@s-13-p_corrige_folios.sql

@s-17-lob-carga-contratos.sql
@s-17-lob-carga-iconos.sql
@s-17-lob-carga-imagenes.sql
@s-17-lob-carga-pagos.sql
@s-17-lob-carga-ventas.sql

--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.

whenever sqlerror continue none
Prompt Listo!