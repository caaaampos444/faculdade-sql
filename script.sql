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
