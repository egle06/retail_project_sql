--CREACIÓN DE BASE DE DATOS
CREATE DATABASE reatail_project;

--CREACIÓN DE TABLAS
--TABLA CLIENTES
CREATE TABLE clientes(
id_cliente SERIAL PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
edad INT CHECK (edad>=18),
email VARCHAR(200) UNIQUE NOT NULL
);
--TABLA PRODUCTOS
CREATE TABLE productos(
id_producto SERIAL PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
categoria VARCHAR(100),
precio DECIMAL(10,2) CHECK(precio>0),
stock INT CHECK(stock >0)
);
--TABLA VENTAS
CREATE TABLE ventas(
id_ventas SERIAL PRIMARY KEY,
cliente_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad INT CHECK (cantidad>0),
fecha_venta DATE NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
FOREIGN KEY (producto_id) REFERENCES productos(id_producto)
);

--CARGA DE DATOS
BEGIN;
INSERT INTO clientes (nombre,edad,email)VALUES
('Ana López',28,'ana.lopez@gmail.com'),
('Carlos Pérez',35,'carlos.perez@hotmail.com'),
('María Gómez',22, 'maria.gomez@gmail.com'),
('Luis Fernández',41,'luis.fernandez@gmail.com'),
('Sofía Duarte',30,'sofia.duarte@hotmail.com');

INSERT INTO productos (nombre,categoria,precio,stock)VALUES
('Notebook Lenovo','Tecnología',850000.00, 10),
('Mouse Logitech', 'Accesorio',15000.00, 50),
('Auriculares Sony','Audio',45000.00, 25),
('Monitor Samsung', 'Tecnología',210000.00, 15),
('Teclado Redragon','Accesorio',28000.00, 40);

INSERT INTO ventas (cliente_id,producto_id,cantidad,fecha_venta)VALUES
(1,5,2,'2026-07-20'),
(2,3,2,'2026-07-15'),
(3,1,4,'2026-07-12'),
(4,2,3,'2026-06-28'),
(5,4,2,'2026-06-20');

COMMIT;

--AUMENTAR LOS PRECIOS UN 10% DE LA CATEGORIA ACCESORIO
UPDATE productos
SET precio=precio*1.10
WHERE categoria='Accesorio';

--VISTA PREVIA DE LA TABLA VENTAS
SELECT* FROM ventas;
--ELIMINAR UN REGISTRO DE VENTA 
DELETE FROM ventas
WHERE id_ventas=2;



