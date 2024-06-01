CREATE TABLE Empregado 
(empregado_cod INTEGER PRIMARY KEY, nome VARCHAR(30) NOT NULL, sexo CHAR(1) CHECK (sexo IN ('m', 'f')), 
telefone VARCHAR(9) NOT NULL, data_nascimento DATE, cpf VARCHAR(11), rg VARCHAR(10), 
mae VARCHAR (30), rua VARCHAR(30), cidade VARCHAR(30), uf VARCHAR(5),
CEP VARCHAR(8) NOT NULL, salario DECIMAL(10, 2), CONSTRAINT unique_cpf UNIQUE (cpf), 
CONSTRAINT unique_RG UNIQUE (rg), CONSTRAINT unique_nome_mae_datan UNIQUE (nome, mae, data_nascimento));

CREATE TABLE Produto (produto_cod INTEGER PRIMARY KEY, nome VARCHAR(30), valor DECIMAL(10, 2));

CREATE TABLE Venda (cod_produto INTEGER, cod_empregado INTEGER, quantidade VARCHAR(10), data_hora DATETIME,
PRIMARY KEY(cod_produto, cod_empregado),
FOREIGN KEY (cod_produto) REFERENCES Produto(produto_cod),
FOREIGN KEY (cod_empregado) REFERENCES Empregado(empregado_cod));

CREATE TABLE Gerente(cod_empregado INTEGER, cod_gerente INTEGER, 
PRIMARY KEY (cod_empregado, cod_gerente),
FOREIGN KEY (cod_empregado) REFERENCES Empregado(empregado_cod),
FOREIGN KEY (cod_gerente) REFERENCES Empregado(empregado_cod));

INSERT INTO Empregado (empregado_cod, nome, sexo, telefone, data_nascimento, cpf, rg, mae, rua, cidade, uf, CEP, salario)
VALUES
(1, 'Ana Silva', 'f', '123456789', '1985-05-12', '12345678901', 'MG1234567', 'Maria Silva', 'Rua A', 'Cidade X', 'MG', '12345678', 3500.50),
(2, 'Bruno Santos', 'm', '987654321', '1990-07-22', '23456789012', 'SP2345678', 'Laura Santos', 'Rua B', 'Cidade Y', 'SP', '87654321', 4200.75),
(3, 'Carlos Oliveira', 'm', '543216789', '1982-09-30', '34567890123', 'RJ3456789', 'Ana Oliveira', 'Rua C', 'Cidade Z', 'RJ', '56781234', 3800.60),
(4, 'Daniela Souza', 'f', '678945321', '1995-03-18', '45678901234', 'BA4567890', 'Fernanda Souza', 'Rua D', 'Cidade W', 'BA', '23456789', 3100.80),
(5, 'Eduardo Lima', 'm', '321654987', '1988-11-05', '56789012345', 'RS5678901', 'Mariana Lima', 'Rua E', 'Cidade V', 'RS', '34567890', 3900.90);

INSERT INTO Produto (produto_cod, nome, valor)
VALUES
(1, 'Produto A', 50.00),
(2, 'Produto B', 30.00),
(3, 'Produto C', 20.00),
(4, 'Produto D', 10.00),
(5, 'Produto E', 15.00);

INSERT INTO Venda (cod_produto, cod_empregado, quantidade, data_hora)
VALUES
(1, 1, '5', '2024-05-01 10:00:00'),
(2, 2, '10', '2024-05-02 11:00:00'),
(3, 3, '7', '2024-05-03 12:00:00'),
(4, 4, '8', '2024-05-04 13:00:00'),
(5, 5, '6', '2024-05-05 14:00:00');

INSERT INTO Gerente (cod_empregado, cod_gerente)
VALUES
(1, 3),
(2, 3),
(4, 3),
(5, 3),
(2, 1);
