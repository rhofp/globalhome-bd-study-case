--@Autor: 			Jorge Rodriguez Campos
--@Fecha creación: 	dd/mm/yyyy
--@Descripción: 	Creación de Usuarios


create user rfp_p07_previo identified by  bases123 quota unlimited on users;
grant create table, create session to rfp_p07_previo;