CREATE DATABASE IF NOT EXISTS event_reservation;
USE event_reservation;

DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS salle;
DROP TABLE IF EXISTS utilisateur;

CREATE TABLE utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Stored as clear text for this simple generic version as requested
    role VARCHAR(20) NOT NULL -- 'USER' or 'ADMIN'
);

CREATE TABLE salle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    capacite INT NOT NULL,
    localisation VARCHAR(255),
    description TEXT,
    equipements TEXT -- Comma separated
);

CREATE TABLE reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    salle_id INT NOT NULL,
    date_debut DATETIME NOT NULL,
    date_fin DATETIME NOT NULL,
    statut VARCHAR(20) NOT NULL DEFAULT 'PLANIFIEE', -- 'PLANIFIEE', 'ANNULEE', 'TERMINEE'
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (salle_id) REFERENCES salle(id)
);

-- Test Data
INSERT INTO utilisateur (nom, email, password, role) VALUES 
('Admin User', 'admin@example.com', 'admin123', 'ADMIN'),
('Alice Employee', 'alice@example.com', 'user123', 'USER'),
('Bob Employee', 'bob@example.com', 'user123', 'USER');

INSERT INTO salle (nom, type, capacite, localisation, description, equipements) VALUES 
('Salle A', 'Reunion', 10, 'Etage 1', 'Petite salle de réunion', 'Projecteur,Wifi'),
('Amphithéâtre', 'Conférence', 100, 'RDC', 'Grand espace pour conférences', 'Micro,Sonorisation,Projecteur'),
('Salle B', 'Formation', 20, 'Etage 2', 'Salle de classe modulaire', 'Tableaux blancs,Wifi');
