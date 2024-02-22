require "application_system_test_case"

class SchoolClassStudyBranchesTest < ApplicationSystemTestCase
  setup do
    @school_class_study_branch = school_class_study_branches(:one)
  end

  test "visiting the index" do
    visit school_class_study_branches_url
    assert_selector "h1", text: "School class study branches"
  end

  test "should create school class study branch" do
    visit school_class_study_branches_url
    click_on "New school class study branch"

    fill_in "Branch", with: @school_class_study_branch.branch_id
    fill_in "Schoolclass", with: @school_class_study_branch.schoolClass_id
    click_on "Create School class study branch"

    assert_text "School class study branch was successfully created"
    click_on "Back"
  end

  test "should update School class study branch" do
    visit school_class_study_branch_url(@school_class_study_branch)
    click_on "Edit this school class study branch", match: :first

    fill_in "Branch", with: @school_class_study_branch.branch_id
    fill_in "Schoolclass", with: @school_class_study_branch.schoolClass_id
    click_on "Update School class study branch"

    assert_text "School class study branch was successfully updated"
    click_on "Back"
  end

  test "should destroy School class study branch" do
    visit school_class_study_branch_url(@school_class_study_branch)
    click_on "Destroy this school class study branch", match: :first

    assert_text "School class study branch was successfully destroyed"
  end
end
