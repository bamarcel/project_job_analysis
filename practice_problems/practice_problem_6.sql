/*
    Créer trois tables différentes, Jan 2023 jobs, Feb 2023 jobs, Mar 2023 jobs
    Il faut donc filtrer les offres par rapport au mois et l'année
*/

-- Vu que je me suis trompé une première fois, on supprime les tables si elles existaient déjà
DROP TABLE IF EXISTS jan_jobs_2023;
DROP TABLE IF EXISTS feb_jobs_2023;
DROP TABLE IF EXISTS mar_jobs_2023;

-- On crée les tables directement à partir du résultats de notre requêtes
CREATE TABLE public.january_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE public.february_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE public.march_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- Petite VAR de vérification sur une des tables
SELECT * FROM january_jobs;