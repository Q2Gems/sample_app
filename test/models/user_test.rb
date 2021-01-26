require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
      @user = User.new(name: "Hafidatun Naida", email: "hafidatunaida@example.com", password: "welcome", password_confirmation: "welcome")
  end

  test "should be valid" do
      assert @user.valid? 
  end

  test "name should be present" do
    @user.name=" "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email="     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

#=begin
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_addr|
        @user.email = invalid_addr
        assert_not @user.valid?, "#{invalid_addr.inspect} should be invalid"
    end
  end
#=end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end