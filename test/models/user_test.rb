require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "password must be numeric with at least four characters" do
    user = build_user(password: "1234")

    assert user.valid?

    user.password = "12ab"

    assert_not user.valid?
    assert_includes user.errors[:password], "must contain only numbers"
  end

  private

  def build_user(password:)
    User.new(
      user_name: "seller",
      first_name: "Sales",
      last_name: "User",
      email: "seller@example.com",
      role: :employee,
      password: password
    )
  end
end
