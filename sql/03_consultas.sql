
--1
SELECT *
FROM Paciente
WHERE data_nascimento > '1990-01-01'
ORDER BY nome ASC;

--2
SELECT *
FROM Consulta
WHERE status = 'Agendada'
   OR status = 'Realizada'
ORDER BY data_hora_inicio DESC;

--3
SELECT *
FROM Procedimento
WHERE valor_base >= 100
  AND valor_base <= 200
ORDER BY valor_base DESC
LIMIT 5;


--4
SELECT
    c.id_consulta,
    p.nome AS paciente,
    pr.nome AS profissional,
    c.data_hora_inicio,
    c.status
FROM Consulta c
INNER JOIN Paciente p
    ON c.id_paciente = p.id_paciente
INNER JOIN Profissional pr
    ON c.id_profissional = pr.id_profissional
ORDER BY c.data_hora_inicio;


--5
SELECT
    c.id_consulta,
    p.nome AS paciente,
    pr.nome AS profissional,
    e.nome AS especialidade,
    s.nome AS sala,
    c.data_hora_inicio,
    c.status
FROM Consulta c
INNER JOIN Paciente p
    ON c.id_paciente = p.id_paciente
INNER JOIN Profissional pr
    ON c.id_profissional = pr.id_profissional
INNER JOIN Especialidade e
    ON c.id_especialidade = e.id_especialidade
INNER JOIN Sala s
    ON c.id_sala = s.id_sala
ORDER BY c.data_hora_inicio;


--6
SELECT
    pr.id_profissional,
    pr.nome AS profissional,
    c.id_consulta,
    c.data_hora_inicio,
    c.status
FROM Profissional pr
LEFT JOIN Consulta c
    ON pr.id_profissional = c.id_profissional
ORDER BY pr.nome;


--7
SELECT
    pr.nome AS profissional,
    COUNT(c.id_consulta) AS total_consultas
FROM Profissional pr
LEFT JOIN Consulta c
    ON pr.id_profissional = c.id_profissional
GROUP BY pr.id_profissional, pr.nome
ORDER BY total_consultas DESC;


--8
SELECT
    pr.nome AS profissional,
    COUNT(c.id_consulta) AS total_consultas
FROM Profissional pr
INNER JOIN Consulta c
    ON pr.id_profissional = c.id_profissional
GROUP BY pr.id_profissional, pr.nome
HAVING COUNT(c.id_consulta) > 1
ORDER BY total_consultas DESC;


--9
SELECT
    nome,
    valor_base
FROM Procedimento
WHERE valor_base > (
    SELECT AVG(valor_base)
    FROM Procedimento
)
ORDER BY valor_base DESC;


--10
SELECT
    nome,
    cpf,
    telefone
FROM Paciente
WHERE id_paciente IN (
    SELECT id_paciente
    FROM Consulta
    WHERE status = 'Realizada'
)
ORDER BY nome;


--11
SELECT
    c.id_consulta,
    p.nome AS paciente,
    SUM(cp.quantidade * cp.valor_cobrado) AS valor_total
FROM Consulta c
INNER JOIN Paciente p
    ON c.id_paciente = p.id_paciente
INNER JOIN Consulta_Procedimento cp
    ON c.id_consulta = cp.id_consulta
WHERE c.status = 'Realizada'
GROUP BY c.id_consulta, p.nome
ORDER BY valor_total DESC;


--12
SELECT
    e.nome AS especialidade,
    COUNT(c.id_consulta) AS total_consultas
FROM Especialidade e
LEFT JOIN Consulta c
    ON e.id_especialidade = c.id_especialidade
   AND c.status = 'Realizada'
GROUP BY e.id_especialidade, e.nome
ORDER BY total_consultas DESC;
