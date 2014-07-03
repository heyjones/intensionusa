require 'test_helper'

class ValuesControllerTest < ActionController::TestCase
  setup do
    @value = values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create value" do
    assert_difference('Value.count') do
      post :create, value: { metafield_id: @value.metafield_id, name: @value.name }
    end

    assert_redirected_to value_path(assigns(:value))
  end

  test "should show value" do
    get :show, id: @value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @value
    assert_response :success
  end

  test "should update value" do
    patch :update, id: @value, value: { metafield_id: @value.metafield_id, name: @value.name }
    assert_redirected_to value_path(assigns(:value))
  end

  test "should destroy value" do
    assert_difference('Value.count', -1) do
      delete :destroy, id: @value
    end

    assert_redirected_to values_path
  end
end
