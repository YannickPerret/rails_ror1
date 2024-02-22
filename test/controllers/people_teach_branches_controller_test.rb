require "test_helper"

class PeopleTeachBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @people_teach_branch = people_teach_branches(:one)
  end

  test "should get index" do
    get people_teach_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_people_teach_branch_url
    assert_response :success
  end

  test "should create people_teach_branch" do
    assert_difference("PeopleTeachBranch.count") do
      post people_teach_branches_url, params: { people_teach_branch: { branch_id: @people_teach_branch.branch_id, people_id: @people_teach_branch.people_id } }
    end

    assert_redirected_to people_teach_branch_url(PeopleTeachBranch.last)
  end

  test "should show people_teach_branch" do
    get people_teach_branch_url(@people_teach_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_people_teach_branch_url(@people_teach_branch)
    assert_response :success
  end

  test "should update people_teach_branch" do
    patch people_teach_branch_url(@people_teach_branch), params: { people_teach_branch: { branch_id: @people_teach_branch.branch_id, people_id: @people_teach_branch.people_id } }
    assert_redirected_to people_teach_branch_url(@people_teach_branch)
  end

  test "should destroy people_teach_branch" do
    assert_difference("PeopleTeachBranch.count", -1) do
      delete people_teach_branch_url(@people_teach_branch)
    end

    assert_redirected_to people_teach_branches_url
  end
end
