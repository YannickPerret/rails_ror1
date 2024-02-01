require "test_helper"

class NoteEvaluateBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_evaluate_branch = note_evaluate_branches(:one)
  end

  test "should get index" do
    get note_evaluate_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_note_evaluate_branch_url
    assert_response :success
  end

  test "should create note_evaluate_branch" do
    assert_difference("NoteEvaluateBranch.count") do
      post note_evaluate_branches_url, params: { note_evaluate_branch: { branch_id: @note_evaluate_branch.branch_id, dateEval: @note_evaluate_branch.dateEval, note_id: @note_evaluate_branch.note_id } }
    end

    assert_redirected_to note_evaluate_branch_url(NoteEvaluateBranch.last)
  end

  test "should show note_evaluate_branch" do
    get note_evaluate_branch_url(@note_evaluate_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_evaluate_branch_url(@note_evaluate_branch)
    assert_response :success
  end

  test "should update note_evaluate_branch" do
    patch note_evaluate_branch_url(@note_evaluate_branch), params: { note_evaluate_branch: { branch_id: @note_evaluate_branch.branch_id, dateEval: @note_evaluate_branch.dateEval, note_id: @note_evaluate_branch.note_id } }
    assert_redirected_to note_evaluate_branch_url(@note_evaluate_branch)
  end

  test "should destroy note_evaluate_branch" do
    assert_difference("NoteEvaluateBranch.count", -1) do
      delete note_evaluate_branch_url(@note_evaluate_branch)
    end

    assert_redirected_to note_evaluate_branches_url
  end
end
