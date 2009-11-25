require 'test_helper'

class CallsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create call" do
    assert_difference('Call.count') do
      post :create, :call => { }
    end

    assert_redirected_to call_path(assigns(:call))
  end

  test "should show call" do
    get :show, :id => calls(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => calls(:one).to_param
    assert_response :success
  end

  test "should update call" do
    put :update, :id => calls(:one).to_param, :call => { }
    assert_redirected_to call_path(assigns(:call))
  end

  test "should destroy call" do
    assert_difference('Call.count', -1) do
      delete :destroy, :id => calls(:one).to_param
    end

    assert_redirected_to calls_path
  end
end
