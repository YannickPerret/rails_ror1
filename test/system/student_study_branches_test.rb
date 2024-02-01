require "application_system_test_case"

class StudentStudyBranchesTest < ApplicationSystemTestCase
  setup do
    @student_study_branch = student_study_branches(:one)
  end

  test "visiting the index" do
    visit student_study_branches_url
    assert_selector "h1", text: "Student study branches"
  end

  test "should create student study branch" do
    visit student_study_branches_url
    click_on "New student study branch"

    fill_in "Branch", with: @student_study_branch.branch_id
    fill_in "Student", with: @student_study_branch.student_id
    click_on "Create Student study branch"

    assert_text "Student study branch was successfully created"
    click_on "Back"
  end

  test "should update Student study branch" do
    visit student_study_branch_url(@student_study_branch)
    click_on "Edit this student study branch", match: :first

    fill_in "Branch", with: @student_study_branch.branch_id
    fill_in "Student", with: @student_study_branch.student_id
    click_on "Update Student study branch"

    assert_text "Student study branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Student study branch" do
    visit student_study_branch_url(@student_study_branch)
    click_on "Destroy this student study branch", match: :first

    assert_text "Student study branch was successfully destroyed"
  end
end
