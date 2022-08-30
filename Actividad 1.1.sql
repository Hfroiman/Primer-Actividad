CREATE DATABASE ACT1
GO

USE ACT1
GO

Create table Carreras(
	ID varchar(4) not null unique,
	Nombre varchar(50) not null,
	Mail varchar(150)not null,
	Nivel varchar(50)not null check(Nivel='Diplomatura' or Nivel='Pregrado' or Nivel='Grado' or Nivel='Posgrado' )
)
alter table Carreras
add Fechacreacion date null check(Fechacreacion <=  GETDATE())
--Fecha de Creacion-- La fecha de creación debe ser una fecha obligatoria y no puede ser mayor a la fecha del sistema.
alter table Carreras
add constraint PK_Carreras primary key (ID)
--SE GENERO RESTRICCION A ID DE LA TABLA
go
Create table Alumnos(
	Legajo smallint not null primary key identity (1000, 1),
	IDCarrera varchar(4) not null foreign key references Carreras (ID),
	Apellido varchar(50) not null,
	Nombre varchar(50) not null,	
	Fechanacimiento date not null check(Fechanacimiento < GETDATE()),
	Mail varchar(150) not null unique,
	telefono varchar(50) null
)
go
Create Table Materias(
	ID smallint primary key identity(1, 1),
	IDCarreras varchar(4) not null foreign key references Carreras (ID),
	NombreMateria varchar(50) not null,
	CargaHoraria smallint not null check(CargaHoraria > 0)
)
