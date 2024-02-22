require "application_system_test_case"

class TeacherConductSchoolClassesTest < ApplicationSystemTestCase
  setup do
    @teacher_conduct_school_class = teacher_conduct_school_classes(:one)
  end

  test "visiting the index" do
    visit teacher_conduct_school_classes_url
    assert_selector "h1", text: "Teacher conduct school classes"
  end

  test "should create teacher conduct school class" do
    visit teacher_conduct_school_classes_url
    click_on "New teacher conduct school class"

    fill_in "People", with: @teacher_conduct_school_class.people_id
    fill_in "Schoolclass", with: @teacher_conduct_school_class.schoolClass_id
    click_on "Create Teacher conduct school class"

    assert_text "Teacher conduct school class was successfully created"
    click_on "Back"
  end

  test "should update Teacher conduct school class" do
    visit teacher_conduct_school_class_url(@teacher_conduct_school_class)
    click_on "Edit this teacher conduct school class", match: :first

    fill_in "People", with: @teacher_conduct_school_class.people_id
    fill_in "Schoolclass", with: @teacher_conduct_school_class.schoolClass_id
    click_on "Update Teacher conduct school class"

    assert_text "Teacher conduct school class was successfully updated"
    click_on "Back"
  end

  test "should destroy Teacher conduct school class" do
    visit teacher_conduct_school_class_url(@teacher_conduct_school_class)
    click_on "Destroy this teacher conduct school class", match: :first

    assert_text "Teacher conduct school class was successfully destroyed"
  end
end
