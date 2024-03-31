require "application_system_test_case"

class ClassStudentsTest < ApplicationSystemTestCase
  setup do
    @class_student = class_students(:one)
  end

  test "visiting the index" do
    visit class_students_url
    assert_selector "h1", text: "Class students"
  end

  test "should create class student" do
    visit class_students_url
    click_on "New class student"

    fill_in "School class", with: @class_student.school_class_id
    fill_in "Student", with: @class_student.student_id
    click_on "Create Class student"

    assert_text "Class student was successfully created"
    click_on "Back"
  end

  test "should update Class student" do
    visit class_student_url(@class_student)
    click_on "Edit this class student", match: :first

    fill_in "School class", with: @class_student.school_class_id
    fill_in "Student", with: @class_student.student_id
    click_on "Update Class student"

    assert_text "Class student was successfully updated"
    click_on "Back"
  end

  test "should destroy Class student" do
    visit class_student_url(@class_student)
    click_on "Destroy this class student", match: :first

    assert_text "Class student was successfully destroyed"
  end
end
