
DROP TABLE tb_cliente CASCADE CONSTRAINTS;

DROP TABLE tb_contato CASCADE CONSTRAINTS;

DROP TABLE tb_ingrediente CASCADE CONSTRAINTS;

DROP TABLE tb_login CASCADE CONSTRAINTS;

DROP TABLE tb_pedido CASCADE CONSTRAINTS;

DROP TABLE tb_pedido_pizza CASCADE CONSTRAINTS;

DROP TABLE tb_pizza CASCADE CONSTRAINTS;

DROP TABLE tb_pizza_composicao CASCADE CONSTRAINTS;



DROP TABLE tb_aluno CASCADE CONSTRAINTS;

DROP TABLE tb_contato CASCADE CONSTRAINTS;

DROP TABLE tb_curso CASCADE CONSTRAINTS;

DROP TABLE tb_login CASCADE CONSTRAINTS;

DROP TABLE tb_turma CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tb_aluno (
    id_aluno   INTEGER NOT NULL,
    nome_aluno VARCHAR2(100)
);

ALTER TABLE tb_aluno ADD CONSTRAINT tb_aluno_pk PRIMARY KEY ( id_aluno );

CREATE TABLE tb_contato (
    id_aluno INTEGER NOT NULL,
    telefone INTEGER,
    email    VARCHAR2(50)
);

CREATE TABLE tb_curso (
    id_curso   INTEGER NOT NULL,
    area VARCHAR(100),
    nome_curso VARCHAR2(100),
    preco_curso number(20,10)
);

ALTER TABLE tb_curso ADD CONSTRAINT tb_curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE tb_login (
    id_aluno INTEGER NOT NULL,
    login    VARCHAR2(100),
    senha    VARCHAR2(15)
);

ALTER TABLE tb_login ADD CONSTRAINT tb_login_pk PRIMARY KEY ( id_aluno );

CREATE TABLE tb_turma (
    id_aluno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL
);

ALTER TABLE tb_contato
    ADD CONSTRAINT tb_contato_tb_aluno_fk FOREIGN KEY ( id_aluno )
        REFERENCES tb_aluno ( id_aluno );

ALTER TABLE tb_login
    ADD CONSTRAINT tb_login_tb_aluno_fk FOREIGN KEY ( id_aluno )
        REFERENCES tb_aluno ( id_aluno );

ALTER TABLE tb_turma
    ADD CONSTRAINT tb_turma_tb_aluno_fk FOREIGN KEY ( id_aluno )
        REFERENCES tb_aluno ( id_aluno );

ALTER TABLE tb_turma
    ADD CONSTRAINT tb_turma_tb_curso_fk FOREIGN KEY ( id_curso )
        REFERENCES tb_curso ( id_curso );
        
        
INSERT INTO TB_ALUNO VALUES (1,'Aline Silva');
INSERT INTO TB_ALUNO VALUES (2,'Fernando Castro');
INSERT INTO TB_ALUNO VALUES (3,'Isadora Oliveira');
INSERT INTO TB_ALUNO VALUES (4,'Pedro da Silva');
INSERT INTO TB_ALUNO VALUES (5,'Julia Souza');

INSERT INTO TB_CURSO VALUES (1,'Exatas','Analise e Desenvolvimento de Sistemas',1800.555);
INSERT INTO TB_CURSO VALUES (2,'Humanas','Direito',2500.888);
INSERT INTO TB_CURSO VALUES (3,'Biologica','Biologia',1600.22222);
INSERT INTO TB_CURSO VALUES (4,'Biologica','Medicina',9200.9999);
INSERT INTO TB_CURSO VALUES (5,'Humanas','Administracao',1000.1111);
INSERT INTO TB_CURSO VALUES (6,'Exatas','Estatistica',2500.555);
INSERT INTO TB_CURSO VALUES (7,'Biologica','Odontologia',2930.654);
INSERT INTO TB_CURSO VALUES (8,'Humanas','Jornalismo',1500.3256);
INSERT INTO TB_CURSO VALUES (9,'Efermagem','Biologica',2200.9654);
INSERT INTO TB_CURSO VALUES (10,'Exatas','Banco de Dados',1500.123);
INSERT INTO TB_CURSO(id_curso,area,nome_curso) VALUES (11,'Exatas','Java');

INSERT INTO TB_TURMA VALUES(1,1);
INSERT INTO TB_TURMA VALUES(2,1);
INSERT INTO TB_TURMA VALUES(3,3);

INSERT INTO TB_LOGIN VALUES(1,'aline.silva','aline123');
INSERT INTO TB_LOGIN VALUES(2,'fernando.castro','fer123');
INSERT INTO TB_LOGIN VALUES(3,'isadora.oliveira','isa123');
INSERT INTO TB_LOGIN VALUES(4,'predro.silva','pedro123');

INSERT INTO TB_CONTATO VALUES(1,'911111111','aline@fiap.com.br');
INSERT INTO TB_CONTATO VALUES(2,'911122222','fer@fiap.com.br');
INSERT INTO TB_CONTATO VALUES(3,'911113333','isa@fiap.com.br');
INSERT INTO TB_CONTATO VALUES(3,'911113333','isadora@fiap.com.br');
INSERT INTO TB_CONTATO VALUES(2,'911113333','fernando@fiap.com.br');

SELECT * FROM TB_CURSO
WHERE preco_curso < 2500;

SELECT * FROM TB_CURSO WHERE preco_curso >=2500;

SELECT id_curso,
        nome_curso,
        preco_curso,
        (preco_curso / 12) as preco_parcelado_12
        FROM tb_curso;

UPDATE tb_curso SET preco_curso = 10000 WHERE nome_curso='Medicina';

SELECT * FROM tb_curso WHERE area LIKE 'Humanas';

SELECT * FROM TB_CURSO WHERE area IN ('Exatas', 'Biologica');

SELECT * FROM TB_CURSO WHERE preco_curso IS NULL;

SELECT * FROM TB_CURSO WHERE preco_curso BETWEEN 2000 AND 3000;

SELECT * FROM TB_ALUNO WHERE nome_aluno LIKE '%Silva%'; 
