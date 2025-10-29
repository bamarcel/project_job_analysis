/*
    Récupérer les offres du premier quartier de l'année 2023
        - Inclure les offres de Janvier, Février, et Mars 2023
        - Salaire supérieur à 70000
*/

-- On utilise une CTE pour combiner les trois tables créées précédemment
WITH first_quarter_2023 AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

-- On filtre ensuite sur le salaire moyen annuel
SELECT 
    job_id,
    job_title,
    job_posted_date,
    salary_year_avg
FROM 
    first_quarter_2023
WHERE 
    salary_year_avg > 70000
ORDER BY 
    salary_year_avg DESC;

-- La CTE nous a permis de combiner les trois tables pour faire un seul filtre global