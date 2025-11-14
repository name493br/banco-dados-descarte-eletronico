-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS plataforma_descarte_eletronico;
USE plataforma_descarte_eletronico;

-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT NOT NULL,
    data_nascimento DATE,
    prioridade BOOLEAN DEFAULT FALSE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de agendamentos
CREATE TABLE agendamentos (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_agendamento DATE NOT NULL,
    horario TIME NOT NULL,
    status ENUM('pendente', 'confirmado', 'cancelado', 'realizado') DEFAULT 'pendente',
    tipo_dispositivo VARCHAR(50),
    quantidade INT DEFAULT 1,
    observacoes TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Inserção de dados na tabela usuarios
INSERT INTO usuarios (nome, email, senha, telefone, endereco, data_nascimento, prioridade) VALUES
('Maria Silva Santos', 'maria.silva@email.com', '$2y$10$ABC123...', '(67) 99999-1111', 'Rua das Flores, 123 - Bairro Centro, Campo Grande-MS', '1955-08-20', TRUE),
('João Oliveira Souza', 'joao.oliveira@email.com', '$2y$10$DEF456...', '(67) 98888-2222', 'Av. Afonso Pena, 456 - Bairro Amambaí, Campo Grande-MS', '1980-03-15', FALSE),
('Ana Paula Costa', 'ana.costa@email.com', '$2y$10$GHI789...', '(67) 97777-3333', 'Rua 14 de Julho, 789 - Bairro Jardim dos Estados, Campo Grande-MS', '1992-11-30', FALSE);

-- Inserção de dados na tabela agendamentos
INSERT INTO agendamentos (id_usuario, data_agendamento, horario, status, tipo_dispositivo, quantidade, observacoes) VALUES
(1, '2025-09-25', '10:00:00', 'confirmado', 'Celular', 2, 'Dois smartphones antigos, um com tela quebrada'),
(2, '2025-09-26', '14:30:00', 'pendente', 'Notebook', 1, 'Laptop com problema na placa-mãe'),
(3, '2025-09-27', '09:00:00', 'confirmado', 'Tablet', 1, 'Tablet funcionando, mas ultrapassado');
