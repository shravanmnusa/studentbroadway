require 'test_helper'

class FirstPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
