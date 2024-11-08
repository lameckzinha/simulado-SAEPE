-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS GerenciamentoTarefas;
USE GerenciamentoTarefas;

-- Criação da tabela de usuários
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Criação da tabela de tarefas
CREATE TABLE Tarefa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    prioridade ENUM('baixa', 'media', 'alta') NOT NULL,
    data_cadastro DATE NOT NULL,
    status ENUM('a fazer', 'fazendo', 'pronto') NOT NULL DEFAULT 'a fazer',
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id) ON DELETE CASCADE
);

-- Consultas e Views adicionais para ajudar no gerenciamento
-- Visualização das tarefas com detalhes do usuário associado
CREATE VIEW ViewTarefasUsuarios AS
SELECT 
    Tarefa.id AS TarefaID,
    Tarefa.descricao AS Descricao,
    Tarefa.setor AS Setor,
    Tarefa.prioridade AS Prioridade,
    Tarefa.data_cadastro AS DataCadastro,
    Tarefa.status AS Status,
    Usuario.nome AS NomeUsuario,
    Usuario.email AS EmailUsuario
FROM 
    Tarefa
JOIN 
    Usuario ON Tarefa.id_usuario = Usuario.id;

