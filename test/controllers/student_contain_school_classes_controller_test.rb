require "test_helper"

class StudentContainSchoolClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_contain_school_class = student_contain_school_classes(:one)
  end

  test "should get index" do
    get student_contain_school_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_student_contain_school_class_url
    assert_response :success
  end

  test "should create student_contain_school_class" do
    assert_difference("StudentContainSchoolClass.count") do
      post student_contain_school_classes_url, params: { student_contain_school_class: { people_id: @student_contain_school_class.people_id, schoolClass_id: @student_contain_school_class.schoolClass_id, school_year: @student_contain_school_class.school_year } }
    end

    assert_redirected_to student_contain_school_class_url(StudentContainSchoolClass.last)
  end

  test "should show student_contain_school_class" do
    get student_contain_school_class_url(@student_contain_school_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_contain_school_class_url(@student_contain_school_class)
    assert_response :success
  end

  test "should update student_contain_school_class" do
    patch student_contain_school_class_url(@student_contain_school_class), params: { student_contain_school_class: { people_id: @student_contain_school_class.people_id, schoolClass_id: @student_contain_school_class.schoolClass_id, school_year: @student_contain_school_class.school_year } }
    assert_redirected_to student_contain_school_class_url(@student_contain_school_class)
  end

  test "should destroy student_contain_school_class" do
    assert_difference("StudentContainSchoolClass.count", -1) do
      delete student_contain_school_class_url(@student_contain_school_class)
    end

    assert_redirected_to student_contain_school_classes_url
  end
end
