require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index, {},{Unity_ID: @post.Unity_ID}
    #assert_redirected_to post_url(assigns(:posts_send))
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    assert_response :success
  end

  test "should update post" do
    put :update, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, {id: @post.to_param, post: @post.attributes}, {Unity_ID: @post.Unity_ID}
    end

    assert_redirected_to posts_path
  end
end
