require "application_system_test_case"

class TeacherTeachBranchesTest < ApplicationSystemTestCase
  setup do
    @teacher_teach_branch = teacher_teach_branches(:one)
  end

  test "visiting the index" do
    visit teacher_teach_branches_url
    assert_selector "h1", text: "Teacher teach branches"
  end

  test "should create teacher teach branch" do
    visit teacher_teach_branches_url
    click_on "New teacher teach branch"

    fill_in "Branch", with: @teacher_teach_branch.branch_id
    fill_in "Teacher", with: @teacher_teach_branch.teacher_id
    click_on "Create Teacher teach branch"

    assert_text "Teacher teach branch was successfully created"
    click_on "Back"
  end

  test "should update Teacher teach branch" do
    visit teacher_teach_branch_url(@teacher_teach_branch)
    click_on "Edit this teacher teach branch", match: :first

    fill_in "Branch", with: @teacher_teach_branch.branch_id
    fill_in "Teacher", with: @teacher_teach_branch.teacher_id
    click_on "Update Teacher teach branch"

    assert_text "Teacher teach branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Teacher teach branch" do
    visit teacher_teach_branch_url(@teacher_teach_branch)
    click_on "Destroy this teacher teach branch", match: :first

    assert_text "Teacher teach branch was successfully destroyed"
  end
end
