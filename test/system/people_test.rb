require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    fill_in "Acronym", with: @person.acronym
    fill_in "Address", with: @person.address
    fill_in "City", with: @person.city
    fill_in "Email", with: @person.email
    fill_in "Firstname", with: @person.firstname
    fill_in "Lastname", with: @person.lastname
    fill_in "Npa", with: @person.npa
    fill_in "Password digest", with: @person.password_digest
    fill_in "Phonenumber", with: @person.phoneNumber
    fill_in "Role", with: @person.role_id
    check "Status" if @person.status
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Acronym", with: @person.acronym
    fill_in "Address", with: @person.address
    fill_in "City", with: @person.city
    fill_in "Email", with: @person.email
    fill_in "Firstname", with: @person.firstname
    fill_in "Lastname", with: @person.lastname
    fill_in "Npa", with: @person.npa
    fill_in "Password digest", with: @person.password_digest
    fill_in "Phonenumber", with: @person.phoneNumber
    fill_in "Role", with: @person.role_id
    check "Status" if @person.status
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
