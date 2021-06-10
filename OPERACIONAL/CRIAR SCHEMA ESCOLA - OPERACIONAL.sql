create tablespace dados_escola_operacional
  logging
  datafile 'c:\oraclexe\dados\dados_escola_operacional.dbf' 
  size 500m 
  autoextend on 
  next 100m maxsize 3072m
  extent management local;
  
create tablespace indices_escola_operacional
  logging
  datafile 'c:\oraclexe\dados\indices_escola_operacional.dbf' 
  size 200m 
  autoextend on 
  next 10m maxsize 1024m
  extent management local;  

create temporary tablespace temp_escola_operacional 
  tempfile 'c:\oraclexe\dados\temp_escola_operacional.dbf' 
  size 50m 
  autoextend on 
  next 10m maxsize 200m
  extent management local;

create user escola
  identified by escola
  default tablespace dados_escola_operacional
  temporary tablespace temp_escola_operacional
  profile DEFAULT;

grant connect to escola;
grant resource to escola;
grant create view to escola;

ALTER SESSION SET CURRENT_SCHEMA = escola;