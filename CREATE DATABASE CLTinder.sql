CREATE DATABASE cltinder;
USE cltinder;

-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('profissional','empresa') NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de habilidades
CREATE TABLE habilidades (
    id_habilidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_habilidade VARCHAR(100) NOT NULL UNIQUE
);

-- Relacionamento N:N entre usuários e habilidades
CREATE TABLE usuario_habilidade (
    id_usuario INT,
    id_habilidade INT,
    PRIMARY KEY (id_usuario, id_habilidade),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,
    FOREIGN KEY (id_habilidade)
        REFERENCES habilidades(id_habilidade)
        ON DELETE CASCADE
);

-- Tabela de vagas
CREATE TABLE vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empresa)
        REFERENCES usuarios(id_usuario)
);

-- Tabela de matches
CREATE TABLE matches (
    id_match INT AUTO_INCREMENT PRIMARY KEY,
    id_profissional INT NOT NULL,
    id_vaga INT NOT NULL,
    score_compatibilidade DECIMAL(4,2),
    data_match TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_profissional)
        REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_vaga)
        REFERENCES vagas(id_vaga)
);