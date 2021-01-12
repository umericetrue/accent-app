require 'test_helper'

class AccentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accents_index_url
    assert_response :success
  end

end
