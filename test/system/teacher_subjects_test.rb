require "application_system_test_case"

class TeacherSubjectsTest < ApplicationSystemTestCase
  setup do
    @teacher_subject = teacher_subjects(:one)
  end

  test "visiting the index" do
    visit teacher_subjects_url
    assert_selector "h1", text: "Teacher subjects"
  end

  test "should create teacher subject" do
    visit teacher_subjects_url
    click_on "New teacher subject"

    fill_in "Subject", with: @teacher_subject.subject_id
    fill_in "Teacher", with: @teacher_subject.teacher_id
    click_on "Create Teacher subject"

    assert_text "Teacher subject was successfully created"
    click_on "Back"
  end

  test "should update Teacher subject" do
    visit teacher_subject_url(@teacher_subject)
    click_on "Edit this teacher subject", match: :first

    fill_in "Subject", with: @teacher_subject.subject_id
    fill_in "Teacher", with: @teacher_subject.teacher_id
    click_on "Update Teacher subject"

    assert_text "Teacher subject was successfully updated"
    click_on "Back"
  end

  test "should destroy Teacher subject" do
    visit teacher_subject_url(@teacher_subject)
    click_on "Destroy this teacher subject", match: :first

    assert_text "Teacher subject was successfully destroyed"
  end
end
