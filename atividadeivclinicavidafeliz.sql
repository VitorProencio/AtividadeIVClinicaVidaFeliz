CREATE DATABASE AtividadeIVClinicaVidaFeliz

USE AtividadeIVClinicaVidaFeliz;

CREATE TABLE IF NOT EXISTS paciente (
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
nome varchar (255) NOT NULL,
CPF char (11) UNIQUE NOT NULL,
idade INT NOT NULL,
observacoes TEXT
);


CREATE TABLE IF NOT EXISTS agenda (
id_agenda INT AUTO_INCREMENT PRIMARY KEY,
horario TIME,
data DATE,
id_paciente INT NOT NULL,
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
UNIQUE (data, horario)
);


CREATE TABLE IF NOT EXISTS consulta (
id_consulta INT AUTO_INCREMENT PRIMARY KEY,
id_agenda INT UNIQUE NOT NULL,
FOREIGN KEY (id_agenda) REFERENCES agenda(id_agenda)
);


insert into paciente (nome, CPF, idade, observacoes)
values
('Rian Ferro', '12655689477', 23, 'diarreia aguda e queixa-se de desconforto na hemorroida'),
('Emauron Garcia', '12874396155', 22, 'apresenta desconforto com suor excessivo'),
('Lucas dos Reis', '12365782099', 24, 'problemas de locomocao e queixa de dor na perna'),
('Douglas Souza', '09365783022', 27, 'TDHA elevadissimo, busca receita de ritalina'),
('Erandi Junior', '12235689123', 28, 'retencao urinaria, queixa-se de dor ao urinar');


insert into agenda (id_paciente, data, horario)
values
(1, '2025-12-20', '14:00:00'),
(2, '2025-12-02', '10:30:00'),
(3, '2025-12-03', '09:00:00'),
(4, '2026-01-24', '17:00:00'),
(5, '2026-01-17', '15:00:00');


insert into consulta (id_agenda)
values
(1),
(2),
(3),
(4),
(5);

SELECT * FROM paciente;
SELECT * FROM agenda;
SELECT * FROM consulta;
SELECT nome, idade, observacoes FROM paciente;
SELECT * FROM paciente WHERE idade <= 24;
SELECT * FROM agenda ORDER BY data ASC;
SELECT * FROM agenda ORDER BY horario ASC;
SELECT * FROM paciente LIMIT 3;
SELECT * FROM agenda ORDER BY data ASC LIMIT 3;
SELECT 
	consulta.id_consulta,
    paciente.nome,
    paciente.observacoes,
    agenda.data,
    agenda.horario
FROM consulta
JOIN agenda ON consulta.id_agenda = agenda.id_agenda
JOIN paciente ON agenda.id_paciente = paciente.id_paciente
ORDER BY agenda.data ASC;

UPDATE paciente SET idade = 24 WHERE id_paciente = 2;
UPDATE paciente SET observacoes = 'diarreia aguda e queixa-se de desconforto na hemorroida (ligou dizendo que piorou)' WHERE CPF ='12655689477';
UPDATE agenda SET horario = '16:30:00' WHERE id_agenda = 4;

DELETE FROM consulta WHERE id_consulta = 4;
DELETE FROM agenda WHERE id_agenda = 4;
DELETE FROM paciente WHERE id_paciente = 4;