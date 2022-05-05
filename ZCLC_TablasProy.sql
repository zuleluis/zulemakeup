-- Datos generales o de contacto para el cliente
CREATE TABLE Clientes(
	idCliente serial primary key,
	nombre varchar(50),
	apPaterno varchar(50),
	apMaterno varchar(50),
	fechaNac date,
	calle varchar(50),
	numero int,
	colonia varchar(50),
	ciudad varchar(80),
	numTel varchar(12)
);

-- Servicios que se brindan en Zule Makeup
CREATE TABLE Servicios(
	idServicio serial primary key,
	nombreServicio varchar(50),
	precio float,
	descripcion varchar(100)
);

-- Promociones existentes
CREATE TABLE Promociones(
	idPromocion serial primary key, 
	nombrePromocion varchar(70),
	precio float,
	estado boolean
);

-- Relación que permite almacenar los servicios que incluye cada promoción
CREATE TABLE PromoServicios(
	fkPromocion int,
	fkServicio int,
	
	CONSTRAINT fk_Promocion
		FOREIGN KEY (fkPromocion)
			REFERENCES Promociones(idPromocion),
	
	CONSTRAINT fk_Servicio
		FOREIGN KEY (fkServicio)
			REFERENCES Servicios(idServicio)
);

-- Datos que son necesarios conocer a la hora de ir a una cita
CREATE TABLE Citas(
	idCita serial primary key,
	fkCliente int,
	fecha date,
	hora time,
	tipoLugar boolean,
	lugar varchar(100),
	fkPromocion int,
	importe float,
	nota varchar(100),
	borrar boolean,
	
	CONSTRAINT fk_Cliente
		FOREIGN KEY (fkCliente)
			REFERENCES Clientes(idCliente),
	
	CONSTRAINT fk_PromocionCita
		FOREIGN KEY (fkPromocion)
			REFERENCES Promociones(idPromocion)
);

-- Relación que permite almacenar los servicios que se van a realizar durante la cita
CREATE TABLE CitasServicios(
	fkCita int,
	fkServicio int,
	
	CONSTRAINT fk_Cita
		FOREIGN KEY (fkCita)
			REFERENCES Citas(idCita),
	
	CONSTRAINT fk_ServicioCita
		FOREIGN KEY (fkServicio)
			REFERENCES Servicios(idServicio)
);

-- El tipo de aplicación del producto (rostro, ojos, labios, etc)
CREATE TABLE Aplicacion(
	idAplicacion serial primary key,
	nombre varchar(30)
);

-- El tipo de producto (base de maquillaje, corrector, contorno, paleta de ojos, entre otros)
CREATE TABLE Tipos(
	idTipo serial primary key,
	nombre varchar(30)
);

-- El tipo de producto (base de maquillaje, corrector, contorno, paleta de ojos, entre otros)
CREATE TABLE Marcas(
	idMarca serial primary key,
	nombre varchar(30)
);

-- Productos existentes
CREATE TABLE Productos(
	idProducto serial primary key,
	fkMarca int,
	nombreProducto varchar(50),
	fkAplicacion int,
	fkTipo int,
	modelo varchar(40),
	cantidad int,
	agotado boolean,
	
	CONSTRAINT fk_Marca
		FOREIGN KEY (fkMarca)
			REFERENCES Marcas(idMarca),

	CONSTRAINT fk_Aplicacion
		FOREIGN KEY (fkAplicacion)
			REFERENCES Aplicacion(idAplicacion),
	
	CONSTRAINT fk_Tipo
		FOREIGN KEY (fkTipo)
			REFERENCES Tipos(idTipo)
);