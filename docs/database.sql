CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       type VARCHAR,
                       lastname VARCHAR,
                       firstname VARCHAR,
                       email VARCHAR,
                       password_digest VARCHAR,
                       address VARCHAR,
                       phone VARCHAR,
                       npa INTEGER,
                       city VARCHAR,
                       state VARCHAR,
                       country VARCHAR,
                       created_at TIMESTAMP NOT NULL,
                       updated_at TIMESTAMP NOT NULL,
                       UNIQUE (email)
);

CREATE TABLE school_classes (
                                id SERIAL PRIMARY KEY,
                                name VARCHAR,
                                created_at TIMESTAMP NOT NULL,
                                updated_at TIMESTAMP NOT NULL
);

CREATE TABLE subjects (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR,
                          archived BOOLEAN,
                          created_at TIMESTAMP NOT NULL,
                          updated_at TIMESTAMP NOT NULL
);

CREATE TABLE semesters (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR,
                           year INTEGER,
                           created_at TIMESTAMP NOT NULL,
                           updated_at TIMESTAMP NOT NULL
);

CREATE TABLE grades (
                        id SERIAL PRIMARY KEY,
                        value FLOAT,
                        student_id INTEGER NOT NULL,
                        subject_id INTEGER NOT NULL,
                        semester_id INTEGER NOT NULL,
                        created_at TIMESTAMP NOT NULL,
                        updated_at TIMESTAMP NOT NULL,
                        FOREIGN KEY (student_id) REFERENCES users(id),
                        FOREIGN KEY (subject_id) REFERENCES subjects(id),
                        FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

CREATE TABLE class_students (
                                id SERIAL PRIMARY KEY,
                                student_id INTEGER NOT NULL,
                                school_class_id INTEGER NOT NULL,
                                semester_id INTEGER NOT NULL,
                                created_at TIMESTAMP NOT NULL,
                                updated_at TIMESTAMP NOT NULL,
                                FOREIGN KEY (student_id) REFERENCES users(id),
                                FOREIGN KEY (school_class_id) REFERENCES school_classes(id),
                                FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

CREATE TABLE class_subject_semesters (
                                         id SERIAL PRIMARY KEY,
                                         school_class_id INTEGER NOT NULL,
                                         subject_id INTEGER NOT NULL,
                                         semester_id INTEGER NOT NULL,
                                         created_at TIMESTAMP NOT NULL,
                                         updated_at TIMESTAMP NOT NULL,
                                         FOREIGN KEY (school_class_id) REFERENCES school_classes(id),
                                         FOREIGN KEY (subject_id) REFERENCES subjects(id),
                                         FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

CREATE TABLE teacher_subjects (
                                  id SERIAL PRIMARY KEY,
                                  teacher_id INTEGER NOT NULL,
                                  subject_id INTEGER NOT NULL,
                                  created_at TIMESTAMP NOT NULL,
                                  updated_at TIMESTAMP NOT NULL,
                                  FOREIGN KEY (teacher_id) REFERENCES users(id),
                                  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
