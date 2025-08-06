use test_csv_db;


 -- Classement des 5 genres les plus rentables avec rang explicite

SELECT 
    -- Numéro de rang automatique selon profit total décroissant
    RANK() OVER (ORDER BY SUM(gross) - SUM(budget) DESC) AS 'rank',

    -- Genre de film
    genre,

    -- Budget total pour ce genre (formaté $)
    CONCAT('$', FORMAT(SUM(budget), 0)) AS total_budget,

    -- Revenu total brut (formaté $)
    CONCAT('$', FORMAT(SUM(gross), 0)) AS total_gross,

    -- Profit total (revenu - budget)
    CONCAT('$', FORMAT(SUM(gross) - SUM(budget), 0)) AS total_profit,

    -- Pourcentage de profit total (arrondi à 2 chiffres)
    CONCAT(ROUND((SUM(gross) - SUM(budget)) / SUM(budget) * 100, 2), '%') AS profit_percentage

FROM movies

-- On exclut les données nulles ou incorrectes
WHERE budget > 0 AND gross > 0 AND genre IS NOT NULL

-- On groupe les films par genre pour avoir un total par catégorie
GROUP BY genre

-- On limite l'affichage aux 5 meilleurs rangs uniquement
ORDER BY SUM(gross) - SUM(budget) DESC
LIMIT 5;
