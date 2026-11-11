# Sistema de Clínica Médica — Saúde & Vida
**Projeto Final — Disciplina de Banco de Dados**  
**Instituto Federal do Triângulo Mineiro (IFTM) — Campus Uberlândia Centro**  
**Curso:** Tecnologia em Sistemas para Internet  
**Professor:** Gustavo Prado  
**Alunos:** Luanny Victoria, Felipe Alcantara  

---

## 🏥 1. Contextualização do Problema

A **Saúde & Vida** é uma clínica médica que está em processo de transição de uma operação de pequeno/médio porte para uma estrutura física e organizacional mais robusta. Com essa expansão, surgiu a necessidade de implementar um sistema completo que atenda às demandas de profissionais e administradores, incluindo:
* Quantificação de consultas realizadas por profissional;
* Gestão e organização da agenda de pacientes;
* Mensuração do volume de atendimentos por especialidade;
* Otimização da alocação de salas e recursos clínicos.

Anteriormente, esses processos eram geridos de forma manual, com agendas físicas de papel, pastas e planilhas descentralizadas — modelo que se tornou inviável com a nova escala da organização. O banco de dados foi concebido para centralizar e padronizar as informações cadastrais e operacionais, assegurando integridade transacional, rastreabilidade clínica e suporte a consultas analíticas estruturadas.

---

## 📋 2. Requisitos Funcionais (RF)

| ID | Requisito Funcional | Descrição |
| :---: | :--- | :--- |
| **RF01** | Cadastrar novos pacientes | O sistema deve permitir registrar, atualizar e consultar os dados cadastrais e de contato dos pacientes (nome, CPF, data de nascimento, telefone, endereço). |
| **RF02** | Cadastrar novos Profissionais e Especialidades | O sistema deve registrar médicos e profissionais de saúde, vinculando-os a uma ou mais especialidades homologadas na clínica. |
| **RF03** | Gerenciar salas de atendimento | O sistema deve permitir o cadastro, a identificação física e o controle da capacidade/tipo das salas de consulta e exames. |
| **RF04** | Criar nova consulta | O sistema deve registrar um agendamento vinculando paciente, profissional responsável, sala designada, data, horário e status inicial. |
| **RF05** | Remarcar ou cancelar consulta | O sistema deve permitir atualizar a data, hora ou sala de um agendamento, ou alterar seu status para "Cancelada" mediante registro da justificativa. |
| **RF06** | Emitir histórico de consultas e procedimentos do paciente | O sistema deve recuperar o histórico detalhado de atendimentos de um paciente específico, listando datas, profissionais responsáveis e procedimentos realizados. |
| **RF07** | Cadastrar catálogo de procedimentos | O sistema deve permitir registrar os procedimentos clínicos e exames oferecidos pela clínica, contendo nome, descrição técnica e valor padrão de tabela. |
| **RF08** | Registrar procedimentos realizados na consulta | O sistema deve permitir associar um ou mais procedimentos do catálogo à consulta realizada, armazenando a quantidade aplicada e o valor efetivamente cobrado. |
| **RF09** | Gerenciar agenda dos profissionais | O sistema deve exibir a grade horária e a escala de disponibilidade de cada profissional, listando seus compromissos e horários vagos por período. |
| **RF10** | Monitorar ocupação e disponibilidade de salas | O sistema deve fornecer a listagem de horários e ocupação de cada sala de atendimento, evitando conflitos e permitindo visualizar horários livres para novos agendamentos. |

---

## ⚖️ 3. Regras de Negócio (RN)

* **RN01 (Vínculo de Paciente):** Toda consulta deve, obrigatoriamente, estar associada a um paciente previamente cadastrado.
* **RN02 (Vínculo de Profissional):** Toda consulta deve, obrigatoriamente, conter um profissional de saúde responsável pelo atendimento.
* **RN03 (Conflito de Horário do Profissional):** Um profissional não pode ter mais de uma consulta agendada no mesmo horário.
* **RN04 (Conflito de Ocupação de Sala):** Nenhuma sala física pode receber mais de uma consulta simultânea (sem sobreposição de data e hora), considerando a duração estimada do atendimento.
* **RN05 (Especialidades do Profissional):** Todo profissional deve possuir ao menos uma especialidade vinculada ao seu cadastro, podendo atuar em múltiplas especialidades.
* **RN06 (Vínculo e Agendamento de Procedimentos):** Todo procedimento clínico executado deve estar vinculado a uma consulta, podendo cada atendimento conter zero, um ou múltiplos procedimentos associados.
* **RN07 (Histórico de Preço de Procedimentos):** O valor praticado no procedimento registrado na consulta deve ser armazenado historicamente, garantindo que reajustes na tabela de preços padrão não alterem o faturamento de atendimentos passados.
* **RN08 (Fluxo de Status da Consulta):** Toda consulta recém-criada assume por padrão o status "Agendada", podendo transitar para "Confirmada", "Realizada" ou "Cancelada".
* **RN09 (Finalização da Consulta):** A alteração do status da consulta para "Realizada" requer a confirmação do profissional responsável pelo atendimento.
* **RN10 (Imutabilidade de Atendimento Concluído):** Consultas com status "Realizada" tornam-se imutáveis no sistema, não permitindo alterações em atributos como data, horário, sala, profissional ou procedimentos já registrados.
* **RN11 (Unicidade Cadastral):** Pacientes e profissionais devem possuir registros únicos no sistema, garantidos pela obrigatoriedade e unicidade de seus documentos civis (CPF para pacientes e registro no conselho de classe/CRM para profissionais).

---

## 🗄️ 4. Lista Preliminar de Entidades, Atributos e Relacionamentos

### Entidades Principais
* **Paciente:** nome, CPF, email, telefone, data de nascimento.
* **Profissional:** n° registro, nome, email, telefone, situação.
* **Especialidade:** nome, descrição.
* **Sala:** nome, andar, tipo, situação.
* **Procedimento:** nome, descrição, valor base.
* **Consulta:** código, data/hora de início, data/hora de fim, status, observações.

### Entidades Associativas
* **Profissional_Especialidade:** Origem `Profissional (N:N) Especialidade` (sem atributos próprios).
* **Consulta_Procedimento:** Origem `Consulta (N:N) Procedimento` (atributos: `quantidade`, `valor cobrado`).

### Relacionamentos Identificados
* Profissional atua em Especialidade: **N:N**
* Paciente realiza Consulta: **1:N**
* Profissional atende Consulta: **1:N**
* Sala abriga Consulta: **1:N**
* Especialidade classifica Consulta: **1:N**
* Consulta envolve Procedimento: **N:N**

---

## ❓ 5. Perguntas que o Banco Deverá Responder (Consultas SQL)

| ID | Pergunta | Entidades Envolvidas | Técnica SQL Prevista |
| :---: | :--- | :--- | :--- |
| **P01** | Quais profissionais realizaram mais consultas? | Profissional, Consulta | `JOIN`, `COUNT`, `GROUP BY`, `ORDER BY` |
| **P02** | Quais pacientes possuem consultas agendadas? | Paciente, Consulta, Profissional, Sala, Procedimento, Especialidade | `JOIN` múltiplo, `WHERE` |
| **P03** | Quantas consultas ocorreram por especialidade? | Consulta, Especialidade | `LEFT JOIN`, `COUNT`, `GROUP BY` |
| **P04** | Quais procedimentos foram realizados em cada consulta e qual o valor total cobrado? | Procedimento, Consulta, Consulta_Procedimento, Paciente | `JOIN`, `STRING_AGG`, `SUM` |
| **P05** | Quais salas tiveram mais consultas e qual o percentual de utilização de cada uma? | Sala, Consulta | `JOIN`, `COUNT`, janela ou subconsulta |
