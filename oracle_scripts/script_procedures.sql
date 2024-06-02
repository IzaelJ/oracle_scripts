CREATE OR REPLACE PROCEDURE pcListProducts
AS
    CURSOR c_product IS
        SELECT produto_cod, nome, valor FROM Produto ORDER BY nome;

    V_produto_cod Produto.produto_cod%TYPE;
    V_produto_nome Produto.nome%TYPE;
    V_produto_valor Produto.valor%TYPE;

BEGIN
    OPEN c_product;
    LOOP
        FETCH c_product INTO V_produto_cod, V_produto_nome, V_produto_valor;
        EXIT WHEN c_product%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product Code: ' || V_produto_cod);
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || V_produto_nome);
        DBMS_OUTPUT.PUT_LINE('Product Value: ' || V_produto_valor);
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    CLOSE c_product;
END;

CREATE OR REPLACE PROCEDURE pcListVendas
AS
    CURSOR c_venda IS
        SELECT v.cod_produto, v.cod_empregado, v.quantidade, p.nome AS produto_nome, e.nome AS empregado_nome
        FROM Venda v
        JOIN Produto p ON v.cod_produto = p.produto_cod
        JOIN Empregado e ON v.cod_empregado = e.empregado_cod
        ORDER BY p.nome;

    V_cod_produto Venda.cod_produto%TYPE;
    V_cod_empregado Venda.cod_empregado%TYPE;
    V_quantidade Venda.quantidade%TYPE;
    V_produto_nome Produto.nome%TYPE;
    V_empregado_nome Empregado.nome%TYPE;

BEGIN
    OPEN c_venda;
    LOOP
        FETCH c_venda INTO V_cod_produto, V_cod_empregado, V_quantidade, V_produto_nome, V_empregado_nome;
        EXIT WHEN c_venda%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Produto: ' || V_produto_nome);
        DBMS_OUTPUT.PUT_LINE('Vendido por: ' || V_empregado_nome);
        DBMS_OUTPUT.PUT_LINE('Quantidade: ' || V_quantidade);
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    CLOSE c_venda;
END;
