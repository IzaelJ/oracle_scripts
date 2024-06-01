CREATE SEQUENCE seq_empregado_cod START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_produto_cod START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_empregado_cod
BEFORE INSERT ON Empregado
FOR EACH ROW
BEGIN
    IF :NEW.empregado_cod IS NULL THEN
        SELECT seq_empregado_cod.NEXTVAL INTO :NEW.empregado_cod FROM dual;
        END IF;
END;
    
CREATE OR REPLACE TRIGGGER trg_produto_cod
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN 
    IF :NEW.produto_cod IS NULL THEN
        SELECT seq_produto_cod.NEXTVAL INTO :NEW.produto_cod FROM dual;
        END IF;
END;


CREATE TRIGGER pk_trigger
FOR INSERT
