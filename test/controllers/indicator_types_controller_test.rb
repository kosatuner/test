require 'test_helper'

class IndicatorTypesControllerTest < ActionController::TestCase
  setup do
    @indicator_type = indicator_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicator_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator_type" do
    assert_difference('IndicatorType.count') do
      post :create, indicator_type: { descripcion: @indicator_type.descripcion, nombre: @indicator_type.nombre }
    end

    assert_redirected_to indicator_type_path(assigns(:indicator_type))
  end

  test "should show indicator_type" do
    get :show, id: @indicator_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicator_type
    assert_response :success
  end

  test "should update indicator_type" do
    patch :update, id: @indicator_type, indicator_type: { descripcion: @indicator_type.descripcion, nombre: @indicator_type.nombre }
    assert_redirected_to indicator_type_path(assigns(:indicator_type))
  end

  test "should destroy indicator_type" do
    assert_difference('IndicatorType.count', -1) do
      delete :destroy, id: @indicator_type
    end

    assert_redirected_to indicator_types_path
  end
end
