-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
create database banco_museu;
use banco_museu;


CREATE TABLE autor (
cod_autor int PRIMARY KEY,
nacionalidade_autor char(3) not null,
nome_autor varchar(80) not null
);

CREATE TABLE salao (
cod_salao int PRIMARY KEY,
num_salao int not null,
andar_museu int not null,
salao varchar(80) not null
);

CREATE TABLE salao_obra (
salao_cod_salao int not null,
obra_cod_obra int not null,
posicao_salao varchar(80) not null,
FOREIGN KEY(salao_cod_salao) REFERENCES salao (cod_salao)
);

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int PRIMARY KEY,
tipo_funcionario varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

CREATE TABLE obra (
cod_obra int PRIMARY KEY,
ano_obra year not null,
titu_obra varchar(80) not null unique,
peso_obra decimal(10,2) null,
material_obra varchar(80) null,
desc_estilo_obra varchar(80) null,
cod_autor int not null,
cod_tipo_obra int not null,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor)
);

CREATE TABLE tipo_obra (
cod_tipo_obra int PRIMARY KEY,
desc_tipo_obra varchar(80) not null
);

CREATE TABLE atividade (
ob_cod_obra int not null,
func_id_funcionario int not null,
hora_entrada time not null,
hora_saida time not null,
data_atividade date not null,
FOREIGN KEY(ob_cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE manutencao (
mnt_obra int PRIMARY KEY,
data_termi_mnt date not null,
custo_mnt decimal(10,2) not null,
data_ini_mnt date not null,
desc_mnt varchar(80) not null,
cod_obra int not null,
func_id_funcionario int not null,
FOREIGN KEY(cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE materia_prima (
cod_mat_prima int PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE manu_mat (
Campo_1 int not null,
Campo_2 int not null,
qtd_mat_mnt varchar(15) not null,
FOREIGN KEY(Campo_1) REFERENCES manutencao (mnt_obra),
FOREIGN KEY(Campo_2) REFERENCES materia_prima (cod_mat_prima)
);

ALTER TABLE salao_obra ADD FOREIGN KEY(obra_cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);

insert into obra(ano_obra, titu_obra, desc_estilo_obra) values
(1949, "Estelar", "Figurativista"),
(1884, "Cena Orientalista", "Modernista"),
(1889, "O quarto em Arles", "Impressionista"),
(1929, "A traição das imagens", "Surrealista"),
(1939, "As duas Fridas", "Arte naïf"),
(1981, "Ironia do policial negro", "Neo-expressionista"),
(1511, "A Criação de Adão", "Renascentista"),
(1656, "As Meninas", "Barroca"),
(1638, "O Massacre dos Inocentes", "Renascentista"),
(1863, "Olympia", "Realista");

insert into obra(ano_obra, titu_obra, peso_obra, material_obra) VALUES
(1504, "David", 5000, "Mármore de Carrara"),
(1922, "Lincoln Memorial", 175000, "Mármore do Tennessee"),
(1996, "Spider", 10000, "Bronze e aço"),
(2000, "Baloon Dog", 1000, "Aço inoxidável"),

