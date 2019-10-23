set verify off
set serveroutput on
set feedback off
whenever sqlerror exit rollback

accept p_usr prompt 'Nombre del usuario: ' 
accept p_pwd prompt 'Password del usuario &&p_usr: ' hide

connect &&p_usr/&&p_pwd


prompt Creando procedimientos para Validar

@s-00-funciones-validacion.plb

create or replace procedure p_valida_ejercicio4 wrapped 
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
cf7 526
TDSrV6pFQxcHiTgEeYkjxTLntj0wg1XqTCCDWo7NxxrkB/jCZdjTrLIxi4wm/HU4huKGNckO
+MkuRxpYl7SF37OfPSSgKBD8roUsBdr5prYRrC+DB/BnWcniwUGtwUftfKVN6SPv0N1Hql1r
brgPz/Ohyh2Iv68cHBymXxBtSnE5uX0z7DCcB1sHW7FdvwVcHabPsvSEVjlCw4axG7TRjD1e
xRq7s7pLYNsBG021JFUvWeMFOkNdlBHBzf++4vYnMfUSZ0BHkYw4iI8FAF8pw20Q4FV1P4is
mV+SALf3QMluQX3U9LM8ct19cW5BhgzaJRu3tynSXdX5r2rWs+11l20hPeycJ9qBYfht77wS
KHtL/QblQqZyoAfbeFsdxmFZyV6xSUGA7dQts0jEge/X7i9H6YlSFo9qomj0XSnaB1miZjch
hjF6AssRlT+mmrzeNXav7eccV2DWFoTfyiSsFkCOhGbPZgxBP6nnqPNPAexsUgrbrsjLmE8o
ErHEhE9KtHDbo84zpAVs8PkEJAdHLDAaILUxUBOe+1Akj86IwEcIk0bPFU7wxC9haYE5eLBB
ecyqXC3s/yq9/T1AbSZFKkEFBuVl6U61QxhC28x3VjXCCF4mkqns1PR04LT6PqUNwKsls+G/
u2F/7GndI9d6J6B61znV7QkUOXcLyU9734F5v1k0qMKY9dMDW3dkBxZz99KX+zK6IZ7d9kDV
6PZhuhvFsSffGtFOWWBkIVV9QZAy0PBxkKwVXKqgxP6AbEtg5nWVodS7hmnU8gZZ/+BLxgt2
B8gKxgME5WhpPdZp3AHS0gt4Ptr2CTx8jr6ocQQw95hal0l/d+KFYWO1lJO17zGe0MqODAC1
93Df7aX/GzWBVTZcfjkYRZbhyXru/Js7GFaMgPca07v6bcVOyhMLJPn9u5YolFAPn+uY+PEZ
1bhKT/ZBD4uDQo7ntGEAeh74E/WqNdVjjoxH9SexTD31c9Mz75QOK5NuqA2Fr/H30hdR53H3
/mY1xUYjoiA36jx3jgbaVorA07AfgZtMNWihYesqMVRKYcsypBtRd79TT6cLjGCRamJ9iqLN
D4Vt3d9bNRbHFc6iEE9fLyQHL/dt9RtLc+7nHrP3wtoJV6qJZjXGzdDbmj/mZvzqZl4jsAM6
6yTeIvqwv2UHW5BV3nGraGtP47HKxOjNIe7yEwjK+XxDZX5ECMMFXrYmRRAxjsMtTVTqsepN
z0vxvrlomwzhcu2YeBma4ghI7XTeMYdvQwETeheBekK+qQZ4X2UTVLRfhjEZ0dLbA3G8Oh9M
cp/U

/

show errors

@s-00-header-validacion.sql

Prompt Iniciando validación.

exec p_valida_ejercicio4

Prompt Validación concluida !
exit
