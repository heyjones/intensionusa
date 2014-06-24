require 'test_helper'

class MakesControllerTest < ActionController::TestCase
  setup do
    @make = makes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:makes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create make" do
    assert_difference('Make.count') do
      post :create, make: { name: @make.name }
    end

    assert_redirected_to make_path(assigns(:make))
  end

  test "should show make" do
    get :show, id: @make
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @make
    assert_response :success
  end

  test "should update make" do
    patch :update, id: @make, make: { name: @make.name }
    assert_redirected_to make_path(assigns(:make))
  end

  test "should destroy make" do
    assert_difference('Make.count', -1) do
      delete :destroy, id: @make
    end

    assert_redirected_to makes_path
  end
end
