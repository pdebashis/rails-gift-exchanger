require 'test_helper'

class UserTest < ActiveSupport::TestCase

def test_user_created_with_email_password_
  user = User.new({email: "dabbebhutdp@gmail.com",password: "password"})
  assert user.save
end

def test_user_not_created_with_email_
  user = User.new({email: "dabbebhutdp@gmail.com"})
  assert_not user.save
end

end
