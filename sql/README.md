# Base de datos

## Práctica 11

### Hola mundo 

```plsql
set serverout on

begin 
	-- paquete.prod/fun
	dbms_output.put_line('HOLA MUNDO');
end
```

### Variables, asignaciones y operadores.

```plsql
begin
	-- truena en caso de no devolver 1 y solo 1 registro.
    select plan_estudios_id,clave,fecha_inicio
    into v_id,v_clave,v_fecha
    from plan_estudios
    where plan_estudios_id=1;
    dbms_output.put_line('id:
    '||v_id);
    dbms_output.put_line('clave: '||v_clave);
    dbms_output.put_line('fecha: '||v_fecha);
end;
/
```

* Procedimientos
* Triggers -> Ya están almacenados en el diccionario de datos
* Funciones

### Prodecimientos

* Parámetro de entrada -> Valor de solo lectura

* Parámetro de salida -> Pasar datos por referencia
* Un parámetro NO se puede invocar en `selects`. 
* Si al parámetro no le ponemos nada, por default es de entrada.

```plsql
create or replate procedure sp_saluda(p_saludo varchar2) is
--- Declaración de variables
begin
	-- 
end
```

