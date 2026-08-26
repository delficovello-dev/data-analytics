USE Retailpro;

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Sucursales;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Territorios1;
DROP TABLE IF EXISTS Categorias;

CREATE TABLE Categorias (
id_categoria INT NOT NULL identity(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200) NULL
);

CREATE TABLE Productos(
id_producto int identity(1,1) PRIMARY KEY,
nombre_producto varchar(100) not null,
id_categoria int foreign key references Categorias(id_categoria),
subcategoria varchar(100),
precio decimal (10,2),
costo decimal (10,2),
stock int not null default 0,
activo int
);

CREATE TABLE Territorios1(
id_territorio int identity(1,1) PRIMARY KEY,
region varchar (60),
pais varchar (80),
zona varchar (100)
);

CREATE TABLE Sucursales(
id_sucursal int identity(1,1) PRIMARY KEY,
nombre_sucursal varchar(100),
ciudad varchar(60),
id_territorio int foreign key references Territorios1(id_territorio)
);

CREATE TABLE Clientes(
id_cliente int identity(1,1) PRIMARY KEY,
nombre varchar(70),
email varchar(80),
ciudad varchar(100),
segmento varchar(100),
fecha_registro date,
id_territorio int foreign key references Territorios1(id_territorio)
);

CREATE TABLE Ventas(
id_venta INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente),
id_producto INT FOREIGN KEY REFERENCES Productos(id_producto),
id_sucursal INT FOREIGN KEY REFERENCES Sucursales(id_sucursal),
cantidad INT,
precio_unitario DECIMAL(10,2),
fecha_venta DATE,
total_venta DECIMAL(12,2),
canal VARCHAR(20)
);

SELECT
    v.fecha_venta AS fecha,
    c.nombre AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    p.precio AS precio_unitario,
    v.total_venta,
    v.canal
FROM Ventas AS v
INNER JOIN Clientes AS c
ON v.id_cliente = c.id_cliente
INNER JOIN Productos AS p
ON v.id_producto = p.id_producto
INNER JOIN Categorias AS cat
ON p.id_categoria = cat.id_categoria
INNER JOIN Territorios1 AS t
ON c.id_territorio = t.id_territorio;

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM Productos AS p
INNER JOIN Categorias AS cat
ON p.id_categoria = cat.id_categoria
LEFT JOIN Ventas AS v
ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

SELECT
    canal,
    SUM(total_venta) AS total_ventas
FROM (
    SELECT
    id_venta,
    total_venta,
    'Online' AS canal
    FROM ventas
    WHERE canal = 'Online'
    UNION ALL
    SELECT
    id_venta,
    total_venta,
    'Presencial' AS canal
    FROM ventas
    WHERE canal = 'Presencial'
) AS ventas_canales
GROUP BY canal;
