Terminal

> sqlplus /nolog

> connect /as sysdba

//cambiar usuario
alter user system identified by benjamin;

//crear  un usuario
CREATE USER moratorres IDENTIFIED BY mora;

//permiso para conectarse
GRANT "CONNECT" to moratorres WITH ADMIN OPTION;

//permiso para crear una tabla
GRANT CREATE TABLE TO moratorres WITH ADMIN OPTION;

//privilegios para el tablespace
GRANT UNLIMITED TABLESPACE TO moratorres WITH ADMIN OPTION ;
//permiso para crear tablas
GRANT SELECT ANY TABLE TO moratorres WITH ADMIN OPTION ;
GRANT DELETE ANY TABLE TO moratorres WITH ADMIN OPTION ;
GRANT INSERT ANY TABLE TO moratorres WITH ADMIN OPTION ;
GRANT UPDATE ANY TABLE TO moratorres WITH ADMIN OPTION ;
GRANT INSERT ANY TABLE TO moratorres WITH ADMIN OPTION ;

//crear tablespace

CREATE TABLESPACE tbs_moratorres_01
	DATAFILE 'tbs_moratorres_01.dat'
	SIZE 50M	
	REUSE
	AUTOECTEND ON NEXT 10M MAXSIZE 200M;	


 CREATE table subject(
 	nombre varchar(2),
 	edad   number(2)
 )
 tablespace tbs_moratorres_01


 //CREAT USUARIO 

 	CREATE USER miusuario IDENTIFIED BY miclave
 		DEFAULT TABLESPACE temp
 		QUOTA UNLIMITED ON data;


 //crear taclespace

 CREATE UNDO TABLESPACE undo_gravertt
 	DATAFILE 'd:/undo_gravertt'
 	SIZE 100M AUTOEXTEND ON 
 	RETENTION GUARANTEE;

//crear tablaespace temporal
 CREATE TEMPORAL TABLESPCAE temp_graverrt 
 	TEMPFILE 'd:/temp_gravertt' 
 	SIZE 40M 
    AUTOENTEND AND;

create 


malla a tierra
Telurometro




--PREGUNTA 1
--CREACIONES DE 3 USUARIOS;

--Usuario Nro1: Contabilidad
Create user Contabilidad IDENTIFIED by con_felipe;
--Usuario Nro2: Remuneraciones
Create user Remuneraciones IDENTIFIED by rem_rivera;
--Usuario Nro3: Gerencia
Create user Gerencia IDENTIFIED by gen_sanchez;
--CREACION DE TABLESPACE PATA CONTABILIDAD
CREATE TABLESPACE tbs_Contabilidad
  DATAFILE 'd:\tbs_Contabilidad.dat'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 5M MAXSIZE 65M;

---------------------------------------------------------------------

--GRANT UNLIMITED TABLESPACE TO Remuneraciones WITH ADMIN OPTION;

--CREACION DE TABLESPACE PATA CONTABILIDAD
CREATE TABLESPACE tbs_Remuneraciones
  DATAFILE 'd:\tbs_Remuneraciones.dat'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
---------------------------------------------------------------------
--GRANT UNLIMITED TABLESPACE TO Gerencia WITH ADMIN OPTION;

--CREACION DE TABLESPACE PATA CONTABILIDAD
CREATE TABLESPACE tbs_Gerencia
  DATAFILE 'd:\tbs_Gerencia.dat'
    SIZE 5M
    REUSE															
    AUTOEXTEND ON NEXT 1M MAXSIZE 15M;
---------------------------------------------------------------------
---------------------------------------------------------------------
--PREGUNTA 2
--CREAR TABLAS PARA CADA USUARIO:
--TABLE Contabilidad
CREATE TABLESPACE tbs_Contabilidad
  DATAFILE 'd:\tbs_Contabilidad'
    SIZE 40M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--TABLE REMUNERACIONES
CREATE TABLESPACE tbs_Remuneraciones
  DATAFILE 'd:\tbs_Remuneraciones'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--TABLE GERENCIA
CREATE TABLESPACE tbs_Gerencia
  DATAFILE 'd:\tbs_Gerencia'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;    
----
--CREACION DE TABLESPACE CON INDICE
----
--TABLE Contabilidad
CREATE TABLESPACE tbs_Contabilidad
  DATAFILE 'd:\tbs_Contabilidad_ind'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--TABLE REMUNERACIONES
CREATE TABLESPACE tbs_Remuneraciones
  DATAFILE 'd:\tbs_Remuneraciones_ind'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--TABLE GERENCIA
CREATE TABLESPACE tbs_Gerencia
  DATAFILE 'd:\tbs_Gerencia_ind'
    SIZE 30M
    REUSE															
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;  
--CREACION DE TABLESPACE TEMPORALES

--TABLESPACE TEMPORAL CONTABILIDAD (Espacio para hacer los order-group by)
CREATE TEMPORARY TABLESPACE temp_Contabilidad_temp
	TEMPFILE 'D:/temp_Contabilidad_temp' SIZE 5M AUTOEXTEND ON;

--TABLESPACE TEMPORAL REMUNERACIONES
CREATE TEMPORARY TABLESPACE temp_Remuneraciones_temp
	TEMPFILE 'D:/temp_Remuneraciones_temp' SIZE 5M AUTOEXTEND ON;

--TABLESPACE TEMPORAL GERENCIA
CREATE TEMPORARY TABLESPACE temp_Gerencia_temp
	TEMPFILE 'D:/temp_Gerencia_temp' SIZE 5M AUTOEXTEND ON;

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

--PREGUNTA 3
--Privilegios: Todos los usuarios deben tener privilegios para realizar las siguientes acciones en su cuenta.
--Priviligeios: Crear, Eliminar y Alterar -> Tablas , Sinónimos, Vistar y Secuencias
--Crear Tablas , Sinónimos, Vistar y Secuencias (Puede dar privilegios a otros usuarios)
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO Contabilidad;
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO Remuneraciones;
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO Gerencia;
--
--Eliminar Tablas , Sinónimos, Vistar y Secuencias
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Contabilidad;
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Remuneraciones;
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Gerencia;
--
--Alterar Tablas , Sinónimos, Vistar y Secuencias
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Contabilidad WITH ADMIN OPTION;
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Remuneraciones WITH ADMIN OPTION;
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO Gerencia WITH ADMIN OPTION;
----
--Crear, ELiminar, Moficiar, Ejecutar -> Procedimientos, Funciones , Package, Trigger
--Crear Procedimientos, Funciones , Package, Trigger
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Contabilidad WITH ADMIN OPTION;
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Remuneraciones WITH ADMIN OPTION;
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Gerencia WITH ADMIN OPTION;
--Eliminar Procedimientos, Funciones , Package, Trigger
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Contabilidad WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Remuneraciones WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Gerencia WITH ADMIN OPTION;
--Modificar Procedimientos, Funciones , Package, Trigger MODIFY
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Contabilidad WITH ADMIN OPTION;
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Remuneraciones WITH ADMIN OPTION;
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Gerencia WITH ADMIN OPTION;
--Ejecutar Procedimientos, Funciones , Package, Trigger
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Contabilidad WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Remuneraciones WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO Gerencia WITH ADMIN OPTION;
--------
--Insertar, Actualizar, Eliminar y Select Los registros de la tabla
--Insertar registros de la tabla
GRANT INSERT ANY TABLE TO Contabilidad WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO Remuneraciones WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO Gerencia WITH ADMIN OPTION;
--Actualizar Registros de la tabla
GRANT UPDATE ANY TABLE TO Contabilidad WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO Remuneraciones WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO Gerencia WITH ADMIN OPTION;
--Eliminat Registros de la tabla
GRANT DROP ANY TABLE TO Contabilidad WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO Remuneraciones WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO Gerencia WITH ADMIN OPTION;
--Select Registros de la tabla
GRANT SELECT ANY TABLE TO Contabilidad WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO Remuneraciones WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO Gerencia WITH ADMIN OPTION;
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
--4.Tablas Usuario Contabilidad 
--Ingresar en la tabla Contabilidad Tabla Persona
--TABLAS USUARIO CONTABILIDAD 32.6MB -> 200.000 1.63MB -> 10.000
CREATE TABLE PERSONA(
    Rut number(10) not null, 
    DigitoVerificador varchar2(1), 
    Nombre varchar(20),
    ApellidoPa varchar2(30),
    ApellidoMa varchar2(30),
    Calle varchar(50),
    Nro number(10) not null,
    Depto varchar2(20)
) tablespace tbs_Contabilidad;
ALTER TABLE PERSONA ADD CONSTRAINT PERSONA_PK PRIMARY KEY ( Rut ) Tablespace tbs_Contabilidad_ind ;
CREATE  INDEX PERSONA_APPAT ON PERSONA(ApellidoPa) tablespace tbs_Contabilidad_ind;
CREATE  INDEX PERSONA_APMAT ON PERSONA(ApellidoMA) tablespace tbs_Contabilidad_ind;
CREATE  INDEX PERSONA_CalleNro ON PERSONA(Calle,Nro) tablespace tbs_Contabilidad_ind;

---
------ Existen 346 comunas en Chile
---
CREATE TABLESPACE tbs_tablas_generales
  DATAFILE 'd:\tbs_tablas_generales'
    SIZE 2M
    REUSE															
    AUTOEXTEND ON NEXT 4M MAXSIZE 100M;
--- 
CREATE TABLE COMUNA(
    Id_Comuna number(10) not null,
    Nombre varchar2(30) 
)Tablespace tbs_tablas_generales;
ALTER TABLE COMUNA ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( Id_Comuna ) Tablespace tbs_tablas_generales_ind;
CREATE UNIQUE INDEX COMUNA_NOMBRE ON COMUNA(Nombre) tablespace tbs_tablas_generales_ind;
--
--
--Tablas Usuario Remuneraciones
--Crear Tabla Empleado 1500 -> 0.05x2=0.1MB 100 -> 0.003x2= 0.006MB
CREATE TABLE EMPLEADO (
    Rut number(10) not null,
    Sueldo number(10),
    fechaContrato varchar2(20)
)tablespace tbs_Remuneraciones;
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY ( Rut );
--Crear Tabla remuneraciones
CREATE TABLE REMUNERACIONES(
    Rut number(10) not null UNIQUE,
    Sueldo number(10),
    fecha_remuneracion varchar2(20) UNIQUE,
    total_haberes number(10) not null,
    total_descuentos number(10),
    total_pagar number(20)
)tablespace tbs_Remuneraciones;
ALTER TABLE REMUNERACIONES ADD CONSTRAINT REMUNERACIONES_PK PRIMARY KEY ( Rut );






-- Crear 3 usuarios;

CREATE TABLESPACE tbs_Contabilidad
  DATAFILE 'd:\tbs_Contabilidad.dat'
    SIZE 30M
    REUSE			
    AUTOEXTEND ON NEXT 5M MAXSIZE 65M;



