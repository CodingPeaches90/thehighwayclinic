require 'test_helper'

class AnalyticspageControllerTest < ActionDispatch::IntegrationTest
  test "should get analytics" do
    get analyticspage_analytics_url
    assert_response :success
  end

end
