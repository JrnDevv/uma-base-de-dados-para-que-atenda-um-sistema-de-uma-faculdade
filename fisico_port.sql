/*create database portofolio_Unifecaf
use database portofolio_Unifecaf;*/
create table tbl_aluno ( 
id int primary key not null auto_increment,
nome varchar(100) NOT NULL,
data_nascimento date NOT NULL,
Cpf varchar(18) NOT NULL,
Sexo enum ('M' , 'F') NOT NULL,
email varchar(100) not null,
nacionalidade varchar(20) DEFAULT 'BRASIL'

);

create table tbl_aluno_telefone (
id int primary key NOT NULL auto_increment,
telefone Varchar(20),
id_aluno int NOT NULL,
constraint FK_tbl_aluno_tbl_aluno_telefone
foreign key (id_aluno)
references tbl_aluno (id) ,
unique index (id)
);

create table endereco (
id int primary key NOT NULL auto_increment,
rua varchar(150) NOT NULL,
bairro varchar(100) NOT NULL,
cidade varchar(100) NOT NULL,
estado varchar(3) NOT NULL,
id_aluno int not null,
constraint FK_tbl_aluno_endereco
foreign key (id_aluno)
references tbl_aluno (Id),
unique index (id)
);


create table curso (
id int primary key auto_increment NOT NULL,
nome varchar(100) NOT NULL,
disciplina varchar(100) NOT NULL,
data_inicio DATE NOT NULL, 
data_fim  DATE NOT NULL,
 modalidade enum ( 'EAD' , 'presencial' , 'hibrido') NOT NULL,
id_aluno int not null,
constraint FK_tbl_aluno_curso
foreign key (id_aluno)
references tbl_aluno (Id),
unique index (id)
);

create table tbl_matricula(
id int primary key not null auto_increment,
data_matricula date NOT NULL,
curso varchar(100) NOT NULL,
modalidade ENUM('ead', 'presencial', 'hibrido') NOT NULL,
id_aluno int not null,
id_curso int not null,
constraint FK_tbl_aluno_tbl_matricula
foreign key (id_aluno)
references tbl_aluno (Id),
constraint FK_curso_tbl_matricula
foreign key (id_curso)
references curso (id)
);

create table  situacao_academica (
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
curso varchar(45) NOT NULL,
aluno varchar(100) NOT NULL,
data_matricula datetime NOT NULL,
data_conclusão datetime,
status ENUM('ativo', 'trancado', 'inativo') NOT NULL,
id_aluno int not null,
constraint FK_tbl_aluno_situacao_academica
foreign key (id_aluno)
references tbl_aluno (Id),
unique index (id)
);  
    
create table tbl_professor(
id int primary key not null auto_increment,
nome varchar(100) NOT NULL,
data_nascimento date NOT NULL,
data_admissao date NOT NULL,
turno ENUM('manhã', 'tarde', 'noite') NOT NULL,
cargo varchar(100)NOT NULL,
sexo ENUM('M', 'F')NOT NULL,
area_de_atuacao varchar(100) NOT NULL,
faixa_salarial int not null,
cpf varchar(18),
nacionalidade varchar(20) DEFAULT 'BRASIL'
);

create table professor_endereco (
id int primary key NOT NULL auto_increment,
rua varchar(150) NOT NULL,
bairro varchar(100) NOT NULL,
cidade varchar(100) NOT NULL,
estado varchar(3) NOT NULL,
nacionalidade varchar(60),
id_professor int not null,
constraint FK_tbl_aluno_tbl_professor
foreign key (id_professor)
references tbl_professor (Id),
unique index (id)
);  
    


create table horaio_professor(
id int primary key NOT NULL auto_increment,
dia_da_semana ENUM('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado') NOT NULL,
periodo ENUM('manhã', 'tarde', 'noite') NOT NULL,
horario time not null,
id_professor int not null,
constraint FK_tbl_horario_professor_tbl_professor
foreign key (id_professor)
references tbl_professor (Id),
unique index (id)
);

create table tbl_telefone_professor(
id int primary key Not null auto_increment,
telefone varchar(45) NOT NULL,
id_professor int not null,
constraint FK_tbl_telefone_professor_tbl_professor
foreign key (id_professor)
references tbl_professor (Id),
unique index (id)
);

create table tbl_disciplina(
id int primary key auto_increment NOT NULL,
nome varchar(100)NOT NULL,
carga_horaria time NOT NULL,
tipo_disciplina enum ('optativa' , 'obrigatoria' , 'eletiva') NOT NULL,
id_professor int not null,
constraint FK_tbl_disciplina_tbl_professor
foreign key (id_professor)
references tbl_professor (Id)

 );
 
 create table modalidade_disciplina(
 id int primary key not null auto_increment,
 tipo ENUM('EAD', 'Presencial', 'Híbrido'),
 id_disciplina int,
 constraint FK_modalidade_disciplina_tbl_disciplina 
 foreign key (id_tbl_disciplina)
 references tbl_disciplina (id)
 
 
 );

CREATE TABLE tbl_turma (
ID INT PRIMARY KEY NOT NULL auto_increment,
disciplinas varchar (100) NOT NULL,
curso varchar(100) NOT NULL,
TURNO ENUM('manhã', 'tarde', 'noite') NOT NULL,
Modalidade ENUM('Hibrido', 'Presencial', 'EAD') NOT NULL,
ano int NOT NULL,
semestre int NOT NULL,
id_curso int,
constraint Fk_curso_tbl_turma
foreign key (id_curso)
references curso (id),
unique index (id)

);

create table tbl_nota (
id int primary key auto_increment not null,
nota decimal (5,2),
data_avaliacao date,
id_aluno int,
id_disciplina int,
constraint FK_tbl_aluno_tbl_nota
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);

