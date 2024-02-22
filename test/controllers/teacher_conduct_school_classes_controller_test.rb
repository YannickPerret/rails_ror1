require "test_helper"

class TeacherConductSchoolClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_conduct_school_class = teacher_conduct_school_classes(:one)
  end

  test "should get index" do
    get teacher_conduct_school_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_conduct_school_class_url
    assert_response :success
  end

  test "should create teacher_conduct_school_class" do
    assert_difference("TeacherConductSchoolClass.count") do
      post teacher_conduct_school_classes_url, params: { teacher_conduct_school_class: { people_id: @teacher_conduct_school_class.people_id, schoolClass_id: @teacher_conduct_school_class.schoolClass_id } }
    end

    assert_redirected_to teacher_conduct_school_class_url(TeacherConductSchoolClass.last)
  end

  test "should show teacher_conduct_school_class" do
    get teacher_conduct_school_class_url(@teacher_conduct_school_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_conduct_school_class_url(@teacher_conduct_school_class)
    assert_response :success
  end

  test "should update teacher_conduct_school_class" do
    patch teacher_conduct_school_class_url(@teacher_conduct_school_class), params: { teacher_conduct_school_class: { people_id: @teacher_conduct_school_class.people_id, schoolClass_id: @teacher_conduct_school_class.schoolClass_id } }
    assert_redirected_to teacher_conduct_school_class_url(@teacher_conduct_school_class)
  end

  test "should destroy teacher_conduct_school_class" do
    assert_difference("TeacherConductSchoolClass.count", -1) do
      delete teacher_conduct_school_class_url(@teacher_conduct_school_class)
    end

    assert_redirected_to teacher_conduct_school_classes_url
  end
end
