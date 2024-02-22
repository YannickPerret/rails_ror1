require "application_system_test_case"

class BranchHistoriesTest < ApplicationSystemTestCase
  setup do
    @branch_history = branch_histories(:one)
  end

  test "visiting the index" do
    visit branch_histories_url
    assert_selector "h1", text: "Branch histories"
  end

  test "should create branch history" do
    visit branch_histories_url
    click_on "New branch history"

    fill_in "Branch", with: @branch_history.branch_id
    fill_in "Effective date", with: @branch_history.effective_date
    fill_in "End date", with: @branch_history.end_date
    fill_in "Name", with: @branch_history.name
    click_on "Create Branch history"

    assert_text "Branch history was successfully created"
    click_on "Back"
  end

  test "should update Branch history" do
    visit branch_history_url(@branch_history)
    click_on "Edit this branch history", match: :first

    fill_in "Branch", with: @branch_history.branch_id
    fill_in "Effective date", with: @branch_history.effective_date
    fill_in "End date", with: @branch_history.end_date
    fill_in "Name", with: @branch_history.name
    click_on "Update Branch history"

    assert_text "Branch history was successfully updated"
    click_on "Back"
  end

  test "should destroy Branch history" do
    visit branch_history_url(@branch_history)
    click_on "Destroy this branch history", match: :first

    assert_text "Branch history was successfully destroyed"
  end
end
