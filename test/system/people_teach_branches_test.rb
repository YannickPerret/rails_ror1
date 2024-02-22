require "application_system_test_case"

class PeopleTeachBranchesTest < ApplicationSystemTestCase
  setup do
    @people_teach_branch = people_teach_branches(:one)
  end

  test "visiting the index" do
    visit people_teach_branches_url
    assert_selector "h1", text: "People teach branches"
  end

  test "should create people teach branch" do
    visit people_teach_branches_url
    click_on "New people teach branch"

    fill_in "Branch", with: @people_teach_branch.branch_id
    fill_in "People", with: @people_teach_branch.people_id
    click_on "Create People teach branch"

    assert_text "People teach branch was successfully created"
    click_on "Back"
  end

  test "should update People teach branch" do
    visit people_teach_branch_url(@people_teach_branch)
    click_on "Edit this people teach branch", match: :first

    fill_in "Branch", with: @people_teach_branch.branch_id
    fill_in "People", with: @people_teach_branch.people_id
    click_on "Update People teach branch"

    assert_text "People teach branch was successfully updated"
    click_on "Back"
  end

  test "should destroy People teach branch" do
    visit people_teach_branch_url(@people_teach_branch)
    click_on "Destroy this people teach branch", match: :first

    assert_text "People teach branch was successfully destroyed"
  end
end
