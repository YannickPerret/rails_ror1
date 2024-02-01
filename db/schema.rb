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

ActiveRecord::Schema[7.1].define(version: 2024_02_01_085852) do
  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "moyenne"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "note_evaluate_branches", force: :cascade do |t|
    t.integer "dateEval"
    t.integer "note_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_note_evaluate_branches_on_branch_id"
    t.index ["note_id"], name: "index_note_evaluate_branches_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "note"
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_notes_on_student_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_study_branches", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_student_study_branches_on_branch_id"
    t.index ["student_id"], name: "index_student_study_branches_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "npa"
    t.string "city"
    t.string "email"
    t.string "phoneNumber"
    t.string "state"
    t.string "acronym"
    t.integer "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
  end

  create_table "teacher_conduct_school_classes", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_teacher_conduct_school_classes_on_school_class_id"
    t.index ["teacher_id"], name: "index_teacher_conduct_school_classes_on_teacher_id"
  end

  create_table "teacher_teach_branches", force: :cascade do |t|
    t.integer "branch_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_teacher_teach_branches_on_branch_id"
    t.index ["teacher_id"], name: "index_teacher_teach_branches_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phoneNumber"
    t.string "address"
    t.string "city"
    t.integer "nip"
    t.string "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "note_evaluate_branches", "branches"
  add_foreign_key "note_evaluate_branches", "notes"
  add_foreign_key "notes", "students"
  add_foreign_key "student_study_branches", "branches"
  add_foreign_key "student_study_branches", "students"
  add_foreign_key "students", "school_classes"
  add_foreign_key "teacher_conduct_school_classes", "school_classes"
  add_foreign_key "teacher_conduct_school_classes", "teachers"
  add_foreign_key "teacher_teach_branches", "branches"
  add_foreign_key "teacher_teach_branches", "teachers"
end
