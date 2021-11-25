
SELECT -- 5.a | A tananyag kilistázása kurzusonként
       courses.course_title,
       projects.project_title
FROM courses
INNER JOIN courses_projects ON courses.course_id = courses_projects.course_id
INNER JOIN projects ON courses_projects.project_id = projects.project_id

WHERE courses.course_id = 1



SELECT -- 5.b | Az egyes projektek megjelenítése azok minden elemével együtt
       projects.project_title,
       projects.project_summary,
       projects.exercise_or_tutorial,
       projects.solo_or_team,
       tasks.task_title,
       tasks.task_summary,
       background_materials.background_material_title,
       background_materials.background_material_url
FROM projects
INNER JOIN tasks ON projects.project_id = tasks.project_id
INNER JOIN background_materials ON tasks.task_id = background_materials.task_id

WHERE projects.project_id = 1



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

WHERE students.student_id = 2


-- Összesített eredmény  a diákok teljesítéseiről. A lekérdezés számoljon átlagot az elért pontszámokból és ha a diák 60% felett teljesített, kapjon “haladó” minősítést, ha alatta, legyen “megfontolva haladó”.
-- A 3 legjobban teljesítőtelsesítő diák listája az összesített (nem átlag) pontszámaik alapján. 
