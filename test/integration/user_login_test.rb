require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "Parker", password: "password")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"

    assert page.has_content?("Parker's Homepage")
  end
end
