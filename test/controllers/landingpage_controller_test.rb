require 'test_helper'

class LandingpageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
      sign_in :three
  end
  test "should get index" do
    get root_path
    assert_response :success
  end

end
