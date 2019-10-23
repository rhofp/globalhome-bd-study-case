
set verify off
set serveroutput on
set feedback off
whenever sqlerror exit rollback

accept p_usr prompt 'Nombre del usuario: ' 
accept p_pwd prompt 'Password del usuario &&p_usr: ' hide

connect &&p_usr/&&p_pwd

create or replace procedure p_valida_ejercicio5 wrapped 
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
555 343
NGiayPueo6/DJ1GC0X3EyhG2Z/Mwg5DDeSCDfC8ZwfJzKP7XfLKJNuXifOhYcPKg20p2sAUi
6d58XBvs9fsbOwYozb+K0Nefl7qZCVxtFLDBSpjZAHJsXUdsjHW2MFo/sE7P7BubsNjCetnZ
maVRToKpE9sBf5RnhnBaMLXkflriAOUA/B/zT1PhWaKGELZ6xbSLLHuRR5Om4rvzxVoPHZKb
1AUaTyLWeZPL471/PvtXM2bxj3zSAB+Z0LNGuP8wjENUpwGqTdamL0xV2eVGNIWX5fExwkYm
Nr9B2eA+H5eHetj5cz05TVPaMUBarOEBjRnoAj6DOZ+YiekiYh8AZxPbHoHovujedVD3J7R1
jDgvbFZvOFaD/PLP0PHUzmAA7/dGbl/tu7KYvTLogav7+J47knPL/YKu5/UPWupClXzuOiGy
pXnmjr9IR2r7wmQGLFMe9ZjfYZbaH/9EZahUga6TfF2RqdSbcsvbONPgNVcBHaLZ/CJiXc8/
j8vfSPcr68/fhP0svUvBKFB+k4ZcgQEjDyJh2fzLkGY6snTQQcfnbaQCpfZs+4tjm+gMEJzH
hfyou8f04r3Gz9vdxnaER4y0sZMlfr4JwKpZ1WMC2FZZUek/xOWTe8jW2u6yBSdI8O8cwygw
IBoShoLS3a+Itr+sthhMllBxZfBYWBxApM3hskc3rzN2eK5mSUuMDYlwIaCNW923jiGS5rie
OhHE2AqnEL0rxMH1I0odgKLhfS4KQzRUO7OnkrBzrB1FxFYKsnhWu9+5MpTa+JREtrQHktUm
ItACowajX+vDvYslGlwgd6r+LHbY3go=

/
show errors

@s-00-header-validacion.sql

Prompt Iniciando validación.

exec p_valida_ejercicio5

Prompt Validación concluida!.
exit
