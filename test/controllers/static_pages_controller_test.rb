require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get jqm" do
    get :jqm
    assert_response :success
  end

end
