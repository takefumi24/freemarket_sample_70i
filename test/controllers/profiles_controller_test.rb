require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get profiles_create_url
    assert_response :success
  end

end
