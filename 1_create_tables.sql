use test_csv_db;


CREATE TABLE movies (
    name VARCHAR(255) NOT NULL,
    rating VARCHAR(10) CHECK (rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR')),
    genre VARCHAR(100),
    year DATE,  -- Format: YYYY-MM-DD (utiliser la date complète ou juste l'année)
    released_by_year DATE,  -- Date de sortie exacte
    released_by_country VARCHAR(100),  -- Pays de sortie
    score DECIMAL(3,1) CHECK (score BETWEEN 0 AND 10),
    votes INT,
    director VARCHAR(255),
    writer VARCHAR(255),
    star VARCHAR(255),
    country VARCHAR(100),  -- Pays de production
    budget DECIMAL(15,2),  -- Meilleur pour les montants financiers
    gross DECIMAL(15,2),
    company VARCHAR(255),
    runtime DECIMAL(5,1),  -- Permet des durées comme 146.0 minutes
    -- Clé primaire composite
    CONSTRAINT pk_movie PRIMARY KEY (name, released_by_year)
);
select * from movies; 

