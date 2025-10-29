/*
    Question : Quelles sont les top compétences les mieux rémunérées ?
        - Afficher le top 25 des compétences avec le plus haut salaire moyen annuel.
*/

SELECT 
    s.skills,
    ROUND(AVG(jp.salary_year_avg),2) AS average_salary
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sj ON jp.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title LIKE '%Data_Analyst%'
    AND jp.salary_year_avg IS NOT NULL
GROUP BY
    s.skills
ORDER BY
    average_salary DESC
LIMIT 25;

-- Explication technique :
--  1. Utilisation de INNER JOIN pour ne récupérer que les compétences associées aux offres d'emploi.
--  2. Filtrage des offres d'emploi pour le métier de Data Analyst avec un salaire spécifié.
--  3. Agrégation des compétences pour calculer le salaire moyen annuel.
--  4. Ordonnancement des résultats pour obtenir le top 25 des compétences les mieux rémunérées.

-- Résultat :
-- On retrouve énormément de technologies liées aux machine learning, big data ou même des technologies très niche/spécifique.
-- Cela peut s'expliquer par le fait que les Data Analysts avec des compétences en développement web
-- ou des compétences techniques spécifiques sont souvent plus rares et donc mieux rémunérées.