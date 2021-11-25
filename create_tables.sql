DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS reviewers;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS background_materials;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS courses_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS courses;

DROP TYPE IF EXISTS exercise_or_tutorial;
DROP TYPE IF EXISTS solo_or_team;

CREATE TYPE exercise_or_tutorial AS ENUM ('exercise', 'tutorial');
CREATE TYPE solo_or_team AS ENUM ('solo', 'team');

-- courses table
CREATE TABLE courses (
    course_id serial PRIMARY KEY,
    course_title varchar(50) NOT NULL,
    course_summary text NOT NULL,
    start_course date NOT NULL
);

-- projects table
CREATE TABLE projects (
    project_id serial PRIMARY KEY,
    project_title varchar(100),
    project_summary text,
    exercise_or_tutorial exercise_or_tutorial NOT NULL,
    solo_or_team solo_or_team NOT NULL
);

-- courses_projects tabel
CREATE TABLE courses_projects (
    courses_projects_id serial PRIMARY KEY,
    course_id int NOT NULL,
    project_id int NOT NULL,
    CONSTRAINT fk_course_id_1 FOREIGN KEY (course_id)
    REFERENCES courses(course_id),
    CONSTRAINT fk_project_id_1 FOREIGN KEY (project_id)
    REFERENCES projects(project_id)
);

-- tasks table
CREATE TABLE tasks (
    task_id serial PRIMARY KEY,
    project_id int NOT NULL,
    task_title varchar(100) NOT NULL,
    task_summary text NOT NULL,
    CONSTRAINT fk_project_id_2 FOREIGN KEY (project_id)
    REFERENCES projects(project_id)
);

-- background materials table
CREATE TABLE background_materials (
    background_material_id serial PRIMARY KEY,
    task_id int NOT NULL,
    background_material_title varchar(100),
    background_material_url varchar(100),
    CONSTRAINT fk_task_id FOREIGN KEY (task_id)
    REFERENCES tasks(task_id)
);

-- students table
CREATE TABLE students (
    student_id serial PRIMARY KEY,
    course_id int NOT NULL,
    student_name varchar(50) NOT NULL,
    nick_name varchar(50),
    city varchar(50),
    hobby varchar(50),
    email varchar(50) UNIQUE NOT NULL,
    CONSTRAINT fk_course_id_3 FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

-- reviewers table
CREATE TABLE reviewers (
    reviewer_id serial PRIMARY KEY,
    student_id int NOT NULL,
    CONSTRAINT fk_student_id_1 FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

-- review table
CREATE TABLE reviews (
    review_id serial PRIMARY KEY,
    project_id int NOT NULL,
    reviewer_id int NOT NULL,
    student_id int NOT NULL,
    evaluation int NOT NULL,
    evaluation_date date DEFAULT now(),
    evaluation_summary text,
    CONSTRAINT fk_project_id_4 FOREIGN KEY (project_id)
    REFERENCES projects(project_id),
    CONSTRAINT fk_reviewer_id FOREIGN KEY (reviewer_id)
    REFERENCES reviewers(reviewer_id),
    CONSTRAINT fk_student_id_2 FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);