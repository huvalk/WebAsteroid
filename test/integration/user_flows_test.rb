require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'login and browse site' do
    get '/session/login'
    assert_response :success
    post '/session/create', params: { login: users(:one).name, password: users(:one).password }
    follow_redirect!
    assert_equal '/game/play', path
  end
  test 'not login and not browse site' do
    get '/session/login'
    assert_response :success
    post '/session/create', params: { login: 'error', password: 'error' }
    assert_equal '/session/create', path
  end
  test 'should create user' do
    get new_user_url
    assert_response :success
    assert_difference('User.count', 1) do
      get users_create_url({user: {pasrep: 'new', password: 'new', name: 'new'}})
    end
    get root_path({password: 'new', name: 'new'})
    assert_response :found
    assert_includes '/game/play', path
  end
  test 'should not create user' do
    get new_user_url
    assert_response :success
    assert_difference('User.count', 0) do
      get users_create_url({user: {pasrep: 'new', password: 'err', name: 'err'}})
    end
    get root_path({password: 'new', name: 'new'})
    assert_response :found
    assert_includes '/session/login', path
  end

end