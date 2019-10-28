Prompt =========================================================
Prompt Iniciando validador - Práctica 9
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar el archvo "&&p_archivo_validador_main" 
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================
accept p_usuario default &&p_usuario  prompt '* Nombre de usuario de la práctica [&&p_usuario]: '
accept p_usuario_pass default  &&p_usuario_pass  prompt '* Password para &p_usuario [configurado en script]: ' hide
accept p_sys_password default '&&p_sys_password' prompt '* Password de sys [configurado en script]: ' hide
accept p_archivo_respuestas default '&&p_archivo_respuestas' Prompt '* Archivo de respuestas [&&p_archivo_respuestas]: ' 
define p_dir=/tmp/bd-unam/p09 
host mkdir -p /tmp/bd-unam/p09
host rm -f &&p_dir/&&p_archivo_respuestas
host cp &&p_archivo_respuestas &&p_dir/&&p_archivo_respuestas
host chmod 444 &&p_dir/&&p_archivo_respuestas
connect sys/&&p_sys_password as sysdba
create or replace directory bd_unam_tmp as '&&p_dir';
grant read on directory bd_unam_tmp to &&p_usuario; 
Prompt conectando como &p_usuario
connect &p_usuario/&p_usuario_pass
Prompt creando procedimientos de validación.
@s-00-funciones-validacion.plb
Prompt creando tablas de respuesta
create or replace procedure spv_elimina_tablas wrapped 
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
fc 107
kwcizHeQwYv/QFDGdlfgW/ZNrBIwgwFK2ssVfC+iJscYecja0Y+XUt9w7q5d0A4DrFrzPmei
L1zL0KTICWnNERcZ/988uNis6XXUv4pA+TyaBc4nloTaN7hppqVwkC1ConLy9MyCAtFY+h24
FvcSVJABurqMylfkqJp9KakmFy6sjoA2FfCfNSNvxEZvbLkC/yl7XKMvkmTqq+tWwaVfejA2
a44rrGzp4nLG5zo6y4V6BVWXs18O4m9ub6Gz11sh8IR4

/
show errors
exec spv_elimina_tablas;
Prompt cargando archivo de respuestas
@&p_archivo_respuestas
create or replace procedure spv_crea_tablas_respuesta wrapped 
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
42b 21f
F2NbHVOc2wNHkwgWctkeSDyLEnkwg2Ne+kgVfI6KKjqe1R/T9B0MPlpuo+Pldg5cuhoZ2B/G
a6fT2oGskjoyb8pna8XX+kLZMBlHTk7Z61ZuZIfmGhiyG/HhPC8XDksa5XzD3mezCvgvImAM
sVKQpQBuOxnmjmJv7npFxLDcMRo+xQUWZqzVt97dwruYhT9xXS0aER3xz6l2zoyHUDvTYWI4
oxbbLhxeKSjsVxZhiw7woATS62n6091WMaeBEjceNpApmoV0J2XpOXYFWFkVRsU10JZJiH4W
gwOkeAiJg6p0Ao5/LxtX5vTt6JALbjHb3noBNBhMNSN9mEpefxX23p438tz5pcOwteXHBU3v
6fKNyAcwVdnf5jUDX2zhH2+TwFImFCTRMa/ZiaBRtx09vlx6F4n2CArIfUepjAn6g7+P7GFb
bjaxphk9GEIStjQsOf5h2ko3ER2IXBkIFc0M2JI9EraYUU7b/4it4t7z740RZP7cF+CxhYOl
lcBSwvjwlVvHd45ouK1PGc8dPniEXg==

/
show errors
exec spv_crea_tablas_respuesta
Prompt cargando datos de validacion
create or  replace procedure spv_carga_datos_validacion wrapped 
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
132e 556
riu6AMB66jGmgl75D0OpJyUMBaswg9dUmtCDVy+8sZvqVPjh1TWUSagSiiJY26lcxv8xvb/N
DF1Adhjb0JQ3jbn5khM2feaYQ0W/k8NGouCl/tdZybwILz4p68rMjo3Qrt7J38e3/0efTOiu
ycxHWSvY6uMpPJjee1H5Rg6p29JrKhoLG6O7o+d/ayYY7u+nhZzmSXobJhVN75FXw6Btz+kd
bwxV6aIDLcpSUY9b0sRGxW/IiUTEEfIw5ir8oMbDQCErX8pm5xd/TqGYbTlMFNP/ICzs6E69
/rbR87w59O1JUuwXDj/mzxtEaDZ+opSUIu9u/AA4nULmG9TDfKMAsKlmYoAIu6KzxHTgkMvs
KRhyF5eu5fDjwPyEYc4JJMZvdZ0MSIzc2/RaJkq3qaGydnA5SV5L6P+5iaLyyx5wHOp1cLgS
NP1/CH6UuVGf2xJhAb7dLNmg5fDc/bmQHNQABTWnMg+d7h4zgDCBFUsfNhFlLVX4yFX2VbwA
mn0zVnS7sSDSI7S5rSSgCBXr3ldnM5ymVQ2df7H8Mdax+EL+Dx0hMAGp0UP31nsyaSUt8mZC
p50Xk/aTjcJwz6gGZEbAqzfCEwOXSP/FsK0KbovYwBPW/Cxr0UOnmWxNXeMnJvz82uVs9BbB
VsjeNog7RnqTvdDVJ10sHmln8EBf4TP0h77ITreRVgpoLFIm/G+zi1nIakNam6EsutFhtDZP
p1Yc0muKcU2DtSZ8IH1BTClSWg7VvZf6vtDxriaDZKGIIx1fLaTMu2jpIGn632Gqhx8IHx+z
V6j72GBcBXnQtwSDLVFP/xCy+lQjHGEtkM/O/FIjSGMHJA1k6kc8DEQxgJAQ2hRm6BdsEKEK
vJ3Z+R8iKDJIWZNH6smYBXUT0UX63zrYTUpdGwW5R2aWcm8seB7GTIcVQ9f0g8/fAYdRk0r8
anowtdUR0DKvj8kRggOFn20qwOLUdZabfpg+ZXVcyX2WoCFOXLxil0OSJ291lXq1NH8RzNjA
A6aD2ldfvK3V2P94yb4sUEe3k3N5yTliTs34PUg6+aMrqbseLi1M4gzjAM+YMQGUaN4GQqV2
GWhKky1l2WYK9NlRaIsMXlEkbcKF3HlTw5+/UNS2Y0P5hZmQdkb8KG+XjOiQpPj4b4W97gt7
Nmvtj2jQ1ntbUJwbj2DnNB2vTkcF51Y5Wf4Uq+fSWNMZL1ciqSRyUNeP5nxuq+pAzOHK8/vZ
0F5iWbfwS7QzN0Tm75RthHVUJGZ9nsUICoY4KtnmnSdf4qoO/dMuMmqPlKWZj+NZ9M42W/fo
EaXZIfvWTS04FewLwg/JUXtmB6quM6z7PtPCzmvp6aWl2SRBGvPl

/
show errors
exec spv_carga_datos_validacion
create or replace procedure spv_valida_estructura_archivo_resp wrapped 
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
332 25c
ha1+ImE0SyZ0PI1rd6GfBH8gWlQwgwIJLvaGfI5oxz+VmJP7zPFWfmtrW8Y/eTZKkRQxLq7m
MkT2hXuvn8D80A8x3GhG0bqk0gghgqveifLzOG6hRou4ZUmY1Zo7Ui66LG0zVLoLHga/QoMT
gypbyia9AaDJvnzTXOxrJWusNAoCwH9E6BumvqEExi3yP9G5qlWunHP/tgwvZZDSt5jigpIq
lTi3CATEvOqj4XLf1YmRNRdBrZPugoZP4SjQ6qtm6dysXH5lHEhfGRr7c5wMq4UOePfn95L7
j2aDDcy5iDIgT3SAs+5lAC32xBvt0D/m0wgG10EtIRYK1D1iiVyYKH1u/4BF8se2xQIJtkFJ
XWDXmtJSYBfSYTAb4TZT1uhN2YSZu8tFIUoibAXOPRPW4A8N4sAqdgrCS6puDzqG+I5twA++
OazMKYbvFicXAFENINpbh4xS2uqgv7F1EWL6z9/tyWwBQ9icpCL6HeQsIjTU6oU6f7j9OOVY
UxSlwmDLcXVXd2tC04jQNfglhbV0evJGRV2CTBXj3WLr2fYq7kQa/AGPupDzyoTopYr3xlXb
KHNkk9xFFdCdJ8c8Tg==

/
show errors
create or replace procedure spv_valida_respuestas wrapped 
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
cfa 4bc
BKxB3c0HIz/E1kp/7B3mpmdFOPswg0PqmiDrfC+LQqqV7WwCCTId3gkKqL70N+OgKXaw1rCF
oDllAaH60J5Q+TD/3BMbMXBcWDCpERPTT52YcsH4/xluQm8NHWCoDyAV8OOMjeeCWGQMWB9m
eO42pVgHNywvizBLykcjDLSTLMZ3CgOl5mBzQmcQ3OSDaB3GgBT5VubcG9G99JUdBjy2Rx9q
GVM4YB+J8xP1SX0+nPsBLOYFQu3EvHbLv8tWlnVSeZBE670BiylLZH6yFk7i5JpwDb6y4l9f
zG27VhcRqbNEdNUKggMp+Ph+SbaS1Fg1Dc+qvOcf2zJ+DaL/4Ufh7ztHWP5sCYJptK3HyA7+
/yERh5FDwhaC+9WI1oWnD1EuGLtLmtFU6JMbnOknwx6qzS3sPgl7pHT/r4E0vhnDLl6dJrAD
rlNvapvJP4/A06vExLqWhtpOHvD2qFS2Jd0hYYTXcgFffvcyWI6L6xyiofcVEXNsd++lPgwg
3aZD5aFIrqy8sCvdPlfrPg2krCA7L3V7ZA36/rjMMk58lIzU+yV/IYID2ue6LK7E27qL3KyY
UBMWPk6GdrmfDrK5r7FejIe7+4he9BFsdFvUTFf/3go5DBzOunv2NsRJXiTS4SIozqaqhLFY
zOswP10L0tQokslllobm2CV2kadj9NucDWdr2+F4IbNgfEUB9akL6meoItTgCsJ75yey3+CI
9K+o0hwLKXeBXPj2IZjqtfWLPiPZZ9t1n3q3P+PYmzCMbpaMIYipljUbBIyFNjlAXNKhyVcv
9OQOLmuxwJNvgyDLQtK+X5EJhXYyZPjYGKjE9pP64VzjXv1/j8gEpDoc90API7T0+XKTIaVc
sbM7WtcSiX3Qw+Sg800Q0aMyWDUQi00zEYrLauJa/lvaM3NzxoJXeaJuMQ6Dmvri9qP1/6Qg
lmHVwxwwTSSLtXLFel9VG5fVTWiaOLyEX1bqUWmqYytrSA1M1+5cgDs+/aQaVz/EutAnhX+I
EXvY0ZNT4w1H2/JfSsNGjeJRcj4lCUSZ+WP2Qt8ApniNodHiQ03UzNToKIbScN2kse4sOTCo
btMcZiUL7kZUu1fvb3OZZWA18B4TRgmcRUArG2wXBviJUsdk1JlXu0/+Hru8NZ3pQqi3RUE9
THgm8gtpnGCYglbSqoLl3D1oAXEGnOJU6Yv6rr3xEfs=

/
show errors
set appinfo on
exec spv_print_header
host sha256sum &&p_archivo_validador
exec spv_valida_respuestas('&&p_usuario','&&p_archivo_respuestas')
host rm -f &&p_dir/&&p_archivo_respuestas
