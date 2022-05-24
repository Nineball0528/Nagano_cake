require "test_helper"

class Public::OredersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_oreders_index_url
    assert_response :success
  end

  test "should get show" do
    get public_oreders_show_url
    assert_response :success
  end
end
