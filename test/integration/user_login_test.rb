require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")

    visit login_path

    fill_in "Username", with: "Parker"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Parker's Homepage")
  end
end
