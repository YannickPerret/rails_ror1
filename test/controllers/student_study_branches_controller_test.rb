require "test_helper"

class StudentStudyBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_study_branch = student_study_branches(:one)
  end

  test "should get index" do
    get student_study_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_student_study_branch_url
    assert_response :success
  end

  test "should create student_study_branch" do
    assert_difference("StudentStudyBranch.count") do
      post student_study_branches_url, params: { student_study_branch: { branch_id: @student_study_branch.branch_id, student_id: @student_study_branch.student_id } }
    end

    assert_redirected_to student_study_branch_url(StudentStudyBranch.last)
  end

  test "should show student_study_branch" do
    get student_study_branch_url(@student_study_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_study_branch_url(@student_study_branch)
    assert_response :success
  end

  test "should update student_study_branch" do
    patch student_study_branch_url(@student_study_branch), params: { student_study_branch: { branch_id: @student_study_branch.branch_id, student_id: @student_study_branch.student_id } }
    assert_redirected_to student_study_branch_url(@student_study_branch)
  end

  test "should destroy student_study_branch" do
    assert_difference("StudentStudyBranch.count", -1) do
      delete student_study_branch_url(@student_study_branch)
    end

    assert_redirected_to student_study_branches_url
  end
end
