require 'test_helper'

class MetafieldsControllerTest < ActionController::TestCase
  setup do
    @metafield = metafields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metafields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metafield" do
    assert_difference('Metafield.count') do
      post :create, metafield: { description: @metafield.description, key: @metafield.key, namespace: @metafield.namespace, product_type: @metafield.product_type, value: @metafield.value, value_type: @metafield.value_type }
    end

    assert_redirected_to metafield_path(assigns(:metafield))
  end

  test "should show metafield" do
    get :show, id: @metafield
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metafield
    assert_response :success
  end

  test "should update metafield" do
    patch :update, id: @metafield, metafield: { description: @metafield.description, key: @metafield.key, namespace: @metafield.namespace, product_type: @metafield.product_type, value: @metafield.value, value_type: @metafield.value_type }
    assert_redirected_to metafield_path(assigns(:metafield))
  end

  test "should destroy metafield" do
    assert_difference('Metafield.count', -1) do
      delete :destroy, id: @metafield
    end

    assert_redirected_to metafields_path
  end
end
