require "application_system_test_case"

class StudentContainSchoolClassesTest < ApplicationSystemTestCase
  setup do
    @student_contain_school_class = student_contain_school_classes(:one)
  end

  test "visiting the index" do
    visit student_contain_school_classes_url
    assert_selector "h1", text: "Student contain school classes"
  end

  test "should create student contain school class" do
    visit student_contain_school_classes_url
    click_on "New student contain school class"

    fill_in "People", with: @student_contain_school_class.people_id
    fill_in "Schoolclass", with: @student_contain_school_class.schoolClass_id
    fill_in "School year", with: @student_contain_school_class.school_year
    click_on "Create Student contain school class"

    assert_text "Student contain school class was successfully created"
    click_on "Back"
  end

  test "should update Student contain school class" do
    visit student_contain_school_class_url(@student_contain_school_class)
    click_on "Edit this student contain school class", match: :first

    fill_in "People", with: @student_contain_school_class.people_id
    fill_in "Schoolclass", with: @student_contain_school_class.schoolClass_id
    fill_in "School year", with: @student_contain_school_class.school_year
    click_on "Update Student contain school class"

    assert_text "Student contain school class was successfully updated"
    click_on "Back"
  end

  test "should destroy Student contain school class" do
    visit student_contain_school_class_url(@student_contain_school_class)
    click_on "Destroy this student contain school class", match: :first

    assert_text "Student contain school class was successfully destroyed"
  end
end
