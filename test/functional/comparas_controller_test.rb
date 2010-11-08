require 'test_helper'

class ComparasControllerTest < ActionController::TestCase
  setup do
    @compara = comparas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comparas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compara" do
    assert_difference('Compara.count') do
      post :create, :compara => @compara.attributes
    end

    assert_redirected_to compara_path(assigns(:compara))
  end

  test "should show compara" do
    get :show, :id => @compara.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @compara.to_param
    assert_response :success
  end

  test "should update compara" do
    put :update, :id => @compara.to_param, :compara => @compara.attributes
    assert_redirected_to compara_path(assigns(:compara))
  end

  test "should destroy compara" do
    assert_difference('Compara.count', -1) do
      delete :destroy, :id => @compara.to_param
    end

    assert_redirected_to comparas_path
  end
end
