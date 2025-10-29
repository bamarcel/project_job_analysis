/*
    Trouver le nombre de remote jobs postées pour chaque skill
        - Afficher le top 5 des skills avec le plus de remote jobs
        - Inclure le skill id, son nom, et le nombre de remote jobs où ce skill est requis
*/

-- On récupère d'abord le nombre de remote jobs par skill dans une CTE
WITH remote_jobs AS (
    SELECT
        skill_id,
        COUNT(*) AS number_of_requiring
    FROM
        skills_job_dim AS sj 
    INNER JOIN job_postings_fact AS jp      -- INNER JOIN car on garde les skills avec minimum 1 remote job
        ON jp.job_id = sj.job_id
    WHERE
        job_work_from_home IS TRUE 
    GROUP BY
        skill_id
)

-- Dans ce cas, le LEFT JOIN aurait récupéré aussi les skills sans remote jobs, ce qui n'est pas demandé


-- Grâce au CTE, on a juste à récupérer le nom du skill dans la table skills_dim
-- et à ordonner par le nombre de remote jobs pour avoir le top 5
SELECT 
    s.skill_id,
    s.skills,
    rj.number_of_requiring
FROM 
    skills_dim as s 
INNER JOIN remote_jobs as rj                -- INNER JOIN pour ne garder que les skills avec au moins 1 remote job
    ON rj.skill_id = s.skill_id
ORDER BY 
    rj.number_of_requiring DESC 
LIMIT 5;

-- Pareil que le cas précédent, le LEFT JOIN aurait inclus les skills sans remote jobs