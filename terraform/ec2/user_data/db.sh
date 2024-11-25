#!/bin/bash
# Update package lists and install MySQL
sudo apt update -y
sudo apt install -y mysql-server

# Run MySQL secure installation (interactive)
sudo mysql_secure_installation

sudo sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Set up the database and tables
sudo mysql -e "CREATE DATABASE encomendas;"
sudo mysql -e "USE encomendas;

-- Table: clientes
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(200),
    endereco VARCHAR(200),
    hash_password VARCHAR(200) NOT NULL,
    status VARCHAR(36),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: produtos
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    preco FLOAT NOT NULL,
    descricao VARCHAR(200),
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(36)
);

-- Table: encomendas
CREATE TABLE encomendas (
    encomenda_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    descricao VARCHAR(200),
    valor_total FLOAT,
    status VARCHAR(36),
    localizacao_atual_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (localizacao_atual_id) REFERENCES encomendas_localizacoes(localizacao_id)
);

-- Table: encomendas_localizacoes
CREATE TABLE encomendas_localizacoes (
    localizacao_id INT AUTO_INCREMENT PRIMARY KEY,
    encomenda_id INT NOT NULL,
    localizacao VARCHAR(200) NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (encomenda_id) REFERENCES encomendas(encomenda_id)
);

-- Table: encomendas_produtos
CREATE TABLE encomendas_produtos (
    encomenda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (encomenda_id, produto_id),
    FOREIGN KEY (encomenda_id) REFERENCES encomendas(encomenda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

FLUSH PRIVILEGES;"

sudo systemctl enable mysql
sudo systemctl restart mysql