USE test_csv_db;

/* 
Ce script calcule :
1. Pourcentage de NULL
2. Pourcentage de 0 (pour colonnes numériques)
3. Pourcentage de valeurs 'Unknown' ou similaires (pour colonnes texte)
*/

/* rating (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'rating' AS colonne,
    (COUNT(CASE WHEN rating IS NULL THEN 1 END) * 100.0 / COUNT(*)) AS pct_null,
    0 AS pct_zero,
    (COUNT(CASE WHEN LOWER(rating) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*)) AS pct_unknown
FROM movies

UNION ALL

/* genre (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'genre',
    (COUNT(CASE WHEN genre IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(genre) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies

UNION ALL

/* year (date) - vérifier NULL uniquement */
SELECT 
    'year',
    (COUNT(CASE WHEN year IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    0
FROM movies

UNION ALL

/* score (numérique) - vérifier NULL et 0 */
SELECT 
    'score',
    (COUNT(CASE WHEN score IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    (COUNT(CASE WHEN score = 0 THEN 1 END) * 100.0 / COUNT(*)),
    0
FROM movies

UNION ALL

/* votes (numérique) - vérifier NULL et 0 */
SELECT 
    'votes',
    (COUNT(CASE WHEN votes IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    (COUNT(CASE WHEN votes = 0 THEN 1 END) * 100.0 / COUNT(*)),
    0
FROM movies

UNION ALL

/* budget (numérique) - vérifier NULL et 0 */
SELECT 
    'budget',
    (COUNT(CASE WHEN budget IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    (COUNT(CASE WHEN budget = 0 THEN 1 END) * 100.0 / COUNT(*)),
    0
FROM movies

UNION ALL

/* gross (numérique) - vérifier NULL et 0 */
SELECT 
    'gross',
    (COUNT(CASE WHEN gross IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    (COUNT(CASE WHEN gross = 0 THEN 1 END) * 100.0 / COUNT(*)),
    0
FROM movies

UNION ALL

/* runtime (numérique) - vérifier NULL et 0 */
SELECT 
    'runtime',
    (COUNT(CASE WHEN runtime IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    (COUNT(CASE WHEN runtime = 0 THEN 1 END) * 100.0 / COUNT(*)),
    0
FROM movies

UNION ALL

/* director (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'director',
    (COUNT(CASE WHEN director IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(director) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies

UNION ALL

/* writer (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'writer',
    (COUNT(CASE WHEN writer IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(writer) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies

UNION ALL

/* star (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'star',
    (COUNT(CASE WHEN star IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(star) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies

UNION ALL

/* country (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'country',
    (COUNT(CASE WHEN country IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(country) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies

UNION ALL

/* company (varchar) - vérifier NULL et 'Unknown' */
SELECT 
    'company',
    (COUNT(CASE WHEN company IS NULL THEN 1 END) * 100.0 / COUNT(*)),
    0,
    (COUNT(CASE WHEN LOWER(company) IN ('unknown','unk') THEN 1 END) * 100.0 / COUNT(*))
FROM movies;
