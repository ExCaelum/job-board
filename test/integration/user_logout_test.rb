require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can logout" do
    user = User.create(username: "Parker",
                       password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    assert page.has_content?("Welcome Parker")

    click_link "Logout"

    refute page.has_content?("Parker's Homepage")
    assert page.has_content?("Captain Jobs")
    assert page.has_content?("Login")
    assert page.has_content?("Create Account")
  end
end
