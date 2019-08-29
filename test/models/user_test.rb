require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save' do
    User.create(name: 'Me', password: 'pas')
    rec = User.new(name: 'Me', password: 'pas')
    assert !rec.save
  end

  test 'should get user' do
    user = users(:one)
    buf_user = User.authenticate user.name, user.password
    assert buf_user
  end

  test 'should not get user' do
    user = users(:one)
    buf_user = User.authenticate user.name, 'err'
    assert_nil buf_user
  end
end

