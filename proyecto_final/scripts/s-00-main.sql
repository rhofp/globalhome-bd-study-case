--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación: 30/11/2019
--@Descripción: Archivo principal

--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback

Prompt creando usuarios ff_proy_admin y ff_proy_invitado
@s-01-usuarios.sql

Prompt conectando como usuario ff_proy_admin
connect ff_proy_admin/proyectof 
-- QUITAR CONTRASEÑA AL FINALIZAR TODAS LAS PRUEBAS

Prompt creando objetos
@s-02-entidades.sql
@s-03-tablas-temporales.sql
@s-04-tablas-externas.sql
@s-05-secuencias.sql
@s-06-indices.sql
--@s-07-sinonimos.sql 
--@s-08-vistas.sql 

Prompt realizando la carga de datos
@s-09-carga-inicial.sql

--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.

whenever sqlerror continue none
Prompt Listo!