# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_01_003446) do
  create_table "class_students", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "school_class_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_class_students_on_school_class_id"
    t.index ["semester_id"], name: "index_class_students_on_semester_id"
    t.index ["student_id"], name: "index_class_students_on_student_id"
  end

  create_table "class_subject_semesters", force: :cascade do |t|
    t.integer "school_class_id", null: false
    t.integer "subject_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_class_subject_semesters_on_school_class_id"
    t.index ["semester_id"], name: "index_class_subject_semesters_on_semester_id"
    t.index ["subject_id"], name: "index_class_subject_semesters_on_subject_id"
  end

  create_table "grades", force: :cascade do |t|
    t.float "value"
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_grades_on_semester_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.boolean "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "lastname"
    t.string "firstname"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "phone"
    t.integer "npa"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "class_students", "school_classes"
  add_foreign_key "class_students", "semesters"
  add_foreign_key "class_students", "users", column: "student_id"
  add_foreign_key "class_subject_semesters", "school_classes"
  add_foreign_key "class_subject_semesters", "semesters"
  add_foreign_key "class_subject_semesters", "subjects"
  add_foreign_key "grades", "semesters"
  add_foreign_key "grades", "subjects"
  add_foreign_key "grades", "users", column: "student_id"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
end
