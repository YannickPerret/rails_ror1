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


* Scaffold
  rails generate scaffold User type:string lastname:string firstname:string email:string password_digest:string address:string phone:string npa:integer city:string country:string, state:string
  rails generate scaffold SchoolClass name:string
  rails generate scaffold Subject name:string archived:boolean
  rails generate scaffold Grade value:float student:references subject:references semester:references
  rails generate scaffold Semester name:string year:integer
  rails generate scaffold ClassStudent student:references school_class:references semester:references
  rails generate scaffold TeacherSubject teacher:references subject:references
  rails generate scaffold ClassSubjectSemester school_class:references subject:references semester:references
