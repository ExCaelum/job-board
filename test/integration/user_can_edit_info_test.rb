require 'test_helper'

class UserCanEditTest < ActionDispatch::IntegrationTest

  test "User can edit their information" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    assert page.has_content?("Welcome Parker")

    click_link "Edit Information"
    assert page.has_content?("Edit Information")
    fill_in "Username", with: "NewUser"
    fill_in "Password", with: user.password
    click_button "Update User"
    assert page.has_content?("Welcome NewUser")
  end

end
