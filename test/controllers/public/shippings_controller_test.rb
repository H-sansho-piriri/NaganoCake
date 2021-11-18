require 'test_helper'

class Public::ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shippings_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_shippings_edit_url
    assert_response :success
  end

end
