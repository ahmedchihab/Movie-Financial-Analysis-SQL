USE test_csv_db;

-- Requête verticale pour afficher les statistiques globales par mesure (budget, gross, runtime, votes)
-- Chaque ligne représente une variable mesurée, avec ses valeurs de somme, min, max, moyenne

-- Bloc pour le budget
SELECT 
    'budget' AS mesure,                         -- Nom de la variable mesurée
    SUM(budget) AS Sum,                       -- Somme de tous les budgets
    MIN(budget) AS Min,                     -- Budget minimum dans le dataset
    MAX(budget) AS Max,                     -- Budget maximum dans le dataset
    AVG(budget) AS Avg                      -- Budget moyen
FROM movies

UNION ALL                                        -- Ajoute les lignes suivantes sans éliminer les doublons

-- Bloc pour les revenus (gross)
SELECT 
    'gross' AS mesure, 
    SUM(gross), 
    MIN(gross), 
    MAX(gross), 
    AVG(gross)
FROM movies

UNION ALL

-- Bloc pour la durée des films
SELECT 
    'runtime' AS mesure, 
    SUM(runtime), 
    MIN(runtime), 
    MAX(runtime), 
    AVG(runtime)
FROM movies

UNION ALL

-- Bloc pour les votes des spectateurs
SELECT 
    'votes' AS mesure, 
    SUM(votes), 
    MIN(votes), 
    MAX(votes), 
    AVG(votes)
FROM movies

UNION ALL


SELECT
'score' AS mesure, 
    SUM(score), 
    MIN(score), 
    MAX(score), 
    AVG(score)
FROM movies;

