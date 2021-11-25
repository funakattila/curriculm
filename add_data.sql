-- add to courses
INSERT INTO courses
(course_title, course_summary, start_course)
VALUES
('Szoftvertesztelő', 'Lórum ipse talán a nakszerű, cukasztó a legkevésbé gatos. A ponadék a csövesz. érser kornéira kodikálja a vitragot ami, zsugozja a múmát, kolást, gyalom pöttömnyi kolást és a fuktokot gyarozja.', '2021.10.11'),
('Frontend fejlesztő', 'A ponadék ezen kívül magába kéri a kenyítményre emlékesztező, kérő urgásokat a kengedővel és fogós szabliumot kőttes köveleményeket.', '2021.10.01');


-- add to projects
INSERT INTO projects
(project_title, project_summary, exercise_or_tutorial, solo_or_team)
VALUES
('Gitting around', 'blah', 'exercise', 'solo'),
('Introduction to SQL', 'blah', 'tutorial', 'solo'),
('Setup PostgrSQL', 'blah', 'exercise', 'solo'),
('Project Codewars - 7 kyu in SQL', 'blah', 'exercise', 'solo'),
('TodoDB.sql', 'blah', 'exercise', 'solo'),
('Northwind Traders', 'blah', 'exercise', 'team');


--add to courses_projects
INSERT INTO courses_projects
(course_id, project_id)
VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,6);

-- add tasks
INSERT INTO tasks
(project_id, task_title, task_summary)
VALUES
(1,'Passwordless git with SSH', 'blah'),
(1,'Initialize exercises', 'blah'),
(1,'Merge remote change', 'blah'),
(1,'Resolve conflict', 'blah'),
(1,'Find a secret', 'blah'),
(1,'Collect size changes of a file', 'blah'),
(1,'Collect all files that ever existed', 'blah'),
(3,'Install PostgreSQL', 'blah'),
(3,'Set up PostgreSQL', 'blah'),
(3,'Connect with psql and create a table with data', 'blah'),
(3,'Connect with your IDE and get some data', 'blah'),
(3,'Connect to PostgreSQL with Python', 'blah'),
(4,'Reach 7 kyu in SQL', 'blah'),
(5,'VM with NAT Networking', 'blah'),
(5,'Create Database', 'blah'),
(5,'Create Schema', 'blah'),
(5,'Alter Schema', 'blah'),
(5,'Insert Data', 'blah'),
(5,'Retrieve Data', 'blah'),
(5,'Modify Existing Data', 'blah'),
(5,'Delete Finished Tasks', 'blah'),
(5,'Drop Tables', 'blah'),
(6,'List products and their suppliers', 'blah'),
(6,'Count products by categories', 'blah'),
(6,'Top 10 Worst selling products', 'blah'),
(6,'Important countries', 'blah'),
(6,'Total revenue by month', 'blah'),
(6,'Get order numbers for each customer from the US with less than 5 orders', 'blah');

-- add background materials
INSERT INTO background_materials
(task_id, background_material_title, background_material_url)
VALUES
(1,'Moving around branches', 'blah'),
(1,'Branches in nutshell', 'blah'),
(1,'Git without password', 'blah'),
(1,'Bash commands and arguments', 'blah'),
(1,'Bash pattern matching', 'blah'),
(1,'Mastering git', 'blah'),
(2,'About databases', 'blah'),
(2,'Relational databases', 'blah'),
(2,'About SQL', 'blah'),
(2,'Introduction to JOINs', 'blah'),
(3,'Installing and setting up PostgreSQL', 'blah'),
(3,'Installing psycopg2', 'blah'),
(3,'Short guide about psql', 'blah'),
(3,'PostgreSQL documentation page about psql', 'blah'),
(3,'Installing PostgreSQL extension in Visual Studio Code', 'blah'),
(3,'Setting up a database connection in PyCharm', 'blah'),
(5,'Introduction to SQL', 'blah'),
(5,'General SQL tutorial', 'blah'),
(5,'Interactive SQL tutorial', 'blah'),
(5,'Primary key - postgres', 'blah'),
(5,'Foreign key - postgres', 'blah'),
(5,'UPDATE examples', 'blah'),
(5,'Short guide about psql', 'blah'),
(5,'PostgreSQL documentation about psql', 'blah'),
(6,'Working with more complex data', 'blah'),
(6,'Northwind database', 'blah'),
(6,'Short guide about psql', 'blah'),
(6,'PostgreSQL documentation page about psql', 'blah');

-- add to students table
INSERT INTO students
(course_id, student_name, nick_name, city, hobby, email)
VALUES
(1, 'Funák Attila', 'funi', 'Sárospatak', 'sörfőzés', 'funak.attila@gmail.com'),
(1, 'Szabó Gábor', 'Kilien', 'Cigánd', 'sörivás', 'kilimancer@gmail.com'),
(1, 'Ladocsi Gábor', 'Ladó', 'Miskolc', 'gitározás', 'boogiesport@gmail.com');

-- add reviewers
INSERT INTO reviewers
(student_id)
VALUES
(1), (2), (3);


-- add reviews
INSERT INTO reviews
(project_id, reviewer_id, student_id, evaluation, evaluation_date, evaluation_summary)
VALUES
(1,2,1,2,'2021.11.10', 'blah'),
(3,2,1,4,'2021.11.10', 'blah'),
(4,2,1,4,'2021.11.10', 'blah'),
(5,2,1,3,'2021.11.10', 'blah'),
(6,2,1,4,'2021.11.10', 'blah'),
(1,3,2,4,'2021.11.18', 'blah'),
(3,3,2,5,'2021.11.18', 'blah'),
(4,3,2,4,'2021.11.18', 'blah'),
(5,3,2,5,'2021.11.18', 'blah'),
(6,3,2,4,'2021.11.18', 'blah'),
(1,1,3,3,'2021.11.20', 'blah'),
(3,1,3,5,'2021.11.20', 'blah'),
(4,1,3,5,'2021.11.20', 'blah'),
(5,1,3,5,'2021.11.20', 'blah'),
(6,1,3,4,'2021.11.20', 'blah');
