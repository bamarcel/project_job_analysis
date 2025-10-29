/*
    Question : Quelles sont les compétences les plus optimales à développer pour un Data Analyst ?
        - On veut combiner à la fois les compétences les plus demandées et les mieux rémunérées.
        - On va se concentrer sur l'ensemble des offres d'emploi pour le métier de Data Analyst.
        - Mais également pour le remote et les salaires spécifiés.
*/

SELECT
    s.skill_id,
    s.skills,
    COUNT(*) AS number_of_offers,
    ROUND(AVG(jp.salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sj ON jp.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title ILIKE '%data analyst%'             -- ILIKE = insensible à la casse
    AND jp.job_work_from_home IS TRUE
    AND jp.salary_year_avg IS NOT NULL
GROUP BY
    s.skill_id,
    s.skills
ORDER BY
    number_of_offers DESC,
    average_salary DESC
;

-- Explication technique :
--  1. Utilisation de INNER JOIN pour ne récupérer que les compétences associées aux offres d'emploi.
--  2. Filtrage des offres d'emploi pour le métier de Data Analyst, en remote et avec un salaire spécifié.
--  3. Agrégation des compétences pour compter le nombre d'offres et calculer le salaire moyen annuel.
--  4. Ordonnancement des résultats pour obtenir les compétences les plus demandées et les mieux rémunérées.

-- Conclusion :
--  En combinant les deux critères, on peut identifier les compétences optimales à développer pour un Data Analyst.
--  Par exemple, SQL, Python, et Tableau ressortent comme des compétences clés à maîtriser.