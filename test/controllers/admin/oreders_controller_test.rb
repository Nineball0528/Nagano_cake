require "test_helper"

class Admin::OredersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_oreders_show_url
    assert_response :success
  end
end
