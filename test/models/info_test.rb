require 'test_helper'

class InfoTest < ActiveSupport::TestCase
  test 'should plus' do
    assert_difference('Info.where(user_id: users(:one).id).count', +1) do
      Info.where_to_add users(:one), 1, 1
    end
  end

  test 'should not plus' do
    10.times do
      Info.where_to_add users(:one), 1, 1
    end
    assert_difference('Info.where(user_id: users(:one).id).count', 0) do
      Info.where_to_add users(:one), 1, 1
    end
  end
end
