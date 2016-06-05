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

    assert page.has_content?("Welcome Parker")
  end

  test "registed user input invalid information, render login" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")

    visit login_path
    assert page.has_content?("Login")
    fill_in "Username", with: "Parker"
    fill_in "Password", with: ""
    click_button "Login"

    assert page.has_content?("Login")
    assert page.has_content?("Please make sure all fields are correct...")
  end

end
