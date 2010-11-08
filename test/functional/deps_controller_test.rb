require 'test_helper'

class DepsControllerTest < ActionController::TestCase
  setup do
    @dep = deps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dep" do
    assert_difference('Dep.count') do
      post :create, :dep => @dep.attributes
    end

    assert_redirected_to dep_path(assigns(:dep))
  end

  test "should show dep" do
    get :show, :id => @dep.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dep.to_param
    assert_response :success
  end

  test "should update dep" do
    put :update, :id => @dep.to_param, :dep => @dep.attributes
    assert_redirected_to dep_path(assigns(:dep))
  end

  test "should destroy dep" do
    assert_difference('Dep.count', -1) do
      delete :destroy, :id => @dep.to_param
    end

    assert_redirected_to deps_path
  end
end
