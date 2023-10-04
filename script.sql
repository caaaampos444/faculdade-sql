create schema instituicao_sql;

use instituicao_sql;

CREATE TABLE Alunos (
    aluno_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_aluno TEXT NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR(20) NOT NULL,
    telefone_aluno VARCHAR(25),
    email_aluno VARCHAR(30),
    endereco VARCHAR(50),
    nacionalidade TEXT,
    sexo TEXT,
    rg VARCHAR(12) NOT NULL
);

-- Tabela Professores
CREATE TABLE Professores (
    professor_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_professor TEXT NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    data_contratacao DATE,
    sexo TEXT,
    nacionalidade TEXT,
    estado_civil TEXT,
    email VARCHAR(30),
    data_nascimento DATE,
    rg VARCHAR(12) NOT NULL
);

-- Tabela Cursos
CREATE TABLE Cursos (
    curso_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_curso TEXT NOT NULL,
    tipo_curso TEXT NOT NULL,
    data_inicio DATE,
    data_termino DATE
);

CREATE TABLE Disciplinas (
    disciplina_id INTEGER PRIMARY KEY,
    nome_disciplina TEXT NOT NULL,
    carga_horaria TIME,
    codigo_disciplina TEXT
);

CREATE TABLE Turmas (
    turma_id INTEGER PRIMARY KEY,
    codigo_turma TEXT NOT NULL,
    ano_escolar NUMERIC
);

CREATE TABLE Notas (
    nota_id INTEGER PRIMARY KEY,
    data_avaliacao DATE,
    nota NUMERIC NOT NULL,
    status_aluno TEXT NOT NULL,
    aluno_id INTEGER,
    disciplina_id INTEGER,
    FOREIGN KEY(aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY(disciplina_id) REFERENCES Disciplinas(disciplina_id)
);

CREATE TABLE Presenca (
    presenca_id INTEGER PRIMARY KEY,
    data_aula DATE,
    presenca TEXT NOT NULL,
    aluno_id INTEGER,
    turma_id INTEGER,
    FOREIGN KEY(aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY(turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Matriculas (
    matricula_id INTEGER PRIMARY KEY,
    data_matricula DATE,
    codigo_matricula TEXT,
    valor_matricula VARCHAR(8),
    aluno_id INTEGER,
    FOREIGN KEY(aluno_id) REFERENCES Alunos(aluno_id)
);

CREATE TABLE MaterialDidatico (
    material_didatico_id INTEGER PRIMARY KEY,
    valor NUMERIC NOT NULL,
    disciplina_id INTEGER,
    FOREIGN KEY(disciplina_id) REFERENCES Disciplinas(disciplina_id)
);

CREATE TABLE Eventos (
    evento_id INTEGER PRIMARY KEY,
    data_evento DATE NOT NULL,
    nome_evento TEXT NOT NULL,
    curso_id INTEGER,
    FOREIGN KEY(curso_id) REFERENCES Cursos(curso_id)
);


INSERT INTO Alunos (aluno_id, nome_aluno, data_nascimento, cpf, telefone_aluno, email_aluno, endereco, nacionalidade, sexo, rg)
VALUES
(1,'José Alberto Costa','1999-08-13','876.999.693-83','+55 (16) 92911-8422','costinhalberto@gmail.com','Costela, Rua do Costinha, 89','Brasileiro','Masculino','16.905.737-9'),
(2,'Luis Becker Pinto','2001-01-01','271.987.568-67','+55 (13) 92537-4288','luisinhopraiano@gmail.com','Vila Belmiro, Rua Pelé, 10','Ítalo-brasileiro','Masculino','30.478.374-2'),
(3,'Laura Silva','1998-06-26','918.969.378-70','+55 (15) 92938-7819','laurinha@gmail.com','Perdizes, Rua dos Abreus, 299','Brasileira','Feminino','48.487.046-4'),
(4,'Juliana Garibaldo','1997-08-09','391.088.888-76','+55 (14) 93951-3618','garibaldoju@outlook.com','Pereira, Rua Júlia Silva, 26','Brasileira','Feminino','37.985.566-5');

-- Inserir dados na tabela Professores
INSERT INTO Professores (professor_id, nome_professor, cpf, data_contratacao, sexo, nacionalidade, estado_civil, email, data_nascimento, rg)
VALUES
(1,'Márcio Ribeiro Junior', '033.016.808-87', '2023-10-03','masculino','brasileiro', 'casado','marcoladazn@yahoo.com','1978-04-05', '17.483.422-6'),
(2, 'Luisa Rodriguez', '236.255.548-87', '2010-11-22','feminino', 'brasileira', 'viúva', 'luisaviuva@gmail.com', '1968-12-25', '47.154.190-4'),
(3, 'Jamal Jackson', '624.630.051-06', '2015-09-14', 'masculino', 'canadense', 'solteiro','jamaljack@hotmail.com', '1970-03-10', '15.424.082-5'),
(4,'Genivaldo Mbappé','378.319.204-80','2002-12-06','Masculino','Brasileiro','Solteiro','gbappe@gmail.com','1980-02-28','17.317.144-8');

-- Inserir dados na tabela Cursos
INSERT INTO Cursos (nome_curso, tipo_curso, data_inicio, data_termino)
VALUES
('Pedagogia','Graduação','2023-10-04','2027-10-04'),
('Gestão Educional','Pós-Graduação','2023-10-04','2024-04-04'),
('Design de Sobrancelhas','Cursos Livres','2023-10-04','2023-10-06'),
('Iniciação à Costura','Workshop - Formação Continuada','2023-10-04','2023-10-05');

-- Inserir dados na tabela Disciplinas
INSERT INTO Disciplinas (disciplina_id,nome_disciplina, carga_horaria, codigo_disciplina)
VALUES
('1','Fundamentos da Educação','100:00:00','FDE100'),
('2','Gestão Pedagógica','80:10:00','GP80'),
('3','Micropigmentação','02:00:00','MP02'),
('4','Overlock','01:00:00','OVL01');

-- Inserir dados na tabela Turmas
INSERT INTO Turmas (turma_id,codigo_turma, ano_escolar)
VALUES
('1','PDG01',2023),
('2','PDG02',2023),
('3','GED01',2023),
('4','GED02',2023),
('5','DGS01',2023),
('6','IAC01',2023);

-- Inserir dados na tabela Notas
INSERT INTO Notas (nota_id,data_avaliacao, nota, status_aluno, aluno_id, disciplina_id)
VALUES
('1','2023-04-10',100,'APROVADO',1,1),
('2','2023-04-10',45,'REPROVADO',2,1),
('3','2023-04-10',60,'EXAME',3,1),
('4','2023-04-10',85,'APROVADO',4,1);

-- Inserir dados na tabela Presença
INSERT INTO Presenca (presenca_id,data_aula, presenca, aluno_id, turma_id)
VALUES
('1','2023-05-11','PRESENTE',1,1),
('2','2023-05-11','AUSENTE',2,1),
('3','2023-05-11','PRESENTE',3,1),
('4','2023-05-11','AUSENTE',4,1);

-- Inserir dados na tabela Matriculas
INSERT INTO Matriculas (matricula_id,data_matricula, codigo_matricula, valor_matricula, aluno_id)
VALUES
('1','2023-03-08','5980','Bolsista',1),
('2','2023-03-05','5686','R$930,00',2),
('3','2023-04-10','2165','R$99,99',3),
('4','2023-04-10','5437','Gratuito',4);

-- Inserir dados na tabela MaterialDidatico
INSERT INTO MaterialDidatico (material_didatico_id,valor, disciplina_id)
VALUES
('1',600, 1),
('2',200, 2),
('3',50, 3),
('4',10, 4);

-- Inserir dados na tabela Eventos
INSERT INTO Eventos (evento_id,data_evento, nome_evento, curso_id)
VALUES
('1','2027-10-04','Formatura do curso de pedagogia',1),
('2','2023-12-01','Palestra sobre sedentarismo',NULL),
('3','2023-10-10','Apresentação de TCC',NULL),
('4','2023-10-30','Congresso',NULL);

-- essa consulta mostra o nome dos alunos, a nota, o status do aluno 
-- mostrando o desempenho do aluno e o seu relatorio escolar 
SELECT a.nome_aluno, n.nota, n.status_aluno
FROM Alunos a
JOIN Notas n ON a.aluno_id = n.aluno_id
JOIN Disciplinas d ON n.disciplina_id = d.disciplina_id;


-- essa consulta mostra a agenda de eventos
select nome_evento, data_evento
from eventos;

-- essa consulta mostra o registro de frequência 
select presenca.presenca, alunos.nome_aluno
from presenca
join alunos on presenca.aluno_id = alunos.aluno_id;


-- essa consulta mostra a gestão de matrícula, mostrando a data que a matricula foi feita, o valor, o rm do aluno e o nome do aluno
select matriculas.data_matricula, matriculas.codigo_matricula,matriculas.valor_matricula,alunos.nome_aluno
from matriculas
join alunos on matriculas.aluno_id = alunos.aluno_id;







