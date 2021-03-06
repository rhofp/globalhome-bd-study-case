--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de usuarios

--permite la salida de mensajes a consula empleabo dbms_output.put_line
set serveroutput on

prompt Creación de usuario FF_PROY_INVITADO y FF_PROY_ADMIN
Prompt proporcione el password del usuario sys
connect sys as sysdba

--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
	v_count_invitado number(1,0);
	v_count_admin number(1,0);
begin
	select count(*) into v_count_invitado
	from dba_users
	where username = 'FF_PROY_INVITADO';

	select count(*) into v_count_admin
	from dba_users
	where username = 'FF_PROY_ADMIN';

	if v_count_invitado > 0 then
		dbms_output.put_line('Eliminando usuario invitado existente');
		execute immediate 'drop user FF_PROY_INVITADO cascade';
	end if;

	if v_count_admin > 0 then
		dbms_output.put_line('Eliminando usuario admin existente');
		execute immediate 'drop user FF_PROY_ADMIN cascade';
	end if;

end;
/

create user FF_PROY_ADMIN identified by proyectof quota unlimited on users;
grant create session, create table, create procedure, create sequence, create view,
create public synonym,create synonym, create trigger to FF_PROY_ADMIN;

create user FF_PROY_INVITADO identified by proyectof;
grant create session,create synonym to FF_PROY_INVITADO;

--Se requiere hacer uso del usuario SYS para crear un objeto tipo
--directory y otorgar privilegios. 

--Un objeto tipo directory es un objeto que se crea y almacena en el
-- diccionario de datos y se emplea para mapear directorios
-- reales en el sistema de archivos. En este caso tmp_dir es un
-- objeto que apunta al directorio /tmp/bases del servidor 
prompt creando directorio tmp_dir
create or replace directory tmp_dir as '/tmp/bd/load';

--se otorgan permisos para que el usuario jorge_0307 de la BD pueda leer
--el contenido del directorio
grant read, write on directory tmp_dir to ff_proy_admin;


-- APUNTANDO A DIRECTORIO PARA ICONOS

Prompt creando objeto ICON_DIR
create or replace directory icon_dir as '/tmp/bd/iconos';

grant read,write on directory icon_dir to ff_proy_admin;

Prompt creando objeto IMG_DIR
create or replace directory img_dir as '/tmp/bd/imagenes';

grant read,write on directory img_dir to ff_proy_admin;	

Prompt creando objeto PDF_DIR
create or replace directory pdf_dir as '/tmp/bd/pdf';

grant read,write on directory pdf_dir to ff_proy_admin;		