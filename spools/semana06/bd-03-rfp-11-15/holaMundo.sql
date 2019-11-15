set serveroutput on
--habilita los mensajes a consola

declare
  v_fecha DATE;
begin
  v_fecha := sysdate;
  dbms_output.put_line('Hola mundo a las: ' || v_fecha);
end;
/
