require "test_helper"

class ClassSubjectSemestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_subject_semester = class_subject_semesters(:one)
  end

  test "should get index" do
    get class_subject_semesters_url
    assert_response :success
  end

  test "should get new" do
    get new_class_subject_semester_url
    assert_response :success
  end

  test "should create class_subject_semester" do
    assert_difference("ClassSubjectSemester.count") do
      post class_subject_semesters_url, params: { class_subject_semester: { school_class_id: @class_subject_semester.school_class_id, semester_id: @class_subject_semester.semester_id, subject_id: @class_subject_semester.subject_id } }
    end

    assert_redirected_to class_subject_semester_url(ClassSubjectSemester.last)
  end

  test "should show class_subject_semester" do
    get class_subject_semester_url(@class_subject_semester)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_subject_semester_url(@class_subject_semester)
    assert_response :success
  end

  test "should update class_subject_semester" do
    patch class_subject_semester_url(@class_subject_semester), params: { class_subject_semester: { school_class_id: @class_subject_semester.school_class_id, semester_id: @class_subject_semester.semester_id, subject_id: @class_subject_semester.subject_id } }
    assert_redirected_to class_subject_semester_url(@class_subject_semester)
  end

  test "should destroy class_subject_semester" do
    assert_difference("ClassSubjectSemester.count", -1) do
      delete class_subject_semester_url(@class_subject_semester)
    end

    assert_redirected_to class_subject_semesters_url
  end
end
