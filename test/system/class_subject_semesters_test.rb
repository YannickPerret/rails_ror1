require "application_system_test_case"

class ClassSubjectSemestersTest < ApplicationSystemTestCase
  setup do
    @class_subject_semester = class_subject_semesters(:one)
  end

  test "visiting the index" do
    visit class_subject_semesters_url
    assert_selector "h1", text: "Class subject semesters"
  end

  test "should create class subject semester" do
    visit class_subject_semesters_url
    click_on "New class subject semester"

    fill_in "School class", with: @class_subject_semester.school_class_id
    fill_in "Semester", with: @class_subject_semester.semester_id
    fill_in "Subject", with: @class_subject_semester.subject_id
    click_on "Create Class subject semester"

    assert_text "Class subject semester was successfully created"
    click_on "Back"
  end

  test "should update Class subject semester" do
    visit class_subject_semester_url(@class_subject_semester)
    click_on "Edit this class subject semester", match: :first

    fill_in "School class", with: @class_subject_semester.school_class_id
    fill_in "Semester", with: @class_subject_semester.semester_id
    fill_in "Subject", with: @class_subject_semester.subject_id
    click_on "Update Class subject semester"

    assert_text "Class subject semester was successfully updated"
    click_on "Back"
  end

  test "should destroy Class subject semester" do
    visit class_subject_semester_url(@class_subject_semester)
    click_on "Destroy this class subject semester", match: :first

    assert_text "Class subject semester was successfully destroyed"
  end
end
