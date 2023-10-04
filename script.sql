create schema gestao_admnistrativa;
create table alunos
(
	aluno_id integer primary key not null auto_increment,
    nome_aluno text not null,
    data_nascimento date,
    cpf varchar(20) not null,
    telefone_aluno varchar(25),
    email_aluno varchar(30),
    endereco varchar(50),
    nacionalidade text,
    sexo text,
    rg varchar(12) not null
);
create table professores
(
	professor_id integer primary key not null auto_increment,
    nome_professor text not null,
    cpf varchar(20) not null,
    data_contratacao date,
    sexo text,
    nacionalidade text,
    estado_civil text,
	email varchar(30),
    data_nascimento date,
    rg varchar(12) not null
);
create table disciplinas
(
	disciplina_id integer primary key not null auto_increment,
    nome_disciplina text not null,
    carga_horaria time,
    codigo_disciplina text
);
create table turmas
(
	turma_id integer primary key not null auto_increment,
    codigo_turma text not null,
    ano_escolar numeric,
    aluno_id integer,
    professor_id integer,
    disciplina_id integer,
    foreign key(aluno_id) references alunos(aluno_id),
    foreign key(professor_id) references professores(professor_id),
	foreign key(disciplina_id) references disciplinas(disciplina_id)
);
create table cursos
(
	curso_id integer primary key not null auto_increment,
    nome_curso text not null,
    tipo_curso text not null,
    data_inicio text,
    data_termino text,
    aluno_id integer,
    professor_id integer,
    disciplina_id integer,
    foreign key(aluno_id) references alunos(aluno_id),
    foreign key(professor_id) references professores(professor_id),
	foreign key(disciplina_id) references disciplinas(disciplina_id)
);
create table notas
(
	nota_id integer primary key not null auto_increment,
    data_avaliacao date,
    nota numeric not null,
    status_aluno text not null,
    aluno_id integer,
    disciplina_id integer,
    foreign key(aluno_id) references alunos(aluno_id),
    foreign key(disciplina_id) references disciplinas(disciplina_id)
);
create table presenca
(
	presenca_id integer primary key not null auto_increment,
    data_aula date,
    presenca text not null,
    aluno_id integer,
    turma_id integer,
    foreign key(aluno_id) references alunos(aluno_id),
    foreign key(turma_id) references turmas(turma_id)
);
create table matriculas
(
	matricula_id integer primary key not null auto_increment,
    data_matricula date,
	codigo_matricula text,
    valor_matricula varchar(8),
    aluno_id integer,
    foreign key(aluno_id) references alunos(aluno_id)
);
create table eventos
(
	evento_id integer primary key not null auto_increment,
    data_evento date not null,
    nome_evento text not null,
    curso_id integer,
    foreign key(curso_id) references cursos(curso_id)
);
create table material_didatico
(
	material_didatico_id integer primary key not null auto_increment,
	valor numeric not null,
    disciplina_id integer,
    foreign key(disciplina_id) references disciplinas(disciplina_id)
);
insert into alunos(aluno_id,nome_aluno,data_nascimento,cpf,telefone_aluno,email_aluno,endereco,nacionalidade,sexo,rg)
values
(1,'José Alberto Costa','1999-08-13','876.999.693-83','+55 (16) 92911-8422','costinhalberto@gmail.com','Costela, Rua do Costinha, 89','Brasileiro','Masculino','16.905.737-9'),
(2,'Luis Becker Pinto','2001-01-01','271.987.568-67','+55 (13) 92537-4288','luisinhopraiano@gmail.com','Vila Belmiro, Rua Pelé, 10','Ítalo-brasileiro','Masculino','30.478.374-2'),
(3,'Laura Silva','1998-06-26','918.969.378-70','+55 (15) 92938-7819','laurinha@gmail.com','Perdizes, Rua dos Abreus, 299','Brasileira','Feminino','48.487.046-4')

insert into professores(professor_id,nome_professor,cpf,data_contratacao,sexo,nacionalidade,estado_civil,email,data_nascimento,rg) 
values
(1,'Márcio Ribeiro Junior', '033.016.808-87', '2023-10-03','masculino','brasileiro', 'casado','marcoladazn@yahoo.com','1978-04-05', '17.483.422-6'),
(2, 'Luisa Rodriguez', '236.255.548-87', '2010-11-22','feminino', 'brasileira', 'viúva', 'luisaviuva@gmail.com', '1968-12-25', '47.154.190-4'),
(3, 'Jamal Jackson', '624.630.051-06', '2015-09-14', 'masculino', 'canadense', 'solteiro','jamaljack@hotmail.com', '1970-03-10', '15.424.082-5');

insert into cursos(nome_curso,tipo_curso,data_inicio,data_termino)
values
('Pedagogia','Graduação','2023-10-04','2027-10-04'),
('Gestão Educional','Pós-Graduação','2023-10-04','2024-04-04'),
('Design de Sobrancelhas','Cursos Livres','2023-10-04','2023-10-06'),
('Iniciação à Costura','Workshop - Formação Continuada','2023-10-04','2023-10-05');

insert into disciplinas(nome_disciplina,carga_horaria,codigo_disciplina)
values
('Fundamentos da Educação','100:00:00','FDE100'),
('Gestão Pedagógica','80:10:00','GP80'),
('Micropigmentação','02:00:00','MP02'),
('Overlock','01:00:00','OVL01');

insert into turmas(codigo_turma,ano_escolar)
values
('PDG01',2023),
('PDG02',2023),
('GED01',2023),
('GED02',2023),
('DGS01',2023),
('IAC01',2023);

insert into alunos(aluno_id,nome_aluno,data_nascimento,cpf,telefone_aluno,email_aluno,endereco,nacionalidade,sexo,rg)
values
(4,'Juliana Garibaldo','1997-08-09','391.088.888-76','+55 (14) 93951-3618','garibaldoju@outlook.com','Pereira, Rua Júlia Silva, 26','Brasileira','Feminino','37.985.566-5');

insert into professores(professor_id,nome_professor,cpf,data_contratacao,sexo,nacionalidade,estado_civil,email,data_nascimento,rg) 
values
(4,'Genivaldo Mbappé','378.319.204-80','2002-12-06','Masculino','Brasileiro','Solteiro','gbappe@gmail.com','1980-02-28','17.317.144-8');

insert into notas(data_avaliacao,nota,status_aluno)
values
('2023-04-10',100,'APROVADO'),
('2023-04-10',45,'REPROVADO'),
('2023-04-10',60,'EXAME'),
('2023-04-10',85,'APROVADO');

INSert into presenca(data_aula,presenca)
values
('2023-05-11','PRESENTE'),
('2023-05-11','AUSENTE'),
('2023-05-11','PRESENTE'),
('2023-05-11','AUSENTE');

INSERT into matriculas(data_matricula,codigo_matricula,valor_matricula)
values
('2023-03-08','5980','Bolsista'),
('2023-03-05','5686','R$930,00'),
('2023-04-10','2165','R$99,99'),
('2023-04-10','5437','Gratuito');

insert into material_didatico(valor)
values
(600),
(200),
(50),
(10);

INSERT INTO eventos(data_evento,nome_evento)
values
('2027-10-04','Formatura do curso de pedagogia'),
('2023-12-01','Palestra sobre sedentarismo'),
('2023-10-10','Apresentação de TCC'),
('2023-10-30','Congresso');