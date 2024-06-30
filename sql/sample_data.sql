create table students
(
    id   SERIAL,
    name varchar(20),
    primary key (id)
);

create table student_info
(
    id         SERIAL primary key,
    details    varchar(500),
    student_id int references students (id)
);


INSERT INTO students (name)
VALUES ('Alice'),
       ('Bob'),
       ('Charlie'),
       ('David'),
       ('Eve'),
       ('Adam');

INSERT INTO student_info(details, student_id)
VALUES ('Born in 1995, likes painting.', 1),
       ('Studying computer science.', 2),
       ('Interested in literature and music.', 3),
       ('Enjoys outdoor activities.', 4),
       ('Loves animals and volunteers at a shelter.', 5),
       ('Enjoys cooking and traveling.', 1),
       ('Passionate about photography.', 2),
       ('Loves playing musical instruments.', 3),
       ('Interested in astronomy.', 4),
       ('Enjoys playing soccer.', 5),
       ('this is null data 1', null),
       ('this is null data 2', null);