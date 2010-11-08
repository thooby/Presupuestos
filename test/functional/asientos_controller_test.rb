require 'test_helper'

class AsientosControllerTest < ActionController::TestCase
  setup do
    @asiento = asientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asiento" do
    assert_difference('Asiento.count') do
      post :create, :asiento => @asiento.attributes
    end

    assert_redirected_to asiento_path(assigns(:asiento))
  end

  test "should show asiento" do
    get :show, :id => @asiento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @asiento.to_param
    assert_response :success
  end

  test "should update asiento" do
    put :update, :id => @asiento.to_param, :asiento => @asiento.attributes
    assert_redirected_to asiento_path(assigns(:asiento))
  end

  test "should destroy asiento" do
    assert_difference('Asiento.count', -1) do
      delete :destroy, :id => @asiento.to_param
    end

    assert_redirected_to asientos_path
  end
end
