require "application_system_test_case"

class NoteEvaluateBranchesTest < ApplicationSystemTestCase
  setup do
    @note_evaluate_branch = note_evaluate_branches(:one)
  end

  test "visiting the index" do
    visit note_evaluate_branches_url
    assert_selector "h1", text: "Note evaluate branches"
  end

  test "should create note evaluate branch" do
    visit note_evaluate_branches_url
    click_on "New note evaluate branch"

    fill_in "Branch", with: @note_evaluate_branch.branch_id
    fill_in "Dateeval", with: @note_evaluate_branch.dateEval
    fill_in "Note", with: @note_evaluate_branch.note_id
    click_on "Create Note evaluate branch"

    assert_text "Note evaluate branch was successfully created"
    click_on "Back"
  end

  test "should update Note evaluate branch" do
    visit note_evaluate_branch_url(@note_evaluate_branch)
    click_on "Edit this note evaluate branch", match: :first

    fill_in "Branch", with: @note_evaluate_branch.branch_id
    fill_in "Dateeval", with: @note_evaluate_branch.dateEval
    fill_in "Note", with: @note_evaluate_branch.note_id
    click_on "Update Note evaluate branch"

    assert_text "Note evaluate branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Note evaluate branch" do
    visit note_evaluate_branch_url(@note_evaluate_branch)
    click_on "Destroy this note evaluate branch", match: :first

    assert_text "Note evaluate branch was successfully destroyed"
  end
end
