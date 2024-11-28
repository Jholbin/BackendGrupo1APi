CREATE DATABASE IF NOT EXISTS BD_Proyecto;
USE BD_Proyecto;

CREATE TABLE roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    dni VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ultimo_acceso DATETIME,
    estado VARCHAR(20) DEFAULT 'activo',
    rol_id BIGINT,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

-- Índices adicionales para mejorar la búsqueda
CREATE INDEX idx_username ON usuarios (username);
CREATE INDEX idx_dni ON usuarios (dni);
CREATE INDEX idx_correo ON usuarios (correo);

-- Ejemplo de inserción de roles para pruebas
INSERT INTO roles (nombre) VALUES ('CLIENTE'), ('ADMIN');

-- Ejemplo de inserción de usuarios para pruebas
INSERT INTO usuarios (username, dni, correo, nombre, apellido, password, telefono, direccion, rol_id) 
VALUES 
    ('Carlos', '23445566', 'carlos@example.com', 'Carlos', 'Gómez', 'admin3', '123456789', 'Av. Central 789', 2),
    ('Juan', '17889900', 'juan@example.com', 'Juan', 'Martínez', 'admin4', '987654321', 'Av. Secundaria 987', 2),
    ('Christian', '43445566', 'Christian@example.com', 'Christian', 'Gómez', 'admin5', '123456789', 'Av. Central 789', 2),
    ('Ronald', '57889900', 'Ronald@example.com', 'Ronald', 'Carpio', 'admin6', '987654321', 'Av. Secundaria 987', 2),
    ('usuario1', '12345678', 'usuario1@example.com', 'Juan', 'Pérez', 'pass', '123456789', 'Av. Principal 123', 1),
    ('usuario2', '87654321', 'usuario2@example.com', 'Ana', 'García', 'pass2', '987654321', 'Av. Secundaria 456', 1),
    ('usuario3', '11223344', 'usuario3@example.com', 'Luis', 'Ramírez', 'pass3', '1122334455', 'Calle Falsa 789', 1),
    ('usuario4', '55667788', 'usuario4@example.com', 'María', 'López', 'pass4', '5566778899', 'Jr. Los Pinos 321', 1),
    ('usuario5', '99887766', 'usuario5@example.com', 'Carlos', 'Fernández', 'pass5', '9988776655', 'Av. Los Olivos 654', 1),
    ('usuario6', '44332211', 'usuario6@example.com', 'Elena', 'Torres', 'pass6', '4433221100', 'Pasaje Las Flores 987', 1),
    ('admin1', '33445566', 'admin1@example.com', 'Carlos', 'Gómez', 'admin', '123456789', 'Av. Central 789', 2),
    ('admin2', '77889900', 'admin2@example.com', 'Lucía', 'Martínez', 'admin2', '987654321', 'Av. Secundaria 987', 2);
    
SELECT * FROM usuarios;
