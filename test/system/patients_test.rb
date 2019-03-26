require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase

  setup do
    @user = users(:five)
    @patient = patients(:one)
    @profile = users(:four)

    visit root_url
    click_on "Sign up"
    fill_in "Email", with: @user.email
    fill_in "user[password]", with: "jordan123"
    fill_in "user[password_confirmation]", with: "jordan123"
    click_on "Sign up"

    # visit profiles_url
    #
    # click_on "New Profile"
    #
    # fill_in "profile[address]", with: @profile.address
    # fill_in "profile[dental_license]", with: @profile.dental_license
    # fill_in "profile[firstname]", with: @profile.firstname
    # fill_in "profile[lastname]", with: @profile.lastname
    # fill_in "profile[pps_number]", with: @profile.pps_number
    # fill_in "User", with: @profile.user_id
    # click_on "Create Profile"
    #
    # assert_text "Profile was successfully created"
  end

  test "visiting the index, redirecting to home and sign in" do
    visit patients_url
    visit user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "jordan123"
    click_on "Log in"
    visit root_path

  end


  test "creating a Patient" do
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "jordan123"
    click_on "Log in"
    visit new_patient_url

    click_on "New Patient"

    fill_in "Address", with: @patient.Address
    fill_in "Age", with: @patient.Age
    fill_in "Full name", with: @patient.Full_Name
    fill_in "Medical card", with: "NO"
    fill_in "Pps", with: @patient.PPS
    fill_in "Sex", with: "M"
    fill_in "User", with: @patient.user_id
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  # test "updating a Patient" do
  #   visit patients_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "Address", with: @patient.Address
  #   fill_in "Age", with: @patient.Age
  #   fill_in "Full name", with: @patient.Full_Name
  #   fill_in "Medical card", with: @patient.Medical_Card
  #   fill_in "Pps", with: @patient.PPS
  #   fill_in "Sex", with: @patient.Sex
  #   fill_in "User", with: @patient.user_id
  #   click_on "Update Patient"
  #
  #   assert_text "Patient was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Patient" do
  #   visit patients_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "Patient was successfully destroyed"
  # end
end
