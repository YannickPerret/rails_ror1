require "test_helper"

class TeacherTeachBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_teach_branch = teacher_teach_branches(:one)
  end

  test "should get index" do
    get teacher_teach_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_teach_branch_url
    assert_response :success
  end

  test "should create teacher_teach_branch" do
    assert_difference("TeacherTeachBranch.count") do
      post teacher_teach_branches_url, params: { teacher_teach_branch: { branch_id: @teacher_teach_branch.branch_id, teacher_id: @teacher_teach_branch.teacher_id } }
    end

    assert_redirected_to teacher_teach_branch_url(TeacherTeachBranch.last)
  end

  test "should show teacher_teach_branch" do
    get teacher_teach_branch_url(@teacher_teach_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_teach_branch_url(@teacher_teach_branch)
    assert_response :success
  end

  test "should update teacher_teach_branch" do
    patch teacher_teach_branch_url(@teacher_teach_branch), params: { teacher_teach_branch: { branch_id: @teacher_teach_branch.branch_id, teacher_id: @teacher_teach_branch.teacher_id } }
    assert_redirected_to teacher_teach_branch_url(@teacher_teach_branch)
  end

  test "should destroy teacher_teach_branch" do
    assert_difference("TeacherTeachBranch.count", -1) do
      delete teacher_teach_branch_url(@teacher_teach_branch)
    end

    assert_redirected_to teacher_teach_branches_url
  end
end
