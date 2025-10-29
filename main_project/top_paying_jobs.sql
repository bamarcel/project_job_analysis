/*
Question : Qu'elles sont les offres d'emploi de Data Analyst les mieux rémunérées ?
    - On se concentre sur un top 10, qui sont disponibles en remote. 
    - On veut que le salaire soit spécifié.   
*/

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
LIMIT 10;

-- On remarque simplement que les offres d'emploi pour le métier de Data Analyst
-- les mieux rémunérées en remote sont proposées par des entreprises de la Tech.
-- Et ils sont évidemment tous en Full-Time.