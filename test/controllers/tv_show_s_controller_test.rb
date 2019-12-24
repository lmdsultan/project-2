require 'test_helper'

class TvShowSControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tv_show_s_new_url
    assert_response :success
  end

end
