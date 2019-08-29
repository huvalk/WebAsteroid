require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'NotMe', password: @user.password, point: @user.point, pasrep: @user.password } }
    end
    assert_redirected_to user_url(User.last)
  end

  test "should not create user" do
    assert_difference('User.count', 0) do
      post users_url, params: { user: { name: 'NotMe', password: @user.password, point: @user.point, pasrep: 'err' } }
    end
    follow_redirect!
    assert_includes new_user_path, path
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
