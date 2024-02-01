require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { acronym: @student.acronym, address: @student.address, city: @student.city, email: @student.email, firstname: @student.firstname, lastname: @student.lastname, npa: @student.npa, phoneNumber: @student.phoneNumber, school_class_id: @student.school_class_id, state: @student.state } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { acronym: @student.acronym, address: @student.address, city: @student.city, email: @student.email, firstname: @student.firstname, lastname: @student.lastname, npa: @student.npa, phoneNumber: @student.phoneNumber, school_class_id: @student.school_class_id, state: @student.state } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
