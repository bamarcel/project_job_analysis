/*
    Question : Quelles sont les compétences les plus demandées ?
        - Afficher le top 5 des compétences avec le plus d'offres d'emploi en remote.
        - On s'étend à toutes les offres d'emploie, pas seulement remote.
*/

SELECT 
    s.skills,
    COUNT(*) AS number_of_offers
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sj ON jp.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title LIKE '%Data_Analyst%'
GROUP BY
    s.skills
ORDER BY
    number_of_offers DESC
LIMIT 5;

-- Explication technique :
--  1. Utilisation de INNER JOIN pour ne récupérer que les compétences associées aux offres d'emploi.
--  2. Filtrage des offres d'emploi pour le métier de Data Analyst.
--  3. Agrégation des compétences pour compter le nombre d'offres associées à chaque compétence.
--  4. Ordonnancement des résultats pour obtenir le top 5 des compétences les plus demandées.

-- Résultat :

-- sql	        85030
-- excel	    57966
-- python	    52174
-- tableau	    44330
-- power bi	    35221

-- Pour le métier de Data Analyst, les compétences les plus demandées dans les offres d'emploi sont : 
-- SQL, Excel, Python, Tableau et Power BI.
-- Il est donc crucial pour les aspirants Data Analysts de maîtriser ces compétences pour 
-- maximiser leurs chances d'obtenir un emploi dans ce domaine.