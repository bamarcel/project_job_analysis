/*
    Question : Quelles sont les compétences les mieux rémunérées pour le métier de Data Analyst ?
        - On se concentre sur le top 10 que nous avons déjà trouvé. 
        - On veut retrouver tout les différents skills associés à ces offres d'emploi.
        - L'objectif est d'identifier les compétences les plus valorisées dans les offres d'emploi.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,     
        job_title, 
        c.name AS company_name ,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
    FROM
        job_postings_fact AS jp
    LEFT JOIN 
        company_dim AS c ON jp.company_id = c.company_id
    WHERE
        job_title LIKE '%Data_Analyst%'
        AND job_work_from_home IS TRUE
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.job_id,
    tpj.job_title,
    tpj.company_name,
    STRING_agg(s.skills, ', ' ORDER BY s.skills) AS skills_needed,
    tpj.salary_year_avg
FROM 
    top_paying_jobs AS tpj
INNER JOIN                      
    skills_job_dim AS sj ON tpj.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
GROUP BY
    tpj.job_id,
    tpj.job_title,
    tpj.company_name,
    tpj.salary_year_avg
ORDER BY
    tpj.salary_year_avg DESC;

-- Explication technique :
--  1. Utilisation d'une CTE (Common Table Expression) pour isoler les 10 meilleurs offres.
--  2. Choix du INNER JOIN pour ne récupérer que les compétences associées aux offres sélectionnées.
--  3. Agrégation des compétences par offre d'emploi pour une présentation claire.

-- Conclusion :
--  On voit que certaines compétences reviennent fréquemment dans les offres d'emploi les mieux rémunérées
--  tel que SQL, Python, Tableau qui sont donc des compétences clés à développer.