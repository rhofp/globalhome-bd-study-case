set verify off
set feedback off
set serveroutput on
whenever sqlerror exit rollback
Prompt Cargando nombres de usuarios
@@s-04-validador-usernames.sql
Prompt Conectando como sys
connect sys/&&sys_pwd as sysdba
Prompt otorgando privilegios para validar.
grant create procedure to &&p7_previo_usr;
grant create sequence to &&p7_previo_usr;
grant create procedure  to &&p7_usr_admin;
grant create sequence to &&p7_usr_admin;
grant create procedure  to &&p7_usr_invitado;
grant create sequence  to &&p7_usr_invitado;
Prompt conectando como usuario &&p7_previo_usr
connect &&p7_previo_usr/&&p7_previo_usr_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-previo.plb
Prompt conectando como usuario &&p7_usr_invitado
connect &&p7_usr_invitado/&&p7_usr_invitado_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-invitado.plb
Prompt conectando como usuario  &&p7_usr_admin
connect &&p7_usr_admin/&&p7_usr_admin_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-admin.plb
create or replace procedure spv_valida_esquema_usr_admin wrapped 
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
f39 511
vsCb7O0crw2x4KnvG70RHidP6Xkwg1Xqul4Fey8icuSe7a1HzHJX+xVuKdI1LenzVwnFMVgz
oYZ7J3+24PyZebVzkzEb9FKp7lDeDIKIHmGSn/7r8tXXGqVNLKEYGB79ELaW6+nYLghjZeot
4hhxxm0K9QJ15hK2kqcI7QBGj2TJxwBJ+070M6EWiUrDohS27M5e1Fv/RwCfKOxAp2a4Mw/E
tpjHlIFmlwBgOUpRu6B5RtuvhHoVy7+lnR7eusfmZb1nvI1E9PiAKq2UCRiARgRPXiZ1j/76
LpVuLoiFnu2zgwMeXc95jrmEIEXk3HPil0wWOx9yqbQAnN1GgPuS/yRwgJjULq9TUWVGZo5N
96vYAlKFFRbK09m2KE4Rg+ALlsrH5Vxd6Qn3ph2e5kl32myj5tImaZ5oIUldX3AvCETo5QGF
PDxfhuK3+KZEDePlry/aQy9WciRspQHkjR6D6KzQkg7Kbil5Ov60lYDR5EuZf/qMyrQNpfMX
u2bl7V78kCgnbZD8I/OcOWyNk41/xVn0WWvrPfD6bSG67VKzsZm3mkoe9TcZyvassVaVaqtu
o+lFxVmH5szJYkdw8EDZoNinUkqvhDTl4vWCrLcBzwv1zGxch9vZQHFGIlhdZjy+Om5vAUHu
6Dp/vF9/52JldKfGH5NBsQ0NKFM9b2r3+8X+9nxN6ugE3YsNdNaEKsZhfpNhXAFtBhI4iEVi
mKJk5UMl4az19Zr6CBUWrUuJdvUWqLBnoetjYK4OkbYUlpxKhAzGOCTm7NEyzi+khMpdKIyG
hSVS9QdKeyLs3DLSw+Y/G+8kQdAtQwtoKNDoDPC7CwvBK0Ipr1J++le5t7P1JoYiiChu/RM2
c5jJF1ocQ00TkHm2SoVJkcG8xzvzuiKjneZmchYhEHs4a93xQFmeAGy7DYD/TY5Vuta6D47Y
l7WkK80GIOmc8E1l/5ayIR+LC6PJV3gB7BeSxfnot84lXZOWmEUuZTsuKWyXDxe3LguMYow0
FwG71zO0Zc172ba6nSF8cRVs5d1td0hX9ofG6KgcRTAhvAueemCsvQj/v8iVU3J6RTKBAn0H
IJgfDtQCbvHd8UwTmph4/qY8Xnm44MEUBofnr7Un5o6Bs6tKmfnnBuIMMAPr3+9ysSUSv6C7
1m/OWDMj4Hu34OYwWiDzHX++mbG6ja1u1aU5E8RnpAekmAfapH57tiXFpjJojIIFMXH6hN+2
TDHXzD3FYaMX08uyYsrFwYG6VzelhKFh8qeUoPkmbD7+D7WBLAjtAaM=

/
show errors
exec spv_print_header
connect &&p7_previo_usr/&&p7_previo_usr_pwd
set serveroutput on
exec spv_valida_esquema_usr_previo
connect &&p7_usr_invitado/&&p7_usr_invitado_pwd
set serveroutput on
exec spv_valida_esquema_usr_invitado
connect &&p7_usr_admin/&&p7_usr_admin_pwd
set serveroutput on
exec spv_valida_esquema_usr_admin
exit;
