--@Autor:			Jorge Rodriguez Campos
--@Fecha creación: 	dd/mm/yyyy
--@Descripción:		Archivo principal

whenever sqlerror exit rollback;

prompt conectando como sys para eliminar/crear al usuario
connect sys as sysdba

prompt eliminando al usuario rfp_p07_previo en caso de existir
@@s-00-asignaturas-elimina-usuario.sql

prompt creando usuario rfp_p07_previo
@@s-01-asignaturas-crea-usuario.sql

prompt conectando como usuario rfp_p07_previo
connect rfp_p07_previo/bases123

prompt creando tablas
@@s-02-asignaturas-ddl.sql

prompt cargando datos
@@s-03-asignaturas-carga-inicial.sql

prompt Listo!