require 'test_helper'

class ChalsControllerTest < ActionController::TestCase
  setup do
    @chal = chals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chal" do
    assert_difference('Chal.count') do
      post :create, chal: { cat_id: @chal.cat_id, dur: @chal.dur, name: @chal.name, reg: @chal.reg, user_id: @chal.user_id }
    end

    assert_redirected_to chal_path(assigns(:chal))
  end

  test "should show chal" do
    get :show, id: @chal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chal
    assert_response :success
  end

  test "should update chal" do
    patch :update, id: @chal, chal: { cat_id: @chal.cat_id, dur: @chal.dur, name: @chal.name, reg: @chal.reg, user_id: @chal.user_id }
    assert_redirected_to chal_path(assigns(:chal))
  end

  test "should destroy chal" do
    assert_difference('Chal.count', -1) do
      delete :destroy, id: @chal
    end

    assert_redirected_to chals_path
  end
end
