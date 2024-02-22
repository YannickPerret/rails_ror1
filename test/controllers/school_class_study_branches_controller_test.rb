require "test_helper"

class SchoolClassStudyBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_class_study_branch = school_class_study_branches(:one)
  end

  test "should get index" do
    get school_class_study_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_school_class_study_branch_url
    assert_response :success
  end

  test "should create school_class_study_branch" do
    assert_difference("SchoolClassStudyBranch.count") do
      post school_class_study_branches_url, params: { school_class_study_branch: { branch_id: @school_class_study_branch.branch_id, schoolClass_id: @school_class_study_branch.schoolClass_id } }
    end

    assert_redirected_to school_class_study_branch_url(SchoolClassStudyBranch.last)
  end

  test "should show school_class_study_branch" do
    get school_class_study_branch_url(@school_class_study_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_class_study_branch_url(@school_class_study_branch)
    assert_response :success
  end

  test "should update school_class_study_branch" do
    patch school_class_study_branch_url(@school_class_study_branch), params: { school_class_study_branch: { branch_id: @school_class_study_branch.branch_id, schoolClass_id: @school_class_study_branch.schoolClass_id } }
    assert_redirected_to school_class_study_branch_url(@school_class_study_branch)
  end

  test "should destroy school_class_study_branch" do
    assert_difference("SchoolClassStudyBranch.count", -1) do
      delete school_class_study_branch_url(@school_class_study_branch)
    end

    assert_redirected_to school_class_study_branches_url
  end
end
