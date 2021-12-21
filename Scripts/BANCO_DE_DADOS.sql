/******************************************************************************/
/****         Generated by IBExpert 2007.05.03 19/12/2021 20:24:11         ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

CREATE DATABASE 'DB_Funcionario.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_FUNCAO_ID;
SET GENERATOR GEN_FUNCAO_ID TO 2;

CREATE GENERATOR GEN_FUNCIONARIOS_ID;
SET GENERATOR GEN_FUNCIONARIOS_ID TO 8;

CREATE GENERATOR GEN_USUARIOS_ID;
SET GENERATOR GEN_USUARIOS_ID TO 4;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE FUNCAO (
    CODIGO     INTEGER NOT NULL,
    DESCRICAO  VARCHAR(50)
);

CREATE TABLE FUNCIONARIOS (
    CODIGO        INTEGER NOT NULL,
    NOME          VARCHAR(50),
    SALARIO       DOUBLE PRECISION,
    DTNASCIMENTO  DATE,
    FK_FUNCAO     INTEGER,
    CEP           INTEGER,
    NUMERO        INTEGER,
    COMPLEMENTO   VARCHAR(100),
    BAIRRO        VARCHAR(100),
    UF            CHAR(2),
    LAGRADOURO    VARCHAR(100),
    CIDADE        VARCHAR(100)
);

CREATE TABLE USUARIOS (
    CODIGO  INTEGER,
    NOME    VARCHAR(20),
    SENHA   VARCHAR(100)
);


/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: FUNCAO_BI */
CREATE TRIGGER FUNCAO_BI FOR FUNCAO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_funcao_id,1);
end;

/* Trigger: FUNCIONARIOS_BI */
CREATE TRIGGER FUNCIONARIOS_BI FOR FUNCIONARIOS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_funcionarios_id,1);
end


/* Trigger: USUARIOS_BI */
CREATE TRIGGER USUARIOS_BI FOR USUARIOS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_usuarios_id,1);
end;

SET TERM ;



/******************************************************************************/
/****                                Roles                                 ****/
/******************************************************************************/

CREATE ROLE RDB$ADMIN;
