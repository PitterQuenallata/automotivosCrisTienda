/********************************************************************/
/* tabla usuarios*/
CREATE TABLE usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  foto_usuario VARCHAR(255) NOT NULL,
  user_usuario VARCHAR(255) NOT NULL,
  nombre_usuario VARCHAR(255) NOT NULL,
  apellido_usuario VARCHAR(255) NOT NULL,
  email_usuario VARCHAR(255) NOT NULL,
  password_usuario VARCHAR(255) NOT NULL,
  rol_usuario VARCHAR(255) NOT NULL,
  estado_usuario VARCHAR(255) NOT NULL,	
  token_usuario VARCHAR(255) NOT NULL,	
  token_exp_usuario VARCHAR(255) NOT NULL,
  date_created_usuario TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_usuario TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);

INSERT INTO usuarios (foto_usuario, user_usuario, nombre_usuario, apellido_usuario, email_usuario, password_usuario, rol_usuario, estado_usuario, token_usuario, token_exp_usuario) 
VALUES 
    ('foto1.jpg', 'juanperez', 'Juan', 'Perez', 'juan.perez@example.com', 'contraseña123', 'administrador', 'activo', 'token_juanperez', '2024-12-31'),
    ('foto2.jpg', 'mariagomez', 'Maria', 'Gomez', 'maria.gomez@example.com', 'password456', 'venta', 'activo', 'token_mariagomez', '2024-12-31'),
    ('foto3.jpg', 'pedrolopez', 'Pedro', 'Lopez', 'pedro.lopez@example.com', 'clave789', 'caja', 'activo', 'token_pedrolopez', '2024-12-31'),
    ('foto4.jpg', 'anasanchez', 'Ana', 'Sanchez', 'ana.sanchez@example.com', 'secure123', 'envio', 'inactivo', 'token_anasanchez', '2024-11-15'),
    ('foto5.jpg', 'luisgarcia', 'Luis', 'Garcia', 'luis.garcia@example.com', 'pass12345', 'publicidad', 'activo', 'token_luisgarcia', '2025-01-10');
    


/********************************************************************/

/* tabla compras*/
CREATE TABLE compras (
  id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  total_precio_compra DECIMAL(10,2) NOT NULL,
  estado_compra VARCHAR(255) NOT NULL,
  proveedor_compra VARCHAR(255) NOT NULL,
  id_usuario INT NOT NULL,
  date_created_compra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_compra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO compras (total_precio_compra, estado_compra, proveedor_compra, id_usuario) 
VALUES 
    (150.00, 'pendiente', 'AutoParts S.A.', 1),
    (75.50, 'completada', 'CarSpares Inc.', 2),
    (200.25, 'pendiente', 'CarFix Solutions', 3),
    (100.75, 'completada', 'AutoParts S.A.', 4),
    (50.00, 'pendiente', 'CarSpares Inc.', 5),
    (300.00, 'completada', 'CarFix Solutions', 1),
    (125.00, 'pendiente', 'AutoParts S.A.', 2),
    (80.20, 'completada', 'CarSpares Inc.', 3),
    (180.50, 'pendiente', 'CarFix Solutions', 4),
    (95.75, 'completada', 'AutoParts S.A.', 5);



/********************************************************************/

/* tabla detalle compra*/
CREATE TABLE detalleCompra(
  id_detalleCompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  precio_comprado DECIMAL(10,2) NOT NULL,
  cantidad_comprada INT NOT NULL,
  id_compra INT NOT NULL,
  id_autoPart INT NOT NULL,
  date_created_dCompra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_dCompra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
  FOREIGN KEY (id_autoPart) REFERENCES autopartes(id_autoPart)
);

INSERT INTO detalleCompra (precio_comprado, cantidad_comprada, id_compra, id_autoPart) 
VALUES 
    (50.00, 2, 1, 1),
    (30.50, 1, 2, 2),
    (25.25, 3, 3, 3),
    (40.75, 1, 4, 4),
    (20.00, 2, 5, 5),
    (100.00, 3, 6, 6),
    (50.00, 1, 7, 7),
    (40.10, 2, 8, 8),
    (90.50, 3, 9, 9),
    (45.75, 1, 10, 10);


/********************************************************************/
/* tabla autopartes*/
CREATE TABLE autoPartes (
  id_autoPart INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  codigo_autoPart VARCHAR(255) NOT NULL,
  foto_autoPart VARCHAR(255) NOT NULL,
  nombre_autoPart VARCHAR(255) NOT NULL,
  descripcion_autoPart VARCHAR(255) NOT NULL,
  cantidad_minima_autoPart INT NOT NULL,
  cantidad_autoPart INT NOT NULL,
  precio_compra_autoPart DECIMAL(10,2) NOT NULL,
  precio_autoPart DECIMAL(10,2) NOT NULL,
  estado_autoPart VARCHAR(255) NOT NULL,
  date_created_autoPart TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_autoPart TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id_categoria INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
);

INSERT INTO autoPartes (codigo_autoPart, foto_autoPart, nombre_autoPart, descripcion_autoPart, cantidad_minima_autoPart, cantidad_autoPart, precio_compra_autoPart, precio_autoPart, estado_autoPart, id_categoria) 
VALUES 
    ('AP001', 'foto1.jpg', 'Filtro de aceite', 'Filtro de aceite para motor de vehículos', 5, 50, 8.50, 15.00, 'activo', 1),
    ('AP002', 'foto2.jpg', 'Pastillas de freno', 'Pastillas de freno delanteras para vehículos', 10, 40, 20.00, 35.00, 'activo', 2),
    ('AP003', 'foto3.jpg', 'Correa de distribución', 'Correa de distribución para motor de vehículos', 3, 20, 30.00, 50.00, 'activo', 3),
    ('AP004', 'foto4.jpg', 'Amortiguador', 'Amortiguador delantero para vehículos', 2, 15, 45.00, 75.00, 'activo', 4),
    ('AP005', 'foto5.jpg', 'Farol delantero', 'Farol delantero izquierdo para vehículos', 5, 30, 55.00, 90.00, 'activo', 5),
    ('AP006', 'foto6.jpg', 'Filtro de aire', 'Filtro de aire para motor de vehículos', 5, 40, 10.00, 20.00, 'activo', 1),
    ('AP007', 'foto7.jpg', 'Pastillas de freno', 'Pastillas de freno traseras para vehículos', 10, 35, 22.00, 38.00, 'activo', 2),
    ('AP008', 'foto8.jpg', 'Kit de embrague', 'Kit de embrague para vehículos', 2, 18, 80.00, 120.00, 'activo', 3),
    ('AP009', 'foto9.jpg', 'Amortiguador', 'Amortiguador trasero para vehículos', 2, 20, 50.00, 80.00, 'activo', 4),
    ('AP010', 'foto10.jpg', 'Farol trasero', 'Farol trasero derecho para vehículos', 5, 25, 60.00, 100.00, 'activo', 5);

/********************************************************************/
/* tabla categorias*/
CREATE TABLE categorias (
  id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  nombre_categoria VARCHAR(255) NOT NULL,
  estado_categoria VARCHAR(255) NOT NULL,
  date_created_categoria TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_categoria TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO categorias (nombre_categoria, estado_categoria) 
VALUES 
    ('Filtros', 'activo'),
    ('Frenos', 'activo'),
    ('Motor', 'activo'),
    ('Suspensión', 'activo'),
    ('Luces', 'activo');

/********************************************************************/
/* tabla modelos*/
CREATE TABLE modelos (
  id_modelo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  nombre_modelo VARCHAR(255) NOT NULL,
  estado_modelo VARCHAR(255) NOT NULL,
  id_marca INT NOT NULL,
  date_created_modelo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_modelo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

INSERT INTO modelos (nombre_modelo, estado_modelo, id_marca) 
VALUES 
    ('Corolla', 'activo', 1),
    ('Fiesta', 'activo', 2),
    ('Civic', 'activo', 3),
    ('Spark', 'activo', 4),
    ('Golf', 'activo', 5);

/********************************************************************/
/* tabla detalle modelo*/
CREATE TABLE modeloRepuestos(
  id_modeloRepuesto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  id_autoPart INT NOT NULL,
  id_modelo INT NOT NULL,
  date_created_mRepuesto TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_mRepuesto TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_autoPart) REFERENCES autopartes(id_autoPart),
  FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo)
);

/********************************************************************/
/* tabla marcas*/
CREATE TABLE marcas (
  id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  nombre_marca VARCHAR(255) NOT NULL,
  estado_marca VARCHAR(255) NOT NULL,
  date_created_marca TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_marca TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO marcas (nombre_marca, estado_marca) 
VALUES 
    ('Toyota', 'activo'),
    ('Ford', 'activo'),
    ('Honda', 'activo'),
    ('Chevrolet', 'activo'),
    ('Volkswagen', 'activo');
/********************************************************************/
/* tabla tipo de vehiculo*/
CREATE TABLE tipoVehiculos (
  id_tipoVehiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  name_tipoVehiculo VARCHAR(255) NOT NULL,
  date_created_tipoVehiculo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_tipoVehiculo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO tipoVehiculos (name_tipoVehiculo) 
VALUES 
    ('Automóvil'),
    ('Camioneta'),
    ('Camión'),
    ('Motocicleta'),
    ('Bicicleta');

/********************************************************************/
/* tabla motores*/
CREATE TABLE motores (
  id_motor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  tipo_motor VARCHAR(255) NOT NULL,
  descripcion_motor VARCHAR(255) NOT NULL,
  año_inicio_motor VARCHAR(255) NOT NULL,
  año_fin_motor VARCHAR(255) NOT NULL,
  date_created_motor TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_motor TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id_modelo INT NOT NULL,
  id_marca INT NOT NULL,
  FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo)
  FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);
INSERT INTO motores (tipo_motor, descripcion_motor, año_inicio_motor, año_fin_motor, id_modelo, id_marca) 
VALUES 
    ('Gasolina', 'Motor de 4 cilindros en línea', '2015', '2022', 1, 1),
    ('Gasolina', 'Motor de 3 cilindros en línea', '2018', '2023', 2, 2),
    ('Gasolina', 'Motor de 4 cilindros en línea', '2019', '2024', 3, 3),
    ('Gasolina', 'Motor de 3 cilindros en línea', '2017', '2021', 4, 4),
    ('Diesel', 'Motor de 4 cilindros en línea', '2016', '2023', 5, 5);

/********************************************************************/
/* tabla ventas*/
CREATE TABLE ventas (
  id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  precio_total_venta DECIMAL(10,2) NOT NULL,
  estado_venta VARCHAR(255) NOT NULL,
  fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  id_cliente INT NOT NULL,
  date_created_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
INSERT INTO ventas (precio_total_venta, estado_venta, fecha_venta, id_cliente) 
VALUES 
    (250.00, 'completada', '2024-05-01 10:00:00', 1),
    (180.50, 'pendiente', '2024-05-02 11:30:00', 2),
    (300.25, 'completada', '2024-05-03 09:45:00', 3),
    (150.75, 'completada', '2024-05-04 14:20:00', 4),
    (200.00, 'pendiente', '2024-05-05 16:00:00', 5);

/********************************************************************/
/* tabla detalle venta*/
CREATE TABLE detalleVentas(
  id_detalleVenta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  cantidad_dVenta INT NOT NULL,
  precio_vendido_dventa DECIMAL(10,2) NOT NULL,
  descuento_dventa DECIMAL(10,2) NOT NULL,
  id_venta INT NOT NULL,
  id_autoPart INT NOT NULL,
  date_created_dVenta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_dVenta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_autoPart) REFERENCES autopartes(id_autoPart)
);
INSERT INTO detalleVentas (cantidad_dVenta, precio_vendido_dventa, descuento_dventa, id_venta, id_autoPart) 
VALUES 
    (2, 100.00, 0.00, 1, 1),
    (1, 90.50, 0.00, 2, 2),
    (3, 100.08, 10.00, 3, 3),
    (1, 150.75, 0.00, 4, 4),
    (2, 100.00, 10.00, 5, 5);

/********************************************************************/
/* tabla clientes*/
CREATE TABLE clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  foto_cliente VARCHAR(255) NOT NULL,
  nombre_cliente VARCHAR(255) NOT NULL,
  apellido_cliente VARCHAR(255) NOT NULL,
  email_cliente VARCHAR(255) NOT NULL,
  password_cliente VARCHAR(255) NOT NULL,
  token_cliente VARCHAR(255) NOT NULL,
  token_exp_cliente VARCHAR(255) NOT NULL,
  telefono_cliente VARCHAR(255) NOT NULL,
  direccion_cliente VARCHAR(255) NOT NULL,
  estado_cliente VARCHAR(255) NOT NULL,
  nit_cliente VARCHAR(255) NOT NULL,
  nombre_nit_cliente VARCHAR(255) NOT NULL,
  tipo_cliente VARCHAR(255) NOT NULL,
  date_created_cliente TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_cliente TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO clientes (foto_cliente, nombre_cliente, apellido_cliente, email_cliente, password_cliente, token_cliente, token_exp_cliente, telefono_cliente, direccion_cliente, estado_cliente, nit_cliente, nombre_nit_cliente, tipo_cliente) 
VALUES 
    ('foto1.jpg', 'Juan', 'Perez', 'juan@example.com', 'contraseña123', 'token_juan', '2024-12-31', '123456789', 'Calle 123, Ciudad', 'activo', '123456-7', 'Juan Perez', 'normal'),
    ('foto2.jpg', 'María', 'Gómez', 'maria@example.com', 'password456', 'token_maria', '2024-12-31', '987654321', 'Avenida 456, Pueblo', 'activo', '987654-3', 'María Gómez', 'normal'),
    ('foto3.jpg', 'Pedro', 'López', 'pedro@example.com', 'clave789', 'token_pedro', '2024-12-31', '555666777', 'Av. Principal, Ciudad', 'activo', '555666-7', 'Pedro López', 'normal'),
    ('foto4.jpg', 'Ana', 'Sánchez', 'ana@example.com', 'secure123', 'token_ana', '2024-12-31', '333444555', 'Calle Central, Pueblo', 'activo', '333444-5', 'Ana Sánchez', 'normal'),
    ('foto5.jpg', 'Luis', 'García', 'luis@example.com', 'pass12345', 'token_luis', '2024-12-31', '111222333', 'Av. Libertad, Ciudad', 'activo', '111222-9', 'Luis García', 'normal');

/********************************************************************/
/* tabla pagos*/
CREATE TABLE pagos (
  id_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  monto_pago DECIMAL(10,2) NOT NULL,
  fecha_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  metodo_pago VARCHAR(255) NOT NULL,
  id_venta INT NOT NULL,
  id_usuario INT NOT NULL,
  date_created_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  date_updated_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO pagos (monto_pago, fecha_pago, metodo_pago, id_venta, id_usuario) 
VALUES 
    (250.00, '2024-05-01 10:15:00', 'tarjeta', 1, 1),
    (180.50, '2024-05-02 11:45:00', 'efectivo', 2, 2),
    (300.25, '2024-05-03 10:00:00', 'transferencia', 3, 3),
    (150.75, '2024-05-04 14:30:00', 'cheque', 4, 4),
    (200.00, '2024-05-05 16:30:00', 'tarjeta', 5, 5);



/********************************************************************/
/* consultas*/

-- Compras completadas:
SELECT * FROM compras WHERE estado_compra = 'completada';

-- Detalle de compras de un usuario específico:
SELECT * FROM detalleCompra WHERE id_compra IN (SELECT id_compra FROM compras WHERE id_usuario = 1);

-- Autopartes activas:
SELECT * FROM autoPartes WHERE estado_autoPart = 'activo';

-- Categorías activas:
SELECT * FROM categorias WHERE estado_categoria = 'activo';

-- Modelos de una marca específica:
SELECT * FROM modelos WHERE id_marca = 1;

-- Repuestos de un modelo específico:
SELECT * FROM modeloRepuestos WHERE id_modelo = 1;

-- Marcas activas:
SELECT * FROM marcas WHERE estado_marca = 'activo';

-- Clientes activos:
SELECT * FROM clientes WHERE estado_cliente = 'activo';

-- Ventas completadas:
SELECT * FROM ventas WHERE estado_venta = 'completada';

-- Detalle de ventas de una venta específica:
SELECT * FROM detalleVentas WHERE id_venta = 1;

-- Pagos de una venta específica:
SELECT * FROM pagos WHERE id_venta = 1;

-- Compras de un proveedor específico:
SELECT * FROM compras WHERE proveedor_compra = 'AutoParts S.A.';

-- Autopartes por categoría:
SELECT * FROM autoPartes WHERE id_categoria = 1;

-- Modelos activos:
SELECT * FROM modelos WHERE estado_modelo = 'activo';

-- Usuarios con rol de administrador:
SELECT * FROM usuarios WHERE rol_usuario = 'administrador';

-- Detalle de ventas de un autoparte específico:
SELECT * FROM detalleVentas WHERE id_autoPart = 1;

-- Ventas por cliente:
SELECT * FROM ventas WHERE id_cliente = 1;

-- Compras por estado:
SELECT estado_compra, COUNT(*) AS total FROM compras GROUP BY estado_compra;
