require 'test_helper'

class LikesforrepliesControllerTest < ActionController::TestCase
  setup do
    @likesforreply = likesforreplies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:likesforreplies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create likesforreply" do
    assert_difference('Likesforreply.count') do
      post :create, likesforreply: @likesforreply.attributes
    end

    assert_redirected_to likesforreply_path(assigns(:likesforreply))
  end

  test "should show likesforreply" do
    get :show, id: @likesforreply.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @likesforreply.to_param
    assert_response :success
  end

  test "should update likesforreply" do
    put :update, id: @likesforreply.to_param, likesforreply: @likesforreply.attributes
    assert_redirected_to likesforreply_path(assigns(:likesforreply))
  end

  test "should destroy likesforreply" do
    assert_difference('Likesforreply.count', -1) do
      delete :destroy, id: @likesforreply.to_param
    end

    assert_redirected_to likesforreplies_path
  end
end
