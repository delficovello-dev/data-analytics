use Ventas_tech_DB

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE Categorias(
id_categoria int identity(1,1) PRIMARY KEY,
nombre_categoria varchar(50) not null,
descripcion varchar(200)
);

CREATE TABLE Clientes(
id_cliente int identity(1,1) PRIMARY KEY,
nombre varchar(100) not null,
email varchar(100) unique,
ciudad varchar(50),
fecha_registro date not null
);

create table Productos(
id_producto int identity(1,1) PRIMARY KEY,
nombre_producto varchar(100) not null,
id_categoria int foreign key references Categorias,
precio decimal(10,2) not null,
stock int not null default 0,
activo tinyint default 1
);

create table Ventas(
id_venta int identity(1,1) primary key,
id_cliente int foreign key references Clientes,
id_producto int foreign key references Productos,
cantidad int not null,
precio_unitario decimal(10,2) not null,
fecha_venta date not null
);

INSERT INTO categorias (nombre_categoria, descripcion) VALUES ('Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias (nombre_categoria, descripcion) VALUES ('Accesorios', 'Periféricos y complementos');
INSERT INTO categorias (nombre_categoria, descripcion) VALUES ('Audio', 'Auriculares y parlantes');
INSERT INTO categorias (nombre_categoria, descripcion) VALUES ('Almacenamiento', 'Discos y memorias');

INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES ('María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES ('Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES ('Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES ('Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES ('Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo) VALUES ('Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES (5, 3, 2,  450.00, '2024-03-15');

SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;


