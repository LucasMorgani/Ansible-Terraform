-- CREATE DATABASE testedb;

\c testedb

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

INSERT INTO usuarios (nome) VALUES
('Lucas'),
('Fernanda'),
('João'),
('Carla');
