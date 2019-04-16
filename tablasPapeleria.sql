--Inicio de las tablas de la BD de papeleria.sql

--Tabla trabajadores
CREATE TABLE IF NOT EXISTS trabajadores (
    id_trabajador INTEGER UNSIGNED AUTO_INCREMENT,
    dni VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fechaNacimiento DATETIME NOT NULL,
    telefono VARCHAR(12) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codPostal VARCHAR(8) NOT NULL,
    poblacion VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    fechaAlta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo TINYINT(1) NOT NULL DEFAULT 1, 
    comentario TEXT,
    NumSS INT(10) UNIQUE NOT NULL,
    PRIMARY KEY (id_trabajador)
);

--Tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER UNSIGNED AUTO_INCREMENT,
    dni VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fechaNacimiento DATETIME NOT NULL,
    telefono VARCHAR(12) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codPostal VARCHAR(8) NOT NULL,
    poblacion VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    fechaAlta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo TINYINT(1) NOT NULL DEFAULT 1, 
    comentario TEXT,
    PRIMARY KEY (id_cliente)
);

--Tabla stock
CREATE TABLE IF NOT EXISTS stock(
    id_producto VARCHAR(50),
    precioVenta  DOUBLE(4,2) NOT NULL,
    cantidad INT(3) NOT NULL,
    PRIMARY KEY (id_producto)
);

--Tabla ventas
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INTEGER UNSIGNED,
    id_trabajador INTEGER UNSIGNED  NOT NULL,
    id_producto VARCHAR(50) NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    precioVenta DOUBLE(4,2) NOT NULL,
    cantidad INT(3) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador),
    FOREIGN KEY (id_producto) REFERENCES stock(id_producto)
);

--Tabla proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor VARCHAR(30) PRIMARY KEY,
    telefono  VARCHAR(12) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    poblacion VARCHAR(20) NOT NULL,
    codPostal VARCHAR(20) UNIQUE NOT NULL,
    CIF VARCHAR(15) NOT NULL
);

--Tabla pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(50) NOT NULL,
    id_proveedor VARCHAR(30) NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    precioCompra DOUBLE(4,2) NOT NULL,
    cantidad INT(3)NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES stock(id_producto)
);
