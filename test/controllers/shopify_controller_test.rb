require 'test_helper'

class ShopifyControllerTest < ActionController::TestCase
  test "should get savings-calculator" do
    get :savings-calculator
    assert_response :success
  end

  test "should get find-your-wheelset" do
    get :find-your-wheelset
    assert_response :success
  end

  test "should get wheel-customizer" do
    get :wheel-customizer
    assert_response :success
  end

end
