CREATE DATABASE restaurante;
USE restaurante;


CREATE TABLE funcionarios(
       id_funcionario INT NOT NULL AUTO_INCREMENT,
       nome VARCHAR (255) NOT NULL,
       cpf VARCHAR (14) NOT NULL,
       data_nascimento DATE NOT NULL,
       endereco VARCHAR (255) NOT NULL,
       telefone VARCHAR (255) NOT NULL,
       email VARCHAR (100) NOT NULL,
       cargo VARCHAR (100) NOT NULL,
       salario DECIMAL (10,2) NOT NULL,
       data_admissao DATE NOT NULL,
       PRIMARY KEY (id_funcionario)
);

CREATE TABLE clientes(
      id_cliente INT NOT NULL AUTO_INCREMENT,
      nome VARCHAR (255) NOT NULL,
      cpf VARCHAR (14) NOT NULL,
      data_nascimento DATE NOT NULL,
      endereco VARCHAR (255) NOT NULL,
      telefone VARCHAR (15)NOT NULL,
      email VARCHAR (100) NOT NULL,
      data_cadastro DATE NOT NULL,
      PRIMARY KEY (id_cliente)
);

CREATE TABLE produtos (
     id_produto INT NOT NULL AUTO_INCREMENT,
     nome VARCHAR (255) NOT NULL,
     descricao TEXT,
     preco DECIMAL (10,2) NOT NULL,
     categoria VARCHAR (100) NOT NULL,
     PRIMARY KEY (id_produto)
);

SHOW CREATE TABLE pedidos;
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_2;

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_clientes
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

SELECT id_funcionario 
  FROM funcionarios 
  WHERE id_funcionario IN (4,7,8);

SELECT id_produto 
  FROM produtos 
  WHERE id_produto BETWEEN 1 AND 20;

SELECT id_funcionario
  FROM funcionarios 
  ORDER BY id_funcionario;
 
SELECT id_cliente 
  FROM clientes 
  ORDER BY id_cliente;
 
SELECT id_funcionario 
 FROM funcionarios 
 ORDER BY id_funcionario;
 
SELECT id_produto
 FROM produtos
 ORDER BY id_produto;
 
SELECT id_pedido  
 FROM pedidos 
 ORDER BY id_pedido;
 
 SELECT fornecedor,
 COUNT(*) AS quantidade_produtos
 FROM info_produtos
 GROUP BY fornecedor
 HAVING 
 COUNT(*) > 1;
 
 TRUNCATE TABLE funcionarios;

SELECT * FROM pedidos
WHERE data_pedido < '2024-07-06';

SET SQL_SAFE_UPDATES = 0;
UPDATE pedidos
SET status = 'Concluído'
WHERE data_pedido < '2024-07-06';

CREATE TABLE pedidos (
     id_pedido INT NOT NULL AUTO_INCREMENT,
     id_cliente INT NOT NULL,
     id_funcionario INT NOT NULL,
     id_produto INT NOT NULL,
     quantidade INT NOT NULL,
     preco DECIMAL (10,2) NOT NULL,
     data_pedido DATE NOT NULL, 
     status VARCHAR (50) NOT NULL DEFAULT 'pendente',
     PRIMARY KEY (id_pedido),
     FOREIGN KEY (id_funcionario) REFERENCES clientes (id_cliente),
     FOREIGN KEY (id_cliente) REFERENCES funcionarios (id_funcionario),
     FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE info_produtos (
    id_info INT NOT NULL AUTO_INCREMENT,
    id_produto INT NOT NULL,
    ingredientes TEXT,
    fornecedor VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_info),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
); 

SELECT * FROM funcionarios; 
DELETE FROM funcionarios WHERE id_funcionario = 1;
DELETE FROM funcionarios WHERE id_funcionario = 22;


SHOW CREATE TABLE funcionarios;

INSERT INTO funcionarios (nome, cpf, data_nascimento, endereco, telefone, email, cargo, salario, data_admissao)
   VALUES
   ('Ricardo Sousa', '111.222.333-44', '1992-05-25', 'Av. Rebouças 1234, São Paulo', '11987651234', 'ricardo.sousa@email.com', 'Chefe de Cozinha', 6000.00, '2019-03-15'),
   ('Marcos Lima', '333.444.555-66', '1985-04-17', 'Rua Augusta 2020, São Paulo', '11987655678', 'marcos.lima@email.com', 'Barman', 2800.00, '2020-01-10'),
   ('Carla Mendes', '444.555.666-77', '1993-07-03', 'Av. Paulista 1853, São Paulo', '11987659876', 'carla.mendes@email.com', 'Garçonete', 2700.00, '2020-07-15'),
   ('Tiago Nunes', '555.666.777-88', '1978-08-12', 'Rua Funchal 500, São Paulo', '11987656789', 'tiago.nunes@email.com', 'Sommelier', 3400.00, '2021-04-22'),
   ('Cláudia Vieira', '666.777.888-99', '1981-01-19', 'Alameda Lorena 1300, São Paulo', '11987657890', 'claudia.vieira@email.com', 'Cozinheira', 3200.00, '2021-08-30'),
   ('Pedro Martins', '777.888.999-00', '1983-12-05', 'Rua dos Pinheiros 800, São Paulo', '11987658901', 'pedro.martins@email.com', 'Garçom', 2700.00, '2022-03-15'),
   ('Fernanda Rocha', '888.999.000-11', '1990-09-27', 'Av. Faria Lima 1500, São Paulo', '11987659012', 'fernanda.rocha@email.com', 'Garçonete', 2700.00, '2022-05-20'),
   ('André Costa', '999.000.111-22', '1986-03-14', 'Rua Bela Cintra 985, São Paulo', '11987660123', 'andre.costa@email.com', 'Gerente', 4700.00, '2022-10-10'),
   ('Sofia Alves', '000.111.222-33', '1995-06-01', 'Rua Consolação 1235, São Paulo', '11987661234', 'sofia.alves@email.com', 'Recepcionista', 2400.00, '2023-01-01');
   
INSERT INTO clientes (nome, cpf, data_nascimento, endereco, telefone, email, data_cadastro)
   VALUES
   ('Lucas Silva', '123.456.789-01', '1990-01-15', 'Av. Brigadeiro Faria Lima, 1571, São Paulo', '11987651234', 'lucas.silva@email.com', '2023-01-12'),
   ('Ana Paula', '234.567.890-12', '1985-03-22', 'Rua Oscar Freire, 1290, São Paulo', '11987652345', 'ana.paula@email.com', '2023-01-12'),
   ('Rafael Costa', '345.678.901-23', '1992-07-18', 'Av. Paulista, 1844, São Paulo', '11987653456', 'rafael.costa@email.com', '2023-01-12'),
   ('Camila Rodrigues', '456.789.012-34', '1988-05-24', 'Rua Augusta, 2530, São Paulo', '11987654567', 'camila.rodrigues@email.com', '2023-01-12'),
   ('Eduardo Santos', '567.890.123-45', '1975-11-30', 'Alameda Santos, 980, São Paulo', '11987655678', 'eduardo.santos@email.com', '2023-01-12'),
   ('Fernanda Lima', '678.901.234-56', '1994-04-15', 'Rua da Consolação, 2000, São Paulo', '11987656789', 'fernanda.lima@email.com', '2023-01-12'),
   ('Gustavo Pereira', '789.012.345-67', '1982-02-28', 'Av. Rebouças, 3001, São Paulo', '11987657890', 'gustavo.pereira@email.com', '2023-01-12'),
   ('Juliana Machado', '890.123.456-78', '1996-09-14', 'Av. Brasil, 1620, São Paulo', '11987658901', 'juliana.machado@email.com', '2023-01-12'),
   ('Marcos Ribeiro', '901.234.567-89', '1991-12-12', 'Rua Bela Cintra, 1225, São Paulo', '11987659012', 'marcos.ribeiro@email.com', '2023-01-12'),
   ('Patricia Almeida', '912.345.678-90', '1987-06-19', 'Rua Haddock Lobo, 1327, São Paulo', '11987660123', 'patricia.almeida@email.com', '2023-01-12'),
   ('Roberto Nunes', '923.456.789-01', '1979-03-21', 'Av. Nove de Julho, 2045, São Paulo', '11987661234', 'roberto.nunes@email.com', '2023-01-12'),
   ('Sandra Gomes', '934.567.890-12', '1984-08-10', 'Rua Pamplona, 1453, São Paulo', '11987662345', 'sandra.gomes@email.com', '2023-01-12'),
   ('Tiago Souza', '945.678.901-23', '1989-01-15', 'Av. Europa, 784, São Paulo', '11987663456', 'tiago.souza@email.com', '2023-01-12'),
   ('Vanessa Moraes', '956.789.012-34', '1974-10-23', 'Rua Amauri, 350, São Paulo', '11987664567', 'vanessa.moraes@email.com', '2023-01-12'),
   ('Daniel Oliveira', '967.890.123-45', '1993-12-11', 'Rua dos Pinheiros, 900, São Paulo', '11987665678', 'daniel.oliveira@email.com', '2023-01-12'),
   ('Maria Clara', '978.901.234-56', '1998-03-05', 'Av. Ibirapuera, 3103, São Paulo', '11987666789', 'maria.clara@email.com', '2023-01-12'),
   ('João Pedro', '989.012.345-67', '1981-05-27', 'Rua Tabapuã, 1123, São Paulo', '11987667890', 'joao.pedro@email.com', '2023-01-12'),
   ('Larissa Fonseca', '991.123.456-78', '1986-11-09', 'Av. Cidade Jardim, 400, São Paulo', '11987668901', 'larissa.fonseca@email.com', '2023-01-12'),
   ('Henrique Silva', '992.234.567-89', '1990-02-14', 'Av. São Gabriel, 477, São Paulo', '11987669012', 'henrique.silva@email.com', '2023-01-12'),
   ('Isabela Freitas', '993.345.678-90', '1994-07-20', 'Rua Veneza, 1000, São Paulo', '11987670123', 'isabela.freitas@email.com', '2023-01-12'),
   ('Giovanna Rocha', '994.456.789-01', '1987-12-01', 'Rua Artur Azevedo, 1767, São Paulo', '11987671234', 'giovanna.rocha@email.com', '2023-01-12'),
   ('Leonardo Alves', '995.567.890-12', '1988-01-22', 'Rua Joaquim Antunes, 760, São Paulo', '11987672345', 'leonardo.alves@email.com', '2023-01-12'),
   ('Beatriz Santos', '996.678.901-23', '1976-06-16', 'Av. Santo Amaro, 1230, São Paulo', '11987673456', 'beatriz.santos@email.com', '2023-01-12'),
   ('Carlos Eduardo', '997.789.012-34', '1972-04-04', 'Rua Estados Unidos, 1457, São Paulo', '11987674567', 'carlos.eduardo@email.com', '2023-01-12'),
   ('Fábio Lopes', '998.890.123-45', '1989-08-12', 'Av. das Nações Unidas, 1889, São Paulo', '11987675678', 'fabio.lopes@email.com', '2023-01-12'),
   ('Tatiane Costa', '999.901.234-56', '1995-10-30', 'Rua Guarará, 532, São Paulo', '11987676789', 'tatiane.costa@email.com', '2023-01-12'),
   ('Ricardo Mendonça', '991.012.345-67', '1980-03-17', 'Rua Pedroso Alvarenga, 1100, São Paulo', '11987677890', 'ricardo.mendonca@email.com', '2023-01-12'),
   ('Elisa Carvalho', '992.123.456-78', '1997-05-25', 'Av. Roque Petroni Júnior, 1089, São Paulo', '11987678901', 'elisa.carvalho@email.com', '2023-01-12'),
   ('Flávio Barros', '993.234.567-89', '1985-09-19', 'Rua Gomes de Carvalho, 1356, São Paulo', '11987679012', 'flavio.barros@email.com', '2023-01-12'),
   ('Priscila Ribeiro', '994.345.678-90', '1983-07-28', 'Rua Bandeira Paulista, 982, São Paulo', '11987680123', 'priscila.ribeiro@email.com', '2023-01-12');
   
INSERT INTO produtos (nome, descricao, preco, categoria)
	VALUES
    ('Feijoada', 'Feijoada completa com arroz, farofa, couve e laranja.', 29.90, 'Prato Principal'),
    ('Picanha na Chapa', 'Picanha fatiada servida com alho, arroz, farofa e vinagrete.', 42.00, 'Prato Principal'),
    ('Moqueca Baiana', 'Moqueca de peixe e camarão, acompanhada de arroz branco e pirão.', 37.50, 'Prato Principal'),
    ('Bobó de Camarão', 'Camarão cozido em creme de mandioca e azeite de dendê, servido com arroz.', 45.00, 'Prato Principal'),
    ('Bacalhau à Brás', 'Bacalhau desfiado, preparado com batata palha, ovos e cebola.', 38.00, 'Prato Principal'),
    ('Coxinha de Frango', 'Massa de batata com recheio cremoso de frango, servida frita.', 6.50, 'Aperitivo'),
    ('Pastel de Carne', 'Pastel frito com recheio de carne moída temperada.', 5.00, 'Aperitivo'),
    ('Pastel de Queijo', 'Pastel frito com recheio de queijo derretido.', 5.00, 'Aperitivo'),
    ('Empada de Palmito', 'Empada de massa podre recheada com creme de palmito.', 6.00, 'Aperitivo'),
    ('Risoto de Camarão', 'Risoto de camarão com toque de limão siciliano e alho-poró.', 36.00, 'Prato Principal'),
    ('Escondidinho de Carne Seca', 'Purê de mandioca com recheio de carne seca e queijo coalho.', 32.00, 'Prato Principal'),
    ('Salada Caprese', 'Tomate, muçarela de búfala e manjericão, com azeite e vinagre balsâmico.', 22.00, 'Entrada'),
    ('Polenta Mole com Ragú de Linguiça', 'Polenta cremosa servida com ragú de linguiça e molho de tomate.', 28.00, 'Prato Principal'),
    ('Frango à Parmegiana', 'Peito de frango empanado coberto com queijo e molho de tomate, servido com arroz e fritas.', 35.00, 'Prato Principal'),
    ('Salmão Grelhado', 'Salmão grelhado servido com legumes no vapor e molho de alcaparras.', 42.00, 'Prato Principal'),
    ('Caipirinha de Limão', 'Tradicional caipirinha brasileira feita com cachaça, limão e açúcar.', 15.00, 'Bebida'),
    ('Suco de Maracujá', 'Suco natural de maracujá.', 8.00, 'Bebida'),
    ('Chopp Gelado', 'Chopp claro, servido bem gelado.', 7.50, 'Bebida'),
    ('Mousse de Maracujá', 'Sobremesa leve e refrescante à base de maracujá.', 12.00, 'Sobremesa'),
    ('Pudim de Leite', 'Pudim de leite condensado com calda de caramelo.', 10.00, 'Sobremesa');
    
INSERT INTO info_produtos (id_produto, ingredientes, fornecedor)
   VALUES
   (1, 'Feijão preto, carne seca, costelinha, linguiça, arroz, farinha, couve, laranja', 'Distribuidora Central'),
   (2, 'Picanha, alho, arroz, farofa, vinagrete', 'Carnes Boi Nobre'),
   (3, 'Peixe, camarão, leite de coco, azeite de dendê, arroz, farinha', 'Mar & Terra Distribuidora'),
   (4, 'Camarão, mandioca, leite de coco, azeite de dendê, arroz', 'Mar & Terra Distribuidora'),
   (5, 'Bacalhau, batata, ovo, cebola, azeite', 'Importadora Lisboa'),
   (6, 'Frango, batata, massa de trigo', 'Avícola São José'),
   (7, 'Carne moída, massa de trigo', 'Carnes Boi Nobre'),
   (8, 'Queijo, massa de trigo', 'Laticínios Vale do Sereno'),
   (9, 'Palmito, massa de trigo, creme de leite', 'Conservas Sabor da Terra'),
   (10, 'Camarão, arroz arbóreo, limão siciliano, alho-poró', 'Mar & Terra Distribuidora'),
   (11, 'Carne seca, mandioca, queijo coalho', 'Carnes Boi Nobre e Laticínios Vale do Sereno'),
   (12, 'Tomate, muçarela de búfala, manjericão', 'Queijaria Bela Vista e Horta Santa Luzia'),
   (13, 'Linguiça, polenta, molho de tomate', 'Carnes Boi Nobre e Moinho Dourado'),
   (14, 'Frango, queijo, molho de tomate, arroz, batata', 'Avícola São José e Laticínios Vale do Sereno'),
   (15, 'Salmão, legumes, alcaparras', 'Pescados do Norte e Hortifruti Natural da Terra'),
   (16, 'Cachaça, limão, açúcar', 'Destilaria Nacional'),
   (17, 'Maracujá', 'Hortifruti Natural da Terra'),
   (18, 'Malte, lúpulo', 'Cervejaria do Vale'),
   (19, 'Maracujá, creme de leite, açúcar', 'Hortifruti Natural da Terra e Laticínios Vale do Sereno'),
   (20, 'Leite condensado, ovos, açúcar', 'Laticínios Vale do Sereno');
   
INSERT INTO pedidos (id_cliente, id_funcionario, id_produto, quantidade, preco, data_pedido, status)
   VALUES
     (1, 4, 1, 2, 29.90, '2024-07-01', 'Concluído'),
     (3, 4, 2, 1, 42.00, '2024-07-01', 'Concluído'),
	 (6, 7, 3, 1, 37.50, '2024-07-01', 'Concluído'),
     (8, 7, 4, 3, 45.00, '2024-07-01', 'Concluído'),
     (10, 8, 5, 2, 38.00, '2024-07-02', 'Pendente'), 
     (15, 8, 6, 4, 6.50, '2024-07-02', 'Concluído'),
     (22, 4, 7, 3, 5.00, '2024-07-02', 'Concluído'),
     (18, 4, 8, 2, 5.00, '2024-07-02', 'Concluído'), 
     (4, 7, 9, 5, 6.00, '2024-07-02', 'Concluído'),
     (6, 7, 10, 1, 36.00, '2024-07-03', 'Concluído'),
     (9, 8, 11, 3, 32.00, '2024-07-03', 'Concluído'),
     (11, 8, 12, 1, 22.00, '2024-07-03', 'Concluído'),
     (24, 4, 13, 2, 28.00, '2024-07-03', 'Concluído'),
     (27, 4, 14, 1, 35.00, '2024-07-03', 'Concluído'),
     (17, 7, 15, 2, 42.00, '2024-07-03', 'Concluído'),
     (7, 7, 16, 3, 15.00, '2024-07-04', 'Concluído'),
     (13, 8, 17, 2, 8.00, '2024-07-04', 'Concluído'),
     (25, 8, 18, 4, 7.50, '2024-07-04', 'Concluído'),
     (22, 4, 19, 1, 12.00, '2024-07-04', 'Concluído'),
     (2, 4, 20, 2, 10.00, '2024-07-04', 'Concluído'),
     (8, 7, 2, 1, 42.00, '2024-07-05', 'Concluído'),
     (11, 7, 3, 2, 37.50, '2024-07-05', 'Concluído'),
     (18, 8, 4, 3, 45.00, '2024-07-05', 'Concluído'),
     (22, 8, 5, 1, 38.00, '2024-07-05', 'Concluído'),
     (19, 4, 6, 4, 6.50, '2024-07-05', 'Concluído'),
     (28, 4, 7, 3, 5.00, '2024-07-05', 'Concluído'),
     (1, 7, 8, 2, 5.00, '2024-07-05', 'Concluído'),
     (7, 7, 9, 5, 6.00, '2024-07-05', 'Concluído'),
     (19, 8, 10, 1, 36.00, '2024-07-05', 'Concluído'),
     (15, 8, 11, 3, 32.00, '2024-07-05', 'Concluído'),
	 (24, 4, 12, 1, 22.00, '2024-07-06', 'Concluído'),
     (12, 4, 13, 2, 28.00, '2024-07-06', 'Concluído'),
     (4, 7, 14, 1, 35.00, '2024-07-06', 'Concluído'),
     (9, 7, 15, 2, 42.00, '2024-07-06', 'Concluído'),
     (18, 8, 16, 3, 15.00, '2024-07-06', 'Concluído'),
     (5, 8, 17, 2, 8.00, '2024-07-06', 'Pendente'),
     (22, 4, 18, 4, 7.50, '2024-07-06', 'Concluído'),
     (14, 4, 19, 1, 12.00, '2024-07-06', 'Pendente'),
     (19, 7, 20, 2, 10.00, '2024-07-06', 'Concluído'),
     (8, 7, 1, 2, 29.90, '2024-07-06', 'Pendente'),
     (7, 8, 2, 1, 42.00, '2024-07-06', 'Concluído'),
     (4, 8, 3, 2, 37.50, '2024-07-06', 'Pendente'),
     (21, 4, 4, 3, 45.00, '2024-07-06', 'Concluído'),
     (4, 4, 5, 1, 38.00, '2024-07-06', 'Pendente'), 
     (13, 7, 6, 4, 6.50, '2024-07-06', 'Concluído'),
     (25, 7, 7, 3, 5.00, '2024-07-06', 'Pendente'),
     (7, 8, 8, 2, 5.00, '2024-07-06', 'Concluído'),
     (12, 4, 10, 1, 36.00, '2024-07-06', 'Concluído'),
     (10, 4, 11, 3, 32.00, '2024-07-06', 'Pendente');
     
SELECT nome, categoria
    FROM produtos
    WHERE preco > 30;
    
SELECT nome, telefone, data_nascimento
    FROM clientes
    WHERE YEAR(data_nascimento) < 1985;
    
SELECT p.id_produto, ip.ingredientes
    FROM produtos p
    JOIN info_produtos ip ON p.id_produto = ip.id_produto
    WHERE ip.ingredientes LIKE '%carne%';
    
SELECT nome, categoria
    FROM produtos
    ORDER BY categoria ASC, nome ASC;
    
SELECT nome, preco
    FROM produtos
    ORDER BY preco DESC
    LIMIT 5;
    
SELECT * 
    FROM produtos
    WHERE categoria = 'Prato Principal'
    LIMIT 2 OFFSET 6;
    
SELECT *
    FROM pedidos 
    WHERE id_funcionario = 4;
    
SELECT *
    FROM pedidos
    WHERE status != 'Concluído';
    
SELECT * 
    FROM pedidos
    WHERE id_produto IN (1,3,5,7,8);
    
SELECT *
    FROM clientes 
    WHERE nome LIKE 'C%';
    
SELECT 
    p.id_produto, p.nome, p.categoria, ip. ingredientes
    FROM produtos p
    JOIN info_produtos ip ON p.id_produto = ip.id_produto
    WHERE 
    ip.ingredientes LIKE '%carne%' OR ip.ingredientes LIKE '%frango%';
    
SELECT *
    FROM produtos
    WHERE preco between 20 AND 30;
    
UPDATE pedidos 
    SET status = NULL
	WHERE id_pedido = 6;
    
SELECT *
    FROM
    pedidos 
	WHERE status IS NULL;
    
SELECT id_pedido,
    IFNULL(status, 'Cancelado') AS status
    FROM 
    pedidos
		WHERE  status IS NULL;
    
SELECT nome, cargo, salario,
    IF (salario > 3000, 'Acima da média', 'Abaixo da média') AS classificacao
    FROM
    funcionarios;
    
SELECT COUNT(*) AS total_pedidos
    FROM 
    pedidos;
    
SELECT COUNT(DISTINCT id_cliente) AS total_clientes_com_pedidos
    FROM 
    pedidos;
    
SELECT nome, preco
	FROM 
    produtos
    WHERE preco = (SELECT MIN(preco) FROM produtos);
    
SELECT nome, preco
    FROM 
    produtos 
    WHERE preco = (SELECT MAX(preco) FROM produtos);
    
SELECT 
    nome AS 'Nome do produto',
    preco AS 'Preço',
    DENSE_RANK() OVER (ORDER BY preco DESC) AS 'Rank'
    FROM produtos
    ORDER BY preco DESC
    LIMIT 5;
    
SELECT
    categoria,
    AVG(preco) AS 'Média de Valores'
    FROM produtos
    GROUP BY categoria;

SELECT
   COUNT(*) AS total_produtos FROM produtos;
 
SELECT id_cliente,
   COUNT(*)  AS total_pedidos
   FROM pedidos
   GROUP BY id_cliente
   HAVING COUNT(*) = 1;

SELECT 
    p.id_produto,
    p.nome,
    p.descricao,
    ip.ingredientes
FROM 
    produtos p
INNER JOIN info_produtos ip ON p.id_produto = ip.id_produto;

SELECT
   p.id_pedido,
   p.quantidade,
   c.nome,
   c.email
FROM 
   pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

SELECT
   p.id_pedido,
   p.quantidade,
   NULL AS data,
   c.nome AS nome_cliente,
   c.email,
   f.nome AS nome_funcionario
FROM
   pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
LIMIT 0, 1000;

SHOW COLUMNS FROM pedidos;
SELECT quantidade, id_pedido, data_pedido FROM pedidos;

SELECT nome, email FROM clientes;

SELECT nome FROM funcionarios;

SELECT nome, preco FROM produtos;


SHOW COLUMNS FROM pedidos;
SELECT 
    p.id_pedido AS id_pedido,
    p.quantidade,
    p.data_pedido,
    c.nome AS clientes_nome,
    c.email AS cliente_email,
    f.nome AS funcionario_nome,
    pr.nome AS produto_nome,
    pr.preco AS produto_preco
FROM
    pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN produtos pr ON p.id_produto = pr.id_produto;

SELECT 
    c.nome AS nome_cliente,
    p.id_pedido,
    p.data_pedido,
    p.quantidade,
    p.status
FROM
    clientes c
JOIN
   pedidos p ON c.id_cliente = p.id_cliente
WHERE 
   p.status = 'Pendente'
ORDER BY
   p.id_pedido DESC;

SELECT
   c.id_cliente,
   c.nome, 
   c.email
FROM 
   clientes c
LEFT JOIN 
   pedidos p ON c.id_cliente = p.id_cliente
WHERE 
   p.id_cliente IS NULL;
   
SELECT
   c.nome AS nome_cliente,
   COUNT(p.id_pedido) AS total_pedidos
FROM 
   clientes c
LEFT JOIN
   pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
   c.id_cliente, c.nome
ORDER BY
   total_pedidos DESC;
   
SELECT
   p.id_pedido,
   (p.quantidade * pr.preco) AS preco_total
FROM
   pedidos p
JOIN 
   produtos pr ON p.id_produto = pr.id_produto
ORDER BY
   p.id_pedido;

SHOW COLUMNS FROM pedidos;
CREATE VIEW resumo_pedido AS
SELECT
   p.id_pedido AS id_pedido,
   p.quantidade,
   p.data_pedido AS data_pedido,
   c.nome AS nome_cliente,
   c.email AS email_cliente,
   f.nome AS nome_funcionario,
   pr.nome AS preco_unitario,
   (p.quantidade * pr.preco) AS valor_total
FROM
   pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN produtos pr ON  p.id_produto = pr.id_produto;

SELECT
   id_pedido,
   nome_cliente,
   valor_total
FROM 
   resumo_pedido
ORDER BY
   id_pedido;
   
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT 
   p.id_pedido AS id_pedido,
   p.quantidade,
   p.data_pedido AS data_pedido,
   c.nome AS nome_cliente,
   c.email AS email_cliente,
   f.nome AS nome_funcionario,
   pr.nome AS preco_unitario,
   (p.quantidade * pr.preco) AS total
FROM
   pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN produtos pr ON p.id_produto = pr.id_produto;

SELECT 
    id_pedido,
    nome_cliente,
    total AS valor_total
FROM
    resumo_pedido
ORDER BY
    id_pedido;

EXPLAIN
SELECT
   id_pedido,
   nome_cliente,
   total AS valor_total
FROM
   resumo_pedido
ORDER BY
   id_pedido;
   
DELIMITER $$

CREATE FUNCTION BuscaIngredientesProduto(id_prod INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT;

    SELECT ingredientes INTO resultado
    FROM info_produtos
    WHERE id_produto = id_prod;

    RETURN resultado;
END$$

DELIMITER ;

SELECT BuscaIngredientesProduto(10);

DELIMITER $$

CREATE FUNCTION mediaPedido(id_ped INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE valor_pedido DECIMAL(10,2);
    DECLARE media_total DECIMAL(10,2);
    DECLARE resultado VARCHAR(50);

    SELECT total INTO valor_pedido
    FROM pedidos
    WHERE id_pedido = id_ped;

    SELECT AVG(total) INTO media_total
    FROM pedidos;

    IF valor_pedido > media_total THEN
        SET resultado = 'Acima da média';
    ELSEIF valor_pedido < media_total THEN
        SET resultado = 'Abaixo da média';
    ELSE
        SET resultado = 'Igual à média';
    END IF;

    RETURN resultado;
END$$

DELIMITER ;

SELECT mediaPedido(5);

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    total DECIMAL(10,2)
);

INSERT INTO pedidos (id_pedido, total) VALUES
(1, 50.00),
(2, 80.00),
(3, 60.00),
(4, 70.00),
(5, 90.00);

SELECT mediaPedido(5);

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    total DECIMAL(10,2)
);

INSERT INTO pedidos (id_pedido, total) VALUES
(1, 50.00),
(2, 80.00),
(3, 60.00),
(4, 70.00),
(5, 90.00),
(6, 65.00);


SELECT mediaPedido(5);
SELECT mediaPedido(6);
DROP FUNCTION IF EXISTS mediaPedido;


