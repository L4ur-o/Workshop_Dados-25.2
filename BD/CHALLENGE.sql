CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE, -- PERMITINDO UM EMAIL POR CLIENTE
    cidade VARCHAR(50)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


-- Adição de dados
INSERT INTO Clientes VALUES
(1, 'João Motta', 'joaaommmo@gmail.com', 'São Paulo'),
(2, 'Gardinal Bio', 'gardinalbio@gmail.com', 'Rio de Janeiro'),
(3, 'Veruska Paiva', 'veve@gmail.com', 'Belo Horizonte'),
(4, 'João Pedro', 'joao.pedro@gmail.com', 'Curitiba'),
(5, 'Fabiola Leves', 'levesfabi@gmail.com', 'Porto Alegre'),
(6, 'Lucas Almeida', 'lucas.almeida@gmail.com', 'Salvador'),
(7, 'Juliana Rocha', 'juliana.rocha@hotmail.com', 'Recife'),
(8, 'Gabriel Martins', 'gabriel.martins@gmail.com', 'Manaus'),
(9, 'Paula Fernandes', 'paula.fernandes@gmail.com', 'Fortaleza'),
(10, 'Ricardo Oliveira', 'ricardo.oliveira@gmail.com', 'Brasília');


INSERT INTO Pedidos VALUES
(101, 1, DATE '2025-09-01', 150.75),
(102, 2, DATE '2025-09-02', 89.90),
(103, 3, DATE '2025-09-02', 230.50),
(104, 4, DATE '2025-09-03', 45.00),
(105, 5, DATE '2025-09-03', 310.20),
(106, 6, DATE '2025-09-04', 125.00),
(107, 7, DATE '2025-09-04', 98.40),
(108, 8, DATE '2025-09-05', 210.10),
(109, 9, DATE '2025-09-05', 72.90),
(110, 10, DATE '2025-09-05', 199.99);

-- ATT de dados da coluna Cliente
UPDATE Clientes
SET email = 'ruskaver@gmail.com'
WHERE id_cliente = 3;

-- Faz a procura e exibe todos os dados da tabela Clientes
SELECT *
FROM Clientes;

-- Dados estatísticos da tabela Pedidos
SELECT 
    SUM(valor_total) AS soma_pedidos,
    AVG(valor_total) AS media_pedidos,
    MAX(valor_total) AS maior_pedido
FROM Pedidos;

-- Exibe o total gasto por cidade
SELECT 
    c.cidade, 
    SUM(p.valor_total) AS total_cidade
FROM Clientes c
JOIN Pedidos p 
  ON c.id_cliente = p.id_cliente
GROUP BY c.cidade;

-- Trás um detalhamento dos pedidos com informações dos clientes
SELECT 
    c.nome, 
    c.cidade, 
    p.id_pedido, 
    p.valor_total
FROM Pedidos p
INNER JOIN Clientes c 
  ON p.id_cliente = c.id_cliente;


