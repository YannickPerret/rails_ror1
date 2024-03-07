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

ActiveRecord::Schema[7.1].define(version: 2024_02_22_094761) do
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

  create_table "people_teach_branches", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_people_teach_branches_on_branch_id"
    t.index ["user_id"], name: "index_people_teach_branches_on_user_id"
  end

  create_table "school_class_study_branches", force: :cascade do |t|
    t.integer "school_class_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_school_class_study_branches_on_branch_id"
    t.index ["school_class_id"], name: "index_school_class_study_branches_on_school_class_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_contain_school_classes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "school_class_id", null: false
    t.string "school_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_student_contain_school_classes_on_school_class_id"
    t.index ["user_id"], name: "index_student_contain_school_classes_on_user_id"
  end

  create_table "teacher_conduct_school_classes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_teacher_conduct_school_classes_on_school_class_id"
    t.index ["user_id"], name: "index_teacher_conduct_school_classes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "npa"
    t.string "city"
    t.string "email"
    t.string "phoneNumber"
    t.string "acronym"
    t.string "password_digest"
    t.boolean "status"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branch_histories", "branches"
  add_foreign_key "note_evaluate_branches", "branches"
  add_foreign_key "note_evaluate_branches", "notes"
  add_foreign_key "notes", "people", column: "people_id"
  add_foreign_key "people_teach_branches", "branches"
  add_foreign_key "people_teach_branches", "users"
  add_foreign_key "school_class_study_branches", "branches"
  add_foreign_key "school_class_study_branches", "school_classes"
  add_foreign_key "student_contain_school_classes", "school_classes"
  add_foreign_key "student_contain_school_classes", "users"
  add_foreign_key "teacher_conduct_school_classes", "school_classes"
  add_foreign_key "teacher_conduct_school_classes", "users"
end
