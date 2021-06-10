create tablespace dados_escola_dw_operacional
  logging
  datafile 'c:\oraclexe\dados\dados_escola_dw_operacional.dbf' 
  size 500m 
  autoextend on 
  next 100m maxsize 3072m
  extent management local;
  
create tablespace indices_escola_dw_operacional
  logging
  datafile 'c:\oraclexe\dados\indices_escola_dw_operacional.dbf' 
  size 200m 
  autoextend on 
  next 10m maxsize 1024m
  extent management local;  

create temporary tablespace temp_escola_dw_operacional 
  tempfile 'c:\oraclexe\dados\temp_escola_dw_operacional.dbf' 
  size 50m 
  autoextend on 
  next 10m maxsize 200m
  extent management local;

create user escola_dw
  identified by escola_dw
  default tablespace dados_escola_dw_operacional
  temporary tablespace temp_escola_dw_operacional
  profile DEFAULT;

grant connect to escola_dw;
grant resource to escola_dw;
grant create view to escola_dw;

ALTER SESSION SET CURRENT_SCHEMA = escola_dw;