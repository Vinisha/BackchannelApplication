require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

    test "should get index" do
    get :index  ,{} , {Unity_ID: @user.Unity_ID , Password: @user.Password }
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
   post :create, :user => @user.attributes
   #assert_response :created
   assert_equal "200", response.code
 end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, { id: @user.to_param, user: @user.attributes }, {Unity_ID: @user.Unity_ID , Password: @user.Password }
    assert_response :success
  end

   test "should update user" do
    put :update,{ id: @user.to_param, user: @user.attributes }, {Unity_ID: @user.Unity_ID , Password: @user.Password }
    assert_response :success
   end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to users_path
  end
end