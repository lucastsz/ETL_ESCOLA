DROP TABLE DM_Disciplina CASCADE CONSTRAINTS;
DROP TABLE DM_Tempo CASCADE CONSTRAINTS;
DROP TABLE DM_Curso CASCADE CONSTRAINTS;
DROP TABLE FT_Reprovacao_GC CASCADE CONSTRAINTS;
DROP TABLE FT_Reprovacao CASCADE CONSTRAINTS;
DROP TABLE DM_Departamento CASCADE CONSTRAINTS;

CREATE TABLE DM_Disciplina (
	id_disc NUMBER(5) NOT NULL,
	nome_disc VARCHAR2(75) NOT NULL,
	carga_horaria NUMBER(3) NOT NULL,
	PRIMARY KEY (id_disc)
);

CREATE TABLE DM_Tempo (
	id_tempo NUMBER(5) NOT NULL,
	semestre NUMBER(5) NOT NULL,
	PRIMARY KEY (id_tempo)
);

CREATE TABLE DM_Curso (
	id_curso NUMBER(5) NOT NULL,
	nom_curso VARCHAR2(75) NOT NULL,
	PRIMARY KEY (id_curso)
);

CREATE TABLE FT_Reprovacao_GC (
	id_tempo NUMBER(5) NOT NULL,
	id_disc NUMBER(5) NOT NULL,
	total_rep_cot_disc NUMBER(5) NOT NULL,
	total_mat_alu_cot NUMBER(5) NOT NULL,
	total_reprovados NUMBER(5) NOT NULL,
	total_mat NUMBER(5) NOT NULL
);

CREATE TABLE FT_Reprovacao (
	id_tempo NUMBER(5) NOT NULL,
	id_disc NUMBER(5) NOT NULL,
	id_curso NUMBER(5) NOT NULL,
	id_dpto NUMBER(5) NOT NULL,
	total_rep_disc NUMBER(5) NOT NULL,
	total_mat_alu NUMBER(5) NOT NULL
);

CREATE TABLE DM_Departamento (
	id_dpto NUMBER(5) NOT NULL,
	nom_dpto VARCHAR2(75) NOT NULL,
	PRIMARY KEY (id_dpto)
);

ALTER TABLE FT_Reprovacao_GC ADD FOREIGN KEY (id_tempo) REFERENCES DM_Tempo(id_tempo);
ALTER TABLE FT_Reprovacao_GC ADD FOREIGN KEY (id_disc) REFERENCES DM_Disciplina(id_disc);
ALTER TABLE FT_Reprovacao ADD FOREIGN KEY (id_curso) REFERENCES DM_Curso(id_curso);
ALTER TABLE FT_Reprovacao ADD FOREIGN KEY (id_tempo) REFERENCES DM_Tempo(id_tempo);
ALTER TABLE FT_Reprovacao ADD FOREIGN KEY (id_dpto) REFERENCES DM_Departamento(id_dpto);
ALTER TABLE FT_Reprovacao ADD FOREIGN KEY (id_disc) REFERENCES DM_Disciplina(id_disc);