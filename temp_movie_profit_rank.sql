USE test_csv_db;

-- Vue temporaire pour calculer les profits et classer les films
WITH film_profits AS (
    SELECT 
        name,
        genre,
        budget,
        gross,
        (gross - budget) AS profit,
        CASE
            WHEN budget <= 100000000 THEN '0-100M'
            WHEN budget <= 200000000 THEN '100-200M'
            ELSE '200M+'
        END AS budget_range
    FROM movies
    WHERE 
        budget > 0 
        AND gross > 0
        AND budget IS NOT NULL
        AND gross IS NOT NULL
),

-- Classement des films par profit dans chaque tranche
ranked_films AS (
    SELECT *,
           RANK() OVER (PARTITION BY budget_range ORDER BY profit DESC) AS rank_in_group
    FROM film_profits
)

-- Requête finale avec stats + top 3 films
SELECT 
    fr.budget_range,
    COUNT(*) AS nombre_films,
    CONCAT('$', FORMAT(AVG(fr.budget)/1000000, 1), 'M') AS budget_moyen,
    CONCAT('$', FORMAT(AVG(fr.gross)/1000000, 1), 'M') AS recettes_moyennes,
    CONCAT('$', FORMAT(SUM(fr.profit)/1000000, 1), 'M') AS profit_total,
    CONCAT(ROUND(AVG(fr.profit / fr.budget * 100), 1), '%') AS ROI_moyen,
    CONCAT('$', FORMAT(MAX(fr.gross)/1000000, 1), 'M') AS recettes_max,
    CONCAT('$', FORMAT(MIN(fr.budget)/1000000, 1), 'M') AS budget_min,
    
    -- Exemples de films (TOP 3 par profit)
    GROUP_CONCAT(CASE WHEN rf.rank_in_group = 1 THEN CONCAT(rf.name, ' (', rf.genre, ')') END) AS Top_1,
    GROUP_CONCAT(CASE WHEN rf.rank_in_group = 2 THEN CONCAT(rf.name, ' (', rf.genre, ')') END) AS Top_2,
    GROUP_CONCAT(CASE WHEN rf.rank_in_group = 3 THEN CONCAT(rf.name, ' (', rf.genre, ')') END) AS Top_3

FROM ranked_films rf
JOIN film_profits fr ON rf.name = fr.name AND rf.budget = fr.budget
GROUP BY fr.budget_range
ORDER BY 
    CASE 
        WHEN fr.budget_range = '0-100M' THEN 1
        WHEN fr.budget_range = '100-200M' THEN 2
        ELSE 3
    END;
