$:.unshift('.')
require 'test/test_helper'

class TestUser < MiniTest::Unit::TestCase
  def setup
    @user_email = "test@nowhere.com"
    @user_password = "test"
    @user = ::User.find_by_email(@user_email)
  end
 
  def test_that_user_with_valid_email_and_password_can_be_authenticated
    assert_equal @user, User.authenticate(@user_email, @user_password)
  end

  def test_that_user_with_valid_email_but_invalid_password_can_not_be_authenticated
    assert_equal nil, User.authenticate(@user_email, "invalid_password")
  end
end
