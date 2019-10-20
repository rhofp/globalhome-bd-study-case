--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de usuarios

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt DESTRUYENDO al usuario rfp_p0703_admin
drop user rfp_p0703_admin cascade;

prompt DESTRUYENDO al usuario rfp_p0703_invitado
drop user rfp_p0703_invitado cascade;

prompt DESTRUYENDO el rol p0703_admin_rol
drop role p0703_admin_rol;