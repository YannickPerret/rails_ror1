# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


rails generate scaffold Branch name:string status:string moyenne:integer
rails generate scaffold Teacher firstname:string lastname:string email:string phoneNumber:string address:string city:string nip:integer acronym:string
rails generate scaffold SchoolClass name:string status:string years:integer
rails generate scaffold Student firstname:string lastname:string address:string npa:integer city:string email:string phoneNumber:string state:string acronym:string school_class:references
rails generate scaffold Note note:integer student:references
rails generate scaffold NoteEvaluateBranch dateEval:integer note:references branch:references
rails generate scaffold TeacherConductSchoolClass teacher:references school_class:references
rails generate scaffold TeacherTeachBranch branch:references teacher:references
rails generate scaffold schoolClassStudyBranch schoolClass:references branch:references






rails generate scaffold Branch name:string code:string:uniq status:boolean moyenne:integer
rails generate scaffold SchoolClass name:string status:boolean
rails generate scaffold BranchHistory name:string effective_date:date end_date:date branch:references
rails generate scaffold Role name:string
rails generate scaffold People firstname:string lastname:string address:string npa:integer city:string email:string phoneNumber:string status:boolean acronym:string password_digest:string role:references
rails generate scaffold Note note:integer people:references
rails generate scaffold NoteEvaluateBranch dateEval:integer note:references branch:references
rails generate scaffold StudentContainSchoolClass people:references school_year:string schoolClass:references
rails generate scaffold TeacherConductSchoolClass people:references schoolClass:references
rails generate scaffold SchoolClassStudyBranch schoolClass:references branch:references
rails generate scaffold PeopleTeachBranch people:references branch:references


Dans un wiki : 

Mettre le mld et mcd dans le readme avec modification avec implémentations






sql : 
CREATE TABLE branch(
   id_branch COUNTER,
   name VARCHAR(50),
   code VARCHAR(50) NOT NULL,
   status LOGICAL,
   moyenne INT,
   PRIMARY KEY(id_branch),
   UNIQUE(code)
);

CREATE TABLE schoolClass(
   id_schoolClass COUNTER,
   name VARCHAR(50),
   status VARCHAR(50),
   years BYTE,
   PRIMARY KEY(id_schoolClass)
);

CREATE TABLE branch_history(
   Id_branch_history COUNTER,
   name VARCHAR(50),
   effective_date DATE,
   end_date DATE,
   id_branch INT NOT NULL,
   PRIMARY KEY(Id_branch_history),
   FOREIGN KEY(id_branch) REFERENCES branch(id_branch)
);

-- Utilisateurs
CREATE TABLE users (
   id_user COUNTER,
   acronyme VARCHAR(3) UNIQUE,
   firstname VARCHAR(75),
   lastname VARCHAR(75),
   email VARCHAR(255) UNIQUE,
   phoneNumber VARCHAR(50),
   address VARCHAR(75),
   city VARCHAR(50),
   npa INT,
    state VARCHAR(50),
   password_hash VARCHAR(255),
   PRIMARY KEY(id_user)
);

-- Rôles
CREATE TABLE roles (
   id_role COUNTER,
   role_name VARCHAR(50),
   PRIMARY KEY(id_role)
);

-- Rôles des utilisateurs
CREATE TABLE user_roles (
   id_user INT,
   id_role INT,
   PRIMARY KEY(id_user, id_role),
   FOREIGN KEY(id_user) REFERENCES users(id_user),
   FOREIGN KEY(id_role) REFERENCES roles(id_role)
);

CREATE TABLE note(
   id_note COUNTER,
   note INT,
   id_student INT NOT NULL,
   PRIMARY KEY(id_note),
   FOREIGN KEY(id_student) REFERENCES student(id_student)
);

CREATE TABLE note_evaluate_branch(
   id_note INT,
   dateEval SMALLINT,
   id_branch INT NOT NULL,
   PRIMARY KEY(id_note),
   FOREIGN KEY(id_note) REFERENCES note(id_note),
   FOREIGN KEY(id_branch) REFERENCES branch(id_branch)
);

CREATE TABLE teacher_conduct_schoolClass(
   id_teacher INT,
   id_schoolClass INT,
   PRIMARY KEY(id_teacher, id_schoolClass),
   FOREIGN KEY(id_teacher) REFERENCES teacher(id_teacher),
   FOREIGN KEY(id_schoolClass) REFERENCES schoolClass(id_schoolClass)
);

CREATE TABLE teacher_teach_branch(
   id_branch INT,
   id_teacher INT,
   PRIMARY KEY(id_branch, id_teacher),
   FOREIGN KEY(id_branch) REFERENCES branch(id_branch),
   FOREIGN KEY(id_teacher) REFERENCES teacher(id_teacher)
);

CREATE TABLE schoolClass_study_branch(
   id_branch INT,
   id_schoolClass INT,
   PRIMARY KEY(id_branch, id_schoolClass),
   FOREIGN KEY(id_branch) REFERENCES branch(id_branch),
   FOREIGN KEY(id_schoolClass) REFERENCES schoolClass(id_schoolClass)
);



-- Association d'étudiants à des classes
CREATE TABLE student_contain_class (
   id_user INT,
   id_schoolClass INT,
   start_date DATE,
   end_date DATE,
   PRIMARY KEY(id_user, id_schoolClass),
   FOREIGN KEY(id_user) REFERENCES users(id_user),
   FOREIGN KEY(id_schoolClass) REFERENCES schoolClass(id_schoolClass)
);

-- Association d'enseignants à des classes
CREATE TABLE teacher_conduct_class (
   id_user INT,
   id_schoolClass INT,
   start_date DATE,
   end_date DATE,
   PRIMARY KEY(id_user, id_schoolClass),
   FOREIGN KEY(id_user) REFERENCES users(id_user),
   FOREIGN KEY(id_schoolClass) REFERENCES schoolClass(id_schoolClass)
);
