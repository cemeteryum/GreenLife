require 'test_helper'

class ComsControllerTest < ActionController::TestCase
  setup do
    @com = coms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create com" do
    assert_difference('Com.count') do
      post :create, com: { art_id: @com.art_id, text: @com.text, user_id: @com.user_id }
    end

    assert_redirected_to com_path(assigns(:com))
  end

  test "should show com" do
    get :show, id: @com
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @com
    assert_response :success
  end

  test "should update com" do
    patch :update, id: @com, com: { art_id: @com.art_id, text: @com.text, user_id: @com.user_id }
    assert_redirected_to com_path(assigns(:com))
  end

  test "should destroy com" do
    assert_difference('Com.count', -1) do
      delete :destroy, id: @com
    end

    assert_redirected_to coms_path
  end
end
