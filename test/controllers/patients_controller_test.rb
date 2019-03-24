require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @patient = patients(:one)
    @user = users(:three)
    sign_in @user
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end


  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { Address: @patient.Address, Age: @patient.Age, Full_Name: @patient.Full_Name, Medical_Card: @patient.Medical_Card, PPS: @patient.PPS, Sex: @patient.Sex, user_id: @patient.user_id } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { Address: @patient.Address, Age: @patient.Age, Full_Name: @patient.Full_Name, Medical_Card: @patient.Medical_Card, PPS: @patient.PPS, Sex: @patient.Sex, user_id: @patient.user_id } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
    sign_out @user
  end
end
