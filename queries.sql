-- Hozz létre olyan módosító lekérdezéseket, amikkel adott esetben egy-egy értékelés eredményét módosítani lehet, illetve a hibás értékelés eredménye akár törölhető is. Az utasítások nem kell, hogy paraméterezettek legyenek, tetszőleges tesztadatot használj a módosításkor, illetve törléskor.

UPDATE reviews -- Az értékelés frissítése
SET evaluation = 5
WHERE review_id = 1



DELETE FROM reviews -- Az értékelés törlése
WHERE review_id = 2


SELECT -- 5.a | A tananyag kilistázása kurzusonként
       courses.course_title,
       projects.project_title
FROM courses
INNER JOIN courses_projects ON courses.course_id = courses_projects.course_id
INNER JOIN projects ON courses_projects.project_id = projects.project_id

WHERE courses.course_id = 2


-- **************** MÉG NEM TELJESEN JÓ *****************

SELECT -- 5.b | Az egyes projektek megjelenítése azok minden elemével együtt
       projects.project_title,
       projects.project_summary,
       projects.exercise_or_tutorial,
       projects.solo_or_team,
       tasks.task_title,
       tasks.task_summary
       --background_materials.background_material_title,
       --background_materials.background_material_url
FROM projects
INNER JOIN tasks ON projects.project_id = tasks.project_id
--INNER JOIN background_materials ON tasks.task_id = background_materials.task_id

WHERE projects.project_id = 3

SELECT *
FROM projects
INNER JOIN tasks ON projects.project_id = tasks.project_id
INNER JOIN background_materials ON tasks.task_id = background_materials.task_id

SELECT -- 5.c | A diákok alapadatainak listája kurzusonként
       courses.course_title,
       students.student_name,
       students.nick_name,
       students.city,
       students.hobby,
       students.email
FROM courses
INNER JOIN students ON courses.course_id = students.course_id

WHERE courses.course_id = 1
ORDER BY students.student_name



SELECT --5.d | A diákok projektenkénti teljesítései az elért eredményeik alapján az értékelés minden részletével együtt
       students.student_name,
       projects.project_title,
       reviews.evaluation,
       reviews.evaluation_summary
FROM projects
INNER JOIN reviews ON projects.project_id = reviews.project_id
INNER JOIN reviewers ON reviews.reviewer_id = reviewers.reviewer_id
INNER JOIN students ON reviewers.student_id = students.student_id

WHERE students.student_id = 3



SELECT -- Összesített eredmény  a diákok teljesítéseiről. A lekérdezés számoljon átlagot az elért pontszámokból és ha a diák 60% felett teljesített, kapjon “haladó” minősítést, ha alatta, legyen “megfontolva haladó”.
students.student_name,
CASE WHEN AVG(reviews.evaluation) / 5 > 0.6 THEN 'haladó'
     ELSE 'megfontolva haladó'
END AS "előrehaladás"
FROM students
INNER JOIN reviews ON students.student_id = reviews.student_id 
GROUP BY 1
ORDER BY 1



SELECT -- A 3 legjobban teljesítőtelsesítő diák listája az összesített (nem átlag) pontszámaik alapján. 
students.student_name,
SUM(reviews.evaluation)
FROM students
INNER JOIN reviews ON students.student_id = reviews.student_id 
GROUP BY 1
ORDER BY 2 DESC, 1