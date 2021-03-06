require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:"Example User", email:"user@example.com",password:"foobar", password_confirmation:"foobar")
  end

  test "should be valid" do
    #正しい値がはいっていますか？
    assert @user.valid?
  end

  test "nameが空かどうかのバリデーションできているか" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "emailがからかどうかのバリデーションできているか" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "nameの長さチェックが正しく動くか" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "emailの長さチェックが正しく動くか" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "emailのフォーマット正しい場合" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid? ,"#{valid_address.inspect} should be valid"
    end
  end


  test "emailのフォーマット正しくない場合" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email が一意になっているかどうかテスト" do
    duplicate_user = @user.dup
    #大文字小文字を区別しなくて一意かどうか
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "パスワードの最小の文字の長さ" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
