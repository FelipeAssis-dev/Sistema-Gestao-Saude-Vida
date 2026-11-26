
INSERT INTO Paciente
(nome, cpf, email, telefone, data_nascimento)
VALUES
('Ana Clara Martins', '12345678902', 'ana@email.com', '34999910001', '1998-04-12'),
('Mariana Costa', '12345678903', 'mariana@email.com', '34999910002', '2001-02-15');

INSERT INTO Paciente
(nome, cpf, email, telefone, data_nascimento)
VALUES
('Lucas Oliveira', '12345678904', 'lucas@email.com', '34999910003', '1975-11-30'),
('Beatriz Santos', '12345678905', 'beatriz@email.com', '34999910004', '1992-07-08'),
('Pedro Alves', '12345678906', 'pedro@email.com', '34999910005', '1968-03-19'),
('Camila Rodrigues', '12345678907', 'camila@email.com', '34999910006', '2003-12-05'),
('Gabriel Ferreira', '12345678908', 'gabriel@email.com', '34999910007', '1980-06-21'),
('Isabela Mendes', '12345678909', 'isabela@email.com', '34999910008', '1995-01-17');



INSERT INTO Profissional
(nome, crm, email, telefone, situacao)
VALUES
('Carlos Mendes', 'CRM12346', 'carlos@clinica.com', '34988810001', TRUE),
('Fernanda Lima', 'CRM12347', 'fernanda@clinica.com', '34988810002', TRUE);

INSERT INTO Profissional
(nome, crm, email, telefone, situacao)
VALUES
('Ricardo Alves', 'CRM12348', 'ricardo@clinica.com', '34988810003', TRUE),
('Patricia Rocha', 'CRM12349', 'patricia@clinica.com', '34988810004', TRUE);



INSERT INTO Especialidade
(nome, descricao)
VALUES
('Dermatologia', 'Tratamento de doencas da pele'),
('Pediatria', 'Atendimento medico infantil');

INSERT INTO Especialidade
(nome, descricao)
VALUES
('Ortopedia', 'Tratamento de problemas osseos e musculares'),
('Neurologia', 'Tratamento de doencas neurologicas');



INSERT INTO Sala
(nome, andar, tipo, situacao)
VALUES
('Sala 02', '1', 'Consulta', TRUE),
('Sala 03', '1', 'Exames', TRUE);

INSERT INTO Sala
(nome, andar, tipo, situacao)
VALUES
('Sala 04', '2', 'Consulta', TRUE),
('Sala 05', '2', 'Exames', FALSE);



INSERT INTO Procedimento
(nome, descricao, valor_base)
VALUES
('Consulta geral', 'Consulta medica de rotina', 150.00),
('Ecocardiograma', 'Exame de imagem do coracao', 280.00),
('Exame de sangue', 'Analise laboratorial', 80.00);

INSERT INTO Procedimento
(nome, descricao, valor_base)
VALUES
('Dermatoscopia', 'Exame detalhado da pele', 100.00),
('Raio X', 'Exame radiologico', 130.00),
('Ultrassonografia', 'Exame de imagem', 200.00);




INSERT INTO Profissional_Especialidade
(id_profissional, id_especialidade)
VALUES
(1, 2),
(2, 3),
(2, 1);

INSERT INTO Profissional_Especialidade
(id_profissional, id_especialidade)
VALUES
(3, 4),
(3, 5),
(4, 2);



INSERT INTO Consulta
(data_hora_inicio, data_hora_fim, status,
 observacoes, id_paciente, id_profissional,
 id_sala, id_especialidade)
VALUES
('2026-10-02 09:00:00', '2026-10-02 09:30:00',
 'Realizada', 'Consulta dermatologica', 2, 2, 2, 2),

('2026-10-05 10:00:00', '2026-10-05 10:40:00',
 'Realizada', 'Consulta pediatrica', 3, 2, 3, 3),

('2026-10-08 13:00:00', '2026-10-08 13:30:00',
 'Realizada', 'Avaliacao ortopedica', 4, 3, 4, 4),

('2026-10-12 14:00:00', '2026-10-12 14:30:00',
 'Realizada', 'Consulta neurologica', 5, 3, 2, 5),

('2026-10-15 08:00:00', '2026-10-15 08:30:00',
 'Cancelada', 'Paciente solicitou cancelamento', 6, 4, 3, 2),

('2026-10-18 09:00:00', '2026-10-18 09:30:00',
 'Cancelada', 'Imprevisto do paciente', 7, 4, 4, 2);


INSERT INTO Consulta
(data_hora_inicio, data_hora_fim, status,
 observacoes, id_paciente, id_profissional,
 id_sala, id_especialidade)
VALUES
('2026-11-26 10:00:00', '2026-11-26 10:30:00',
 'Agendada', 'Retorno medico', 8, 2, 2, 3),

('2026-11-27 13:00:00', '2026-11-27 13:40:00',
 'Agendada', 'Exame ortopedico', 9, 3, 3, 4),

('2026-12-02 14:00:00', '2026-12-02 14:30:00',
 'Agendada', 'Consulta cardiologica', 2, 1, 1, 1),

('2026-12-05 08:00:00', '2026-12-05 08:30:00',
 'Agendada', 'Consulta de rotina', 3, 1, 1, 1),

('2026-12-08 09:00:00', '2026-12-08 09:30:00',
 'Agendada', 'Avaliacao dermatologica', 4, 2, 2, 2),

('2026-12-10 10:00:00', '2026-12-10 10:30:00',
 'Agendada', 'Acompanhamento', 5, 3, 4, 4);



INSERT INTO Consulta_Procedimento
(id_consulta, id_procedimento, quantidade, valor_cobrado)
VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 120.00),
(2, 2, 1, 150.00),
(2, 5, 1, 100.00),
(3, 3, 1, 280.00),
(4, 1, 1, 150.00),
(4, 4, 1, 80.00),
(5, 1, 1, 150.00);


INSERT INTO Consulta_Procedimento
(id_consulta, id_procedimento, quantidade, valor_cobrado)
VALUES
(6, 6, 1, 130.00),
(7, 1, 1, 140.00),
(8, 3, 1, 280.00),
(9, 2, 1, 150.00),
(10, 4, 2, 80.00),
(11, 5, 1, 100.00),
(12, 6, 1, 130.00),
(1, 3, 1, 260.00);