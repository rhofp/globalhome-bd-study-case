--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de sinonimos

prompt Conectandose al usuario rfp_p0703_admin:
connect rfp_p0703_admin/bases123

grant select on cuenta to rfp_p0703_invitado;
grant create synonym to rfp_p0703_invitado;

connect rfp_p0703_invitado/invitado123
create or replace synonym s_cuenta_cliente for rfp_p0703_admin.cuenta;

select * from s_cuenta_cliente;

disconnect