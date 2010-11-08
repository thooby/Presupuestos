require 'test_helper'

class ProgsControllerTest < ActionController::TestCase
  setup do
    @prog = progs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prog" do
    assert_difference('Prog.count') do
      post :create, :prog => @prog.attributes
    end

    assert_redirected_to prog_path(assigns(:prog))
  end

  test "should show prog" do
    get :show, :id => @prog.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @prog.to_param
    assert_response :success
  end

  test "should update prog" do
    put :update, :id => @prog.to_param, :prog => @prog.attributes
    assert_redirected_to prog_path(assigns(:prog))
  end

  test "should destroy prog" do
    assert_difference('Prog.count', -1) do
      delete :destroy, :id => @prog.to_param
    end

    assert_redirected_to progs_path
  end
end
