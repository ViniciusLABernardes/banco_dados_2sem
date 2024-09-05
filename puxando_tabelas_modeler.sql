
DROP TABLE tb_cliente CASCADE CONSTRAINTS;

DROP TABLE tb_contato CASCADE CONSTRAINTS;

DROP TABLE tb_ingrediente CASCADE CONSTRAINTS;

DROP TABLE tb_login CASCADE CONSTRAINTS;

DROP TABLE tb_pedido CASCADE CONSTRAINTS;

DROP TABLE tb_pedido_pizza CASCADE CONSTRAINTS;

DROP TABLE tb_pizza CASCADE CONSTRAINTS;

DROP TABLE tb_pizza_composicao CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tb_cliente (
    id_cliente       INTEGER NOT NULL,
    nome_cliente     VARCHAR2(100),
    cpf_cliente      INTEGER NOT NULL,
    endereco_cliente VARCHAR2(200)
);

ALTER TABLE tb_cliente ADD CONSTRAINT id_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE tb_contato (
    cliente_id INTEGER NOT NULL,
    email      VARCHAR2(100),
    telefone   INTEGER
);

CREATE TABLE tb_ingrediente (
    id_ingrediente   INTEGER NOT NULL,
    nome_ingrediente VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_ingrediente ADD CONSTRAINT tb_ingrediente_pk PRIMARY KEY ( id_ingrediente );

CREATE TABLE tb_login (
    id_cliente INTEGER NOT NULL,
    login      VARCHAR2(50),
    senha      VARCHAR2(16)
);

ALTER TABLE tb_login ADD CONSTRAINT id_login_pk PRIMARY KEY ( id_cliente );

CREATE TABLE tb_pedido (
    id_pedido        INTEGER NOT NULL,
    id_cliente       INTEGER NOT NULL,
    data_hora_pedido TIMESTAMP
);

ALTER TABLE tb_pedido ADD CONSTRAINT tb_pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE tb_pedido_pizza (
    id_pedido  INTEGER NOT NULL,
    id_pizza   INTEGER NOT NULL,
    quantidade INTEGER
);
ALTER TABLE tb_pedido_pizza ADD CHECK(quantidade > 0);
CREATE TABLE tb_pizza (
    id_pizza    INTEGER NOT NULL,
    nome_pizza  VARCHAR2(50) NOT NULL,
    preco_pizza NUMBER(10, 2),
    categoria   VARCHAR2(50)
);

ALTER TABLE tb_pizza ADD CONSTRAINT tb_pizza_pk PRIMARY KEY ( id_pizza );

CREATE TABLE tb_pizza_composicao (
    id_pizza       INTEGER NOT NULL,
    id_ingrediente INTEGER NOT NULL
);

ALTER TABLE tb_contato
    ADD CONSTRAINT tb_contato_id_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES tb_cliente ( id_cliente );

ALTER TABLE tb_login
    ADD CONSTRAINT tb_login_tb_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES tb_cliente ( id_cliente );

ALTER TABLE tb_pedido
    ADD CONSTRAINT tb_pedido_id_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES tb_cliente ( id_cliente );

ALTER TABLE tb_pedido_pizza
    ADD CONSTRAINT tb_pedido_pizza_tb_pedido_fk FOREIGN KEY ( id_pedido )
        REFERENCES tb_pedido ( id_pedido );

ALTER TABLE tb_pedido_pizza
    ADD CONSTRAINT tb_pedido_pizza_tb_pizza_fk FOREIGN KEY ( id_pizza )
        REFERENCES tb_pizza ( id_pizza );

ALTER TABLE tb_pizza_composicao
    ADD CONSTRAINT tb_pizza_comp_tb_ingr_fk FOREIGN KEY ( id_ingrediente )
        REFERENCES tb_ingrediente ( id_ingrediente );

ALTER TABLE tb_pizza_composicao
    ADD CONSTRAINT tb_pizza_comp_tb_pizza_fk FOREIGN KEY ( id_pizza )
        REFERENCES tb_pizza ( id_pizza );

CREATE SEQUENCE tb_cliente_id_cliente_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_cliente_id_cliente_trg BEFORE
    INSERT ON tb_cliente
    FOR EACH ROW
    WHEN ( new.id_cliente IS NULL )
BEGIN
    :new.id_cliente := tb_cliente_id_cliente_seq.nextval;
END;
/

CREATE SEQUENCE tb_ingrediente_id_ingrediente START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_ingrediente_id_ingrediente BEFORE
    INSERT ON tb_ingrediente
    FOR EACH ROW
    WHEN ( new.id_ingrediente IS NULL )
BEGIN
    :new.id_ingrediente := tb_ingrediente_id_ingrediente.nextval;
END;
/

CREATE SEQUENCE tb_pedido_id_pedido_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_pedido_id_pedido_trg BEFORE
    INSERT ON tb_pedido
    FOR EACH ROW
    WHEN ( new.id_pedido IS NULL )
BEGIN
    :new.id_pedido := tb_pedido_id_pedido_seq.nextval;
END;
/

CREATE SEQUENCE tb_pizza_id_pizza_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_pizza_id_pizza_trg BEFORE
    INSERT ON tb_pizza
    FOR EACH ROW
    WHEN ( new.id_pizza IS NULL )
BEGIN
    :new.id_pizza := tb_pizza_id_pizza_seq.nextval;
END;
/

INSERT INTO tb_ingrediente( nome_ingrediente) VALUES ('morango');

