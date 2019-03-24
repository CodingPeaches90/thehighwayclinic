require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @profile = profiles(:one)
  end
  # When the user is logged in we want to map a profile to that user
  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { address: @profile.address, dental_license: @profile.dental_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_number: @profile.pps_number, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { address: @profile.address, dental_license: @profile.dental_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_number: @profile.pps_number, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile, sign out, try direct to root" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
    sign_out @user
    get root_path
    assert_redirected_to new_user_session_path
  end
end
