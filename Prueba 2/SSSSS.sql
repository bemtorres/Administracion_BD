--- Prueba

CREATE USER con_benjamin IDENTIFIED by duoc;
CREATE USER rem_mora IDENTIFIED BY duoc;
CREATE USER ger_torres IDENTIFIED BY duoc;

CREATE TABLESPACE tbs_con_benjamin DATAFILE 'd:\tbs_con_benjamin.dat'; 
CREATE TABLESPACE tbs_rem_mora DATAFILE 'd:\tbs_rem_mora.dat'; 
CREATE TABLESPACE tbs_ger_torres DATAFILE 'd:\tbs_ger_benjamin.dat'; 

ALTER USER con_benjamin DEFAULT TABLESPACE tbs_con_benjamin;
ALTER USER rem_mora DEFAULT TABLESPACE tbs_rem_mora;
ALTER USER ger_torres DEFAULT TABLESPACE tbs_ger_torres;


--•	Cada vez que cree un índice, se deben crear un table spaces llamado tbs_usuario_ind
CREATE TABLESPACE tbs_con_benjamin_ind 	DATAFILE 'd:\tbs_con_benjamin_ind.dat';
CREATE TABLESPACE tbs_rem_mora_ind	DATAFILE 'd:\tbs_rem_mora_ind.dat';
CREATE TABLESPACE tbs_ger_torres_ind DATAFILE 'd:\tbs_ger_torres_ind.dat';

-- tablas temporales
CREATE TEMPORARY TABLESPACE tbs_con_benjamin_temp TEMPFILE 'D:/tbs_con_benjamin_temp.dat'; --SIZE 5M AUTOEXTEND ON;
CREATE TEMPORARY TABLESPACE tbs_rem_mora_temp TEMPFILE 'D:/tbs_rem_mora_temp.dat';
CREATE TEMPORARY TABLESPACE tbs_ger_torres_temp	TEMPFILE 'D:/tbs_ger_torres_temp.dat';	

ALTER USER con_benjamin TEMPORARY TABLESPACE tbs_con_benjamin_temp;
ALTER USER rem_mora TEMPORARY TABLESPACE tbs_rem_mora_temp;
ALTER USER ger_torres TEMPORARY TABLESPACE tbs_ger_torres_temp;

--
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO con_benjamin;
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO rem_mora;
GRANT CREATE TABLE,SYNONYM,VIEW,SEQUENCE TO ger_torres;
--
--Eliminar Tablas , Sinónimos, Vistar y Secuencias
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO con_benjamin;
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO rem_mora;
GRANT DROP ANY TABLE,SYNONYM,VIEW,SEQUENCE TO ger_torres;
--
--Alterar Tablas , Sinónimos, Vistar y Secuencias
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO con_benjamin;
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO rem_mora;
GRANT ALTER ANY TABLE,SYNONYM,VIEW,SEQUENCE TO ger_torres;
---- ANY cualquier tablas

--Crear Procedimientos, Funciones , Package, Trigger
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO con_benjamin;
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO rem_mora;
GRANT CREATE PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO ger_torres;
--Eliminar Procedimientos, Funciones , Package, Trigger
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO con_benjamin;
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO rem_mora;
GRANT DROP ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO ger_torres;
--Modificar Procedimientos, Funciones , Package, Trigger MODIFY
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO con_benjamin;
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO rem_mora;
GRANT ALTER ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO ger_torres;
--Ejecutar Procedimientos, Funciones , Package, Trigger
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO con_benjamin;
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO rem_mora;
GRANT EXECUTE ANY PROCEDURE,FUNCTION,PACKAGE,TRIGGER TO ger_torres;

--Insertar, Actualizar, Eliminar y Select Los registros de la tabla
--Insertar registros de la tabla
GRANT INSERT ANY TABLE TO con_benjamin;
GRANT INSERT ANY TABLE TO rem_mora;
GRANT INSERT ANY TABLE TO ger_torres;
--Actualizar Registros de la tabla
GRANT UPDATE ANY TABLE TO con_benjamin;
GRANT UPDATE ANY TABLE TO rem_mora;
GRANT UPDATE ANY TABLE TO ger_torres;
--Eliminat Registros de la tabla
GRANT DROP ANY TABLE TO con_benjamin;
GRANT DROP ANY TABLE TO rem_mora;
GRANT DROP ANY TABLE TO ger_torres;
--Select Registros de la tabla
GRANT SELECT ANY TABLE TO con_benjamin;
GRANT SELECT ANY TABLE TO rem_mora;
GRANT SELECT ANY TABLE TO ger_torres;

--4.Tablas Usuario Contabilidad 
--Ingresar en la tabla Contabilidad Tabla Persona
--TABLAS USUARIO CONTABILIDAD 32.6MB -> 200.000 1.63MB -> 10.000

-- char 1 char 1byte
-- un varchar2 2byte
-- number 1 byte 10 = 10bytes                     --- 379MB

CREATE TABLE persona(
    rut number(10),
    dv varchar2(1),
    nombre varchar(30),
    appaterno varchar2(50),
    apmaterno varchar2(50),
    calle varchar2(37),
    nro varchar2(8),
    depto varchar2(8)
) tablespace tbs_con_benjamin;
ALTER TABLE persona ADD CONSTRAINT PERSONA_PK PRIMARY KEY ( rut ) Tablespace tbs_con_benjamin_ind ;
CREATE  INDEX PERSONA_APPAT ON persona(appaterno) tablespace tbs_con_benjamin_ind;
CREATE  INDEX PERSONA_APMAT ON persona(apmaterno) tablespace tbs_con_benjamin_ind;
CREATE  INDEX PERSONA_CalleNro ON persona(calle,rro) tablespace tbs_con_benjamin_ind;


--- Create tabla generales

CREATE TABLESPACE tbs_tablas_generales DATAFILE 'd:\tbs_tablas_generales.dat';
CREATE TABLESPACE tbs_tablas_generales_ind	DATAFILE 'd:\tbs_tablas_generales_ind';

CREATE TABLE comuna(
	id_comuna number(3),
	nombre varchar2(30)
)Tablespace tbs_tablas_generales;
ALTER TABLE comuna ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( id_comuna ) tablespace tbs_tablas_generales_ind;
CREATE UNIQUE INDEX COMUNA_NOMBRE ON comuna(nombre) tablespace tbs_tablas_generales_ind;


CREATE TABLE empleado(
	rut number(10),
	sueldo number(10),
	fechaContrato date
 )tablespace tbs_rem_mora;
ALTER TABLE empleado ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY ( rut ) TABLESPACE tbs_rem_mora_ind;

--- number 10 + 10
--datatime 7 byte   27 bytes por datos =  1600 4200bytes
-- 
CREATE TABLE remuneraciones(
    rut number(10),
    sueldo number(10),
    fecha_remuneracion varchar2(20),
    total_haberes number(10),
    total_descuentos number(10),
    total_pagar number(20)
)tablespace tbs_Remuneraciones;
ALTER TABLE remuneraciones ADD CONSTRAINT REMUNERACIONES_PK PRIMARY KEY ( rut ) TABLESPACE tbs_rem_mora_ind;
CREATE UNIQUE INDEX  rem_fecha ON remuneraciones(fecha_remuneracion) tablespace tbs_rem_mora_ind;
CREATE UNIQUE INDEX rem_rut ON remuneraciones(rut) tablespace tbs_rem_mora_ind;


CREATE ROLE secretaria;
--,UPDATE,Insert,delete
Grant Select on persona to secretaria;	
Grant Select on comuna to secretaria;	
Grant Select on persona to secretaria;	


set secretaria TO con_benjamin;

