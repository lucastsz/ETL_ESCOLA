CREATE TABLE ALUNOS (
    mat_alu       INTEGER NOT NULL,
    nome          VARCHAR (100) NOT NULL,
    dat_entrada   VARCHAR (20) NOT NULL,
    dat   DATE,
    cod_curso     INTEGER NOT NULL,
    cotista       CHAR (1) NOT NULL
);

ALTER TABLE ALUNOS ADD CONSTRAINT alu_fk PRIMARY KEY ( mat_alu );

CREATE TABLE CURSOS (
    cod_curso   INTEGER NOT NULL,
    nom_curso   VARCHAR (80) NOT NULL,
    cod_dpto    INTEGER NOT NULL
);

ALTER TABLE CURSOS ADD CONSTRAINT cur_pk PRIMARY KEY ( cod_curso );

CREATE TABLE DEPARTAMENTOS (
    cod_dpto    INTEGER NOT NULL,
    nome_dpto   VARCHAR (50) NOT NULL
);

ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT departamentos_pk PRIMARY KEY ( cod_dpto );

CREATE TABLE DISCIPLINAS (
    cod_disc        INTEGER NOT NULL,
    nome_disc       VARCHAR (60) NOT NULL,
    carga_horaria   NUMERIC (5, 2) NOT NULL
);

ALTER TABLE DISCIPLINAS ADD CONSTRAINT disc_pk PRIMARY KEY ( cod_disc );

CREATE TABLE MATRICULAS (
    semestre   INTEGER NOT NULL,
    mat_alu    INTEGER NOT NULL,
    cod_disc   INTEGER NOT NULL,
    nota       NUMERIC (5, 2),
    faltas     INTEGER ,
    status     CHAR(1)
);

ALTER TABLE MATRICULAS ADD CONSTRAINT mat_pk PRIMARY KEY ( mat_alu,
                                                           semestre );

CREATE TABLE MATRIZES_CURSOS (
    cod_curso   INTEGER NOT NULL,
    cod_disc    INTEGER NOT NULL,
    periodo     INTEGER NOT NULL
);

ALTER TABLE MATRIZES_CURSOS ADD CONSTRAINT mcu_pk PRIMARY KEY ( cod_curso,
                                                                cod_disc );

ALTER TABLE ALUNOS
    ADD CONSTRAINT alu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES CURSOS ( cod_curso );

ALTER TABLE CURSOS
    ADD CONSTRAINT cur_der_fk FOREIGN KEY ( cod_dpto )
        REFERENCES DEPARTAMENTOS ( cod_dpto );

ALTER TABLE MATRICULAS
    ADD CONSTRAINT mat_alu_fk FOREIGN KEY ( mat_alu )
        REFERENCES ALUNOS ( mat_alu );

ALTER TABLE MATRICULAS
    ADD CONSTRAINT mat_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES DISCIPLINAS ( cod_disc );

ALTER TABLE MATRIZES_CURSOS
    ADD CONSTRAINT mcu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES CURSOS ( cod_curso );

ALTER TABLE MATRIZES_CURSOS
    ADD CONSTRAINT mcu_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES DISCIPLINAS ( cod_disc );