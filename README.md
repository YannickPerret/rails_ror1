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
rails generate scaffold Evaluate dateEval:integer branch:references note:references
rails generate scaffold Conduct teacher:references school_class:references
rails generate scaffold Teach branch:references teacher:references
rails generate scaffold Study student:references branch:references



rails generate scaffold Branch name:string status:string moyenne:integer
rails generate scaffold Teacher firstname:string lastname:string email:string phoneNumber:string address:string city:string nip:integer acronym:string
rails generate scaffold SchoolClass name:string status:string years:integer
rails generate scaffold Student firstname:string lastname:string address:string npa:integer city:string email:string phoneNumber:string state:string acronym:string school_class:references
rails generate scaffold Note note:integer student:references
rails generate scaffold NoteEvaluateBranch dateEval:integer note:references branch:references
rails generate scaffold TeacherConductSchoolClass teacher:references school_class:references
rails generate scaffold TeacherTeachBranch branch:references teacher:references
rails generate scaffold StudentStudyBranch student:references branch:references




Dans un wiki : 

Mettre le mld et mcd dans le readme avec modification avec implémentations
