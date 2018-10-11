require 'test_helper'

class CollaoratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collaorators_index_url
    assert_response :success
  end

end
