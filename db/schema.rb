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

ActiveRecord::Schema[7.1].define(version: 2024_02_22_104853) do
  create_table "branch_histories", force: :cascade do |t|
    t.string "name"
    t.date "effective_date"
    t.date "end_date"
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_histories_on_branch_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "status"
    t.integer "moyenne"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_branches_on_code", unique: true
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
    t.integer "people_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_notes_on_people_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "npa"
    t.string "city"
    t.string "email"
    t.string "phoneNumber"
    t.boolean "status"
    t.string "acronym"
    t.string "password_digest"
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rollable_id"
    t.string "rollable_type"
    t.index ["role_id"], name: "index_people_on_role_id"
    t.index ["rollable_id", "rollable_type"], name: "index_people_on_rollable_id_and_rollable_type"
  end

  create_table "people_teach_branches", force: :cascade do |t|
    t.integer "people_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_people_teach_branches_on_branch_id"
    t.index ["people_id"], name: "index_people_teach_branches_on_people_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_class_study_branches", force: :cascade do |t|
    t.integer "schoolClass_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_school_class_study_branches_on_branch_id"
    t.index ["schoolClass_id"], name: "index_school_class_study_branches_on_schoolClass_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_contain_school_classes", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "schoolClass_id", null: false
    t.string "school_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_student_contain_school_classes_on_person_id"
    t.index ["schoolClass_id"], name: "index_student_contain_school_classes_on_schoolClass_id"
  end

  create_table "teacher_conduct_school_classes", force: :cascade do |t|
    t.integer "people_id", null: false
    t.integer "schoolClass_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_teacher_conduct_school_classes_on_people_id"
    t.index ["schoolClass_id"], name: "index_teacher_conduct_school_classes_on_schoolClass_id"
  end

  add_foreign_key "branch_histories", "branches"
  add_foreign_key "note_evaluate_branches", "branches"
  add_foreign_key "note_evaluate_branches", "notes"
  add_foreign_key "notes", "people", column: "people_id"
  add_foreign_key "people", "roles"
  add_foreign_key "people_teach_branches", "branches"
  add_foreign_key "people_teach_branches", "people", column: "people_id"
  add_foreign_key "school_class_study_branches", "branches"
  add_foreign_key "school_class_study_branches", "schoolClasses"
  add_foreign_key "student_contain_school_classes", "people"
  add_foreign_key "student_contain_school_classes", "schoolClasses"
  add_foreign_key "teacher_conduct_school_classes", "people", column: "people_id"
  add_foreign_key "teacher_conduct_school_classes", "schoolClasses"
end
