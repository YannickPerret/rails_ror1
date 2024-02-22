require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { person: { acronym: @person.acronym, address: @person.address, city: @person.city, email: @person.email, firstname: @person.firstname, lastname: @person.lastname, npa: @person.npa, password_digest: @person.password_digest, phoneNumber: @person.phoneNumber, role_id: @person.role_id, status: @person.status } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { acronym: @person.acronym, address: @person.address, city: @person.city, email: @person.email, firstname: @person.firstname, lastname: @person.lastname, npa: @person.npa, password_digest: @person.password_digest, phoneNumber: @person.phoneNumber, role_id: @person.role_id, status: @person.status } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
