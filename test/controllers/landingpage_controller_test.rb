require 'test_helper'

class LandingpageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:three)
    @profile = profiles(:three)
    post profiles_url, params: { profile: { address: @profile.address, dental_license: @profile.dental_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_number: @profile.pps_number, user_id: @profile.user_id } }
  end

  # This test ensure we go to Log in | Testing the Authentication.
  test "non logged in user should go to Log In Page" do
    get new_user_session_path
    assert_response :success
    assert_select 'h2', "Log in"
  end

  # Ensure user has access to landing page after signing in
  test "Does home page show current signed in user name" do
      sign_in @user
      get root_path
      assert_response :success
      assert_select 'h3',  'Welcome back Dr MyString!'
      sign_out @user
  end

  # Is the twitter card displaying the correct twitter timeline
  test 'Is twitter card displaying correct timeline username' do
      sign_in @user
      get root_path
      assert_response :success
      assert_select 'h6#twitter-uname',  '@IrishDentists'
      sign_out @user
  end

  # Does the nav bar display users email address
  test 'Does nav bar display current user email address' do
      sign_in @user
      get root_path
      assert_response :success
      assert_select 'h7#nav-bar-current-user-email', 'Welcome! jordanmay@hotdad.com'
      sign_out @user
  end

end
