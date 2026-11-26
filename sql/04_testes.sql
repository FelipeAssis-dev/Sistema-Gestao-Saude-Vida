-- 1
INSERT INTO Paciente (nome, cpf, email, telefone, data_nascimento)
VALUES ('Mariana Costa', '12345678910', 'mariana@email.com',
        '34999999999', '2000-05-15');

SELECT *
FROM Paciente
WHERE cpf = '12345678910';


-- 2
UPDATE Paciente
SET telefone = '34988888888'
WHERE cpf = '12345678910';


SELECT nome, telefone
FROM Paciente
WHERE cpf = '12345678910';


-- 3
BEGIN;

DELETE FROM Paciente
WHERE cpf = '12345678910';

SELECT *
FROM Paciente
WHERE cpf = '12345678910';

ROLLBACK;


SELECT *
FROM Paciente
WHERE cpf = '12345678910';


-- 4
BEGIN;

INSERT INTO Consulta (
    data_hora_inicio, data_hora_fim, status, observacoes,
    id_paciente, id_profissional, id_sala, id_especialidade
)
VALUES (
    '2026-12-10 10:00:00',
    '2026-12-10 11:00:00',
    'Agendada',
    'Teste de integridade',
    999999,
    1,
    1,
    1
);

ROLLBACK;


-- 5
BEGIN;

INSERT INTO Procedimento (nome, descricao, valor_base)
VALUES ('Teste', 'Procedimento inválido', -50.00);

ROLLBACK;



BEGIN;

INSERT INTO Consulta_Procedimento (
    id_consulta, id_procedimento, quantidade, valor_cobrado
)
VALUES (1, 1, 0, 100.00);

ROLLBACK;



BEGIN;

INSERT INTO Consulta_Procedimento (
    id_consulta, id_procedimento, quantidade, valor_cobrado
)
VALUES (1, 1, 1, -100.00);

ROLLBACK;



BEGIN;

INSERT INTO Consulta (
    data_hora_inicio, data_hora_fim, status, observacoes,
    id_paciente, id_profissional, id_sala, id_especialidade
)
VALUES (
    '2026-12-10 11:00:00',
    '2026-12-10 10:00:00',
    'Agendada',
    'Teste de datas',
    1,
    1,
    1,
    1
);

ROLLBACK;




BEGIN;

INSERT INTO Consulta (
    data_hora_inicio, data_hora_fim, status, observacoes,
    id_paciente, id_profissional, id_sala, id_especialidade
)
VALUES (
    '2026-12-10 10:00:00',
    '2026-12-10 11:00:00',
    'Pendente',
    'Teste de status',
    1,
    1,
    1,
    1
);

ROLLBACK;


-- 6
SELECT * FROM Paciente;
SELECT * FROM Consulta;
SELECT * FROM Procedimento;
SELECT * FROM Consulta_Procedimento;