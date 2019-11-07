--Ejercicio 1 
select dia_semana,hora_inicio,hora_fin 
from horario
where dia_semana=1 or dia_semana=3;

DIA_SEMANA HORA_INICIO         HORA_FIN 
========== =================== = 
1          2019-10-01 07:00:00 2019-10-01 08:30:00
3          2019-10-01 07:00:00 2019-10-01 08:30:00
1          2019-10-01 08:30:00 2019-10-01 10:00:00
3          2019-10-01 08:30:00 2019-10-01 10:00:00
1          2019-10-01 10:00:00 2019-10-01 11:30:00
3          2019-10-01 10:00:00 2019-10-01 11:30:00
1          2019-10-01 11:30:00 2019-10-01 13:00:00
3          2019-10-01 11:30:00 2019-10-01 13:00:00

-- EJERCICIO 5
select 365-to_number(to_char(sysdate,'ddd')) as "DIAS FALTANTES" from dual;

DIAS FALTANTES 
= 
54

-- EJERCICIO 4
select  to_number(sysdate-fecha_nacimiento)/365 "Edad Profesor" 
from profesor where nombre='FELIPE'
and apellido_paterno='LIMA' and  apellido_materno='RODRIGUEZ';

EDAD PROFESOR 
= 
67.02215794647387

-- EJERCICIO 10
select curso_id,clave_grupo 
from(
	select * 
	from curso where cupo_maximo=30
	minus 
	select * 
	from  curso where clave_grupo='001'
);

-- EJERCICIO 11
select asignatura_id,nombre,plan_estudios_id, creditos from(
	select * 
	from asignatura 
	where plan_estudios_id=1
	union
	select *
	from asignatura
	where plan_estudios_id =2
	minus
	select *
	 from asignatura
	 where creditos>=9
);

ASIGNATURA_ID NOMBRE                           PLAN_ESTUDIOS_ID CREDITOS 
============= ================================ ================ = 
1             ALGEBRA                          1                8
4             ALGEBRA LINEAL                   1                7
7             CALCULO 3                        1                8
10            ELECTRICIDAD Y MAGNETISMO        1                8
11            ALGORITMOS Y ESTRUCTURA DE DATOS 2                6
13            BASES DE DATOS                   1                8
14            ANALISIS DE SISTEMAS Y SEÑALES   1                7
16            DINAMICA DE SISTEMAS FISICOS     1                6
20            TEMAS SELECTOS DE BD             1                5

--EJERCICIO 14
select a.nombre, c.clave_grupo,h.dia_semana
from horario h,curso_horario ch,semestre s,curso c,
	profesor p, asignatura a, plan_estudios pe
where h.HORARIO_ID = ch.HORARIO_ID
 and ch.CURSO_ID=c.CURSO_ID 
 and s.semestre_id = c.SEMESTRE_ID
 and p.PROFESOR_ID=c.PROFESOR_ID
 and a.ASIGNATURA_ID=c.ASIGNATURA_ID
 and a.plan_estudios_id=pe.PLAN_ESTUDIOS_ID
 and p.nombre='JULIAN' 
 and p.APELLIDO_PATERNO='VALDEZ'
 and p.APELLIDO_MATERNO='SANCHEZ'
 and s.anio=2008
 and s.PERIODO=1
 order by a.NOMBRE, c.CLAVE_GRUPO;

 NOMBRE              CLAVE_GRUPO DIA_SEMANA 
=================== =========== = 
CALCULO 1           001         5
CALCULO 1           001         3
CALCULO 1           001         1
CALCULO 1           004         1
CALCULO 1           004         3
CALCULO 1           004         5
CALCULO 2           003         2
CALCULO 2           003         4
GEOMETRIA ANALITICA 002         5
GEOMETRIA ANALITICA 002         3
GEOMETRIA ANALITICA 002         1


