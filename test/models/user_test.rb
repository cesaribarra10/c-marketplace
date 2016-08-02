require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Cesar Ibarra", uni: "cfi2103@columbia.edu", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "a name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be longer than 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "a uni should be present" do
    @user.uni = " "
    assert_not @user.valid?
  end

  test "uni should not be longer than 255 characters" do
    @user.uni = "a" * 263 + "@columbia.edu"
    assert_not @user.valid?
  end

  test "uni should match email regex" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                       foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.uni = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "uni should be unique" do
    duplicate_user = @user.dup
    duplicate_user.uni = @user.uni.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "uni should be lowercase before saving it" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.uni = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.uni
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should be at least 6 characters long" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
