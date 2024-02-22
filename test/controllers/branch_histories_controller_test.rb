require "test_helper"

class BranchHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch_history = branch_histories(:one)
  end

  test "should get index" do
    get branch_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_history_url
    assert_response :success
  end

  test "should create branch_history" do
    assert_difference("BranchHistory.count") do
      post branch_histories_url, params: { branch_history: { branch_id: @branch_history.branch_id, effective_date: @branch_history.effective_date, end_date: @branch_history.end_date, name: @branch_history.name } }
    end

    assert_redirected_to branch_history_url(BranchHistory.last)
  end

  test "should show branch_history" do
    get branch_history_url(@branch_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_history_url(@branch_history)
    assert_response :success
  end

  test "should update branch_history" do
    patch branch_history_url(@branch_history), params: { branch_history: { branch_id: @branch_history.branch_id, effective_date: @branch_history.effective_date, end_date: @branch_history.end_date, name: @branch_history.name } }
    assert_redirected_to branch_history_url(@branch_history)
  end

  test "should destroy branch_history" do
    assert_difference("BranchHistory.count", -1) do
      delete branch_history_url(@branch_history)
    end

    assert_redirected_to branch_histories_url
  end
end
