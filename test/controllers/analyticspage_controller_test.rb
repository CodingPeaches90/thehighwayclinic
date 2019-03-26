require 'test_helper'

class AnalyticspageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # This page should only be viewable by an admin

  setup do
    @user_no_admin = users(:three)
    @user_admin = users(:four)
  end

  test "user should not have access" do
    sign_in @user_no_admin
    get analyticspage_analytics_url
    assert_response :redirect
    sign_out @user_no_admin
  end
end
